#import "../things-to-add.typ": *


= Motivation and introduction to symmetry in physics

The cornerstone of modern physics is, without a shadow of a doubt, symmetry. This 
is thanks to one of the most beautiful theorems of physics. *The Noether theorem*.

The Noether theorem establishes a one to one connection between symmetries and 
conservation laws, thus explaining the origin of conservation of energy, charge and 
all other conservation laws widely used in physics. 

As an example, in classical mechanics, the action is defined as the integral of the
Lagrangian

$ S[q^i (t)] =  integral dd(t) L(t, q^i, dot(q)^i) $

where $q^i$ are the generalized coordinates of the system and $dot(q)^i$ the 
derivatives of the coordinates.

The equations of motion are obtained by enforcing that the action is stationary for 
any perturbations to the trajectory that don't change the boundary conditions

$ delta S[q_s^i, delta q^i]  = S[q_s^i + delta q^i] - S[q_s^i] = 0 $

on the other hand, a symmetry is defined as an infinitesimal transformation, meaning
it can be seen as a perturbation to a trajectory, that regardless of the path (even for non physical paths)
the action only changes by some boundary term $K$

$ delta S[q^i, delta_s q^i] = integral dd(t) dv(K, t) $

Noether's theorem allows to obtain a conserved quantity for every symmetry of a 
system defined as

$ Q = K - sum_i pdv(L, dot(q)^i) delta_s q^i $

In our case we are going to work with general relativity. A widely different theory
from classical mechanics. The first question that might arise is, What constitutes a symmetry? 
How do you define it in this context?
A symmetry is a transformation, such as translations, rotations or even of the 
internal degrees of freedom a theory might have, that maintains some aspect of the
theory invariant. 

In the case of classical mechanics the main object that encapsulates the behavior 
of the system allowing for the computation of the equations of motion. Therefore 
a symmetry in classical mechanics is any transformation to the Lagrangian that 
doesn't change the equations of motion.

In our case we will find that the corresponding symmetries en general relativity
are those that preserve the geometry of spacetime, meaning, the metric. The so 
called isometries. Killing fields are nothing more than the generators these transformations.

