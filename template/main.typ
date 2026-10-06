#import "jfla-conf-template.typ": *
#show: jfla-conf-template.with(
  title: [Gestion de la mémoire sans asynchronie d'un language de script],
  authors: (
    (
      name: "Paul Adam",
      running-name: "Paul A.",
      affiliation: "ENS Rennes, Rennes, 35000, France",
    ),
    (
      name: "Alan Schmitt",
      running-name: "Alan S.",
      affiliation: "INRIA, Rennes, 35000, France",
    ),
    (
      name: "Martin Quinson",
      running-name: "Martin Q.",
      affiliation: "IRISA, Rennes, 35000, France",
    ),
  ),
  abstract: [
    #lorem(200)
  ],
  jfla-numbering: 38,
  review-mode: false,
  lang: "fr",
)

= Introduction <section:introduction>

#lorem(100) @TestCite #lorem(30).

= Travaux Annexes <section:related-work>

Comme dans la @section:introduction on a introduit le sujet. #lorem(100).

#bibliography("bib.bib")



