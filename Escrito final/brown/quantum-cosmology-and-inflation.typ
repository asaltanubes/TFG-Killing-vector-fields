#import "../things-to-add.typ": *

= Quantum inflation and cosmology

As part of the agreement of the University of Cantabria and University of Brown 
this project was developed the summer of 2025. 

== Theory

Introduction to the Ashtekar variables adapted from @ashtekar-variables-intro.

Inflation is a proposed mechanism where at the big bang there was a big expansion
before the observed big bang explaining the observed flatness and isotropy of the
universe. Multiple mechanisms for inflation have been proposed, and usually involve
adding a field coupled to general relativity that drives inflation.

One of these proposals is by Stephon Alexander in his 2003 paper 
@Alexander:2003wb where the cosmological constant is replaced by the potential of
a scalar field in the action. 

The resulting action would look something like the following

$
  S = integral [1/(2k) (R - 2 V(phi.alt)) + 1/2 partial_mu phi.alt partial^mu phi.alt] sqrt(g) dd(x, 4)
$

In the paper Ashtekar variables are used. To understand what these are first is 
necessary to introduce ADM and tetrad formalism. From now on natural units with $l_p = c = hbar = 1$
are used.

// ADM formalism is a way to view general relativity, instead as a theory that treats
// spacetime as a four dimensional manifold with a locally Lorentzian metric, as a 
// dynamical three dimensional manifold with a metric that evolves in time. To get 
// here spacetime is sliced in spatial slices, with metric $q_(a b)$ labeled by a time variable $t$.

// This variable generates a vector field that points in the time direction. 
// Similarly
// we can pick three vector fields on each slice that generate the spatial metric. 
// These three vector fields will be called a triad.

// By calling the vector fields on the slice

// $ e_a = tensor(e, mu, -a) partial_mu $

// and $n$ the normal vector to the spatial slice we can write the vector field on the
// time direction as

// $ t^mu = N n + N^a e_a  $

// where $N$ is the so called lapse function and $N^a$ the translation function.

// Notice that when using the triad $a, b, c...$ are spatial indices but for reasons
// that will be seen later must not be confused with spatial indices $i, j, k...$ 
// this is because the internal indices 


In tetrad formalism is based on the idea 
of using the equivalence principle to work on a "Minkowski like space". What is
meant by this is that the metric becomes the Minkowski metric but the coordinate 
system is no longer holonomic, meaning the basis for the tangent space is no longer
the partial derivatives with respect to the coordinate system. Formally a tetrad 
are four vectors of the tangent space labeled by what we will call internal indices
$i, j, k...$ (not to be confused with indices that only involve spatial components
those will be called $a, b, c...$ from now on) so that 

$ e_i = tensor(e, mu, -i) partial_mu $

is a basis for the tangent space. That additionally has the following property

$ e_i dot e_j = eta_(i j) $

so that the metric of the internal space is the Minkowski metric.

The tensor components of the tetrad allow to define a map between "normal" and 
"internal" spaces by defining

$ v_i = tensor(e, mu, -i) v_mu \
  v^i = tensor(e, -mu, i) v^mu $

The transformation tensors with upper and lower indices are defined as inverses 
so that

$ tensor(e, mu, -i) tensor(e, -mu, j) = delta_i^j\
  tensor(e, mu, -i) tensor(e, -nu, i) = delta^mu_nu \
  tensor(e, -mu, i) tensor(e, -nu, -i) = g_(mu nu)\
  tensor(e, mu, -i) tensor(e, -mu, -j) = eta_(i j) $

Internal indices work under the Minkowski metric and normal indices under the usual
metric. Therefore, while the usual metric will be used to raise and lower normal
indices internal indices will be raised and lowered by a Minkowski metric.

On the other hand ADM formalism takes spacetime and slices it into a family of 
space-like surfaces that represent the state of spacetime at a given time. These 
space-like surfaces will have an induced metric $q_(i j)$, in ADM formalism this 
metric is treated as a dynamical variable that evolves in time. 

Both formalism can be combined by taking a tetrad such that $e_0$ is orthonormal
to the surface and $e_a$ are tangent to each slice. Thus we will call 

$ n = e_0 $

As the time coordinate evolves not only we change from one slice to another we 
also could be shifted on the coordinates.

Therefore we have

$ partial_t = N n + N^a e_a $

where $N$ is the lapse function and $N^a$ are the shift functions. 

Now we have a gauge choice, we pick the coordinate system so that $n$ only has a 
time component and each of the $e_a$ only have spatial components. Therefore 
internal indices are only spatial from now on. This also has the effect, since 
internal indices are spatial, that the metric on internal indices is the Kronecker
delta. Therefore upper and lower internal indices are equivalent.

To be able to take covariant derivatives of tensors expressed in terms of internal
coordinates the spin connection $tensor(omega, -mu, i, -j)$ is defined so that the
connection is compatible with the internal space so that 

$ cdv(bold(V), nu) = (cdv(V^nu, mu)) partial_nu = (cdv(V^i, mu))e_i  $

so the required condition is

$ cdv(tensor(e, mu, -i), nu) = cdv(tensor(e, -mu, i), nu) = 0 $

giving as a solution

$ tensor(omega, -mu, i, -j) = tensor(e, -rho, i) tensor(Gamma, rho, -mu nu) tensor(e, nu, -j) - tensor(e, nu, -j) partial_mu tensor(e, -nu, i) $

We also have to define the extrinsic curvature of the spatial slices similarly to 
how Gaussian curvature is defined giving

$ K_(a b) =  cdv(n_b,a)$



From these quantities we can define the Ashtekar variables. The first one is the 
densitized triad defined as

$ tensor(E, a, -i) = det(e) tensor(e, a, -i)  $

where $det(e)$ is the determinant of the matrix whose indices are $tensor(e, -a, i)$

so that

$ det(g_(a b)) g^(a b) = tensor(E, a, i) tensor(E, b, -i) $

and the associated conjugated momentum

$ A_a^i = epsilon^(i k l) omega_(a k l) + i K_(a b) tensor(e, b, i) $.

Lastly we define the curvature of $tensor(A, -a, i j) := 1/2 epsilon.alt_(i j k) A^(k)_a$

$ F_(a b)^(i j) = 2 partial_(\[a) tensor(A,-b\], i j) 
                + tensor(A, -a, i k) tensor(A, -a k, j)
                - tensor(A, -b, i k) tensor(A, -a k, j)  $

And define

$ F_(a b)^i = epsilon.alt_(i j k) F_(a b)^(j k) $

With these variables the usual Hamiltonian has the following form

$ H = integral dd(x, 3) N cal(H) + N^a cal(H)_a + lambda^i cal(G)_i $

where $cal(H)$ is the Hamiltonian density and enforces the time diffeomorphism 
invariance, $cal(H)_a$ are the spatial constraints and enforce the spatial 
diffeomorphism invariance and $cal(G)$ are the Gauss constraints and enforce 
the $S O(3)$ gauge invariance of the triad.


Now that we have defined all relevant quantities the Hamiltonian density used in 
@Alexander:2003wb is the following

$ cal(H) = 1/l_p^2 epsilon.alt_(i j k) E^(a i) E^(b j)(F_(a b)^k + (G V(phi.alt))/3
epsilon.alt_(a b c) E^(c k)) + 1/2 p_phi.alt^2 + 1/2 E^(a i) E^b_i partial_a phi.alt
partial_b phi.alt $

where $p_phi$ is the momentum of the scalar field. Notice that the first term is 
the usual general relativity gravitational Hamiltonian with the cosmological constant
dependent on the field.

In the total Hamiltonian the Gauss constraints are not included since these are
boundary terms and in this model a boundary for the universe is not considered. 
The diffeomorphism constraints are not included by choosing a coordinate system 
so that $N^a = 0$. In this way the total Hamiltonian is

$ H = integral_cal(S)  N cal(H) $

where $cal(S)$ is the corresponding spatial slice.

By taking the value of the scalar field as a time variable $T = phi.alt$ and defining $N = dv(t, phi.alt)$
where this enforces the lapse function to be

$ N = k/p_phi $

where $k$ is some constant. Without losing generality $k = 1$ is picked.

By the equation of motion generated by $N$ we have the Hamiltonian constraint that enforces

$ cal(H) = 0 $

with this equation we can find that

$ p_phi.alt = pm sqrt(-2 cal(H)) $

and substituting into the lagrangian we get

$ H = integral_S p_phi.alt $


To apply this to the deSitter spacetime homogeneity and isotropy together with a flat 
space give as a result

$ A_(a i) = i delta_(a i) A(T)  #h(20pt) E_(a i) = delta_(a i) E(T) $

The resulting metric is

$ dd(s)^2 = - N^2 dd(T)^2 + E(T) (dd(Sigma)^2) $

where $dd(Sigma)$ is the spatially flat metric and $E$ takes the role of the scale factor,
$a^2$ of cosmology.

Since the spatial slice is infinite the integral would diverge, to avoid this problem the
theory is built over a compact region of the slice and take this region as a 
finite representation of the whole spacetime.

We define the "side length", $R$, so that the volume of the region to be integrated over is
$R^3$. The resulting Hamiltonian is

$ H = R^3 sqrt(12 E^2(A^2 - V(T)/3 E)) $<ec-brown:classical-hamiltonian>

where $G$ has been absorbed into $V$.


To obtain solutions Hamilton-Jacobi theory is used arriving to a Hamilton principal function

$ S(A, T, alpha) = (R^3A^3)/(3 V(T)) (1+u(T)) $

where $u$ solves the initial value problem

$ cases(dot(u) = (1+u) (dot(V)/V + 18sqrt(-3u)), u(T_0) = alpha) $<ec-brown:u-definition>

by using the second constant 
$ beta = pdv(S, alpha) $<ec-brown:beta-definition>

since the Hamilton principal function is related to $E$ by

$ 3/(R^3) pdv(S, A) $

one can obtain equations of motion for $A$ and $E$ by inverting @ec-brown:beta-definition
resulting in 

$ E(T) = (3^(5 slash 3) beta^(2 slash 3) (1+u))/(R^2 V^(1 slash 3)) (pdv(u, alpha))^(-2 slash 3)  $<ec-brown:classical-E-definition>


It is also possible to obtain the lapse function

$ N = R^3/(18 beta (1+u) sqrt(-3u)) (pdv(u, alpha)) $<ec-brown:lapse-function>

This equation together with @ec-brown:u-definition and @ec-brown:classical-E-definition 
enforce the conditions

$ -1< u < 0 $

since we need $1+u>0$ for the metric to be Lorentzian and the lapse function to be finite
and $u<0$ for @ec-brown:u-definition to be real.

From this model a quantum cosmological model is developed by a quantum mini-superspace. 
A mini-superspace in quantum gravity refers to an approximation where, instead of the full
path integral of the metric, only certain components are quantized. In this case the 
spatial metric is quantized by making a quantum theory of the $E$ and $A$ parameters.

To do this $A$ is upgraded to a multiplicative operator and $E$ to an operator via

$ hat(E) = - i/R^3 pdv(, A) $

The evolution of the quantum state is defined by a schrödinger equation
$ i pdv(Psi, T) = hat(H) Psi $

whose Hamiltonian is the quantized version of @ec-brown:classical-hamiltonian with ordering

$ hat(H) =  i sqrt(12) pdv(, A)(A sqrt(hat(J))) $<ec-brown:q-hamiltonian>

where

$ hat(J) = 1 - (i V)/(R^3 A^2) pdv(, A) $

The solutions are

$ Psi_u (A, T) = e^(6 sqrt(3) integral_(T_0)^T sqrt(-u(s)) dd(s) + i (A^3 R^3)/(3V)(1+u)) $

== Results
From this model the objective of the internship at Brown was proving the attractor behavior
of @ec-brown:u-definition, the asymptotic behavior of $E$ in the limits $u -> -1$ and $u->0$
and check how well behaved the quantum  model was. 


The attractor behavior of @ec-brown:u-definition refers to the result that, for certain 
kinds of potentials, the solutions are almost independent of the potential of choice.

This can be seen by making a plot of $dot(u)$ against $u$. 

#figure(
  image("figures/udot-u-plot.svg"),
  caption: [In this figure the value of $dot(u)$ is represented as a 
  function of $u$ for $dot(V)/V = -0.2$. The result is that solutions tend to follow 
  $dot(V)/V$]
)

As can be seen $dot(u)$ becomes zero when $u = -(-1/lambda dot(V)/(V))^2$ where $lambda = 18 sqrt(3)$. Additionally, 
solutions tend towards this value since solutions with higher values of $u$ than this 
have a negative negative derivative and solutions with a smaller value have a positive 
derivative. This makes it so that the solutions have an attractor behavior towards $u=0$
as long as $dot(V)/V << lambda$ and $V$ is strictly decreasing.
This condition is called the slow rolling condition.
Solutions will be well behaved with the following requirements

- The potential follows the slow rolling condition and is strictly decreasing in a simply connected set of points $cal(T)$
- The initial condition is chosen to be between $-1<u(T_0)< -(1/lambda dot(V)/V)^2$ with $T_0 in cal(T)$
- The allowed time for the evolution of the solutions is $-oo<T<sup(cal(T))$

The region where the potential follows the slow rolling condition prevents solutions from
becoming complex when evolved forward in time. However nothing prevents us from evolving 
the solutions backwards in time, and since $u=-1$ is a stationary solution and the EDO
of $u$ are unique (since $dot(u)$ is $cal(C)^oo$ on $u$ in the valid range for $u$) 
the condition of $u>-1$ is secured. 

Since we wanted to give an upper bound on the time where the solutions are valid the result
we enforce $cal(T)$ to be simply connected. Otherwise we could have "holes
#footnote[For example we could have $cal(T) = (0, 1) union (3, 4)$]"
where solutions become complex. Therefore, just to be safe, we take a conservative upper bound
for time.

To check this numerically we simulated @ec-brown:u-definition for some different potentials
using Runge-Kutta 3/8 rule. The results can be seen in @fig-brown:u-simulations.
The results are pretty similar even if the potentials are different.

#figure(
  image("figures/u-sim.svg"),
  caption: [In this figure multiple simulations of $u$ with different potentials are shown.
  As can be seen the result is really similar for all of them. The initial conditions for the 
  differential equations are $u(-1) = -0.999$.]
)<fig-brown:u-simulations>



Now, from @ec-brown:classical-E-definition $E$ is well defined as long as both $u$ and 
$pdv(u, alpha)$ are well defined since all of the other quantities involved are well 
defined. To do this first we define the density of solutions as

$ rho = (pdv(u, alpha))^(-1) $

so that $E$ depends on $rho$. To obtain $rho$ we make use of @ec-brown:u-definition to 
obtain the following differential equation

$ cases(dot(rho)_u = - rho_u (V'/V + lambda sqrt(-u) - lambda ((1+u))/(2sqrt(-u))), 
        rho_u (T_0) = 1) $<ec-brown:rho-definition>

where $u$ is previously computed from @ec-brown:u-definition. Once again the equation has
unique solutions, this ensures that $rho$ is positive for all time since $rho = 0$ is a 
stationary solution. From this we can see that in the limit $u -> -1$ or equivalently 
$T -> - oo$ the differential equation for $rho$ can be approximated as

$ dot(rho)_u = -rho_u (V'/V + lambda) approx - rho_u lambda ==> rho_u approx C e^(-lambda T) $

when substituting this into @ec-brown:classical-E-definition we obtain

$ E prop (1+u)/V e^(lambda T) $

and differentiating wrt time we obtain

$ dot(E) prop E (V'/V + lambda/3) => E prop e^(alpha T) $

therefore in the limit $T -> - oo$ we have $E -> 0$.

In the limit $u -> 0$ $rho$ can be approximated as

$ dot(rho)_u approx  rho lambda 1/(2 sqrt(-u)) ==> rho approx C e^(lambda/2 integral 1/sqrt(-u(s)) dd(s)) $

so that 

$ E prop C/V e^(lambda/2 integral 1/sqrt(-u(s)) dd(s)) $

so the evolution of $E$ is exponential when $u approx 0$ and faster than exponential when
$u -> 0$. This last condition happens when $V'/V -> 0$ since the point where $dot(u) = 0$
goes to zero, this moment is also where the gauge of $phi.alt$ as a time variable breaks 
down since for these models $N -> 0$ and after that we would expect for $phi.alt$ to 
remain at the minimum of the potential so that the Hamiltonian includes the cosmological 
constant.

To compute numerically the values of $E$, at first, I tried computing two similar solutions
and tried to estimate $rho$ from finite differences. However, this method had one issue, 
since the density of solutions got so large eventually solutions reached the same value 
because of floating point precision. The solution for this problem was using the numerical
results on 
@fig-brown:u-simulations and integrating the right hand side of @ec-brown:rho-definition
with the trapezoidal rule since the solution is 

$ rho = exp(integral_(T_0)^T (V'(s))/V(s) + lambda sqrt(-u(s)) - lambda ((1+u(s)))/(2sqrt(-u(s))) dd(s)) $

With these values $E$ could be computed and the results can be found in

#figure(
  image("figures/E-classical-sim.svg"),
  caption: [In this figure simulations of $E$ using @ec-brown:classical-E-definition. 
  As we can see the fourth order potential is the only one that has a faster than 
  exponential behavior since it is the only one reaching the end of the inflationary
  epoch. The initial values for $E$ are $E(0) = 1$ and the solutions for $u$ are the ones
  in @fig-brown:u-simulations.]
)<fig-brown:classical-E>


The quantum mechanical approximation solution is in terms of $A$ as a variable. 
To change to $E$ representation we have to take the fourier transform of the 
wavefunction.

#let Ai = "Ai"

$ tilde(Psi)_u (E, T) &= 1/sqrt(2 pi)integral_(-oo)^oo dd(A) e^(-i R^3 E A) Psi_u (A) =
1/sqrt(2 pi)integral_(-oo)^oo dd(A) e^(-i R^3 E A) e^(alpha cal(E)_u + i gamma_u A^3/3)\
&=_(B = - gamma^(1 slash 3) A)  gamma^(1 slash 3)_u e^(alpha cal(E)_u) 1/sqrt(2 pi) 
integral_(-oo)^oo dd(B) exp(-i (-(R^3 E)/gamma^(1 slash 3) B + B^3/3)) \ &=_(#[@Vallee2010Airy]) 
gamma_u^(1 slash 3) e^(alpha cal(E)_u) Ai(-(R^3E)/gamma_u^(1 slash 3)) 
$

where $alpha = 6 sqrt(3)$, $gamma = R^3/V (1+u)$ y 
$cal(E)_u = integral_(T_0)^T sqrt(-u(s))dd(s) $ and $Ai$ is the Airy function of the
first kind. An example of the norm of the wavefunction, by using the fourth order
potential in @fig-brown:classical-E and as initial condition for $u$ taking 
$u(0) = -0.999$ using 10000 steps in time is represented in 

#figure(
  image("figures/q-phi-norm.png"),
  caption: [In this figure the norm of a solution to the Hamiltonian @ec-brown:q-hamiltonian with $u(0) = -0.999$ and 100000 steps in time. As we can 
  see the solution is analytic through $E=0$ into the Euclidean spaces.]

)

This result is similar to the quantum version of a parabolic trajectory of a particle
in a linear potential since the solutions to that system are also in terms of Airy
functions of the first kind. The main difference between the two is that in the 
linear potential case the solutions are of the form $psi_u (x) = Ai(x+beta_x)$ while
our solutions are of the form $psi_u (x) = Ai(beta_u x)$. This difference prevents
the solutions from being delta normalizable since the inner product of two distinct
solutions can be written as

$ braket(Psi_v, Psi_u) 
&= integral_(-oo)^oo dd(E)  e^(alpha (cal(E)_v + cal(E)_u)) 
1/ sqrt(2pi) integral_C dd(A) exp(-i(-R^3 E A + gamma_v A^3/3)) 
1/sqrt(2pi)integral_C dd(B) exp(i(-R^3 E B + gamma_u B^3/3))

\ &=_(E -> R^3 E) e^(alpha (cal(E)_v + cal(E)_u))/(R^3 2 pi) 
integral.double_C dd(A) dd(B) 
exp(i(gamma_u B^3/3 - gamma_v A^3/3))

integral_(-oo)^oo dd(E)   
exp(i E A-B) 

\ &= e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 
integral.double_C dd(A) dd(B) 
exp(i(gamma_u B^3/3 - gamma_v A^3/3))

delta(A-B)


\ &= e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 
integral_C dd(A)

exp(i (gamma_u - gamma_v)A^3/3)$


where $C$ is a path that starts at complex value $z_(-oo)$ with $abs(z_(-oo)) -> oo$
and $2/3 pi <= arg(z_(-oo))<= pi$ and ends at $z_oo$ with $abs(z_oo) -> oo$ and
$0 <= arg(z_(oo)) <= pi/3$. By choosing the path that goes through the real line 
we can see that the integral is equivalent to twice the real part of the integral 
over the positive negative real axis#footnote[Since $z + z^* = 2 Re(z)$]. The result is that
the integral reduces to an integral from $0$ to $oo$ with the argument of the curve
stays between $2/3 pi$ and $5/6 pi$. Therefore we can write


#let cbrt(x) = $root(3, #x)$
$

braket(Psi_v, Psi_u) = &e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 
2 
Re(integral_(C^-) dd(A) exp(i (gamma_u - gamma_v)A^3/3)) 
\ #scale($("Variable change"/(B = -i abs(gamma_u-gamma_v)/3 A^3))$, 110%, reflow:true)= &2 e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 

Re( cbrt(i)/(cbrt(3^2 abs(gamma_u - gamma_v))) integral_(hat(C)^-)dd(B) B^(1/3 - 1) e^(-B))

\ = &2 e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 

Re( cbrt(i)/(cbrt(3^2 abs(gamma_u - gamma_v))) eval(Gamma(1/3, z))^(z=0)_(abs(z) -> oo))

\ = &2 e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 

Re( cbrt(i)/(cbrt(3^2 abs(gamma_u - gamma_v))) Gamma(1/3))

\ = & e^(alpha (cal(E)_v + cal(E)_u))/(R^3 sqrt(2 pi)) 
Gamma(1/3)/(cbrt(3) cbrt(abs(gamma_u- gamma_v)))
$

where $Gamma(1/3, z)$ is the lower incomplete gamma function, $Gamma(1/3)$ is the
gamma function and the absolute value on $gamma_u-gamma_v$ when defining $B$
together with picking 
the integration path $C^+$ ensures
that $B$ has positive real part. This is necessary for the incomplete gamma function
to converge to the gamma function.

Similarly, the $expval(E)$ diverges towards positive infinity since the integral
of the Airy function squared 
over the negative values of $E$ is finite but the integral over the positive values
diverges. This also tells something really interesting. Since the provability of a
certain value of $E$ is related to the area of the square norm of the function this
means that the predicted provability of finding Euclidean, instead of Lorentzian, 
spaces is zero. This also implies that the provability of finding a singularity 
with zero scale factor is also zero.

However infinite values are most certainly not the desired result. Fortunately it
is possible, by building wave packets of these plane waves, to find states with 
well defined values. To do this we define

$ phi(E, T) = integral_(-1)^0 dd(v) f(v) tilde(Psi)_u (E, T) $

where $f$ is a function with support on $(-1, 0)$. The expected value of $E$ and norm of
$phi$ can be computed in terms of all of the defined quantities as

$ braket(phi, phi) 
&= integral_(-1)^0 dd(v) integral_(-1)^0 dd(w) f^*(v)f^*(w) braket(Psi_v, Psi_w) 
\ &= Gamma(1/3)/(R^3 cbrt(3)sqrt(2 pi)) integral_(-1)^0 integral_(-1)^0 dd(v) dd(w)
f^*(v) f(w) e^(alpha (cal(E)_v  + cal(E)_w))/(cbrt(abs(gamma_u- gamma_v)))   $<ec-brown:normphi>

and

$ bra(phi) E ket(phi) 
&= 1/(braket(phi))  integral.double_(-1)^0 dd(v) dd(w) integral.triple_(-oo)^oo dd(A) dd(B) dd(E)
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(2  pi) E e^(i(- R^3 E A + R^3 E B + gamma_v A^3/3 - gamma_w B^3/3))

\ &= 1/braket(phi) 
integral.double_(-1)^0 dd(v) dd(w) integral.double_(-oo)^oo dd(A) dd(B) 
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(2  pi)  e^(i(gamma_v A^3/3 - gamma_w B^3/3))

integral_(-oo)^oo dd(E) E e^(i R^3(B-A) E)

\ &= 1/braket(phi)

integral.double_(-1)^0 dd(v) dd(w) integral.double_(-oo)^oo dd(A) dd(B) 
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(R^6 sqrt(2  pi))  e^(i(gamma_v A^3/3 - gamma_w B^3/3))

delta'(B-A)

\ &= 1/braket(phi) 
integral.double_(-1)^0 dd(v) dd(w) 
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(R^6 sqrt(2  pi)) 
integral_(-oo)^oo dd(A) 
gamma_w A^2 e^(i(gamma_v- gamma_w) A^3/3)

\
#scale($("Variable change"/(C = 1/braket(phi) gamma_w A^3/3))$)
 &= 1/braket(phi) 
integral.double_(-1)^0 dd(v) dd(w) 
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(R^6 sqrt(2  pi)) 
integral_(-oo)^oo dd(C) 
e^(i(gamma_v/gamma_w- 1) C)

\ &= 1/braket(phi) 
integral.double_(-1)^0 dd(v) dd(w) 
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(R^6) 

delta(gamma_v/gamma_w -1)
$<ec-brown:first-part-expvalE>

Now, since 
$ pdv(, v) (gamma_v/gamma_w -1) = (partial_v gamma_v)/gamma_w = 1/gamma_w (R^3/V partial_v (1+u)) = R^3/(V rho_v gamma_w) $

applying $delta(f(x)) = 1/abs(f'(x_0)) delta(x-x_0)$ to @ec-brown:first-part-expvalE

$ 
bra(phi) E ket(phi) 
&= 1/braket(phi)   
integral.double_(-1)^0 dd(v) dd(w) 
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(R^6) 

rho_v (1+u_w) delta(v-w)

\ &= 1/braket(phi) 
integral.double_(-1)^0 dd(w) dd(v)
f(v) f^*(w)
e^(alpha (cal(E)_v + cal(E)_w))/(R^6) 

rho_v (1+u_w) delta(v-w)

\ &= 1/braket(phi) 
integral_(-1)^0 dd(w)
abs(f(w))^2
e^(2alpha cal(E)_w)/(R^6) 

rho_w (1+u_w) 


$<ec-brown:exp-val-E>

By using a uniform distribution between $-0.7$ and $-0.2$ at time $T=0.3$

$ f(v) = cases(2 "if" -0.7 <= v <= -0.2, 0 "otherwise") $<ec-brown:distribution>

and the fourth order potential from @fig-brown:classical-E we can simulate the 
results.
The norm and expected values can be found in @fig-brown:norm-phi and @fig-brown:exp-val-E.

As we can see the norm of the wavefunction is not a constant. This can be traced
to the chosen Hamiltonian, since the Hamiltonian is not Hermitian, the time evolution
operator @lancaster2014quantum

$ U(Delta t) = exp(-i hat(H) Delta t slash hbar) $

is not unitary. Therefore the norm is not a conserved quantity. 

It is also interesting to note how @fig-brown:exp-val-E and 
the fourth order potential solution in @fig-brown:classical-E. This can be understood
by remembering that $u=-1$ is an attractor when time runs backwards. Since the 
wave packet defines the initial conditions at $T_0 = 0.3$ when evolved backwards
the values of $u$ will be clumped close to $-1$, so that the evolution is similar 
to a state with only one value of $u$ corresponding to the solution represented in 
@fig-brown:classical-E.

#figure(
  image("figures/normphi.svg"),
  caption: [In this figure the norm of the wave packet described in @ec-brown:distribution
  is computed by using @ec-brown:normphi. The number of steps in time was of $10000$ and
  for the initial conditions in $u$ was $100$.]
)<fig-brown:norm-phi>

#figure(
  image("figures/exp-val-e.svg"),
  caption: [In this figure the expected value of $E$ is computed from @ec-brown:exp-val-E.
  using the distribution in @ec-brown:distribution. The number of steps in time 
  for integration was of $10000$ and in the initial conditions for $u$ was $100$.]
)<fig-brown:exp-val-E>


== Conclusions 

As show here the classical model predicts inflation for slow rolling potentials 
at the end of the inflationary epoch. Additionally the quantum model allows to define
well defined wave packets and compute quantities in agreement with the expected values.

Additional work could find a Hermitian Hamiltonian and the solutions would fix 
the non-constant norm problem of the solutions.