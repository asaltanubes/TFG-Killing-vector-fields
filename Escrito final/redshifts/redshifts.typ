#import "../things-to-add.typ": *

= Computation of redshifts

This section is based on @redshifts-and-killing-vectors.

The redshift is the quantity that relates the frequency of a light wave when it 
was emitted at a point $A$ and when it is measured at a point $B$. The redshift,
denoted $z$ is usually defined as


$ 1+z = lambda_B/lambda_A = f_A/f_B = T_B/T_A = E_A/E_B $

where $lambda$ is the wavelength, $f$ the frequency, $T$ the period and $E$ the 
energy of each photon.

So far we have been talking about the geodesics and how Killing fields generate 
conserved quantities, in particular we have seen that when there is a time-like 
Killing field we can define energy for particles. It would be nice if we could 
extend this idea to photons, and since photon energy is related to the frequency
obtain gravitational redshifts with it. This direct argument has a problem. Energy
is not a scalar quantity in relativity since it is the $0$th component of the 
four-momentum. 
The energy we defined with the Killing field is a scalar because is the 
energy someone at infinity measures and thats why it doesn't depend on the observer.
However, here we actually want to know how different observers measure different 
energies and how that gives a redshift.

This can be achieved by using Killing fields in a different way. The Killing fields
are used to define who is an stationary observer. 

Imagine we have two observers, Alice and Bob. Alice is emitting light from the 
curve#footnote[Since observers move through time.] $x^mu_A (tau)$ to Bob, 
who is in curve $x^mu_B (tau)$.
A way to compute the redshift is to take two geodesics that start at $x^mu_A$ and
end $x^mu_B$. 
To compute $T_A$ and $T_B$ would therefore be the proper time differences between
the proper times of the intersection points of the light geodesics on the observer
geodesics.

This approach works but requires to know both the geodesics of the emitter, the 
observer and the light. This requirement can be dropped by using Killing fields.

Assume we have a time-like Killing field $K$. Now we define stationary observers
as those whose four-velocity is proportional to $K$. 

If Alice and Bob are stationary observers, lets call $A_0$ and $B_0$ the initial 
two points connected by a null geodesic. Now, since their four-velocities are 
proportional to the Killing field, they move through the flow of the Killing field.
Therefore their geodesics for some small $Delta tau$ is 

$ x^mu_(A) (Delta tau) = phi.alt_(Delta tau) (A_0) = A_0 + K^mu Delta tau $

more importantly, since the Killing field generates an isometry it preserves 
geodesics. Therefore since $A$ and $B$ are connected by a null geodesic so are 
$x^mu_A (Delta tau)$ and $x^mu_B (Delta tau)$ for all $Delta tau$. Therefore the 
period as measured by $A$ would be 

$ T_A = 
integral_0^(Delta tau) sqrt(pm g_(mu nu)dot(x)^mu_A (s) dot(x)^nu_A (s)) dd(s) =
integral_0^(Delta tau) sqrt(pm K_mu K^mu) dd(s) approx sqrt(pm K_mu K^nu) Delta tau  $

where the $pm$ depends on the chosen signature and ensures the quantity in the 
square root is positive as long as $K$ is time-like. The same expression can be 
found for $B$. By substituting this expression on the redshift formula we obtain
the following relationship between redshift and Killing fields.

$ 1+z = sqrt((K_mu (B_0) K^mu (B_0))/(K_mu (A_0) K^mu (A_0))) $

In the case of the of stationary metrics, using the Killing field $K^mu = delta^mu_t$ we obtain the well known formula

$ 1+z = sqrt((g_(0 0) (B))/(g_(0 0) (A))) $<ec-redshift:killing-redshift>

This also applies for the Kerr black hole, however an interesting result comes 
out. With this formula the border of the ergosphere is an infinite redshift 
surface. This is surprising because we saw that this surface is not an event 
horizon and we should be able to see through it. 
The problem here is that the stationary observers we picked doesn't take into account that our metric is 
not static, we are picking as a stationary observer, 
someone that 
doesn't rotate with the black hole. Inside the ergosphere that means someone 
moving faster than light, thus by a Lorentz doppler effect we get an infinite 
redshift. The trick here is to use a combination of the time and axial Killing 
fields $K = partial_t + Omega_H partial_phi$ where $Omega_H$ makes it so that the 
Killing field is null at the exterior event horizon. This way stationary observers
do rotate with the black hole giving a finite redshift between the interior and
exterior regions of the ergosphere. 

This shows that one has to be careful when picking the Killing field used to 
compute redshifts since it doesn't tell the hole story and might give infinite 
redshifts on surfaces that are not infinite redshift surfaces and not give 
infinite redshifts on surfaces that actually are infinite redshift surfaces.

Some metrics are not stationary. As an example, for the FLRW metric for an 
arbitrary $a(t)$ 
there aren't any time-like Killing fields. 

However there
is a way to extend this kind of method to some of these spaces by 
using conformal Killing fields defined in @ec-manifolds:conformal-killing-field-definition.

Since these kind of vector fields also preserve geodesics under the transformations
they generate the same argument applies by using these. For example,
in the case of the FLRW metric there is one Homothetic Killing field 
$ H = a(t) partial_t $

that after applying @ec-redshift:killing-redshift the resulting redshift is 

$ 1+z = a(B)/a(A) $


// introducing the 
// so called *Homothetic
// Killing fields*. This kind of field represents an expansion and its defined by 

// $ lie(H, g) = kappa g $

// where $kappa$ is some constant. This kinds of fields also preserve geodesics, this
// is because the geodesic action

// $ S = integral g_(mu nu) dot(x)^mu (tau) dot(x)^nu dd(tau) $

// under the transformation generated by $H$ is transformed as $S -> S' = kappa S$.
// Therefore the extreme points don't change because $delta S' = 0 <=> delta S = 0$.
