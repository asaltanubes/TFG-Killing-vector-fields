/* 

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Varias utilidades que son self-contained y ocupan mucho en el template
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

*/

// Formatea los decimales de forma que el separador decimal es una coma y el separador de los miles es un espacio
#let to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let n(num, decimal: ",", thousands: h(2.5pt)) = {
  let parts = str(num).split(".")
  let decimal_part = if parts.len() == 2 { parts.at(1) }
  let integer_part = parts.at(0).rev().clusters().enumerate()
    .map((item) => {
      let (index, value) = item
      return value + if calc.rem(index, 3) == 0 and index != 0 {
        thousands
      }
    }).rev().join("")
  return integer_part + if decimal_part != none { decimal + decimal_part }
}

// Gracias al $ del final en el primer regex, no se matchea el numbering de las ecuaciones
#let show-math(it) = {
  
  show regex("\d+\.\d+$|\d{4,}"): num => n(to-string(num))
  it
}


#let heading-to-page-header(head) = {
  text(style: "italic", counter(heading).at(head.location()).map(str).join(".") + "." + h(0.5em) + head.body)
}

// Crea el header
#let header() = context {
    // Not in blank pages
    if page.numbering == none { return }
    // Not in pages with new chapter
    if query(heading.where(level: 1)).any(c => c.location().page() == here().page()) { return }
    
    // Get all headings with level 1
    let headings-one = query(heading.where(level: 1).before(here()))
    // Get all headings with level 2
    let headings-two-before = query(heading.where(level: 2).before(here()))
    let headings-two-after = query(heading.where(level: 2).after(here()))
  
    if headings-one.len() == 0 { return }
    let heading-one = headings-one.last()

    grid(columns: 3, align: (left+top, center, left), 
    // If there is some level 2 heading, show it, otherwise only show chapter
    if headings-two-after.len() != 0 and headings-two-after.first().location().page() == here().page(){
     let heading-two-after = headings-two-after.first()

      if heading-two-after.location().page() >= heading-one.location().page() {
        // text(style: "italic", counter(heading).at(heading-two-after.location()).map(str).join(".") + "." + h(0.5em) + heading-two-after.body)
        heading-to-page-header(heading-two-after)
      } 
    }
    else if headings-two-before.len() != 0 {
      let heading-two-before = headings-two-before.last()

      if heading-two-before.location().page() >= heading-one.location().page() {
        // text(style: "italic", counter(heading).at(heading-two-before.location()).map(str).last() + "." + h(0.5em) + heading-two-before.body)
        heading-to-page-header(heading-two-before)
      }
    },
    h(30pt),
    text(style: "italic", heading-one.body)
    )
    move(dy: -9pt, line(length: 100%))

    counter(footnote).update(0)
  } 
