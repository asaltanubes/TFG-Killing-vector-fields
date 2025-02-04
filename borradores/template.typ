#import "utils.typ": show-math, header

/* 

TODOS:

  - In captions and abstract, align center if it's only one line
    and align left if it's more.
  - Tables and figures can be separated from its caption because of a page change, thats not good


*/

// Useful functions.
#let pm = move(dy: -2pt, $plus.minus$)
#let heading-color = rgb(9, 105, 112)
#let heading-color-75 = rgb(9, 105, 112, 75%)

#let blank-page = {
  pagebreak()
  set page(numbering: none)
}
#let dedicatoria(body) = align(right)[
  #set page(numbering: none)
  #set par(justify: false)
  #v(5cm)
  #text(style: "italic", body)
]


#let project(
  title: "",
  english-title: "",
  authors: (),
  date: none,
  body,
) = {
  set document(author: authors, title: title)
  set page(margin: 25mm, numbering: "I", header: header())
  set text(font: "CMU Concrete", lang: "es")
  set par(justify: true)
  set ref(supplement: it => {
    it.supplement.text.slice(0, 3).replace("u", "") + "."
  })
  
  set heading(numbering: "1.")
  
  // Esto es para conseguir numbering indexado en cada capitulo
  let custom-numbering(style, num) = numbering(style, counter(heading).get().first(), num.pos().first())
  
  set math.equation(numbering: (..num) => custom-numbering("(1.1)", num))
  set figure(numbering: (..num) => custom-numbering("1.1", num))
  
  
  show math.equation: set text(weight: 400)
  show math.equation: it => show-math(it)
  
  show figure.where(kind: table): set figure.caption(position: top)
  
  show figure.caption: it => if it.separator.text == "" {it} else {align(left)[#it]}
  show figure: it => {
    set figure.caption(separator: "") if it.caption != none and it.caption.body == []
    it
  }
  
  show heading.where(level: 3): set heading(numbering: none)
  show heading.where(level: 1): it => {
    pagebreak()
    // Esto es para conseguir numbering indexado en cada capitulo
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    
    grid(columns: 2, align: (left, left+horizon), column-gutter: .2cm,

    if it.numbering != none {
      box(fill: heading-color, width: 2cm, height: 2cm, align(center + horizon)[#text(fill: white, size: 25pt, numbering("1.1", ..counter(heading).at(it.location())))])
    } else {
      box(fill: heading-color, width: 0.3cm, height: 2cm) + h(.75cm)
    },
    // h(1cm)
    box(text(size: 20pt, fill: heading-color-75, it.body)))
    line(length: 100%, stroke: 3pt + heading-color-75)
    v(1.2cm)
  }
  
  align(center)[
    #set page(numbering: none)
    #image("Logo-UCnuevo.png", height: 2.3cm)
    #v(0.3cm)
    #text(size: 20pt)[Facultad \ de \ Ciencias]

    #v(1.4cm)
    
    #text(size: 20pt, weight: "bold")[#title]
    
    #text(size: 17pt)[#english-title]
    #v(2cm)

    #text(size: 14pt)[Trabajo de Fin de Grado \ para acceder al #v(0.3cm) *GRADO EN FÍSICA*]

    #v(2cm)
    
    #text(size: 14pt)[#grid(columns: (1fr,), gutter: 1em, align: right, ..authors.map(author => author + v(0.2cm)), date)]
    #pagebreak()
  ]

  // All the document
  body
}
