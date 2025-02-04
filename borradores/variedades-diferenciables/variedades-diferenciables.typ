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

Se define una especie de sistema de referencia global llamado Atlas a un conjunto de mapas $phi_i: U_i subset M -> V_i subset RR^n $ tal que $ union_i U_i = M$. Además se requiere que para cada pareja de mapas, si estas
'mapean' la misma sección de la variedad, entonces puedan definir una biyección entre ambos conjuntos. Es decir, si $U_i sect U_j != 0$ entonces $phi_j compose phi^(-1)_i$ es una biyección.


== Variedades diferenciables
Dos mapas son compatibles si se cumple que la biyección $phi_j compose phi^(-1)_i$ es #Cinf. 
Si se puede construir un Atlas tal que todos sus mapas con compatibles entonces este es un 
Atlas compatible.

Una *variedad diferenciable* es una variedad topológica que admite Atlas compatibles.

= Funciones escalares y curvas

== Funciones escalares y diferenciabilidad.

Una función escalar en una variedad es una función que mapea puntos de la variedad a números.
$ f: M->RR $

Puesto que en principio una variedad no tiene porqué tener una noción de distancia para definir
cuando una función es suave se usa un sistema de coordenadas local. Es decir, dado un Atlas $cal(A)$
la función $f$ es suave si $forall phi in cal(A)$ la función $f compose phi^(-1): RR^n --> RR$ es suave.

== Curvas suaves
Una curva es un mapa de un parámetro en la variedad

$ gamma: U subset RR --> M $

De manera similar a las funciones escalares una curva es suave si la curva $phi compose gamma$ es suave.
 

= Espacio tangente y campos vectoriales.
En el cálculo multivariable los campos vectoriales son funciones de $arrow(f): RR^n--> RR^n$. Esto da
una noción de que cada vector se encuentra en un punto concreto del espacio, sin embargo, el  espacio
final es el mismo para todos los vectores independientemente del punto. En una variedad diferenciable
esto no siempre se va a cumplir (en general nunca). Por ejemplo, en el caso de una esfera, si uno quisiera
definir un campo vectorial en la esfera este debería ser tangente, puesto que al tratarla como una variedad
diferenciable ignoramos la dimensión extra en la que se encuentra imbuida. Esto significa que cada
vector situado en un punto $p$ de la esfera vive en un espacio tangente a la esfera el cual corresponde
a un plano tangente a la esfera en el punto $p$. Por lo tanto cada punto tiene su propio plano tangente
y no corresponden al mismo espacio.

Por lo tanto es importante definir que es este  espacio tangente en una variedad antes de poder definir
los campos vectoriales.

== Espacio tangente
Queremos definir un espacio que corresponda con los vectores posibles en un punto concreto. Una idea que puede
tener uno es que, los posibles vectores podrían corresponder a las derivadas de curvas en $M$. Esta definición
es interesante pero tiene el problema de que  al no tener una noción de distancia en la variedad no se pueden 
tomar derivadas. Una forma de resolver este problema es usar las propias curvas como método para representar
las direcciones posibles de forma similar a como las fracciones representan los números racionales.

De esta manera se define la siguiente equivalencia entre curvas.

Sean $gamma_1$ y $gamma_2$ curvas tales que $gamma_1(0) = gamma_2(0)=p$ y $phi$ un mapa tal que un entorno
de $p$ está en su dominio. Se define la siguiente relación de equivalencia

$ gamma_1 tilde.op gamma_2 <==> (phi compose gamma_1)'(0) = (phi compose gamma_2)'(0) $

Es decir si sus derivadas son iguales al dar un sistema de coordenadas local.

De esta forma el espacio tangente en el punto $p$ es el conjunto de clases de equivalencia de las curvas
suaves con $gamma(0) = p$
