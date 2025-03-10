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

$ cdv(K_beta, gamma, alpha) = - tensor(R, -alpha beta gamma, delta) K_delta $<ec:rel-der-killing-vector>

Con esta ecuación se puede resolver en términos de la serie de Taylor de los campos de
Killing. Para ello se expande $K_delta$ en series de Taylor. Usando la notación multi-índice
de forma que 
$ alpha = (alpha_1, alpha_2, alpha_3, ..., alpha_n) in NN^n \ 
|alpha| = sum_i alpha_i \
mipdv(f, alpha) = (diff^(|alpha|) f)/((diff x^1)^(alpha_1) (diff x^2)^(alpha_2)...
(diff x^n)^(alpha_n)) \ 

alpha! = #sym.product _i alpha_i !

x^alpha = #sym.product _i (x^i)^(alpha_i)
$

La serie de taylor queda como

$ K_delta (x) = sum_(|alpha|=0)^oo (mipdv(K, alpha)(p))/alpha! (x-p)^alpha $

Ahora mediante la @ec:rel-der-killing-vector los términos de $|alpha| = 2$  quedan determinados
por $K(p)$ y $partial_mu K(p)$, los términos de $|alpha|=3$ se obtienen mediante las derivadas
de la misma ecuación y así para cualquier $|alpha|$. Todas estas relaciones son lineales
por lo que se puede escribir

$ mipdv(K_delta, alpha) =
 tensor(hat(A), -delta, gamma)(p, alpha) K_gamma (p)
+tensor(hat(B), -delta, gamma, beta)(p, alpha) partial_gamma K_beta (p)  
$

Sustituyendo en la serie de taylor se obtiene
$ K_delta (x) &= sum_(|alpha| = 0)^oo (mipdv(K, alpha)(p))/alpha! (x-p)^alpha  
 \ &= sum_(|alpha| = 0)^oo 1/alpha! (x-p)^alpha (tensor(hat(A), -delta, gamma)(p, alpha) K_gamma (p)
+tensor(hat(B), -delta, gamma, beta)(p, alpha) partial_gamma K_beta (p)  
) 
\ &= (sum_(|alpha| = 0)^oo 1/alpha! (x-p)^alpha tensor(hat(A), -delta, gamma)(p, alpha)) K_gamma (p)
+(sum_(|alpha| = 0)^oo 1/alpha! (x-p)^alpha tensor(hat(B), -delta, gamma, beta)(p, alpha)) partial_gamma K_beta (p)
\ &= tensor(A, -delta, gamma)(x, p)K_gamma (p) + 2 tensor(B, -delta, gamma beta)(x, p) partial_gamma K_beta (p)
$

Ahora se puede imponer una condición adicional en esta ecuación usando la ecuación de killing
puesto que 
$ partial_alpha K_beta = -partial_beta K_alpha + 2 christoffel(sigma, alpha, beta) K_sigma $

aplicando esto se obtiene

$ K_delta (x) &= tensor(A', -delta, gamma)(x, p) K_gamma (p) + 
                tensor(B, -delta, gamma sigma)(x, p) (partial_gamma K_sigma (p) + partial_gamma K_sigma (p))
                
             \ &= tensor(A', -delta, gamma)(x, p) K_gamma (p) + 
tensor(B, -delta, gamma sigma)(x, p) (partial_gamma K_sigma (p) 
                                    - partial_sigma K_gamma (p) + 2 christoffel(alpha, gamma, sigma) K_alpha (p))
\ &= underbrace((tensor(A', -delta, alpha)(x, p) + 2 tensor(B, -delta, gamma sigma)(x, p)christoffel(alpha, gamma, sigma)), tensor(A, -delta, alpha)(x, p)) K_alpha + 
tensor(B, -delta, gamma sigma)(x, p) (partial_gamma K_sigma (p) - partial_sigma K_gamma (p))
\ &= tensor(A, -delta, gamma)(x, p) K_gamma (p) 
   + tensor(B, -delta, gamma sigma)(x, p)(partial_gamma K_sigma (p) - partial_sigma K_gamma (p))
 $<ec-cosm:general-killingfield-form>

En esta ecuación final se obtiene una información muy importante. Puesto que los tensores
$A$ y $B$ son independientes del campo de killing los campos de killing forman un espacio
vectorial de dimensión $n + (n (n-1))/2 = (n(n+1))/2$. Esto es puesto que los campos de 
killing quedan definidos por los valores de $K_gamma (p)$ y $partial_gamma K_sigma (p)$,
el primer término da $n$ elementos y el segundo por ser antisimétrico en la ecuación $n(n-1)/2$.

Para definir una base de este espacio se elige un conjunto de campos de killing
dando una serie de elementos del espacio tangente en $p$ y a partir de la 
@ec-cosm:general-killingfield-form se extiende a una base en todo el espacio. 
Es importante decir que el hecho de que se pueda elegir una base con n elementos
no implica que existan n campos de Killing. Esto es porque puede ocurrir que 
los términos de $A$ y $B$ al combinarlos con ciertos elementos de la base den
lugar a un campo de Killing nulo, esto indica que el espacio no tiene todas las 
posibles simetrías de un espacio con su dimensión.


Por un lado tenemos los términos que acompañan al término $tensor(A, - delta, gamma)$.
Aquí se tendrán n posibles términos, uno por cada dimensión del espacio. De esta forma
se puede elegir de forma que el elemento $gamma$ todas sus componentes sean nulas excepto
el componente $gamma$ que valga uno.

$ K^((gamma))_alpha (p) = delta^gamma_alpha \
partial_sigma K^((gamma))_alpha (p)= 0  $ 

donde $gamma$ es una etiqueta para cada campo. Si un espacio tiene una base completa
de estos elementos en todo punto se llama homogéneo. La razón de esta definición se 
explorará más adelante junto con la isotropía.


Además de los elementos anteriores se tienen los términos de $tensor(B, -delta, gamma sigma)$. 
Aquí se sigue el mismo proceso que en la parte anterior, sin embargo, por la 
antisimetría de estos términos usando una notación similar
a la anterior pero haciendo las derivadas parciales no nulas
se tiene que $K^((gamma, sigma)) = - K^((sigma, gamma))$. Para introducir
esto se definen $n(n-1) slash 2$ términos independientes de la forma

$ K^((gamma, sigma))_alpha (p) = 0\
partial_alpha K^(gamma, sigma)_beta = delta^(gamma, sigma)_(alpha, beta) - delta^(sigma, gamma)_(alpha, beta)
$

Si un espacio tiene una base completa de estos elementos en todo punto lo llamamos isótropo.