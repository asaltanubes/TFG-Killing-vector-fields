#import "../things-to-add.typ":*


= Formalism of general relativity

This section is based on @smooth-manifolds-lee and @riemannian-manifolds-lee.

In order to understand symmetry and motivate the definition of Killing fields first
it is required to understand is, in the mathematical sense, spacetime and
define flows and Lie derivatives.

To do this we will introduce little by little mathematical structure based on the 
qualities that a spacetime should have. At the end of the section
we will have motivated the use
of a pseudo-Riemannian manifold as the model for spacetime.


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
without introducing a metric, in our case there will be an additional notion of
closeness defined because of the metric but this idea has to be introduced later.
Any topology obeys the following 
relations of closure

$ emptyset, M in tau \ U_i in tau => Union_(i = 0)^oo U_i in tau \
U_i in tau => Intersection_(i=0)^n U_i in tau $

This allows to define what a continuous function is, the idea of continuity is 
that any two 'close' points in the input of the function will be 'close' in the 
output. On topological spaces the definition is related to how open sets transform,
here a function between topological spaces $f: (M, tau_M) -> (N, tau_N)$ is 
continuous if $ forall V in tau_N, f^(-1)(V) in tau_M$ meaning all open sets in the 
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

Additionally it is required that for any two mappings $phi_1: V_1 -> RR^n$ and 
$phi_2: V_2 -> RR^n$ such that $V_1 inter V_2 != emptyset$ there has to be a 
function from $psi: phi_1(V_1 inter V_2) -> phi_2(V_1 inter V_2)$ that is 
a bijection, continuous and has a continuous inverse. This means that one can 
'translate' one coordinate system to another if they map the same region.

In the case of physics it is additionally required that $psi$ is infinitely 
differentiable, this is the definition for smooth manifolds. 
This is necessary because otherwise a smooth function would be smooth on one 
coordinate system but it would not be smooth on a different coordinate system
because of the chain rule.

The set of all coordinate systems with a smooth coordinate change is called an 
atlas or $atlas$.

Another representation for a coordinate system is a collection of $n$ functions 
$x^mu: EE --> RR$ such that $x^0$ gives the $0$-th component of a coordinate system
$phi$, $x^1$ the first component and so on. This representation is more common in 
physics and will be the main one used in this thesis.

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

Motivated from the 'classical' version of a vector field defined as 
$F: RR^n --> RR^n$ it might be tempting to define $X: EE --> RR^n$ as a vector 
field on an $n$ dimensional smooth manifold. This definition has one big problem,
it is not coordinate independent. 

Imagine one has a 3-dimensional manifold with a coordinate system ${x^mu}$ and a
primed coordinate system ${x'^mu}$ such that 
$x'^0 = x^1, x'^1 = x^0, x'^2 = x^2$. 
Now lets define a constant vector field on the
'$x$' direction $X(p) = (1, 0, 0)$. In the $x^mu$ coordinate system this field 
points in the $x^0$ direction while on the $x'^mu$ coordinate system points in 
the $x'^0$ direction, this would correspond to the $x^1$ direction by the coordinate
transformations defined. Therefore this definition of a vector field is not 
independent of coordinate choice.

There are two equivalent definitions for vectors on a manifold at a point $p$ that
are coordinate independent. 

The first of these is in terms of tangent vectors of curves, since a curve on the
manifold is defined independently of the coordinate system it would be expected that
the tangent vector is coordinate independent too. In this way the set of all vectors
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

The equivalence of definitions may be proven by first proving both spaces have the
same dimension. After that @ec:derivation-via-curve gives a one to one 
correspondence on both spaces.  When given a coordinate system the space
of derivations has a basis defined by
$ partial_mu (p)= pdv(, x^mu)(p) $

Where $(p)$ denotes evaluation of the partial derivative at $p$

With any of the two definitions the vector space of all vectors at a point $p$ of
a manifold $M$ is denoted $T_p M$. 

By defining the set of all vectors tangent to the manifold $T M = Union_(p in M) T_p M$ a vector field may be defined as 

$ X: M &--> T M \ p &--> X(p) in T_p M $

When given a coordinate system a vector field may be written as 

$ X(p) = X^mu (p) pdv(, x^mu)  (p) $<ec:vector-component-def>

So a *smooth vector field* is defined as a vector field whose component functions,
$X^mu$, are smooth. The set of all smooth vector fields is denoted as $svecfield(M)$

For some proofs the notation $X(p, f) = X(f)(p) = X^mu (p) pdv(f, x^mu)(p)$ will 
be useful


=== Covectors

It is easy now to define covectors. A covector at a point $p$ is defined as a 
linear function

$ omega: T_p M --> RR $
so the cotangent space $T^*_p M$ is the space of all covectors at a point $p$ and
the set of all covectors $T^* M = Union_(p in M) T^*_p M$ a covector field is

$ omega: M &--> T^* M \ p &--> omega(p) in T^*_p M $

for any basis $partial_mu$ the canonical basis for the covector space can be 
defined as a covector collection such that $dd(x^mu)(partial_nu) = delta^mu_nu$ 
where $delta^mu_nu$ is the Kronecker delta. 

A covector will be smooth if for a coordinate system the covector has components
$omega_mu$ defined by

$ omega = omega_mu (p) dd(x^mu) $<ec:covector-component-def>

are $Cinf(M)$ functions

Again the notation
$ omega(p, X) = omega_mu (p) dd(x^mu)(X) (p) $

will be useful

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

Another notation that will be useful is 

$ T(p, omega, ..., X, ...) = omega_mu_1 (p) ... X^(nu_1) (p) ... T_(nu_1 ...)^(mu_1 ...) (p) $

== Metrics

The last piece for constructing a spacetime is adding a notion of magnitude to 
our vectors and distance. This is constructed by adding a tensor field to the 
spacetime Manifold which we will call the metric.

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
diagonalized with all positive eigenvalues and pseudo-Riemannian if it can have
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

$ d(p, q) = min_(gamma in Gamma(p, q)) integral_gamma sqrt(g(gamma'(tau), gamma'(tau))) 
dd(tau) $

where $gamma'$ is the tangent vector to $gamma$

= Transformations of manifolds

This section is based on @smooth-manifolds-lee, @riemannian-manifolds-lee and 
@carroll2003spacetime.

In order to study the symmetries of our spacetime one has to first understand how to make a transformation. 

First will start by defining a smooth transformation between manifolds $M, N$ as 
a function $F: M->N$ such that for any coordinate system of $M$, $phi$, that 
contains $p$, and any coordinate system of $N$, $phi'$, that contains $F(p)$, 
the function $phi' compose F compose phi^(-1)$ is smooth.

A *diffeomorphism* is a smooth map that is also  bijective and with a smooth inverse.
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

$ pb(F) f = f compose F $<ec:def-pb-scalar-field>

so that $F$ maps points of $M$ to $N$ and then $f$ maps it to $RR$ so the 
complete map is $M->RR$.

The pushforward is the opposite transformation to the pullback, mapping fields from
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
the position of the $X^mu (p)$ vector. The other component are rotations, or 
expansions, encoded on the $pdv(x'^mu, x^nu)(F^(-1)(hat(p)))$, this is because 
this term mixes the components and allows for changing the direction of the vector
or length of the vector.

For the pullback the result is equivalent by changing $x'^mu-> x^mu$, $x^mu -> x'^mu$
$hat(p) -> p$ and $F -> F^(-1)$

so 

$ X'^mu (p) = pdv(x^mu, x'^nu)(F(p)) X^nu (F(p)) $<ec:pb-comp-vec-field>

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
@ec:computation-transformation-rule-for-covectors it can be proven that 
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

This section is based on @smooth-manifolds-lee.

A flow, intuitively, is described as the movement of a liquid or a gas that at 
each point moves in one particular direction.

Mathematically this can be described by a velocity field, that describes the 
movement of the fluid. 

This might not seem relevant to the study of transformations in general relativity, 
however this concept is the definition we will use to build all of the 
transformations.

First we will start by defining a flow as a curve that solves the following 
differential equation 

$ cases(pdv(phi.alt, tau)(tau, x_0) = V(phi.alt(tau, x_0)), phi.alt(0, x_0) = x_0)  $<ec:def-flow-of-vec-field>

where $V$ is the velocity field and $phi.alt$ is a curve on the manifold. There are
a few interesting properties of flows that will be important later.

First of all, since $V$ is a smooth vector field, the solutions to 
$phi.alt(tau, x_0)$ are unique, this also means that for any fixed $tau$ the 
transformation
$phi.alt_tau: M -> M$ defined as $phi.alt_tau (p) = phi.alt(tau, p)$ is a 
diffeomorphism.

Another property that flow has is that these are defined except by a constant 
translation on the parameter $tau$. Meaning if $phi.alt(tau, x_0)$ is a flow of a 
field $V$ then $phi.alt(tau + s, x_0)$ is also a flow of the field $V$. 

There is an interesting property of flows that can be stated as follows

$ phi.alt(t+s, x_0) = phi.alt(t, phi.alt(s, x_0)) $

this is easy to check since by uniqueness both $phi.alt(t+s, x_0)$ and 
$phi.alt(t, p_0)$ where $p_0 = phi.alt(s, x_0)$ solve the same initial value problem
therefore the equality is true. As a lemma we have that the inverse diffeomorphism
$phi.alt^(-1)_tau (p)$ is equivalent to $phi.alt_(-tau) (p)$

= Lie derivatives

This section is based on @smooth-manifolds-lee and @carroll2003spacetime.

Finally after all of the mathematical conundrum we are finally ready to define 
the Lie derivative. The Lie derivative is an object that takes in a vector field
$V$ and some geometrical object, such as scalar fields, vector fields or tensor
fields. And what the Lie derivative represents is, if someone following the flow
of $V$, made a function of how they see these objects change as a function of $tau$
and then took a derivative at $tau=0$, what would be the value of that derivative.

This intuitive image of what a Lie derivative wants to answer can be stated in 
two equivalent ways, and active way and a passive way. The active way models the 
path of the observer by keeping coordinates stationary and transforming the fields
so that $phi -> phi'$ and the Lie derivative would be something like $(phi'-phi)
 slash epsilon$. The passive approach transforms the coordinates so that the fields
stay still and the observer is the one moving from this coordinate system. In this
case $x^mu -> x'^mu$ and the Lie derivative would take the form of $(phi(x'^mu)-
phi(x^mu)) slash epsilon$. 

Here we will take the active approach and model the derivative by transforming the 
fields. 

First we will motivate the equation with an example and then will start computing
the Lie derivative in component form of multiple kinds of objects.

To obtain a Lie derivative of some field $phi$ with respect to some vector field 
$X$, first of all the flow of $X$ is computed obtaining $phi.alt_tau (p)$. Now 
the manifold $M$ is mapped by $phi.alt_tau$ to $M'$ which is nothing else than the 
same manifold but with a different coordinate system. Here the interpretation is not
that the coordinate system changed, when we interpret is that the coordinate systems
of $M$ and $M'$ are the same but the fields changed. Now $phi'$ is a field on $M'$
so what we can do to compare it with $phi$ is to pull it back to $M$ and by taking
the limit as $tau -> 0$ one obtains the Lie derivative

$ lie(X, phi) = lim_(tau -> 0) (pb(phi.alt_tau) phi - phi)/tau 
              = lim_(tau -> 0) (pf(phi.alt_(-tau)) phi - phi)/tau 
              = dv(, tau)pb(phi.alt_tau) phi $<ec:def-lie-der>

Now it is possible to compute Lie derivatives of several objects in a coordinate 
system.

By defining $x^mu$ as a coordinate system on $M$ and $x'^mu = phi.alt_tau (x^mu)$
then it follows that $x'^mu = x^mu + X^mu tau + Order(tau^2)$.

== Lie derivative of a scalar field

The Lie derivative of a scalar field is the simplest Lie derivative to compute.
This is because by @ec:def-pb-scalar-field the Lie derivative may be computed as

$ lie(X, f) &= eval(dv(, tau) pb(phi.alt_tau) f)_(tau = 0)
             = eval(dv(, tau) f(phi.alt(tau, x_0)))_(tau = 0) 
             = eval(dv(, tau) f(x'^mu))_(tau = 0) 
             = eval(pdv(f, x^nu) pdv(x^nu, x'^mu) pdv(x'^mu, tau))_(tau = 0)
          \ &= eval(pdv(f, x^nu) (delta^nu_mu + Order(tau)) (X^mu + Order(tau)))_(tau=0)
             = X^mu pdv(f, x^mu)
               $<ec:lie-derivative-of-scalar-field-components>

Here one can see that the Lie derivative of a scalar field with respect to some
vector field is nothing else than the directional derivative of $f$ in the direction
of $X$. In general this is not the case, the reason for this is that scalar fields
have no sense of 'direction' so they are not affected by rotations, as we will see
now this is not the case for vector fields

== Lie derivatives of vector fields

The same procedure as done in @ec:lie-derivative-of-scalar-field-components to find
the Lie derivative of a vector field. However here the corresponding pullback
equation is @ec:pb-comp-vec-field

$ (lie(X, Y))^mu &= eval(dv(, tau) pb(phi.alt_tau) Y)_(tau = 0) 
                  = eval(dv(, tau) (pdv(x^mu, x'^nu) Y^nu (x')))_(tau=0) 
               \ &= [dv(, tau) (pdv(x^mu, x'^nu)) Y^nu (x')
                  + pdv(x^mu, x'^nu) dv(, tau) Y^nu(x')]_(tau=0)
               \ &= [(- pdv(X^mu, x'^nu) + Order(tau)) Y^nu (x') 
                  + (delta^mu_nu + Order(tau)) dv(, tau) Y^nu (x')]_(tau=0)
               \ &= - Y^nu (x) pdv(X^mu, x^nu) + [(delta^mu_nu  + Order(tau)) 
               dv(x'^alpha, tau) pdv(x^beta, x'^alpha) pdv(Y^nu, x^beta)]_(tau=0)
               \ &= -Y^nu (x) pdv(X^mu, x^nu) + [(delta^mu_nu + Order(tau)) 
               X^alpha pdv(x^beta, x'^alpha) pdv(Y^nu, x^beta)]_(tau=0)
               \ &= -Y^nu (x) pdv(X^mu, x^nu) +  
               X^alpha pdv(Y^mu, x^alpha)
               $

Here there are two terms, the first one is associated with translations. This term
is the $X^alpha pdv(Y^mu, x^alpha)$. This is essentially what was obtained in the 
scalar field case and represents a directional derivative. The second term, 
$-Y^alpha pdv(X^mu, x^alpha)$, represents rotations and dilations. This is because
it 'mixes' components of the vector $Y$ and allows for changing the norm of the 
vector.

This means that for any two vector fields $X, Y$ their Lie derivative applied to 
a scalar field is

$ lie(X, Y)(f) = X(Y(f)) - Y(X(f)) = [X, Y](f) $



== Lie derivatives of tensor fields

Once again, by using these methods one finds the general equation

$ tensor((lie(X, T)), alpha_1, ..., -beta_1, -...) = 
&X^alpha pdv(tensor(T, alpha_1, ..., -beta_1, -...), x^alpha) 
\ &+ tensor(T, alpha_1, ..., alpha_(i-1) sigma, alpha_(i+1), ..., -beta_1, -...) pdv(X^alpha_i, x^sigma) + ... 
\ &- tensor(T, alpha_1, ..., -beta_1, -..., - beta_(i-1), -sigma, -beta_(i+1), -... ) pdv(X^sigma, x^(beta_i)) - ... $

This equation also can be written in the following form

$ (lie(X, T)) (A, B, ...) = lie(X, (T(A, B, ...))) + T(lie(X, A), B, ...) +
                            T(A, lie(X, B), ...) + ... $

= Killing fields

This section in based on @carroll2003spacetime,
@katanaev-killing-fields-homogeneous-and-isotropic and @redshifts-and-killing-vectors.

Finally we can write the definition of Killing fields. A Killing field, $K$, is a 
vector field such that the flow it generates is an isometry. In physical terms, 
moving along the 'velocity field' $K$ doesn't change the metric tensor 

$ pb(phi.alt_tau) g = g $

that can be written as

$ (lie(K, g))_(mu nu) = 0 $<ec:def-Killing-fields>

In component form the Killing equation may be written in contravariant form as

$ K^alpha pdv(g_(mu nu), x^alpha) + g_(alpha nu) pdv(K^alpha, x^mu) 
+ g_(mu alpha) pdv(K^alpha, x^nu) = 0 $

Additionally, whenever a symmetric connection is used, such as the Levi-Civita
connection used in general relativity, the following covariant form is equivalent

$ cdv(K_nu, mu) + cdv(K_mu, nu) = 0 $<manifolds-eq:covariant-killing-field-eq>

== Killing tensors

By analogy to @manifolds-eq:covariant-killing-field-eq a Killing tensor is defined
as a tensor $tensor(T, -alpha beta gamma ...)$ such that

$ cdv(tensor(T, -alpha beta gamma")"), "("mu ) = 0 $<manifolds-eq:Killing-tensor>

where the parenthesis is the average over all of the permutations of the indices.

== Properties of Killing fields

Killing fields form vector spaces, this is because the Lie derivative is linear on
the vector field wrt which it differentiates 

$ lie(alpha X+ beta Y, g) = alpha lie(X, g) + beta lie(Y, g) = 0 $

This can easily be seen on the component definitions of Lie derivatives.

Additionally these form a Lie algebra, this is because Lie derivatives have the
following property

$ lie([X, Y], T) = lie(X, lie(Y, T)) - lie(Y, lie(X, T)) $

So that if $X$ and $Y$ are Killing fields, then $[X, Y]$ form a Killing field too.

The norm of a Killing vector field is constant along its own flow, this is easily
proved by

$ lie(K, K^2) =  K^nu cdv((K^mu K_mu), nu) = 2 K^nu K^mu cdv(K_mu, nu)  = 
K^nu K^mu underbrace((cdv(K_mu, nu) + cdv(K_nu, mu)), "Killing equation") = 0 $

These are also divergenceless tensors. Intuitively one can think of Killing fields
as flows of an incompresible fluid. One can prove this by multiplying 
@manifolds-eq:covariant-killing-field-eq by the metric so that

$ 0 = g^(mu nu) cdv(K_nu, mu) + g^(mu nu) cdv(K_nu, mu) = cdv(K^mu, mu) + cdv(K^nu, nu) = 2 cdv(K^mu, mu) => cdv(K^mu, mu) = 0  $

The main property of Killing fields is that it allows us to build conserved 
quantities on geodesics, meaning, if $x^mu (tau)$ is a geodesic and $K^mu$ a Killing 
field, then

$ dv((dot(x)^mu K_mu), tau) = underbrace(dv(dot(x)^mu, tau), "zero by geodesic") K_mu + dot(x)^mu dv(K_mu, tau) = dot(x)^mu dot(x)^nu cdv(K_mu, nu) = 1/2 dot(x)^mu dot(x)^nu underbrace((cdv(K_mu, nu) + cdv(K_nu, mu)), "Killing equation") = 0 $

It also allows for defining conserved currents for any divergenceless rank two 
symmetric tensor because

$ cdv((T^(mu nu) K_nu), mu) = 
cancel(cdv(T^mu nu, mu) K_nu)  + T^(mu nu) cdv(K_nu, mu) = 
1/2 T^(mu nu) (cdv(K_mu, nu) + cdv(K_nu, mu)) = 0
$

as an example of such a tensor the Stress-energy tensor, allowing to define 
energy and momentum densities in curved spacetimes.

This same idea can be extended to Killing tensors defined by @manifolds-eq:Killing-tensor
so that if $tensor(A, - alpha beta gamma...)$ is a Killing tensor

$ dv(, tau)(tensor(A, -alpha beta gamma...) u^alpha u^beta u^gamma ... ) = 0 $

is also a conserved quantities.

Since four-momentums are related by a constant to four-velocities the same can be
extended to four-momentums since the derivative is a linear operator.

=== Number of Killing fields

A good question now is to ask "How many Killing fields does our space have?", since
this will lead to the same amount of conserved quantities, simplifying the resulting equations.

As it turns out it is not possible, in general, to know exactly to know how many
Killing fields there are without solving the equations, however, it is possible to
place an upper bound on the number of Killing fields of $n(n+1)/2$, $n$ 
corresponding to translations and $n(n-1)/2$ to rotations.

To prove this the starting point is the Riemann tensor


$ tensor(R, delta, - alpha beta gamma) K_delta = cdv(cdv(K_gamma, beta), alpha) - 
cdv(cdv(K_gamma, alpha), beta) $<ec:riemann-applying-to-killing-vector>

and the Bianchi identities 
$ tensor(R,delta, -alpha beta gamma) + tensor(R, delta,- gamma alpha beta) + 
tensor(R, delta, - beta gamma alpha) = 0 $

By multiplying the Bianchi identities by $K_delta$ and applying 
@ec:riemann-applying-to-killing-vector  the result is

$     0=cdv(K_gamma, alpha, beta) - cdv(K_gamma, beta, alpha)
     +cdv(K_beta, gamma, alpha) - cdv(K_beta, alpha, gamma)
     +cdv(K_alpha, beta, gamma) - cdv(K_alpha, gamma, beta)=
     
 \   cdv(K_gamma, alpha, beta) - cdv(K_beta, alpha, gamma) 
    +cdv(K_alpha, beta, gamma) - cdv(K_gamma, beta, alpha)
    +cdv(K_beta, gamma, alpha) - cdv(K_alpha, gamma, beta)=

\    cdv((cdv(K_gamma, beta) - cdv(K_beta, gamma)), alpha) +
     cdv((cdv(K_alpha, gamma) - cdv(K_gamma, alpha)), beta) +
     cdv((cdv(K_beta, alpha) - cdv(K_alpha, beta)), gamma) =_"Killing equation"

\  2(cdv(K_gamma, alpha, beta) - cdv(K_alpha, gamma, beta) + 
 cdv(K_beta, gamma, alpha)) = 
 2(tensor(R, delta, - alpha beta gamma) K_delta + cdv(K_beta, gamma, alpha)) => 
\ => tensor(R, delta, -alpha beta gamma)K_delta = -cdv(K_beta, gamma, alpha) $<manifolds-eq-:Killing-relation-second-zero-order-derivatives>

This allows, by substituting into the Taylor series to obtain an 
expression of the solution to the Killing field equation.


By using the following multi-index notation

$ alpha = (alpha_1, alpha_2, alpha_3, ..., alpha_n) in NN^n \ 
|alpha| = sum_i alpha_i \
mipdv(f, alpha) = (diff^(|alpha|) f)/((diff x^1)^(alpha_1) (diff x^2)^(alpha_2)...
(diff x^n)^(alpha_n)) \ 

alpha! = #sym.product _i alpha_i !\

x^alpha = #sym.product _i (x^i)^(alpha_i)

$

The Taylor series in multiple variables is

$  K_delta (x) = sum_(|alpha|=0)^oo (mipdv(K_delta, alpha)(p))/alpha! (x-p)^alpha $

Now, since 
@manifolds-eq-:Killing-relation-second-zero-order-derivatives
gives a linear relationship between the second and zeroth order
derivatives, one can also obtain the third derivative as a linear
combination of the first derivatives and the zeroth order by
deriving the equation #footnote[As long as the Riemann tensor is 
smooth], and so on with higher order derivatives. By defining 
two linear objects $hat(A)$ and $hat(B)$ so that

$ mipdv(K_delta, alpha) =
 tensor(hat(A), -delta, gamma)(p, alpha) K_gamma (p)
+tensor(hat(B), -delta, gamma, beta)(p, alpha) partial_gamma K_beta (p)  
$

It is important to note that these objects  in general are not tensors, since the
left hand side is not a tensor.

By substituting into the Taylor series one obtains

$ K_delta (x) &= sum_(|alpha| = 0)^oo (mipdv(K_delta, alpha)(p))/alpha! (x-p)^alpha  
 \ &= sum_(|alpha| = 0)^oo 1/alpha! (x-p)^alpha (tensor(hat(A), -delta, gamma)(p, alpha) K_gamma (p)
+tensor(hat(B), -delta, gamma, beta)(p, alpha) partial_gamma K_beta (p)  
) 
\ &= (sum_(|alpha| = 0)^oo 1/alpha! (x-p)^alpha tensor(hat(A), -delta, gamma)(p, alpha)) K_gamma (p)
+(sum_(|alpha| = 0)^oo 1/alpha! (x-p)^alpha tensor(hat(B), -delta, gamma, beta)(p, alpha)) partial_gamma K_beta (p)
\ &= tensor(tilde(A), -delta, gamma)(x, p)K_gamma (p) + tensor(tilde(B), -delta, gamma beta)(x, p) partial_gamma K_beta (p)
$

Now, from this expression it looks like there should be $n + n^2$ Killing fields 
since there are that many free parameters as initial conditions, however there is
an additional restriction, the Killing equation.

$ partial_alpha K_beta = -partial_beta K_alpha + 2 christoffel(sigma, alpha, beta) K_sigma $

so that

$ K_delta (x) &= tensor(hat(A), -delta, gamma)(x, p) K_gamma (p) + 
                1/2 tensor(hat(B), -delta, gamma sigma)(x, p) (partial_gamma K_sigma (p) + partial_gamma K_sigma (p))
                
             \ &= tensor(hat(A), -delta, gamma)(x, p) K_gamma (p) + 
1/2 tensor(hat(B), -delta, gamma sigma)(x, p) (partial_gamma K_sigma (p) 
                                    - partial_sigma K_gamma (p) + 2 christoffel(alpha, gamma, sigma) K_alpha (p))
\ &= underbrace((tensor(hat(A), -delta, alpha)(x, p) +  tensor(hat(B), -delta, gamma sigma)(x, p)christoffel(alpha, gamma, sigma)), tensor(A, -delta, alpha)(x, p)) K_alpha + 
underbrace(1/2 tensor(hat(B), -delta, gamma sigma)(x, p), tensor(B, -delta, gamma sigma)) (partial_gamma K_sigma (p) - partial_sigma K_gamma (p))
\ &= tensor(A, -delta, gamma)(x, p) K_gamma (p) 
   + tensor(B, -delta, gamma sigma)(x, p)(partial_gamma K_sigma (p) - partial_sigma K_gamma (p))
 $<manifolds-eq:general-form-killing-fields>

So now we only care about the antisymmetric part of $B$ on the upper indices, 
meaning now there are only $n + (n(n-1))/2 = (n(n+1))/2$ linearly independent 
Killing fields. Any space that has all of the Killing fields it is allowed by its 
dimension will be called *maximally symmetric*.

This result is important on its own, however, by categorizing the basis of Killing
fields one gains more insight on the kinds of allowed transformations.

Killing fields of the form
$ 
cases(
K_delta^((alpha))(p) = delta^alpha_delta,

partial_sigma K^((alpha))_delta (p) = 0)
$
where $(alpha)$ acts as a label will be denoted "translations". The motivation
for this definition has two origins, first, we have the same number of translations
as dimensions, so one can assign one translation to each direction. Secondly, 
from the way objects transform under isomorphisms one can see that the components
of vector and tensors don't change under this kind of transformation, but their 
position does.

The second family of transformations are the rotations, these have two labels
that are antisymmetric, $alpha beta$ and are defined by

$ 
cases(
   K^((alpha,beta))_delta (p) = 0,
   partial_sigma K^((alpha,beta))_delta (p) = delta^alpha_sigma delta^beta_delta 
                                          - delta^alpha_delta delta^beta_sigma
)
$

There are $n(n-1)/2$ distinct rotations, one per unique combination 
of axis, Since
rotations are on a plane defined by two axis. These rotations are 
centered at $p$
because objects in this point are not translated, however, objects
like vectors are rotated.

=== Generating geodesics
Since the covariant derivative is an intrinsic object it is preserved under 
isometries, meaning for an isometry $F: M -> tilde(M)$

$ tilde(nabla)_mu (pf(F) X) = pf(F) (nabla_mu X) $

where $X$ is any geometrical object. This means that transforming a geodesic by
an isometry (for example those generated by Killing vectors) results in a 
different geodesic. In fact, this condition can be relaxed and it is not necessary
for the transformation to be an isometry, it is enough for the transformation to 
be conformal. A transformation $F: M->tilde(M)$, is said to be conformal if 
$ pf(F)g = kappa tilde(g) $
where $g$ is the metric on $M$, $tilde(g)$ the metric on $tilde(g)$ and $kappa$ is 
some constant. One can see this by looking at the action of a free particle

$ S = integral g_(mu nu) dot(x)^mu dot(x)^nu dd(tau) $

by applying a conformal transformation the resulting action is

$ S' = kappa S $

so $delta S' = 0 <=> delta S = 0$

One can generate these transformations via *conformal Killing fields* defined 
in an analogous way to Killing fields as

$ lie(K, g) = kappa g $<ec-manifolds:conformal-killing-field-definition>

where $K$ is a conformal Killing field.

This allows to generate new geodesics from existing ones and will simplify the 
computations of redshifts.









// Whenever the metric is smooth it can be proven that there are at most $(n(n+1))/2$
// linearly independent Killing fields where $n$ is the dimension of the space. 
// The name of the spaces that have all of the allowed Killing fields are called 
// maximally symmetric and because of the Killing-Hopf theorem they are isometric to 
// either then n-ball, the n-hyperboloid or a flat space.