#import "../things-to-add.typ": *

= Métrica de Kerr y frame dragging


$ dd(s)^2 = (1-(r_s r)/Sigma) dd(t)^2  - Sigma/Delta dd(r)^2 - Sigma dd(theta)^2

- (r^2 + a^2 + (r_s r a^2)/Sigma sin^2(theta)) sin^2(theta) dd(phi)^2 - (2 r_s r a sin^2(theta))/Sigma dd(t) dd(phi)

\
a = J/M
\
Sigma = r^2 + a^2 cos^2(theta)
\
Delta = r^2 -r_s r + a^2
$

En este espacio se tienen dos campos de Killing de interés, el primero es 
$ omega^mu = delta^(mu t) $
Este campo de Killing da lugar a la siguiente cantidad conservada

$ E = omega_mu u^mu = g_(mu alpha) omega^alpha u^mu = g_(mu alpha) delta^(alpha t) u^mu =
g_(mu t) u^mu = g_(t mu) u^mu = u_t $

De manera similar existe un segundo campo de killing en la dirección $phi$

$ xi^mu = delta^(mu phi) $

que da lugar a la cantidad conservada 

$ L = xi_mu u^mu = g_(mu alpha) xi^alpha u^mu = u_phi $

Puesto que la métrica es diagonal excepto en el bloque correspondiente al subespacio 
$phi, t$ la métrica contravariante será diagonal excepto las componentes 
$g^(phi t) = g^(t phi)$. De esta manera uno obtiene que

$ u^t = g^(t t) E + g^(t phi) L
\
u^phi = g^(phi t) E + g^(phi phi)L $

Se puede ahora tomar un ejemplo de partícula que comienza en reposo y cae al agujero negro,
en este caso se tiene 
$ 
  cases(E = g_(t nu) u^nu (tau = 0) = g_(t t)(x^mu (tau = 0)),
        L = g_(phi nu) u^nu (tau=0) = g_(phi t) (x^mu (tau=0))) 
$

Si ahora se permite evolucionar el sistema se obtiene

$ u^phi (tau) = g^(phi t) (x(tau)) E + g^(phi phi) (x(tau)) L $

Este sistema tiene que $u^phi != 0$ al evolucionar, de hecho para soluciones con energía 
existe un punto a partir del cual todas las partículas se mueven.

Esta superfice de 'no estacionareidad' está descrita por la condición 

$ g^(phi phi)(x^mu) = 0 $

Puesto que $g^(phi phi) prop g_(t t) $ se tiene que esta superficie corresponde a  

$ 1 - (r_s r)/Sigma = 0 => Sigma - r_s r = 0 => r^2 - r_s r + a^2 cos^2(theta) = 0
\ 
=> r_pm = (r_s pm sqrt(r_s^2 - 4 a^2 cos^2(theta)))/2 = r_s/2 pm sqrt((r_s/2)^2 - a^2 cos(theta)) $

Para que existan soluciones resulta necesario imponer la condición $a < r_s/2$. Esta 
condición es la impuesta por la hipótesis de censura cósmica en la cual se postula la 
no existencia de singularidades descubiertas.

La superficie dada por $r_+$ (tomando el valor positivo de el $pm$) es la llamada ergosfera.
A partir de este punto y hasta llegado una zona más interna del agujero negro todo objeto 
que cae debe comenzar a rotar con el agujero negro, este efecto es el llamado frame dragging.

El origen de este efecto es el término $g_(phi t)$ no nulo. Esto es consecuencia directa de
la ruptura de la simetría $t -> -t$ y $phi -> -phi$ por separado pero manteniendo la simetría $t, phi -> -t, -phi$ (ambas de forma simultánea).

Queda así demostrado que cualquier sistema estacionario, con simetría cilíndrica ($partial_phi$ es campo de Killing), con componente $g_(phi, t)$  no nula manteniendo el 
resto de términos no diagonales asociados al tiempo o a la coordenada $phi$ puede sufrir 
frame dragging. Además si las componentes $g_(phi phi)$ o $g_(t t)$ se anulan en algún punto
este lugar será una superficie de no estacionareidad.