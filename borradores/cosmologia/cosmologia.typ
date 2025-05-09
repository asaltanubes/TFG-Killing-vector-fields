#import "../things-to-add.typ": *


= Derivación de la métrica de Friedman-Lemaître-Robertson-Walker

En cosmología la métrica fundamental que describe el espacio tiempo a gran escala es la 
métrica FLRW o de Friedman-Lemaître-Robertson-Walker. En coordenadas esféricas tiene la 
siguiente expresión 

$ dd(s)^2 = -dd(t)^2 + a^2(t)((dd(r)^2)/(1-k r^2) + r^2 dd(theta)^2 + r^2 sin(theta)^2 dd(phi)^2) $<ec-cosm:métrica-FLRW>

donde $a(t)$ es el llamado factor de escala y describe la expansión y contracción del 
universo y $k$ es el signo de la curvatura del espacio.

Esta sección es bastante matemática y es relativamente larga por lo que es facil perderse.
Por ello se da una idea del camino que lleva la demostración.

+ Definir las condiciones que se imponen a la métrica
+ Se demuestra que la métrica tiene forma $dd(s)^2 = -dd(t)^2 + a(t) tensor(g, - i j)(x) dd(x^i) dd(x^j)$
+ Se demuestra que la parte espacial de la métrica $tensor(g, - i j)$ tiene que ser un espacio de curvatura seccional constante
+ Aplicando el teorema de Killing-Hopf se obtiene que la parte espacial de la métrica tiene que ser isométrica a una esfera, un hiperboloide o un espacio plano y se obtiene la expresión de estas métricas.

== Condiciones para el espacio tiempo a gran escala

A pesar de que a pequeñas escalas el universo no parece tener muchas simetrías. A gran
escala se observa que el universo es totalmente homogéneo e isótropo. Es decir, invariante
frente a translaciones y frente a rotaciones de este. Esto lleva a pensar que la métrica 
del espacio debe tener estas propiedades puesto que si no las tuviera se generarían 
fuerzas gravitatorias que romperían la simetría. 

El primer paso definir de forma rigurosa que significa isotropía y homogeneidad en 
una variedad diferenciable.

=== Forma general de los campos de Killing

El primer paso consiste en definir que es una rotación y una translación. Para ello el 
camino a seguir va a ser, primero obtener una forma general de los campos de Killing. Y 
a partir de esto obtener una base de este espacio de isometrías de forma que unos elementos
van a corresponder a rotaciones y otros a translaciones.

Un punto por el que comenzar es el tensor de riemann puesto que tiene simetrías similares
a las de la ecuación de Killing

$ tensor(R, delta, - alpha beta gamma) K_delta = cdv(cdv(K_gamma, beta), alpha) - 
cdv(cdv(K_gamma, alpha), beta) $<ec:riemann-applying-to-killing-vector>

Usando que el tensor de Riemann cumple la identidad de Bianchi 

$ tensor(R,delta, -alpha beta gamma) + tensor(R, delta,- gamma alpha beta) + 
tensor(R, delta, - beta gamma alpha) = 0 $

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

$ cdv(K_beta, gamma, alpha) = - tensor(R,delta, -alpha beta gamma) K_delta $<ec:rel-der-killing-vector>

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

$ K_delta (x) = sum_(|alpha|=0)^oo (mipdv(K_delta, alpha)(p))/alpha! (x-p)^alpha $

Ahora mediante la @ec:rel-der-killing-vector los términos de $|alpha| = 2$  quedan determinados
por $K(p)$ y $partial_mu K(p)$, los términos de $|alpha|=3$ se obtienen mediante las derivadas
de la misma ecuación y así para cualquier $|alpha|$. Todas estas relaciones son lineales
por lo que se puede escribir

$ mipdv(K_delta, alpha) =
 tensor(hat(A), -delta, gamma)(p, alpha) K_gamma (p)
+tensor(hat(B), -delta, gamma, beta)(p, alpha) partial_gamma K_beta (p)  
$

Sustituyendo en la serie de taylor se obtiene
$ K_delta (x) &= sum_(|alpha| = 0)^oo (mipdv(K_delta, alpha)(p))/alpha! (x-p)^alpha  
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
partial_sigma K^((gamma))_alpha (p)= 0  $<ec-cosmo:homogeneidad>

donde $gamma$ es una etiqueta para cada campo. Si un espacio tiene una base completa
de estos elementos en todo punto, y además estos dan lugar a compos de Killing no nulos
el espacio se denominará homogéneo. La razón de esta definición se explorará más adelante 
junto con la isotropía.


Además de los elementos anteriores se tienen los términos de $tensor(B, -delta, gamma sigma)$. 
Aquí se sigue el mismo proceso que en la parte anterior, sin embargo, por la 
antisimetría de estos términos usando una notación similar
a la anterior pero haciendo las derivadas parciales no nulas
se tiene que $K^((gamma, sigma)) = - K^((sigma, gamma))$. Para introducir
esto se definen $n(n-1) slash 2$ términos independientes de la forma

$ K^((gamma, sigma))_alpha (p) = 0\
partial_alpha K^(gamma, sigma)_beta = delta^(gamma, sigma)_(alpha, beta) - delta^(sigma, gamma)_(alpha, beta)
$<ec-cosmo:isotropia>

Si un espacio tiene una base completa de estos elementos en todo punto y estos dan lugar
a campos de Killing lo llamamos isótropo.

Para comprender estas definiciones conviene trabajar en una base ortonormal.

La definición dada en @ec-cosmo:homogeneidad da lugar a una serie de isotropías de forma 
que las coordenadas se transforman como $x'^mu =x^mu  + t K^mu (x) + Order(t^2)$.
De esta forma si la @ec-cosmo:homogeneidad se cumple todos los puntos son isótropos a su
entorno.

Por otro lado ante la definición @ec-cosmo:isotropia, en el caso de la base ortonormal
cada un de los elementos corresponde a rotaciones. Esto es porque al aplicar la isotropía
asociada se obtiene que para un vector arbitrario $ V'^mu(x) = pf(phi.alt)V^mu(x) =
pdv(x'^mu, x^nu) V^nu = (delta^mu_nu + t partial_nu K^mu)V^nu = V^mu + t Delta V^mu $

El vector al aplicar la transformación se convierte en sí mismo mas una componente que es
perpendicular al propio vector ($partial_nu K^mu =^(K(p) = 0) cdv(K^mu, nu) =^(g=delta) cdv(tensor(delta, mu alpha) K_alpha, nu)
 = tensor(delta, mu alpha) cdv(K_alpha, nu) = tensor(delta, mu alpha) partial_nu K_alpha =^("Si" mu = nu) 0 $), además esta transformación conserva la norma por lo que
podemos concluir que se trata de una rotación. Un espacio con todas las posibles rotaciones
en todos los puntos es isótropo.

Además una variedad que es al mismo tiempo homogénea e isótropa tiene todos los posibles 
campos de Killing por lo que también se le denomina *maximalmente simétrica*

Nuestro espacio tiempo es homogéneo e isótropo *espacialmente*. Esto quiere decir que en 
la variedad pseudo-rimanniana que es el espacio-tiempo tiene que haber una familia
de sub-variedades Rimannianas de dimensión 3 cuyos vectores tangentes son de tipo espacial
y que además son homogéneos e isótropos de acuerdo a la definiciones @ec-cosmo:homogeneidad
y @ec-cosmo:isotropia.

== Forma general de un espacio-tiempo espacialmente homogéneo e isótropo
Comenzamos a tratar la métrica del espacio, lo primero es separar las coordenadas
en una parte espacial y una temporal. Es decir, llamando a la variedad 
espacio-temporal $cal(M)$ existe una hipersuperficie, $EE subset cal(M)$, de tres
dimensiones de tipo espacial que además es maximalmente simétrica que va a
representar el espacio en un instante de tiempo concreto.

Eligiendo un sistema de coordenadas para $EE$, ${hat(x)^i}$, se tiene 
una base de vectores del espacio tangente a la superficie espacial. Esta base
puede extenderse a una base completa del espacio tangente del espacio-tiempo 
mediante el método de ortonormalización de Gram-Schmidt. De esta forma se obtiene un campo 
normal a la superficie $n^mu$. Con esto se puede extender el sistema de 
coordenadas en $EE$ a un sistema de coordenadas en $cal(M)$. Para ello se coge
cada punto $x^mu in EE$ y se le asigna una geodésica con la condición inicial
$gamma(0) = x^mu$ $dot(gamma)(0) = n$. Al conjunto de puntos que traza la geodésica
se les asignan las coordenadas $[x^mu] = (s, hat(x)^i)$ donde $x^i$ son las coordenadas 
asignadas al punto inicial en la variedad y $s$ es la longitud de la geodésica entre 
$gamma(0)$ y el punto correspondiente.

Así el espacio en el tiempo '$tau$' corresponde a la hipersuperficie correspondiente
a $s=tau$. 

Con este sistema de coordenadas nos gustaría demostrar que la forma de la métrica 
es $dd(s)^2 = dd(t)^2 - a^2(t) hat(g)_(i j) dd(x)^i dd(x)^j$. Para ello primero demostramos que la métrica tiene forma de $dd(s)^2 = dd(t)^2 - h_(i j) dd(x)^i dd(x)^j$, que todas las hipersuperficies con $s="cte"$ son maximalmente simétricas y por
último que en estas hipersuperficies, por ser maximalmente simétricas, $dot(h) prop h$ y por lo tanto $h = a(t)^2 g$.

Para el primer paso nos basta con comprobar que $g_(0 i) = 0$ en todo instante 
de tiempo de forma que en la métrica solo hay términos puramente espaciales y un
término puramente temporal.

Para ello podemos usar la ecuación geodésica. Por construcción en este sistema de 
coordenadas las geodésicas con la condición inicial $dot(x)^mu = delta^mu_0$
tienen coordenadas espaciales constantes. La ecuación geodésica resulatante es 

$ dot.double(x)^i = 0 = christoffel(i, mu, nu) dot(x)^mu dot(x)^nu = 
christoffel(i, mu, nu) delta^mu_0 delta^nu_0 = christoffel(i, 0, 0) =>\ =>
tensor(Gamma, -i 0 0) = 0 $.

Usando ahora la relación entre los símbolos de christoffel y la métrica se obtiene
que 

$ tensor(Gamma, -i 0 0) = 1/2 (2 partial_0 g_(i 0) - partial_i g_(0 0)) = 0 $

Puesto que $tensor(g, -0 0) = norm(n)^2$, por construcción $partial_i g_(0 0) = 0$.
De esta forma se obtiene que 
$ partial_0 g_(i 0) = 0 $
Combinando esto con la condición inicial $g_(i 0)(s=0, x^i) = 0$ se obtiene esta igualdad 
para todo punto y todo tiempo. De esta forma se concluye que la métrica tiene que ser de 
la forma

$ dd(s)^2 = dd(t)^2 - h_(i j) dd(x)^i dd(x)^j $

Para la siguiente parte de la demostración es necesario demostrar primero que todas las 
superficies con $s="cte"$ son maximalmente simétricas. Es decir, que no aparecen 
anisotropías ni inhomogeneidades al avanzar el tiempo. Esto se puede demostrar de forma 
similar a como hemos demostrado que la métrica es separable en espacio y tiempo pero 
aplicándolo a los campos de Killing.

Partimos de que la superficie $s=0$ es homogénea e isótropa. Es decir, en términos de 
campos de Killing, existen campos satisfaciendo las condiciones  @ec-cosmo:homogeneidad
y @ec-cosmo:isotropia para los índices espaciales y con $K^0(s=0, x^i) = 0$.

Usando la componente $(0, 0)$ de la ecuación de Killing @ec-variedades:ec-killing se 
obtiene

$ 2 g_(0 0) partial_0 K^0 + cancel(K^alpha partial_alpha g_00) = 0 =>\ 
=> partial_0 K^0 = 0 $<ec-cosm:derivative-wrt-time-of-killing-field-0th-comp>

Esto unido a la condición inicial $K(s=0, x^i) = 0$ implica que $K^0 = 0$ en todo espacio 
y tiempo. Es decir, los campos de Killing no pasan a ser de tipo temporal y mantienen su 
espacialidad.

Si las otras componentes de los campos de Killing también se conservan entonces podemos
concluir que el resto de superficies a tiempo constante son maximalmente simétricas puesto
que ningun campo se anularía ni tampoco ocurriría que dos campos dejaran de ser únicos en 
alguna región reduciendo el número de simetrías.

Para ello usamos las componentes $(0, i)$ de la ecuación de Killing

$ cancel(g_(0 alpha) partial_i K^alpha) + g_(i alpha) partial_0 K^alpha + 
cancel(K^alpha partial_alpha g_(0 i)) = 0 => \ => partial_0 K^i = 0 $<ec-cosm:derivative-wrt-time-of-killing-field-ith-comp>

donde el primer término se anula cuando $alpha = 0$ por la 
@ec-cosm:derivative-wrt-time-of-killing-field-0th-comp y el resto puesto que la métrica
es separable en parte espacial y temporal. El segundo término se anula por la separabilidad
de la métrica. La implicación se debe a que la parte espacial de la métrica es no
degenerada por tratarse de una variedad Riemanniana, por lo tanto para cada componente 
espacial de $partial_0 K^i$ tiene que haber un término de $g$ que no se anule dando la igualdad.

Esto combinado con las condiciones iniciales correspondientes a cada campo de Killing da 
lugar a que todos las superficies con tiempo constante son variedades
Riemannianas cuya métrica es $h$ y que son maximalmente simétricas.

Para demostrar el último punto de esta sección, que la métrica tiene la forma

$ dd(s)^2 = dd(t)^2 - a^2(t) hat(g)_(i j) dd(x)^i dd(x)^j $<ec-cosm:metric-general-form-with-a-and-g>

primero hay que demostrar un teorema que aplica a las variedades Riemannianas maximalemente
simétricas.

Este teorema dice que si uno tiene un campo tensorial $T_(alpha beta)$ en una variedad 
maximalmente simétrica y se cumple que $lie(K, T) = 0$ donde $K$ es un campo de Killing
entonces $T_(alpha beta) prop g_(alpha beta)$.

Para demostrar esto partimos de la ecuación de Killing usando el conjunto de campos que
definen la isometría @ec-cosmo:isotropia.

$ lie(K, T) = 
T_(gamma beta) partial_alpha K^gamma + T_(alpha gamma) partial_beta K^gamma + cancel(K^gamma partial_gamma T_(alpha beta)) 
=^(partial_alpha K^gamma = cdv(K^gamma, alpha))
tensor(T, gamma, -beta) partial_alpha K_gamma + tensor(T, -alpha, gamma) partial_beta K_gamma = 0  $

Esto se puede simplificar de la siguiente forma

$ tensor(T, gamma, -beta) partial_alpha K_gamma + tensor(T, -alpha, gamma) partial_beta K_gamma =
(tensor(T, gamma, -beta) delta^sigma_alpha+tensor(T, -alpha, gamma) delta^sigma_beta) partial_sigma K_gamma = 0 $

Usando que para los campos elegidos se cumple la @ec-cosmo:isotropia se obtiene que

$ tensor(T, gamma, -beta) delta^sigma_alpha + tensor(T, -alpha, gamma) delta^sigma_beta =
tensor(T, sigma, -beta) delta^gamma_alpha + tensor(T, -alpha, sigma)delta^gamma_beta $

Contrayendo los índices $alpha = sigma$ se obtiene

$ n tensor(T, gamma, -beta) + tensor(T, -beta, gamma) = tensor(T, gamma, -beta) + delta^gamma_beta T =>
\ => (n-1)tensor(T, gamma, -beta) + tensor(T, -beta, gamma) = delta^gamma_beta T $
donde $n$ es la dimensión del espacio (en nuestro caso será 3 puesto que va a aplicar a la
parte espacial unicamente) y $T := tensor(T, -alpha, alpha)$

Esta última expresión puede simplificarse multiplicando por $g_(alpha gamma)$ y contrayendo
índices se obtiene

$ (n-1) T_(alpha beta) + T_(beta alpha) = g_(alpha beta) T $<ec-cosm:relation-killing-transported-tensor-fields-and-metric>

Puesto que la parte derecha de la expresión es simétrica en alpha y beta también lo debe ser
la parte izquierda por lo tanto

$ (n-1) T_(alpha beta) + T_(beta alpha) &= (n-1) T_(beta alpha) + T_(alpha beta) => 
\ => (n-2)T_(alpha beta) &= (n-2) T_(beta alpha) $

puesto que nuestro caso de interés es $n=3$ podemos concluir que $T$ debe ser simétrico y 
por lo tanto combinando esto con la @ec-cosm:relation-killing-transported-tensor-fields-and-metric
se obtiene finalmente

$ T_(alpha beta) = T/n g_(alpha beta) $<ec-cosm:parallel-02tensor-maximally-sym-space>

#align(right)[$qed$]

Ahora queremos aplicar este teorema a $dot(h)$ puesto que si se cumple entonces
$dot(h) prop h$.

Para ello usamos la ecuación de Killing y las relaciones de 
@ec-cosm:derivative-wrt-time-of-killing-field-0th-comp y 
@ec-cosm:derivative-wrt-time-of-killing-field-ith-comp.

Derivando la ecuación de Killing con respecto a $partial_0$

$ lie(K, h) = 0 => partial_0 (lie(K, h)) = 0 =>\
=> partial_0(h_(sigma beta) partial_alpha K^sigma + h_(alpha sigma) partial_beta K^sigma 
+ K^sigma partial_sigma h_(alpha beta)) = \
 dot(h)_(sigma beta) partial_alpha K^sigma + dot(h)_(alpha sigma) partial_beta K^sigma 
+ K^sigma partial_sigma dot(h)_(alpha beta)
+ cancel(h_(sigma beta) partial_alpha partial_0 K^sigma + h_(alpha sigma) partial_beta partial_0 K^sigma 
+ partial_0(K^sigma) partial_sigma h_(alpha beta)) = \
=lie(K, dot(h)) = 0
$

Por lo tanto aplicando el teorema anterior obtenemos la siguiente ecuacion

$ dot(h)_(alpha beta) = f(t) h_(alpha beta) $

que dando la condición inicial $h(s=0)_(alpha beta) = hat(g)_(alpha beta)$ se obtiene la 
solución 

$ h_(alpha beta)(t, x) = e^(integral_0^t f(s) dd(s)) hat(g)_(alpha beta)(x) 
= a^2(t) hat(g)_(alpha beta)(x) $

demostrando la forma de la métrica descrita en @ec-cosm:metric-general-form-with-a-and-g.
#align(right)[$qed$]

== El subespacio $EE$ es de curvatura consante

Para finalizar la derivación de la métrica se va a emplear el teorema de Killing Hopf

Para enunciar este teorema es necesario intruducir una noción de curvatura llamada
curvatura seccional. Esta noción de curvatura se obtiene eligiendo dos vectores
del espacio tangente y extendiendo ese plano mediante geodésicas a un 'plano' del
espacio, la curvatura seccional es entonces la curvatura gaussiana de esa superficie.

Esta noción de curvatura puede demostrarse que se relaciona con el tensor de 
curvatura mediante la siguiente ecuación

$ K(u, v)= (R_(alpha beta gamma delta)u^alpha v^beta u^gamma v^delta)
/((g_(alpha gamma) g_(beta delta) - 
   g_(alpha beta) g_(gamma delta) )u^alpha v^beta u^gamma v^delta) $

Donde $u$ y $v$ son los vectores tangentes al plano.

El caso de que la curvatura seccional $K$ sea constante se obtiene que

$ R_(alpha beta gamma delta) = K (g_(alpha gamma) g_(beta delta) - g_(alpha beta) g_(gamma delta)) $<ec-cosm:component-relation-riemann-secctional-curvatures-K-constant>

El teorema de Killing-Hopf establece que cualquier pareja de espacios de curvatura 
seccional constante son isométricos si tienen la misma curvatura seccional. 
Es decir, tienen la misma métrica. Por lo tanto, solo existen 3 métricas distintas
para estos espacios. En el caso de curvatura positiva se tienen los espacios 
isométricos a una n-esfera, en el caso de curvatura nula se tiene el espacio euclídeo
y en el caso de curvatura seccional negativa son isométricos a un hiperboloide.

De esta forma si se demuestra que los espacios maximalmente simétricos son espacios
de curvatura constante ya tendríamos la métrica de FLWR puesto que la única incógnita
que queda en la métrica es $hat(g)$ correspondiente a la métrica de la 
hipersuperficie $EE$ en $t=0$.

Restringiéndonos a $EE$ tenemos que en esta subvariedad hay el número máximo de 
campos de Killing. Puesto que el tensor de Riemann es intrínseco (solo depende de
la inducida métrica y no del espacio inmerso) este tiene que ser invariante frente
a isometrías y por lo tanto su derivada de Lie debe anularse. En concreto si 
calculamos la derivada de Lie de los campos definidos en la isotropía
@ec-cosmo:isotropia

$ lie(K, R) &= cancel(K^alpha partial_alpha R_(mu nu gamma sigma)) 
+ R_(alpha nu gamma sigma) partial_mu K^alpha 
+ R_(mu alpha gamma sigma) partial_nu K^alpha
+ R_(mu nu alpha sigma) partial_gamma K^alpha
+ R_(mu nu gamma alpha) partial_delta K^alpha =\
&= 
  R_(alpha nu gamma sigma) partial_mu K^alpha 
- R_(alpha mu gamma sigma) partial_nu K^alpha 
+ R_(alpha sigma mu nu) partial_gamma K^alpha 
- R_(alpha gamma mu nu) partial_sigma K^alpha =\
#scale(100%, $(cdv(K, alpha) = partial_alpha K) / "en rotaciones"$)&=

  tensor(R, alpha, - nu gamma sigma) cdv(K_alpha, mu)
- tensor(R, alpha, - mu gamma sigma) cdv(K_alpha, nu)
+ tensor(R, alpha, - sigma mu nu) cdv(K_alpha, gamma)
- tensor(R, alpha, - gamma mu nu) cdv(K_alpha, sigma) =\
&= 
(
  tensor(R, alpha, - nu gamma sigma) delta^epsilon_mu
- tensor(R, alpha, - mu gamma sigma) delta^epsilon_nu
+ tensor(R, alpha, - sigma mu nu) delta^epsilon_gamma
- tensor(R, alpha, - gamma mu nu) delta^epsilon_sigma
) cdv(K_alpha, epsilon)=0
$

En esta última igualdad se tiene que $cdv(K_alpha, epsilon)$ es antisimétrico en 
$alpha$ y $epsilon$. Además se tiene que este tensor es arbitrario por la condición
de isotropía por lo tanto el término de los tensores de Riemann debe ser simétrico
en $alpha$ y $epsilon$.

$
  tensor(R, alpha, - nu gamma sigma) delta^epsilon_mu
- &tensor(R, alpha, - mu gamma sigma) delta^epsilon_nu
+ tensor(R, alpha, - sigma mu nu) delta^epsilon_gamma
- tensor(R, alpha, - gamma mu nu) delta^epsilon_sigma 
= \
&=
  tensor(R, epsilon, - nu gamma sigma) delta^alpha_mu
- tensor(R, epsilon, - mu gamma sigma) delta^alpha_nu
+ tensor(R, epsilon, - sigma mu nu) delta^alpha_gamma
- tensor(R, epsilon, - gamma mu nu) delta^alpha_sigma
$<ec-cosm:antisimetry-riemann-tensor-lie-derivative>

Para poder demostrar la ecuación que tenemos que obtener una relación entre el 
tensor de Riemann y la métrica. Por lo tanto parece buena idea realizar una 
contracción en esta ecuación con $epsilon=mu$ puesto que de esta forma solo 
quedan tensores de Riemann y de Ricci. Además puesto que el tensor de Ricci es
intrínseco por lo que aplicando @ec-cosm:parallel-02tensor-maximally-sym-space 
$ lie(K, R_(alpha beta)) = 0 => R_(alpha beta) = R/n g_(alpha beta) $<ec-cosm:ricci-metric-relation>

Realizando la contracción de $epsilon=mu$ a la relación en la 
@ec-cosm:antisimetry-riemann-tensor-lie-derivative

$ "LHS" &=  
  tensor(R, alpha, - nu gamma sigma) delta^mu_mu
- tensor(R, alpha, - mu gamma sigma) delta^mu_nu
+ tensor(R, alpha, - sigma mu nu) delta^mu_gamma
- tensor(R, alpha, - gamma mu nu) delta^mu_sigma \
&=
n tensor(R, alpha, - nu gamma sigma) 
- tensor(R, alpha, - nu gamma sigma)
+ tensor(R, alpha, - sigma gamma nu) 
- tensor(R, alpha, - gamma sigma nu)  \
&=
(n-1) tensor(R, alpha, - nu gamma sigma) 
+ underbrace(tensor(R, alpha, - sigma gamma nu) 
+ tensor(R, alpha, - gamma nu sigma), "identidad de Bianchi")  \
&=
(n-1) tensor(R, alpha, - nu gamma sigma) 
- tensor(R, alpha, - nu sigma gamma)

\ \
"RHS" &= 
  tensor(R, mu, - nu gamma sigma) delta^alpha_mu
- underbrace((tensor(R, mu, - mu gamma sigma) delta^alpha_nu), R_(alpha beta gamma sigma) = - R_(beta alpha gamma sigma))
+ tensor(R, mu, - sigma mu nu) delta^alpha_gamma
- tensor(R, mu, - gamma mu nu) delta^alpha_sigma \
&=
  tensor(R, alpha, - nu gamma sigma) 
+ tensor(R, - sigma nu) delta^alpha_gamma
- tensor(R, - gamma nu) delta^alpha_sigma \
&=
-  tensor(R, alpha, - nu sigma gamma) 
+ tensor(R, - sigma nu) delta^alpha_gamma
- tensor(R, - gamma nu) delta^alpha_sigma


\ \ 

"LHS" &= "RHS" + #[@ec-cosm:ricci-metric-relation]
 => \ &=>
tensor(R, alpha, - nu gamma sigma)  = 
R/(n(n-1)) (
  tensor(g, - sigma nu) delta^alpha_gamma
- tensor(g, - gamma nu) delta^alpha_sigma) =>\

dot g_(alpha beta)
&=> 
tensor(R, -beta nu gamma sigma) = R/(n(n-1)) (g_(sigma nu) g_(beta gamma) - g_(gamma nu) g_(beta sigma)

)
$

Con esto quedaría demostrada la ecuación 
@ec-cosm:component-relation-riemann-secctional-curvatures-K-constant si se cumple 
que el escalar de curvatura $R$ es constante. Puesto que esta cantidad es contracción
del tensor de Riemann $R = tensor(R, alpha beta, - alpha beta)$ también es intrínseco
y por lo tanto debe cumplir

$ lie(K, R) = K^alpha partial_alpha R = 0 $

Aplicando la condición de homogeneidad @ec-cosmo:homogeneidad queda demostrado que 
este escalar es constante y por lo tanto aplica el teorema de Killing-Hopf.
De esta forma la parte espacial de la métrica tiene que ser isométrica a uno de los
tres espacios de curvatura constante de forma que 

$ dd(s)^2 = hat(g)_(i j) dd(x)^i dd(x)^j = R^2 (dd(r)^2/(1-k r^2) + r^2 dd(Omega)) $

Donde $R$ es un parámetro que controla el módulo de la curvatura y $k in {-1, 0, 1}$ 
y selecciona el signo de la curvatura. Absorbiendo $R^2$ en el término de $a^2$ 
queda demostrada la ecuación @ec-cosm:métrica-FLRW
#align(right)[$qed$]