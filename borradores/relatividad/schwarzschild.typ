#import "../things-to-add.typ": *

= Métrica de schwarzschild

La métrica de schwarzschild es la métrica exterior a un cuerpo masivo cuya distribución de
materia es esféricamente simétrica. En concreto es la solución a las ecuaciones de campo
con una única partícula estacionaria en el origen.

Usando coordenadas esféricas se obtiene la siguiente métrica

$ dd(s)^2 = c^2(1-r_s/r) dd(t)^2 - (1-r_s/r)^(-1) dd(r)^2 + r^2 dd(Omega)^2 $

que puesto que es diagonal cumple que

$ g^(mu nu) = 1/(g_(mu nu)) $

Para estudiar los campos de killing en este espacio es interesante primero darse cuenta de
que este espacio no es maximalmente simétrico. Esto es facil de ver puedo que en ningún 
punto existen campos de Killing con la condición $K_mu (p) = delta^r_mu$, $partial_mu K_mu = 0$ puesto que la derivada de Lie de un campo con estas características no se anula por la
dependencia de los términos temporales y radiales de la métrica. Con el objetivo de obtener
todos los campos uno primero puede calcular un escalar de curvatura para obtener una 
cantidad intrínseca para guiarse. La siguiente cantidad cumple con las características

$ tensor(R, mu nu alpha beta) tensor(R, -mu nu alpha beta) = (12 r_s)/r^6 $

Puesto que esta cantidad es un escalar intrínseco (al estar construido solo por el tensor
de Riemann) debe ser conservado bajo isometrías. Es decir, no pueden existir isometrías 
que cambien el valor de $r$. En términos de campos de Killing esto es $K^r = 0$.

Por lo tanto para encontrar los campos de Killing de este espacio bastaría con encontrar los
campos de Killing de las subvariedades definidas por $r=cte$. Como es natural estas 
subvariedades son las esferas. Si uno demuestra esto entonces el problema está practicamente
resuelto puesto que las esferas son variedades maximalmente simétricas por lo que nos 
encontraríamos en un caso equivalente al de la métrica de 
Friedmann-Lemaitre-Robertson-Walker en el cual tendríamos una variedad con subvariedades 
espaciales maximalmente simétricas.

Eligiendo $r=cte$ las subvariedades tienen una métrica inducida de la siguiente forma

$ dd(s)^2 = c^2 (1-r_s/r) dd(t)^2 - r^2 dd(Omega)^2 $

El primer campo de Killing es el campo de Killing temporal, este tiene la siguiente forma
$ omega^mu = delta^(t mu) $

Es facil comprobar que esto es un campo de Killing puesto que es constante y la métrica es 
independiente de la componente temporal. El resto de campos de Killing pueden encontrarse
si uno se restringe a subvariedades con $t=cte$. Estas subvariedades tienen solo dos 
términos en la métrica, $g_(phi phi)$ y $g_(theta theta)$, y su forma es la misma  que 
la métrica en una esfera. Por lo tanto esta subvariedad y las esferas deben tener los mismos
campos de Killing. En coordenadas cartesianas estos campos son

$ K^((gamma) mu) = tensor(epsilon, gamma mu, -nu) x^nu $

donde $epsilon$ es la tensor de levi-civita 

$ tensor(epsilon, gamma mu, -nu) = cases(
1 "si" (gamma, nu, mu) " es permutación par",
-1 "si" (gamma, mu, nu) " es permutación impar",
0 "en otro caso") $

Ahora mismo los campos que tenemos corresponderían a translaciones en $t$, $theta$  y  $phi$
y a la rotación en el plano $theta-phi$. Si la subvariedad $r=cte$ fuera maximalmente 
simétrica faltarían 2 campos adicionales por comprobar, correspondientes a las rotaciones
$t-phi$ y $t-theta$. No puede existir una isometría de este tipo puesto que la componente
temporal tiene signo negativo en la métrica y las espaciales positivo. Además, fisicamente
no está claro que podría representar este tipo de invarianzas. 

Esto se puede demostrar usando las componentes $t t$, $phi t$, $phi phi$, $r phi$ y $r t$
se puede demostrar que $partial_t K^phi = partial_phi K^t = 0$

$ 
(lie(g, K))_(t t) = 2 g_( t t ) partial_t K^t = 0 => K^t = f(r, theta, phi)
\
(lie(g, K))_(phi phi) = 2 g_(phi phi) partial_phi K^phi = 0 => K^phi = f(r, t, phi)
\
(lie(g, K))_(phi r) = 2 g_(phi phi) partial_r K^phi = 0 
\
(lie(g, K))_(t r) = 2 g_(t t) partial_t K^t = 0 
\
(lie(g, K))_(t phi) =  g_(t t) partial_phi K^t + g_(phi phi) partial_t K^phi = 0 =>
\
g_(t t)/g_(phi phi) partial_phi K^t = -partial_t K^phi =>^(partial_r) partial_r (g_(t t)/g_(phi phi)) partial_phi K^t = 0 => partial_phi K^t = 0 => partial_t K^phi = 0 
$

Similar con $theta$ pero todavía no lo he escrito.

De esta forma la subvariedad al perder 2 posibles campos de Killing queda con 4 campos de Killing asociados 3 a rotaciones y 1 a translación temporal.



