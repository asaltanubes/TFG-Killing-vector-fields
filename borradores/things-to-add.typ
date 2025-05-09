#import "@preview/physica:0.9.4": *

#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)

#let Union = math.op(sym.union.big, limits: true)
#let Intersection = $sect.big$
#let Cinf = $cal(C)^oo$
#let mapsto = $arrow.r.long.bar$
#let evalb(val, point) = $lr(val|)_point$

#let pb(func) = $func^*$
#let pf(func) = $func_*$

#let lie(vecf, obj) = text(
  features: ("ss01",),
  box($upright(cal(L))_vecf obj$),
)

#let svecfield(manifold) = $frak(X)(manifold)$ 
#let dualspace(space) = $space^*$

#let cdv(val, ..subindex) = {
  
  for sym in subindex.pos() {$nabla_sym$}
  
  $val$}

#let mipdv(val,super) = $ D^super val $
#let christoffel(index1, index2, index3) = $tensor(Gamma, index1, -index2 index3)$

#let cte = "cte"
#let pm = move(dy: -2pt, $plus.minus$)