#import "../things-to-add.typ":*

= Schwarzschild geodesics

The Schwarzschild metric is one of the most important metrics in general relativity.
By Birkhoff's theorem  it is known to be the unique spherically symmetric
vacuum solution to Einstein field equations. This means that any spherically 
symmetric distribution of energy will produce this metric on the outside (up to 
gravitational waves). It also is the first prediction of black holes.

By using spherical coordinates $(t, r, theta, phi)$ so that $t$ is the time 
coordinate, $r$ is a radial coordinate such that the "sphere" defined by fixing
$t$ and $r$ has area of $A = 4pi r^2$ and $theta$, $phi$ are the polar and 
azimuthal angles respectively, defined so that the submanifolds of constant time 
and radius have the induced metric of a sphere.

The metric on this coordinates can be written as

$ dd(s)^2 = (1-r_s/r) dd(t)^2 - (1-r_s/r)^(-1)dd(r)^2 - r^2 dd(theta)^2 - r^2 sin^2(theta) dd(phi)^2 $

This metric has 4 Killing vectors. One is associated with time translations, the
other three are associated with rotations and obey the SO$(3)$ Lie algebra

$ [X, Y] = Z \ [Y, Z] = X \ [Z, X] = Y $

In spherical coordinates these can be written as

$ 
X = - sin phi  partial_theta - cot theta  cos phi  partial_phi\
Y = cos phi partial_theta - cot theta sin phi partial_phi \
Z = partial_phi
$

The Killing vector associated to time translation is
$ T =  partial_t$

Since this metric is rotation invariant we are allowed to choose the coordinate
system so that both the initial position and spatial part of the four-velocity
lie on the $theta = pi/2$ plane. Reducing the complexity of the system.
In this plane with the restriction $u^theta = 0$, this restriction is valid for 
all time, this can be proved by looking at the conserved quantities of $X$ and $Y$ 


$ 
cases(
X_mu u^mu = sin phi r^2 u^theta + cancel(r^2 cot theta cos phi sin^2 theta u^phi) = 0,
Y_mu u^mu = - cos phi r^2 u^theta + cancel(r^2 cot theta sin phi sin^2 theta u^phi) = 0
)
$

Where the equality with $0$ comes from the initial condition. Conservation of both
quantities leads to either $r=0$ or $u^theta = 0$, since $u^theta = 0$ for all $tau$
$x^theta = pi/2$ is valid for all $tau$


The other two conserved quantities are related to classical quantities.
The conserved quantity associated to $T$ will be denoted energy

$ E = T_mu u^mu = g_(mu alpha) T^alpha u^mu = g_(mu alpha) delta^(alpha 0) u^mu =
g_(0 0) u^0 = g_(t t) u^t $

this quantity agrees with energy per unit of mass of a free particle in the limit 
$r -> oo$

The conserved quantity associated with $Z$ is denoted angular momentum

$ L = Z_mu u^mu = g_(mu alpha) Z^alpha u^mu = g_(mu alpha) delta^(alpha 3) u^mu =
g_(3 3) u^3 = g_(phi phi) u^phi $

this quantity can be recognized as the angular momentum per unit mass of a free 
particle _if r is the radius_, however, here $r$ is only the "classical radius" in the limit $r -> oo$, so these quantities don't exactly agree.

These two quantities allow to know $u^phi$ and $u^t$ at any point of the geodesic
if the initial conditions are known. Additionally, since $norm(u)^2 = cases(1 "for matter", 0 "for light")$ one can obtain $u^r$ as

$
  u^r = pm sqrt(norm(u)^2/g_(r r) - L^2/(g_(phi phi) g_(r r)) + E^2 )
$

Importantly this allows for computing quantities such as the three velocity as 
seen by an observer at $oo$

$ dv(r, t) = (dd(r) slash dd(tau))/(dd(t) slash dd(tau)) = u^r/u^t =
pm g_(t t) sqrt((norm(u)^2)/(g_(r r) E^2) + L^2/(g_(phi phi) g_(r r) E^2) + 1) $

since in the limit $r->r_s$ $g_(t t) -> 0$ and $g_(r r) -> -oo$ objects stop moving
when close to the limit horizon.

Also one can compute how fast things rotate around a black hole as seen at $oo$
$ dv(phi, t) = (dd(phi) slash dd(tau))/(dd(t) slash dd(tau)) = u^phi/u^t = 
(L g_(t t))/(E g_(phi phi)) $

Once again since $g_(t t) -> 0$ when $r -> r_s$ things stop rotating when close to
the Schwarzschild radius.

This method allows us to obtain the equations of motion of the particles without 
having to compute the Christoffel symbols.

This result that things stop moving when touching the event horizon can be generalized
to moving black holes by using a Lorentz transformation. The result is that 
for the case where the black hole moves, matter and light tend to move with the 
black hole, dragged by it. This has some interesting phenomenological effects where
certain particles experience forces similar to being pushed away or forces tangential
to the line connecting the black hole and the particle. One might think that these
effects could be explained using a retarded gravitational potential, however 
for a retarded potential particles tend to fall behind the atracting object and 
follow it instead of being dragged with it or even being pushed. Some animations 
can be fond in the following link.
// An interesting place to study that is not commonly treated is the moving black hole.
// This is because one can always Lorentz boost to the frame that sees the black hole
// as stationary and work in that reference frame. However there is some interesting
// phenomenology that is better understood when working with Killing fields.

// First, to be able to easily do a Lorentz boost will change the coordinates to 
// the naive interpretation of cartesian coordinates defined as

// $ 
//   cases(
//     x = r cos phi,
//     y = r sin phi
//   )  
// $

// So that if the black hole moves with velocity $beta$ in the $x$ direction the Lorentz
// boost is 

// $
//   cases(
//     tilde(t) = gamma(t + beta x),
//     tilde(x) = gamma(beta t + x),
//     tilde(y) = y
//   )
// $

// And energy and angular momentum are

// $
//   E = g_(t t) u^t = gamma g_(t t)(tilde(u)^t - beta tilde(u)^x)
// $

// $
//   L = g_(phi phi)(-y/r^2 u^x + x/r^2 u^y) = y u^x - x u^y = 
//       tilde(y) gamma (+beta tilde(u)^t + tilde(u)^x) 

// $

// $ 
//   pdv(phi, x) = -y/r^2 
//   \
//   pdv(phi, y) = x/r^2
// \
//   u^phi = pdv(phi, x) u^x + pdv(phi, y) u^y
// \

// $



