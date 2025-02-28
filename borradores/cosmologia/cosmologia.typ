#import "../things-to-add.typ": *


= Derivación de la métrica de Friedman-Lemaître-Robertson-Walker

En cosmología la métrica fundamental que describe el espacio tiempo a gran escala es la 
métrica FLRW o de Friedman-Lemaître-Robertson-Walker. En coordenadas esféricas tiene la 
siguiente expresión 

$ dd(s)^2 = -dd(t)^2 + a^2(t)((dd(r)^2)/(1-k r^2) + r^2 dd(theta)^2 + r^2 sin(theta)^2 dd(phi)^2) $

donde $a(t)$ es el llamado factor de escala y describe la expansión y contracción del 
universo y $k$ es el signo de la curvatura del espacio.

Esta sección es bastante matemática y es relativamente larga por lo que es facil perderse.
Por ello se da una idea del camino que lleva la demostración.

+ Definir las condiciones que se imponen a la métrica
+ Se demuestra que la métrica tiene forma $dd(s)^2 = -dd(t)^2 + a(t) tensor(g, - i j)(x) dd(x^i) dd(x^j)$
+ Se demuestra que la parte espacial de la métrica $tensor(g, - i j)$ tiene que ser un espacio de curvatura seccional constante
+ Se demuestra que los espacios de curvatura seccional constante son isométricos con una n esfera, hiperboloide o un espacio euclídeo de n dimensiones.

== Condiciones para el espacio tiempo a gran escala

A pesar de que a pequeñas escalas el universo no parece tener muchas simetrías. A gran
escala se observa que el universo es totalmente homogéneo e isótropo. Es decir, invariante
frente a translaciones y frente a rotaciones de este. Esto lleva a pensar que la métrica 
del espacio debe tener estas propiedades puesto que si no las tuviera se generarían 
fuerzas gravitatorias que romperían la simetría. 

El primer paso definir en que consisten las rotaciones y translaciones para poder definir
isotropía y homogeneidad de forma rigurosa.

=== Forma general de los campos de Killing

El primer paso consiste en definir que es una rotación y una translación. Para ello el 
camino a seguir va a ser, primero obtener una forma general de los campos de Killing. Y 
a partir de esto obtener una base de este espacio de isometrías de forma que unos elementos
van a corresponder a rotaciones y otros a translaciones.

Un punto por el que comenzar es el tensor de riemann puesto que tiene simetrías similares
a las de la ecuación de Killing

$ tensor(R, - alpha beta gamma,  delta) K_delta = cdv(cdv(K_gamma, beta), alpha) - 
cdv(cdv(K_gamma, alpha), beta) $<ec:riemann-applying-to-killing-vector>

Usando que el tensor de Riemann cumple la identidad de Bianchi 

$ tensor(R, -alpha beta gamma, delta) + tensor(R, - gamma alpha beta, delta) + 
tensor(R, - beta gamma alpha, delta) = 0 $

Y multiplicando por $K_delta$ y sustituyendo la @ec:riemann-applying-to-killing-vector se 
obtiene

$     cdv(K_gamma, alpha, beta) - cdv(K_gamma, beta, alpha)
     +cdv(K_beta, gamma, alpha) - cdv(K_beta, alpha, gamma)
     +cdv(K_alpha, beta, gamma) - cdv(K_alpha, gamma, beta)=
     
 \   cdv(K_gamma, alpha, beta) - cdv(K_beta, alpha, gamma) 
    +cdv(K_alpha, beta, gamma) - cdv(K_gamma, beta, alpha)
    +cdv(K_beta, gamma, alpha) - cdv(K_alpha, gamma, beta)=

\    cdv((cdv(K_gamma, beta) - cdv(K_beta, gamma)), alpha) +
     cdv((cdv(K_alpha, gamma) - cdv(K_gamma, alpha)), beta) +
     cdv((cdv(K_beta, alpha) - cdv(K_alpha, beta)), gamma) =

 \  2(cdv(K_gamma, alpha, beta) + cdv(K_alpha, beta, gamma) + cdv(K_beta, gamma, alpha)) = 0 $

Ahora identificando el término $cdv(K_alpha, beta, gamma) = - cdv(K_gamma,
beta, alpha)$ de la @ec:riemann-applying-to-killing-vector se obtiene

$ cdv(K_beta, gamma, alpha) = - tensor(R, -alpha beta gamma, delta) K_delta $

Con esta ecuación se puede resolver en términos de la serie de Taylor de los campos de
Killing. Para ello 