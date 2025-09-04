#import "../things-to-add.typ": *

= Kerr black holes

This section is based on @carroll2003spacetime and @gravitation.

The Kerr metric represents a spinning black hole. From this one can already think
that spherical symmetry and time reversal symmetry are going to be broken. The 
first one because there will be an "special axis" around which the black hole 
spins. The second cone because by reversing time the direction of rotation of the 
black hole is also reversed breaking the symmetry. To recover the time reversal 
symmetry it is necessary to also do an inversion around the axis of symmetry of 
the solution. The result is that in the metric there is at least one cross term 
allowed between time and space.

By using the Boyer-Lindquist coordinates, $(t, r, theta, phi)$ related to 
Cartesian coordinates by 

$ 
  cases(
    x = sqrt(r^2 + a^2) sin theta cos phi,
    y = sqrt(r^2 + a^2) sin theta sin phi,
    z = r cos theta
  )
$

so that in the limit $r-> oo$ they reduce to usual spherical coordinates. 

In this coordinate system the black hole spins around $theta = 0$ and the metric 
can be written as

$ dd(s)^2 =& (1 - (r_s r)/ Sigma) dd(t)^2 
          + (2 r_s r a sin^2 theta)/Sigma dd(t) dd(phi)
          - Sigma/Delta dd(r)^2 \
          &- Sigma dd(theta)^2
          - (r^2 + a^2 + (r_s r a^2)/Sigma sin^2 theta) sin^2 (theta) dd(phi)^2
 $

Where $a = J/M$ where $J$ is the angular momentum of the black hole, 
$Sigma = r^2 + a^2 cos^2 theta$ and $Delta = r^2 - r_s r + a^2$

There are two
Killing fields in this metric, one associated the axial symmetry $R = partial_phi$
and the other with time symmetry $K = partial_t$.

Just as with the Schwarzschild geodesics we will call angular momentum and energy
to the conserved quantities

$ E = K_mu u^mu = g_(t mu) u^mu = g_(t t)u^t + g_(t phi) u^phi = u_t $

and angular momentum

$ L = R_mu u^mu = g_(phi t) u^t + g_(phi phi)u^phi = u_phi $

Immediately there is an interesting result, the system of equations above can be 
solved for either $u^t$ or $u^phi$ to give

$ 
  u^t = (L g_(phi t) - E g_(phi phi))/((g_(phi t))^2 - g_(t t) g_(phi phi)) \
  u^phi = (E g_(phi t)  - L g_(t t))/((g_(phi t))^2 - g_(t t) g_(phi phi))
$<ec-kerr:u-from-E-and-L>

As one can see $u^phi$ is not necessarily zero even if it is at one point in time.
This can be interpreted as the black hole forcing particles to rotate with it. 
This effect, called frame dragging, is only dependent on the spacetime being 
axially symmetric with the time-axial inversion symmetry. 

In the case of the Kerr black hole there is a region where the $t t$  component of
the metric becomes spacelike. This
region is called the ergosphere of the Kerr black hole. This region is 
not enclosed in an event horizon and particles and light are allowed to go in and 
out of the ergosphere. 
This is because even if $g_(t t)$
is zero, the $g_(phi t)$ is positive, so that the particle can have radial component
of four velocity provided $u^t$ and $u^phi$ are large enough.

For particles outside the ergosphere the energy is always positive (using $(+ - - -)$
signature). This is because $K$ is a time like vector, and, since four velocities
are either time like or null, depending on if the particle has mass or not, the 
product has to be positive.

To see this we can use the equivalence principle and prove this in Minkowski
spacetime. For all non spacelike vectors in Minkowski spacetime we have that

$ (u^0)^2 >= norm(arrow(u))^2 $

where equality happens for null vectors. Therefore if we have the product of two 
four vectors and one of them is time like we have that

$ u^0 v^0 > norm(arrow(u)) norm(arrow(v)) >= iprod(arrow(u), arrow(v)) =>\
=> u^0 v^0 - iprod(arrow(u), arrow(v)) = g_(mu nu) u^mu v^nu > 0 $

so the product is positive.



Inside the ergosphere we can solve for $dv(phi, t)$ obtaining

$ dv(phi, t) = 1/g_(phi t) (E/u^t - g_(t t)) $

and, since $E$, $u^t$ and $-g_(t t)$ are positive and $g_(phi t)$ has the sign of 
the angular momentum of the black hole, this means that any particle that goes 
into the ergosphere has to rotate with the black hole.


If we wanted to obtain the equations of motion like how we did in the Schwarzschild
metric we would find a problem. In the Schwarzschild metric we  had three Killing
fields that, when combined with the norm of the four velocity allowed to solve
for the derivatives. Here we only have two Killing fields. Fortunately there is
an additional Killing rank 2 tensor $sigma$ defined as

$ sigma_(mu nu) = Sigma^2 (l_mu n_nu + l_nu n_mu) + r^2 g_(mu nu)

\

l^mu = 1/Delta (r^2 + a^2, Delta, 0, a)\
n^mu = 1/(2 Sigma^2)(r^2 + a^2, -Delta, 0, a) $<ec-kerr:carter-constant>

the associated conserved quantity is called the Carter constant and is usually 
denoted $C$. The system of equations @ec-kerr:carter-constant together 
with @ec-kerr:u-from-E-and-L allows to solve for $u^r$ and with these three 
constants it is possible to finally obtain $u^theta$ from the norm of the four-velocity
and obtain the equations of motion. However the equations obtained, although 
straightforward to obtain, are quite lengthy and don't have any really give any 
insights on the geodesics.

