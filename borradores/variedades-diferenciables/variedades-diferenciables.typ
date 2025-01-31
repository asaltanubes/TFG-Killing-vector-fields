#import "../things-to-add.typ": *
// #set text(font: "New Computer Modern Math")
= Variedades diferenciables y topológicas
En relatividad general el espacio tiempo se define como una variedad diferenciable 
pseudo-riemanniana cuya métrica obedece unas ciertas ecuaciones de campo. En esta sección
se va a motivar la definición de una variedad diferenciable y definir que es un sistema de 
coordenadas.

== Variedades topológicas
Antes de definir que es una variedad diferenciable hay que definir un objeto más simple al
cual se le imponen ciertas restricciones para definir las variedades diferenciables. 

Una variedad topológica es un espacio topológico al cual 'se le pueden dar coordenadas'

#align(center,
box(stroke: blue+2pt, inset: 4pt, radius: 4pt)[
*Definición: * Espacio topológico.  

Un espacio topológico es un conjunto de elementos $M$ y otro conjunto, $tau$, al que llamamos 
topología.

La topología define que es un conjunto abierto en $M$ y cumple las siguientes relaciones

#set math.equation(numbering: none)
$ emptyset, M in tau $

donde $emptyset$ es el conjunto vacío.

$ x_i in tau => Union_(i=0)^oo x_i in tau $

$ x_i in tau => Intersection_(i=0)^n x_i in tau $

])

En los espacios topológicos los conjuntos abiertos son también llamados entorno del punto.

En un espacio topológico se puede definir la continuidad de una función entre dos espacios
topológicos de la siguiente manera.

Sea $f: X --> Y$ una función entre dos espacios topológicos. Si $x in X$ cumple que para
todo entorno $V$ de $f(x) in V$, $f^(-1)(V)$ es un entorno de $x$ entonces $f$ es contínua en $x$.

Si una función es biyectiva, contínua y con inversa contínua se le llama homeomorfismo.

Un espacio topológico se llama *Hausdorff* si cumple que 
$ forall x, y in M #h(8pt) exists U, V in tau_M: U sect V = emptyset, x in U, y in V $

Un espacio topológico tiene *base numerable* si existe un conjunto $B subset tau_M$ numerable
tal que:
$ forall V in tau_M  space space exists U subset.eq B: V=Union_(u in U) u $ 

Si un espacio topológico $M$ cumple que cualquier conjunto abierto de su topología $tau$
es homeomórfico a $RR^n$. Y además es Hausdorff y con base numerable entonces es una 
variedad topológica y las coordenadas locales son los homeomorfismos de abiertos a $RR^n$.


