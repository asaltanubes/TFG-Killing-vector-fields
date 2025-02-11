#import "../things-to-add.typ": *


= Demostración ley de Snell

Si uno tiene una lente o algun otro tipo de material cuando la luz cambia de medio se 
desvía. Una forma de modelar esto es usando una teoría efectiva la cual describe el 
movimiento de la luz como si se encontrara en una métrica de la forma
$ dd(s) = v_"L "^2 (dd(t))^2 - (dd(x))^2 - (dd(y))^2 - (dd(z))^2 $

donde $v_"L "$ es la velocidad de la luz en ese punto.

Para demostrar esto se puede comenzar con un caso simple en el cual solo hay una frontera
plana entre dos objetos, tras esto se puede generalizar a casos más complejos mediante
cambios de variables.

== Caso simple
En este caso la métrica está determinada por la velocidad en función de la posición

$ v_"L " (x) = cases(v &"si" x<0, v' &"si" x >= 0) $

Para esta métrica hay tres campos de killing de interés

$ [xi^mu] = (1, 0, 0, 0) \
  [k^mu] = (0, 0, -1, 0)\
  [omega^mu] = (0, 0, -z, y) $


La ecuación de conservación del tercero no lo he hecho todavía pero es invarianza con
respecto a rotaciones y da la conservación del plano que forman el vector velocidad y
el vector normal al plano.

Las otras dos dan respectivamente la conservación de las componentes $u^2$ y $v_"L "^2 u^0$.
No es dificil de comprobar puesto que para todo  campo de killing la cantidad $K = k_mu u^mu
= tensor(g, - mu nu) k^nu u^mu$ es constante de movimiento. 

Ahora hay que darse cuenta de una cosa. Si el rayo de luz se mueve con un ángulo $theta$
con respecto al eje $x$ la velocidad en el eje $y$ será:

$ v_"L " sin(theta) = dv(y, t) = dv(y, sigma) dv(sigma, t) = dv(y, sigma) (dv(t, sigma))^(-1) 
= (u^2)/u^0 ==> \ ==> sin(theta) / v_"L " = u^2/(v_"L "^2 u^0) $
puesto que la parte derecha de la igualdad son cantidades conservadas la parte izquierda
también debe de serlo y por lo tanto 

$ sin(theta)/v_"L " = sin(theta')/v'_"L " $

#align(right)[
$qed$]

== Caso general

En el caso general basta con realizar un cambio de variable de forma que $y$ y $z$ 
parametrizan la superficie que separa los dos medios y $x$ sea perpendicular a la superficie.

De esta manera uno se puede dar cuenta que en un punto superficial el espacio tangente no
cambia entre ambos sistemas de referencia por lo tanto el ángulo se mantiene al hacer los
cambios de variable.

También es importante darse cuenta de que los campos de killing anteriores dejan de serlo
en puntos alejados de la superficie pero en la superficie sí que lo son por lo que es 
suficiente para demostrar el teorema.

== Anisotropos
tengo que hacerlo pero en este caso se usaría una métrica

$ dd(s) = (dd(t))^2 - (dd(x))^2/(v_"x ")^2 - (dd(y))^2/(v_"y ")^2 - (dd(z))^2/(v_"z ")^2 $

y se procedería de forma similar