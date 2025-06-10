#import "../things-to-add.typ":*


= Formalism of general relativity

In order to understand symetry and motivate the definition of Killing fields first
it is required to understand is, in the mathematical sense, spacetime and
define flows and Lie derivatives.

To do this we will introduce little by little mathematical structure based on the 
cualities that a spacetime should have

== Spacetimes

A spacetime in the formalism of general relativity is defined as a pseudo-Riemannian
manifold. We will start by understanding this ideas.

== Continuity

First of all, a spacetime has a notion that it is continuous, further than that,
it is path connected, meaning one can connect any point to any other point by a 
continuous path#footnote([This path is not required to be physical, it could 
be superluminic.]). 

The notion of continuity is defined in the mathematical field of topology
A topological space is a pair of sets
$(M, tau)$, the first of these is the set of all the points in the space, the 
second is called the topology of the space and represents all of the open sets.
The core idea behind having a topology is introducing a notion of 'closeness' 
without introducing a metric, in our case there will be an aditional notion of
closeness defined because of the metric but this idea has to be introduced later.
Any topology obeys the following 
relations of closure

$ emptyset, M in tau \ x_i in tau => Union_(i = 0)^oo x_i in tau \
x_i in tau => Intersection_(i=0)^n x_i in tau $

This allows to define what a continuous function is, the idea of continuity is 
that any two 'close' points in the input of the function will be 'close' in the 
output. On topological spaces the definition is related to how open sets transform,
here a function between topological spaces $f: (M, tau_M) -> (N, tau_N)$ is 
continous if $ forall V in tau_N, f^(-1)(V) in tau_M$ meaning all open sets in the 
output are open sets in the input. This definition is inspired by the $epsilon-delta$
definition usually defined for metric spaces#footnote([Spaces with the notion of
distance]), in fact if one uses the topology defined by the open balls (sets of 
points closer than some distance) the definitions are equivalent.

== Coordinates
Whenever one talks about any kind of state in physics it is talked about in a 
coordinate system. It would be expected that in spacetimes one can do the same 
thing and label the points in spacetime. This is covered in the mathematical field
of manifolds. A manifold is a topological space that additionally can be locally
mapped to a cartesian coordinate system, meaning for any open set $V$ there is a 
continuous bijection $phi$ from $V$ to $RR^n$ such that $phi^(-1)$ is continuous too.

Additionally it is requiered that for any two mappings $phi_1: V_1 -> RR^n$ and 
$phi_2: V_2 -> RR^n$ such that $V_1 inter V_2 != emptyset$ there has to be a 
function from $psi: phi_1(V_1 inter V_2) -> phi_2(V_1 inter V_2)$ that is 
a biyection, continuous and has a continuous inverse. This means that one can 
'translate' one coordinate system to another if they map the same region.

In the case of physics it is addtitionally required that $psi$ is infinitely 
differentiable, this is the definition for smooth manifolds. 
This is necesary because otherwise a smooth function would be smooth on one 
coordinate system but it would not be smooth on a different coordinate system
because of the chain rule.

The set of all coordinate systems with a smooth coordinate change is called an 
atlas or $atlas$.

Another representation for a coordinate system is a collection of $n$ functions 
$x^mu: EE --> RR$ such that $x^0$ gives the $0$-th component of a coordinate system
$phi$, $x^1$ the first component and so on. This representation is more common in 
physics and will be widely used in this thesis.

== Fields on the spacetime
Now it is time to start talking about what can we 'place' on spacetime.
=== Scalar fields on spacetimes
A scalar field assigns a number to each point of our spacetime $EE$. So it will
be any function of the form 

$ phi.alt: EE --> RR $ 

This function can be 'placed' in a coordinate system by defining 
$phi.alt_phi: RR^n -->RR$ by taking a coordinate system from the atlas $phi in atlas$
and applying the inverse to the input $phi.alt_phi = phi.alt compose phi$. 
From now on $phi.alt_phi$ will be denoted just $phi.alt$ whenever the coordinate 
system is clear.

The set of all infinitely differentiable scalar fields on a manifold will be 
denoted $Cinf(M)$

=== Parametric curves
If one wishes to keep track of the path of a particle on a spacetime one would 
naturally use this kind of object. A parametric curve may be defined as a function

$ gamma: RR-->EE $

Again this path can be represented in a coordinate system by composing it with a 
map $phi in atlas$, #box($gamma_phi: RR --> RR^n, gamma_phi = phi compose gamma$).

=== Vector fields on the spacetime

Motivated from the 'clasical' version of a vector field defined as 
$F: RR^n --> RR^n$ it might be tempting to define $X: EE --> RR^n$ as a vector 
field on an $n$ dimensional smooth manifold. This definition has one big problem,
it is not coordinate independent. 

Imagine one has a 3-dimensional manifold with a coordinate system ${x^mu}$ and a
primed coordinate system ${x'^mu}$ such that 
$x'^0 = x^1, x'^1 = x^0, x'^2 = x^2$. 
Now lets define a constant vector field on the
'$x$' direction $X(p) = (1, 0, 0)$. In the $x^mu$ coordinate system this field 
points in the $x^0$ direction while on the $x'^mu$ coordinate system points in 
the $x'^0$ direction, this would correspond to the $x^0$ direction by the coordinate
transformations defined. Therefore this definition of a vector field is not 
independent of coordinate choice.

There are two equivalent definitions for vectors on a manifold at a point $p$ that
are coordinate independent. 

The firest of these is in terms of tangent vectors of curves, since a curve on the
manifold is defined independently of the coordinate system it would be expected that
the tangent vector is coordinate independet too. In this way the set of all vectors
at a point $p in EE$ is defined as the set of curves $gamma$ such that 
$gamma(0) = p$. Here we will have to add an equivalence relation, similarly to how
rational numbers are not all of the fractions but the fractions with the fact that
two fractions are equal when they follow the relation $a/b tilde.op c/d <=> a d = 
b c$ here two of our vectors will be 'equal' if for any $phi in atlas$ 
$ gamma tilde.op hat(gamma) <=> (phi compose gamma)' = (phi compose hat(gamma))' $

where $'$ is the usual derivative.


The second definitions is via derivations. A derivation at a point $p$ is defined 
as a linear functional

$ D: Cinf(M) --> RR $

that also obeys the product rule

$ f, g in Cinf \ D(f dot g) = f(p) D(g) + D(f) g(p) $<ec:def-derivations>

Any curve can be assigned a derivation via the following definition 

$ D_gamma f = (f compose gamma)'(0) $<ec:derivation-via-curve>

The equivalence of definitions may be proben by first proving both spaces have the
same dimension. After that @ec:derivation-via-curve gives a one to one 
correspondence on both spaces.  When given a coordinate system the space
of derivations has a basis defined by
$ partial_mu (p)= pdv(, x^mu)(p) $

Where $(p)$ denotes evaluation of the partial derivative at $p$

With any of the two definitions the vector space of all vectors at a point $p$ of
a manifold $M$ is denoted $T_p M$. 

By definig the set of all vectors tangent to the manifold $T M = Union_(p in M) T_p M$ a vector field may be defined as 

$ X: M &--> T M \ p &--> X(p) in T_p M $

When given a coordinate system a vector field may be written as 

$ X(p) = X^mu (p) pdv(, x^mu)  (p) $<ec:vector-component-def>

So a *smooth vector field* is defined as a vector field whose component functions,
$X^mu$, are smooth. The set of all smooth vector fields is denoted as $svecfield(M)$

For some proofs the notation $X(p, f) = X(f)(p) = X^mu (p) pdv(f, x^mu)(p)$ will 
be usefull


=== Covectors

It is easy now to define covectors. A covector at a point $p$ is defined as a 
linear function

$ omega: T_p M --> RR $
so the cotangent space $T^*_p M$ is the space of all covectors at a point $p$ and
the set of all covectors $T^* M = Union_(p in M) T^*_p M$ a covector field is

$ omega: M &--> T^* M \ p &--> omega(p) in T^*_p M $

for any basis $partial_mu$ the canonical basis for the covector space can be 
defined as a covector collection such that $dd(x^mu)(partial_nu) = delta^mu_nu$ 
where $delta^mu_nu$ is the chroneker delta. 

A covector will be smooth if for a coordinate system the covector has components
$omega_mu$ defined by

$ omega = omega_mu (p) dd(x^mu) $<ec:covector-component-def>

are $Cinf(M)$ functions

Again the notation
$ omega(p, X) = omega_mu (p) dd(x^mu)(X) (p) $

will be usefull

=== Tensors

A tensor represents a multilinear map, meaning that for any input slot

$ T(a, b, ..., alpha c+beta d, ..., z) = alpha T(a, b, ..., c, ..., z) + beta T(a, b, ..., d, ..., z) $

The most basic definition of a tensor one can come up with is

$ T: V_1 times V_2 times ... times V_n -> RR $

This is a tensor that takes $n$ vectors as input and as output gives a number

It could be also output more vectors defining
$ hat(T): V_1 times V_2 times ... times V_n --> V_(n+1) $

however by evaluating the output of $hat(T)$ with a covector the result is a number
representing some component. So it is common to represent this kind of tensors by

$ hat(T): V_1 times V_2 times ... times V_n times V^*_(n+1) --> RR $

Therefore the definition of a tensor over a vector space $V$ of kind $(q, p)$ or 
$q$ times contravariant, $p$ times covariant is defined as 

$ T: underbrace(V^* times ... times V^*, q "copies") times underbrace(V times ... times V, p "copies") --> RR $

In our case the corresponding vector spaces are the $T_p M$ and a tensor field 
will be a map

$ T: underbrace(T^* M times ... times T^* M, q "copies") times underbrace(T M times ... times T M, p "copies") --> Cinf(M)   $

The components of a tensor can be obtained by feeding it some vectors and 
applying @ec:vector-component-def and @ec:covector-component-def

$ T(omega,  ..., X, ...) = T(omega_mu dd(x^mu), ..., X^nu partial_nu, ...) = 
omega_mu X^nu ... T(dd(x^mu), ..., partial_nu, ...) =: omega_mu X^nu ... T^(mu ...)_(nu ...) $

So a tensor field is called smooth if the component functions $T^(mu ...)_(nu ...)$
are $Cinf(M)$

Another notation that will be usefull is 

$ T(p, omega, ..., X, ...) = omega_mu_1 (p) ... X^(nu_1) (p) ... T_(nu_1 ...)^(mu_1 ...) (p) $

== Metrics

The last piece for constructing a spacetime is adding a notion of magnitude to 
our vectors and distance. This is constructed by adding a tensor field to the 
spacetime Manifold which we will call the metic.

The metric defines a dot product between vectors

$ X dot Y = g(X, Y) = X^mu Y^nu g_(mu nu) $

also allowing to lower the indices of vectors and tensors by contracting with the
metric
$ X_mu = g_(mu nu) X^nu $

since we would like to be able to invert the relation it is defined $g^(mu nu)$
such that
$ g^(mu alpha) g_(alpha nu) = delta^mu_nu $

so $X^mu = g^(mu nu) X_nu$

A Manifold equipped with a metric is called Riemannian if a metric can be 
diagonilazed with all positive eigenvalues and pseudo-Riemannian if it can have
both positive and negative. 

In general relativity the equivalence principle can be stated in terms of the 
metric so that for any point there is a coordinate system such that

$ g_(mu nu) = eta_(mu nu) + Order(x^2) $

where $eta$ is the Minkowski metric.

This allows to define a distance #footnote[This will only be a distance function
whenever the manifold is Riemannian, for pseudo-Riemannian it is not since it 
can be negative, in general relativity the sign will be a way to encode when a 
path moves in the 'time direction', in the 'space direction' or like light. ]
 function between two points of the manifold by
denoting $Gamma(p, q)$ the set of all curves starting at $p$ and ending at $q$

$ d(p, q) = min_(gamma in Gamma(p, q)) integral_gamma (g(gamma'(tau), gamma'(tau))) 
dd(tau) $

where $gamma'$ is the tangent vector to $gamma$

= Transformations of manifolds

In order to study the symmetries of our spacetime one has to first understand how to make a transformation. 

First will start by defining a smooth transformation between manifolds $M, N$ as 
a function $F: M->N$ such that for any coordinate system of $M$, $phi$, that 
contains $p$, and any coordinate system of $N$, $phi'$, that contains $F(p)$, 
the function $phi' compose F compose phi^(-1)$ is smooth.

A *diffeomorphism* is a smooth map that is also biyective and with a smooth inverse.
Any pair of manifolds that have a diffeomorphism relating them will be called 
diffeomorphic manifolds.

Diffeomorphic manifolds are equivalent in the sense that any field, may it be 
scalar, vectorial or tensorial defined on one of the manifolds.
Has an equivalent definition on the other. The operations that map a field on one
of the manifolds to the other are called pullback and pushforward.

== Pullback and pushforward of scalar fields
Given a function $F: M->N$. A pullback will map fields defined on $N$ to fields
defined on $M$. The simplest case is for scalar fields. The pullback of a scalar
field $f in Cinf(N)$ is defined as

$ pb(F) f = f compose F $

so that $F$ maps points of $M$ to $N$ and then $f$ maps it to $RR$ so the 
complete map is $M->RR$.

The pushforward is the oposite transformation to the pullback, mapping fields from
$M$ to $N$. In the case of diffeomorphisms it can be defined as the pullback by the
inverse function. So if one has a function $f in Cinf(M)$ the pushforward by $F$
is defined as 

$ pf(F)f = pb((F^(-1)))f = f compose F^(-1) $

The motivation behind this definition is that, if one pushes forward a function and 
then pulls it back, it would be reasonable for the function to remain unchanged
therefore $pb(F)pf(F)f = f$

It is easy to see that the pullback and pushforward are linear since composition 
is linear so that 


$ pf(F)(alpha f+ beta g) = alpha pf(F) f + beta pf(F) g \ 
  pb(F)(alpha f+ beta g) = alpha pb(F) f + beta pb(F) g  $

Under this definitions diffeomorphisms may be thought rather than as mappings 
between manifolds, as coordinate changes, since for any coordinate system on $N$,
$x'^mu$, it can be thought of as a coordinate system on $M$ defined as 
$x^mu = pb(F) x'^mu$. This will come up later in the chapter in the notion of 
passive vs active transformations. 


== Pullback and pushforward of vector fields

Since a vector field was defined as a collection of derivations, it may be 
thought of as a  function $X: Cinf(M) -> Cinf(M)$, that maps a function to the 
directional derivative of the function at that point.

The pushforward of vector fields may be thought of as first pulling back the vector
field the corresponding function then
pushing forward the result, for clarity $X(p, f)$ denotes evaluating $X(f)$ at $p$,
$p in M$, $hat(P) in N$ $g in Cinf(N)$

$ (pf(F) X)(g) = X(F^(-1)(hat(p)), pb(F) g) $

The pullback is defined as the pushforward by the inverse function

$ pb(F) X = pf((F^(-1))) X $


Again pushforward and pullback of vector fields is linear 

$ pf(F) (alpha X+beta Y)(f) &= (alpha X+ beta Y)(f compose F) = 
 alpha X(f compose F) + beta Y(f compose F) \
 &= alpha pf(F)(X)(f) + beta pf(F)(Y)(f) $

Also by defining multiplication of vector fields and scalar fields $f X$ as 

$ (f X)(p, g) = f(p) X(p, g) $

the pushforward of this composition is linear in the following sense

$ pf(F)(f X)(hat(p), g) &= (f, X)(F^(-1)(hat(p)), pb(F)g) = f(F^(-1)(hat(p))) 
X(F^(-1)(hat(p)), pb(F) g) 
\ &= (pf(F)f)(hat(p)) dot (pf(F)X)(hat(p), g) $

where $dot$ denotes the product of real numbers

equivalently for the pullback

$ pb(F)(f X) = (pb(F)f) (pb(F) X) $

This equations are coordinate independent, however for computations it is easier 
to obtain the transformations by coordinate systems, in order to obtain the 
coordinate transformation we will write the coordinate system of $M$ as $x^mu$ and
the coordinate system of $N$ obtained as the pushforward of $x^mu$, $x'^mu$ 

Now our vector field $X in svecfield(M)$ can be written

$ X = X^mu (x^mu) pdv(, x^mu) $

by defining a vector field on $N$, $X'$ as the pushforward of $X$

$ X' = pf(F)X = X'(x'^mu) pdv(, x'^mu) $<ec:def-pf-of-vf-coordinates-proof>

Since $x'^mu = F(x^mu)$ for a function in $f in Cinf(N)$ and defining $p in M$, 
$hat(p) in N$ so that $hat(p) = F(p)$

$ pf(F) X(hat(p), f) &= pf(F)(X^mu pdv(, x^mu))(hat(p), f) = X^mu (F^(-1)(hat(p)))
pdv(f compose F, x^mu)(F^(-1)(hat(p))) 
\ &= X^mu (p) pdv(f compose F, x^mu)(p) = X^mu (p) pdv(f, x'^nu)(hat(p)) 
pdv(x'^nu, x^mu)(p) $<ec:proof-pf-of-vf-coordinates>

Therefore by comparing the @ec:def-pf-of-vf-coordinates-proof and
@ec:proof-pf-of-vf-coordinates the resulting transformation on a coordinate system
is 
$ X'^mu (hat(p)) = pdv(x'^mu, x^nu)(F^(-1)(hat(p))) X^nu (F^(-1)(hat(p)))  $

This equation might seem purely mathematical but it explains the physical 
transformations that we will find. These have a translation component, encoded 
on the term of $X^nu (F^(-1)(hat(p)))$, that because of the $F^(-1)$ term shifts 
the position of the $X^mu(p)$ vector. The other component are rotations, or 
expansions, encoded on the $pdv(x'^mu, x^nu)(F^(-1)(hat(p)))$, this is because 
this term mixes the components and allows for changing the direction of the vector
or length of the vector.

For the pullback the result is equivalent by changing $x'^mu-> x^mu$, $x^mu -> x'^mu$
$hat(p) -> p$ and $F -> F^(-1)$

so 

$ X^mu (p) = pdv(x^mu, x'^nu)(F(p)) X'^nu (F(p)) $

== Pullback and pushforward of covector fields

Just as we did with vector fields, covector fields map vector fields to scalar fields
the definitions and results are equivalent so for a covector $omega$

$ pf(F) omega (hat(p), X) = omega(F^(-1)(hat(p)), pb(F) X)  $<ec:pushforward-of-covector>

and for the pullback

$ pb(F) omega(p, X) = omega(F(p), pf(F) X) $

Again these are linear over addition of covectors and products by real numbers,
and by defining the product of covectors by 

$ (f omega)(p, X) = f(p) omega(p, X) $

the pushforward is 'linear' over these in the sense that

$ pf(F)(f omega)(hat(p), X) &= (f omega)(F^(-1)(hat(p)), pb(F)X) 
= f(F^(-1)(hat(p))) omega(F^(-1)(hat(p)), pb(F) X) 
\ &= (pf(F)f)(hat(p)) (pf(F) omega)(hat(p), X) $

and equivalently for the pullback

$ pb(F)(f omega) = (pb(F) f) (pb(F) omega) $

When given a coordinate system for $M$ and $N$, $x^mu$ and $x'^mu$ respectively,
then the covector on $M$ may be written as

$ omega = omega_mu (p) dd(x^mu) $

and the pushforward

$ omega' = pf(F) omega =  omega_mu (hat(p)) dd(x'^mu) $
<ec:covector-transformed-basis-expansion-proof-transformation>

so by applying the definition of pushforward of a covector field, 
@ec:pushforward-of-covector, one finds by setting $X' in svecfield(N)$

$ pf(F) omega (hat(p), X') &= pf(F) (omega_mu  dd(x^mu)) (hat(p), X') = 
pf(F)(omega_mu)(hat(p)) pf(F)(dd(x^mu))(hat(p), X') 
= omega_mu (p) dd(x^mu)(p, pb(F)X') 
\ &= omega_mu (p) dd(x^mu) (p, X'^nu (hat(p)) pdv(x^alpha, x'^nu) pdv(, x^alpha))
=  omega_mu (p)  X'^nu (hat(p)) pdv(x^alpha, x'^nu)  
                     underbrace(dd(x^mu) (p, pdv(, x^alpha)), delta^mu_alpha) 
\ &= omega_mu (p) X'^nu (hat(p)) pdv(x^alpha, x'^nu)(hat(p)) delta^mu_alpha 
=  pdv(x^mu, x'^nu)(hat(p)) omega_mu (p) X'^nu (hat(p)) $<ec:computation-transformation-rule-for-covectors>

now, by feeding the same input to the @ec:covector-transformed-basis-expansion-proof-transformation one obtains

$ omega'(hat(p), X') &= omega'_mu (hat(p)) dd(x'^mu)(X') = omega'_mu (hat(p))
X'^nu (hat(p)) dd(x'^mu)(pdv(, x'^nu))  
\ &= omega'_mu (hat(p)) X'^nu (hat(p)) delta^mu_nu = omega'_mu (hat(p)) X'^nu (hat(p)) $<ec:proof-covector-transformation-feed-to-pushforward>

by comparing 
@ec:computation-transformation-rule-for-covectors
and
@ec:proof-covector-transformation-feed-to-pushforward 

one obtains

$ omega'_mu (hat(p)) = pdv(x^nu, x'^mu) (hat(p)) omega_nu (F^(-1)(hat(p))) $

The equivalent reasoning for the pullback gives

$ omega_mu (p) = pdv(x'^nu, x^mu) (p) omega'_nu (F(p)) $

Again here one can identify a translation and a rotation or expansion term, 
however here the rotation is inverted.

== Tensor pullbacks and pushforwards

The pushforward of a tensor field, just as we did before with vectors and covectors
is defined by pulling back the vector and covector fields and then pushing 
forward the results

$ pf(F)T(p, omega, ..., X, ...) = T(F^(-1)(p), pb(F)omega, ..., pb(F)X, ...)  $

and equivalently for the pullback

$ pb(F)T(p, omega, ..., X, ...) = T(F(p), pf(F) omega, ..., pf(F) X, ...) $

Just as proven with the method in the 
@ec:computation-transformation-rule-for-covectors it can be proben that 
if $T$ is a tensor in $M$ and $T'$ is the pushforward on $N$, and by 
choosing a coordinate system $x^mu$ on $M$ and the pushforward of this coordinate
system to $N$, $x'^mu$, one obtains the relationship between the coordinate 
systems of both as

$ T'_(mu_1 ...)^(nu_1 ...)(hat(p)) = 
pdv(x'^(nu_1), x^(alpha_1))(F^(-1)(hat(p))) ... pdv(x^(beta_1), x'^(mu_1))(hat(p)) 
T^(alpha_1 ...)_(beta_1 ...) (F^(-1)(hat(p))) $

== Isometries

An isometry, is a diffeomorphism between Riemannian or pseudo-Riemannian manifolds,
$F: M -> N$, where $g_M$ is the metric on $M$ and $g_N$ is the metric on $N$ then
$F$ is an isometry if 
$ g_N = pf(F) g_M  $

thus preserving the metric.

Any object that only depends on the metric is called *intrinsic* and is preserved
under isometries in the same sense that the metric is preserved. 

A few examples are:
- The Levi-Civita connection ($cdv(, mu)$)
- The Riemann tensor ($tensor(R, mu, -nu gamma sigma)$)
- The length of a curve ($integral_gamma sqrt(g_(mu nu) gamma'^mu gamma'^nu) dd(tau)$)

= Flows 

A flow, intuitivelly, is descrived as the movement of a liquid or a gas that at 
each point moves in one particular direction.

Mathematically this can be described by a velocity field, that describes the 
movement of the fluid. 

This might not seem relevant to the study of transformations in general relativity, 
however this concept is the definition we will use to build all of the 
transformations.

First we will start by defining a flow as a curve that solves the following 
differential equation 

$ cases(pdv(phi.alt, tau)(tau, x_0) = V(phi.alt(tau, x_0)), phi.alt(0, x_0) = x_0)  $

where $V$ is the velocity field and $phi.alt$ is a curve on the manifold. There are
a few interesting properties of flows that will be important later.

First of all, since $V$ is a smooth vector field, the solutions to 
$phi.alt(tau, x_0)$ are unique, this also means that for any fixed $tau$ the 
transformation
$phi.alt_tau: M -> M$ defined as $phi.alt_tau (p) = phi.alt(tau, p)$ is a 
diffeomorphism since the solutions are unique and since the function is 
differentiable with respect to $tau$ it has to be smooth.