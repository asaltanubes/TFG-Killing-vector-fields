#import "../things-to-add.typ": *

= Quantum inflation and cosmology

As part of the agreement of the University of Cantabria and University of Brown 
this project was developed the summer of 2025. 

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
necessary to introduce ADM and tetrad formalism. 

// ADM formalism is a way to view general relativity, instead as a theory that treats
// spacetime as a four dimensional manifold with a locally Lorentzian metric, as a 
// dynamical three dimensional manifold with a metric that evolves in time. To get 
// here spacetime is sliced in spacial slices, with metric $q_(a b)$ labeled by a time variable $t$.

// This variable generates a vector field that points in the time direction. 
// Similarly
// we can pick three vector fields on each slice that generate the spacial metric. 
// These three vector fields will be called a triad.

// By calling the vector fields on the slice

// $ e_a = tensor(e, mu, -a) partial_mu $

// and $n$ the normal vector to the spacial slice we can write the vector field on the
// time direction as

// $ t^mu = N n + N^a e_a  $

// where $N$ is the so called lapse function and $N^a$ the translation function.

// Notice that when using the triad $a, b, c...$ are spacial indices but for reasons
// that will be seen later must not be confused with spacial indices $i, j, k...$ 
// this is because the internal indices 


In tetrad formalism is based on the idea 
of using the equivalence principle to work on a "Minkowski like space". What is
meant by this is that the metric becomes the Minkowski metric but the coordinate 
system is no longer holonomic, meaning the basis for the tangent space is no longer
the partial derivatives with respect to the coordinate system. Formally a tetrad 
are four vectors of the tangent space labeled by what we will call internal indices
$i, j, k...$ (not to be confused with indices that only involve spacial components
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
time component and each of the $e_a$ only have spacial components. Therefore 
internal indices are only spacial from now on. This also has the effect, since 
internal indices are spacial, that the metric on internal indices is the Kronecker
delta. Therefore upper and lower internal indices are equivalent.

To be able to take covariant derivatives of tensors expressed in terms of internal
coordinates the spin connection $tensor(omega, -mu, i, -j)$ is defined so that the
connection is compatible with the internal space so that 

$ cdv(bold(V), nu) = (cdv(V^nu, mu)) partial_nu = (cdv(V^i, mu))e_i  $

so the required condition is

$ cdv(tensor(e, mu, -i), nu) = cdv(tensor(e, -mu, i), nu) = 0 $

giving as a solution

$ tensor(omega, -mu, i, -j) = tensor(e, -rho, i) tensor(Gamma, rho, -mu nu) tensor(e, nu, -j) - tensor(e, nu, -j) partial_mu tensor(e, -nu, i) $

We also have to define the extrinsic curvature of the spacial slices similarly to 
how gaussian curvature is defined giving

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
invariance, $cal(H)_a$ are the spacial constraints and enforce the spacial 
diffeomorphism invariance and $cal(G)$ are the Gaussian constraints and enforce 
the $S O(3)$ gauge invariance of the triad.


Now that we have defined all relevant quantities the Hamiltonian density used in 
@Alexander:2003wb is the following

$ cal(H) = 1/l_p^2 epsilon.alt_(i j k) E^(a i) E^(b j)(F_(a b)^k + (G V(phi.alt))/3
epsilon.alt_(a b c) E^(c k)) + 1/2 p_phi.alt^2 + 1/2 E^(a i) E^b_i partial_a phi.alt
partial_b phi.alt $

where $p_phi$ is the momentum of the scalar field. Notice that the first term is 
the usual general relativity gravitational Hamiltonian with the cosmological constant
dependent on the field.

In the total Hamiltonian the Gaussian constraints are not included since these are
boundary terms and in this model a boundary for the universe is not considered. 
The diffeomorphism constraints are not included by choosing a coordinate system 
so that $N^a = 0$. In this way the total Hamiltonian is

$ H = integral_cal(S)  N cal(H) $

where $cal(S)$ is the corresponding spacial slice.
