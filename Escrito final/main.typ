#import "template.typ": *

#show: project.with(title: "Campos de Killing", authors: ("Autor: Gustavo Gancedo Crespo", "Director: Diego Herranz Muñoz"), abstract-in-english: [
  The purpose of this thesis is to make a rigorous and approachable introduction 
  to Killing fields and their applications to any undergrad that is or has 
  studied a general relativity course. Applications range from direct treatment
  of geodesics in usual metrics like the Schwarzschild, Kerr or FLRW metrics to
  applications to optics as an effective theory passing through the more geometrical
  sides of general relativity and maximally symmetric spaces.

  Additionally, as part of the agreement with Brown university, there is a dedicated
  section talking about the internship results on the study of a certain quantum 
  inflationary model and the validity and asymptotic behaviors of the model.
])

#include "Introduction/Introduction.typ"
#include "Manifolds/manifolds.typ"
#include "schwarzschild/schwarzschild.typ"
#include "kerr/kerr.typ"
#include "cosmology/cosmology.typ"
#include "redshifts/redshifts.typ"
#include "optics/optics.typ"

#include "brown/quantum-cosmology-and-inflation.typ"

#bibliography(("brown/bibliography.bib",))
