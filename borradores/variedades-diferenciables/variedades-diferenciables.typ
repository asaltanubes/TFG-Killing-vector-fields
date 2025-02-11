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

Un espacio topológico es un conjunto de elementos $M$ y otro conjunto, $tau$, al que 
llamamos topología.

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
todo entorno $V$ de $f(x) in V$, $f^(-1)(V)$ es un entorno de $x$ entonces $f$ es contínua
en $x$.

Si una función es biyectiva, contínua y con inversa contínua se le llama homeomorfismo.

Un espacio topológico se llama *Hausdorff* si cumple que 
$ forall x, y in M #h(8pt) exists U, V in tau_M: U sect V = emptyset, x in U, y in V $

Un espacio topológico tiene *base numerable* si existe un conjunto $B subset tau_M$ 
numerable tal que:

$ forall V in tau_M  space space exists U subset.eq B: V=Union_(u in U) u $ 

Si un espacio topológico $M$ cumple que cualquier conjunto abierto de su topología $tau$
es homeomórfico a $RR^n$. Y además es Hausdorff y con base numerable entonces es una 
variedad topológica y las coordenadas locales son los homeomorfismos de abiertos a $RR^n$.

Se define una especie de sistema de referencia global llamado Atlas a un conjunto de mapas
$phi_i: U_i subset M -> V_i subset RR^n $ tal que $ union_i U_i = M$. Además se requiere 
que para cada pareja de mapas, si estas 'mapean' la misma sección de la variedad, entonces 
puedan definir una biyección entre ambos conjuntos. Es decir, si $U_i sect U_j != 0$ 
entonces $phi_j compose phi^(-1)_i$ es una biyección.


== Variedades diferenciables
Dos mapas son compatibles si se cumple que la biyección $phi_j compose phi^(-1)_i$ es #Cinf. 
Si se puede construir un Atlas tal que todos sus mapas con compatibles entonces este es un 
Atlas compatible.

Una *variedad diferenciable* es una variedad topológica que admite Atlas compatibles.

= Funciones escalares y curvas

== Funciones escalares y diferenciabilidad.

Una función escalar en una variedad es una función que mapea puntos de la variedad a números.
$ f: M->RR $

Puesto que en principio una variedad no tiene porqué tener una noción de distancia para 
definir cuando una función es suave se usa un sistema de coordenadas local. Es decir, dado 
un Atlas $cal(A)$ la función $f$ es suave si $forall phi in cal(A)$ la función 
$f compose phi^(-1): RR^n --> RR$ es suave.

== Curvas suaves
Una curva es un mapa de un parámetro en la variedad

$ gamma: U subset RR --> M $

De manera similar a las funciones escalares una curva es suave si la curva 
$phi compose gamma$ es suave.
 

= Espacio tangente y campos vectoriales.
En el cálculo multivariable los campos vectoriales son funciones de 
$arrow(f): RR^n--> RR^n$. Esto da una noción de que cada vector se encuentra en un punto 
concreto del espacio, sin embargo, el  espacio final es el mismo para todos los vectores 
independientemente del punto. En una variedad diferenciable esto no siempre se va a 
cumplir (en general nunca). Por ejemplo, en el caso de una esfera, si uno quisiera definir 
un campo vectorial en la esfera este debería ser tangente, puesto que al tratarla como una 
variedad diferenciable ignoramos la dimensión extra en la que se encuentra imbuida. Esto 
significa que cada vector situado en un punto $p$ de la esfera vive en un espacio tangente 
a la esfera el cual corresponde a un plano tangente a la esfera en el punto $p$. Por lo 
tanto cada punto tiene su propio plano tangente y no corresponden al mismo espacio.

Por lo tanto es importante definir que es este  espacio tangente en una variedad antes de 
poder definir los campos vectoriales.

== Espacio tangente
Queremos definir un espacio que corresponda con los vectores posibles en un punto concreto. 
Una idea que puede tener uno es que, los posibles vectores podrían corresponder a las 
derivadas de curvas en $M$. Esta definición es interesante pero tiene el problema de que 
al no tener una noción de distancia en la variedad no se pueden  tomar derivadas. Una 
forma de resolver este problema es usar las propias curvas como método para representar 
las direcciones posibles de forma similar a como las fracciones representan los números 
racionales.

De esta manera se define la siguiente equivalencia entre curvas.

Sean $gamma_1$ y $gamma_2$ curvas tales que $gamma_1(0) = gamma_2(0)=p$ y $phi$ un mapa 
tal que un entorno de $p$ está en su dominio. Se define la siguiente relación de equivalencia

$ gamma_1 tilde.op gamma_2 <==> (phi compose gamma_1)'(0) = (phi compose gamma_2)'(0) $

Es decir si sus derivadas son iguales al dar un sistema de coordenadas local.

De esta forma el espacio tangente en el punto $p$, denotado $T_p M$, es el conjunto de 
clases de equivalencia de las curvas suaves con $gamma(0) = p$.

Con esta definición queda claro que la noción de espacio tangente no es tanto una noción 
de vector 'clásica' como flecha que apunta en una dirección sino que más bien es algo así
como las posibles direcciones en las que uno se puede mover desde $p$.

Existe una segunda definición, equivalente a la primera, que define el espacio tangente
como una especie de análogo a las derivadas direccionales.

Para ello se define una derivación. Una derivación es una función lineal $D: Cinf--> RR$
que además satisface la regla del producto $D(f dot g) = D(f) dot g(a) + f(a) dot D(g)$. 
El espacio tangente sería entonces el conjunto de derivaciones en el punto $p$.

Es facil ver que ambas definiciones son equivalentes puesto que para cualquier curva
$ D_gamma f = dv(,t)(f compose gamma)(0) $
es una derivación en el punto $p$.

== Campos vectoriales

Un campo vectorial se puede interpretar como una función que mapea puntos de la variedad 
a los correspondientes espacios tangentes. Por simplificar la notación se suele usar la 
noción de paquete tangente
$ T M = Union_(p in M) T_p M $

cuyos elementos se suelen denotar $(p, v) in T M$ de forma que $v in T_p M$. Así se puede
definir el llamado mapa proyectivo $pi(p,  v) = p$.

De esta forma un campo vectorial sería un mapa $X: M-->T M$ que cumple que $pi compose X =
id_M$ donde $id_M$ es la función identidad.

Esencialmente esto quiere decir que $p mapsto X_p in T_p M$. 

Si se tiene un sistema de coordenadas $(U, (x^i))$ entonces se puede escribir el campo 
mediante la base de derivadas parciales

$ X_p = X^i (p) evalb(pdv(, x^i), p) $

De esta forma se dice que $X_p$ es suave si todas las $X^i$ son suaves.

= Mapeados suaves entre variedades y diffeomorfismos

Un mapeado entre dos variedades diferenciables, $M$ y $N$ es una función $F: M-->N$.
Dado un sistema de coordenadas $(U, phi)$ para $M$ y $(V, psi)$ para $V$ de forma que
$p in U$ y $F(p) in V$. Se dice que el mapeado es suave si la función $psi compose F 
compose phi^(-1)$ es suave. Esencialmente lo que se hace es el siguiente proceso

$ RR^n -->^(phi^(-1)) M -->^F N -->^psi RR^n $

Puesto que $phi$ y $psi$ son homeomorfismos $F$ es suave si también lo es la composición
con estos.

Un *Diffeomorfismo* es un mapeado continuo con inversa continua.

Los diffeomorfismos dan una noción de equivalencia en el sentido de que si dos variedades
son diffeomórficas enconces podemos considerarlas 'equivalentes' y se puede escribir
$M approx N$.

== Pullback y pushforward

Si uno tiene un campo escalar $f$ en una variedad $N$. Y además tiene otra variedad con
un mapeado suave $F: M --> N$. Entonces puede convertir el campo escalar $f$ en un campo
escalar en $M$ mediante el 'pullback' 

$ pb(F)f = f compose F $
Esencialmente se tiene que $M-->^F N -->^f RR$ por lo que $pb(F)f$ es  un campo escalar en 
$M$. 

Si además $F$ es un diffeomorfismo se puede definir el pushforward $pf(F)$ que mapea campos
escalares en $M$, $g$, a campos escalares en $N$ de la siguiente manera.

$ pf(F) g = pb((F^(-1))) g = g compose F^(-1) $

Puesto que $(f+g)(p) = f(p) + g(p)$ el pushforward y el pullback son lineales.

De forma similar puesto que $(f g)(p) = f(p) g(p)$ tanto para el pullback como para el 
pushforward ambos son 'lineales' con respecto al producto de campos escalares.

== Diferencial
El diferencial de un mapeado suave esencialmente actua como el pushforward para campos 
vectoriales. El diferencial, $dd(F): T_p M --> T_F(p) N$, se define de la siguiente manera

$ dd(F)(v) = v compose pb(F) $

Esencialmente se usa que $T_F(p) N = {phi: Cinf(N) -->RR}$ y 
$T_p M =  {phi: Cinf(M) --> RR}$ de forma que 
$ Cinf(N) -->^pb(F) Cinf(M) -->^v RR $ 
por lo que 
$v compose pb(F): Cinf(N) --> RR ==> v compose pb(F) in T_F(p) N$

= Flujos y curvas integrales

A la hora de definir la derivada de lie va a ser de vital importancia la noción de flujos.
Un flujo, de forma intuitiva, describe el movimiento de una partícula cuya velocidad es 
un campo vectorial dado. 

La forma de definir esta noción de forma rigurosa es la de las curvas integrales. Si uno
tiene una curva $gamma: J subset RR --> M$ y un campo vectorial $V in svecfield(M)$
entonces la 'derivada' de $gamma$ es el correspondiente elemento del espacio tangente
en $gamma(t)$. 

Se dice que $gamma$ es una curva integral de $V$ si cumple que $gamma(t) = V(gamma(t)) 
space forall t$. 

Si uno toma un sistema de coordenadas obtendrá un sistema de ecuaciones diferenciales
de la forma $gamma^i '(t) = V^i (gamma(t))$. La existencia y unicidad de soluciones de 
este sistema está garantizado puesto que $V$ es suave, por lo tanto, Lipschitz. Un punto
interesante que surgirá más adelante es que no es dificil ver que si $gamma$ es solución
entonces $hat(gamma)(t) = gamma(t+t_0)$ también lo será.

== Flujos
Una manera de pensar en las curvas integrales es como diffeomorfismos $M-->M$. Si uno 
tiene el siguiente problema de valor inicial

$ cases(dv(phi.alt(t, p), t) = V(phi.alt(t, p)), phi.alt(0, p) = p) $

entonces fijando $t$, $phi.alt^t (p) = phi.alt(t, p)$, se obtiene un diffeomorfismo puesto
que las soluciones son únicas.

Además puesto que las curvas integrales admiten un cambio de parámetro cambiando $t_0$ se 
tiene que 
$ phi.alt(t, phi.alt(s, p)) = phi.alt(t+s, p) $

De esta manera 
$phi.alt^(-t)(phi.alt^t(p)) = phi.alt^0(p) = p ==> phi.alt^(-t) = (phi.alt^t)^(-1)$

= Tensores y espacio dual

== Espacio dual
Si uno tiene un espacio vectorial $V$ uno puede definir un tipo de funciones entre dos
espacios vectoriales llamadas lineales las cuales cumplen que para cualquier conjunto de 
escalares ($a, b$) y vectores ($u, v$)

$ f(a dot v + b dot u) = a f(a) + b f(b) $

En concreto, se pueden definir funciones de $V-->RR$ con la estructura habitual de espacio
vectorial de los números reales. Uno puede definir la suma y multiplicación por un escalar
de estas funciones de forma simple como
$ (f+g)(v) = f(v) + g(v) \ (a f)(v) = a f(v) $

Usando esta definición es claro que esto forma un segundo espacio vectorial al cual vamos
a denotar $dualspace(V)$ o espacio dual de $V$. Es facil ver que $dualspace(V)$ tiene que
tener la misma dimensión que $V$. Esto es porque si $V$ tiene $n$ dimensiones entonces 
tiene una base ${v_1, ..., v_n}$. Si uno evalua un vector arbitrario $u$ con una función
lineal obtiene

$ f(u) = f(alpha^i v_i) = alpha^i f(v_i) $

De esta forma uno puede ver que determinando los $n$ números correspondiendo a las $f(v_i)$
la función $f$ queda perfectamente determinada por lo que el espacio $dualspace(V)$ tiene
$n$ dimensiones.

== Pullback de covectores

Si uno tiene un covector y un mapeado entre variedades $F: M --> N$ se puede definir el 
pullback $pb(F): dualspace(T_F(p) N) --> dualspace(T_p M) $ de un elemento del espacio 
cotangente $omega$ mediante $(pb(F) omega) (v) = omega compose pf(F)(v)$. Es decir, se 
translada $v$ a $T_F(p) N$ con el pushforward y ahí si aplica $omega$.

== Tensores
Ahora uno podría querer extender este razonamiento a funciones con más de un 'input' y que
devuelvan vectores en vez de solo escalares. Esto da la noción de funciones multilineales.

Comenzando por el caso más simple función multilineal es aquella la cual toma elementos de
$V times V times V ...$ y devuelve números reales y además cumple la siguiente relación

$ T(v_1, v_2, ..., alpha v_i + beta u_i, ...) = alpha T(v_1, v_2, ..., v_i, ...) + beta T(v_1, v_2, ..., u_i, ...) $

para cualquier $i$.

Es interesante notar que si uno tiene una pareja de vectores arbitrarios escritos en unas 
bases ${arrow(e)_i}$ y ${arrow(e)'_i}$, $v = v^i arrow(e)_i$ y $u = u^i arrow(e)'_i$, 
y una aplicación multilineal con dos inputs, $T(v, u)$, entonces se puede definir
$tensor(T, - alpha beta) := T(arrow(e)_alpha, arrow(e)'_beta)$ y usando linealidad se 
obtiene que $T(v, u) = v^alpha u^beta tensor(T, -alpha beta)$. Por lo que de nuevo la 
función está determinada por los números $tensor(T, -alpha beta)$

Ahora uno podría querer intentar generalizar esto y obtener aplicaciones mulilineales que
devuelvan vectores, múltiples vectores o incluso otras funciones multilineales. Esto, 
que en principio parece dificil de conseguir, solo requiere de añadir el espacio dual al
input de nuestra aplicación.

=== Ejemplo con vectores
Imaginemos que queremos una aplicación multilineal $G$ que coja dos vectores y devuelva
otro. Si por ejemplo se tiene que $w = G(u, v)$, entonces se puede definir una aplicación
multilineal de $dualspace(V) times V times V --> RR$ usando elementos del espacio dual.
Si $omega in dualspace(V)$

$ T(omega, u, v) = omega(G(u, v)) $

Además $T$ tiene la misma información que $G$ puesto que si uno tiene una base ${arrow(e)_i}$
de $V$ y una base de $dualspace(V)$ ${omega^i}$ tal que $omega_i (arrow(e)_j) = delta_(i j)$
y definiendo $tensor(T, +i, - j k) = T(omega^i, arrow(e)_j, arrow(e)_k)$ entonces

$ w^i = tensor(T, +i, - j k) u^j v^k $

Por lo tanto uno obtiene de forma automática lo que quería si permite copias de el espacio
dual en el 'input' de la función. De esta manera se define un tensor de tipo $(p, q)$ o
$p$ veces contravariante y $q$ veces covariante como una aplicación multilineal

$ T: underbrace(dualspace(V) times ... times dualspace(V), p "copias") times underbrace(V times ... times V, q "copias") --> RR $

== Campos tensoriales en variedades diferenciables

En una variedad diferenciable un campo tensorial es un mapa que a cada punto le asigna
un tensor de un tipo arbitrario donde $V = T_p M$. Por ejemplo, la métrica es un campo
tensorial de tipo $(0, 2)$ y por lo tanto es una función $g_p: T_p M times T_p M --> RR$.

De forma similar a en el caso de los campos vectoriales para determinar si un campo
tensorial es contínuo vamos a definir una base y unas componentes y el tensor será suave
si las componentes son suaves.

Si uno tiene un tensor de tipo $(p, q)$ $T$ y además una base de $T_p M$ {$e_i$} y 
$dualspace(T_p M)$ ${omega^i}$ entonces las funciones componente de $T$ son:

$ tensor(T, + i_1  ... i_p, - j_1  ... j_q)(p) = T_p (omega^(i_1)(p),  ..., omega^(i_p)(p), e_(j_1)(p), ..., e_(j_q)(p)) $

== Pullback de un tensor

Igual que podemos hacer pullbacks y pushforwards de funciones escalares y campos
vectoriales se puede hacer el pullback de un campo tensorial usando un mapeado contínuo 
entre variedades. En el libro que tengo solo explican este concepto para tensores puramente
covariantes, esto es suficiente en nuestro caso puesto que el resto de componentes se 
podrían bajar con el tensor métrico.

Sea $T$ un tensor $k$ veces covariante, es decir $T: (T_p N)^k --> RR$, y $F: M--> N$ un
mapa.

El pullback de $T$ se define como $T$ actuando sobre el pushforward de los vectores de 
$T_(F^(-1)(p)) M$.

$ ( pb(F)T)_(p)(A, B, C, D, ...) = T_F(p) (dd(F)_p (A), dd(F)_p (B), dd(F)_p (C),
dd(F)_p (D), ...) $

= Derivada de Lie

La derivada de Lie es un operador lineal que actua de forma que dado un campo vectorial
toma la derivada del objeto que se le paso a lo largo del flujo del campo. En cierto 
sentido es como una derivada direccional en la que en cada punto el campo dicta en qué
dirección hay que tomar la derivada.

== Derivada de Lie de un campo escalar

El caso de los campos escalares es el más simple, esto es porque el producto final de un
campo escalar es un número por lo que se puede dar una definición muy similar al de una
derivada 'clásica'. 

$ lie(X, f) = lim_(t->0) (f(phi.alt^t (p))-f(p))/t = dv(,t)(f compose phi.alt^t) = X(f) $

== Derivada de Lie de un campo vectorial
Uno podría intentar hacer lo mismo que en los campos escalares y definir la derivada de 
Lie mediante la diferencia de los campos en los puntos $p$ y $phi.alt^t (p)$, sin embargo,
el primero de estos es un elemento de $T_p M$ y el segundo de $T_(phi.alt(t, p)) M$ por lo
que no se puede calcular la diferencia de ambos. Para poder definir este objeto hay que 
llevar ambos objetos al mismo espacio. Para ello se puede usar el diferencial del flujo 
inverso para mapear $T_(phi.alt^t(p)) M$ a $T_p M$. De esta forma se define

$ lie(X, Y) = lim_(t->0) (dd(phi.alt^(-t))_(phi.alt^t (p))(Y_(phi.alt^t (p)))- Y_p)/t $

Esta expresión resulta ser equivalente a el braket de lie de ambos campos definido como 
$ [X, Y](f) = X(Y(f)) - Y(X(f)) $

Para demostrarlo se puede hacer dando un sistema de coordenadas, en concreto se puede 
elegir $X=diff_0$ en los puntos en los que $X!=0$. Con esta elección de coordenadas 
$phi.alt^t (x^0, x^1, ...) = (x^0+t, x^1, ...)$ y 
$ dd(phi.alt^(-t))_(phi.alt^t (p))(evalb(pdv(,x^i), phi.alt^(t)(p)))=evalb(pdv(, x^i), p) $<ec:diff-flux-lie-proof-vector-field>. 

Con estas coordenadas el braket es 
#[
#let ppdv(ind) = $pdv(, x^ind)$ 
$ [X, Y] = [ppdv(0), Y^j ppdv(j)]= ppdv(0)(Y^j ppdv(j)) - Y^j ppdv(j)(ppdv(0)) = \
\= ppdv(0)(Y^j) ppdv(j) + cancel(Y^j ppdv(0)(ppdv(j))) - cancel(Y^j ppdv(0)(ppdv(j))) =
pdv(Y^j, x^0) ppdv(j)  $



Por otro lado la derivada de lie se convierte en

$ lie(X, Y) = lim_(t->0) (dd(phi.alt^(-t))_(phi.alt^t (p))(Y_(phi.alt^t (p)))- Y_p)/t = 
lim_(t->0) (Y^j_(phi.alt^t (p)) dd(phi.alt^(-t))_(phi.alt^t (p)) (evalb(ppdv(j), 
phi.alt^t(p))) - Y^i_p evalb(ppdv(i), p))/t =^(#ref(<ec:diff-flux-lie-proof-vector-field>))\
= lim_(t->0) (Y^j_(phi.alt^t (p)) evalb(ppdv(j), p) - Y^i_p evalb(ppdv(i), p))/t = 
lim_(t->0) (Y^i_(phi.alt^t(p)) - Y^i_p)/t evalb(ppdv(i), p) = (lie(X, Y^i))_p evalb(ppdv(i), p)
= ppdv(0)(Y^i) ppdv(i) #h(5pt) $
]

En los puntos en los cuales $X=0$ y por lo tanto no se puede tomar este sistema de
coordenadas la derivada de Lie es nula puesto que $phi.alt^t (p) = p$. Además el braket
también se anula puesto que $Y(0) = X(dot) = 0$. Por lo tanto ambas expresiones son nulas
en ambos casos.

$ lie(X, Y) = [X, Y] $

== Derivada de Lie de un tensor covariante
La derivada de Lie de un tensor covariante se define de forma similar a los campos 
vectoriales usando el pullback y el pushforward.

$ lie(X, T) = lim_(t->0) (pb(phi.alt^t) T_(phi.alt^t (p)) - T_p )/t $

Esta expresión puede demostrarse que es equivalente a

$ (lie(X, T))(A, B, ...) = lie(X, (T(A, B, ...))) - T(lie(X, A), B, ...)
- T(A, lie(X, B), ...) $

donde $lie(X, (T(A, B, ...)))$ es la derivada del campo escalar que a cada punto le asigna
el valor al evaluar los campos vectoriales con $T$.

// todo: demostrarlo

=== Tensor métrico

En el caso del tensor métrico se tiene que 

$ lie(X, g)  $