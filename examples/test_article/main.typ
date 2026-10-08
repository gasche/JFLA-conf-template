#import "../../jfla.typ": *
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

// Packages Import
#import "@preview/zebraw:0.6.3": zebraw
#import "@preview/curryst:0.6.0": prooftree, rule, rule-set

= Introduction <section:introduction>

#lorem(200). Here we cite @JFLA because it is very important to cite.

#figure(
  box(width: 100pt, height: 200pt, stroke: 1pt),
  caption: [#lorem(10)],
) <figure:important-stuff>

We can in the @figure:important-stuff a very important example.
#lorem(1000)

= Travaux annexes <section:related-work>

After presenting in @section:introduction the problem at hand we will now
explain related work.

Avant de détailler notre approche nous allons détailler les travaux annexes et
les projets existants qui ont été une inspiration à cette article. #lorem(200).

#lorem(200).

#lorem(200).

#lorem(200).

#figure(
  box(width: 100pt, height: 200pt, stroke: 1pt),
  caption: [#lorem(10)],
)

= Syntaxe <section:syntax>

#lorem(1000).

= Sémantique <section:semantics>

= Typage <section:type-system>

== Typing Judgement

#lorem(300).

== Correction Proof

#lorem(400).

= Extensions <section:extensions>

#lorem(1000).

= Conclusion and future work

#lorem(300). In the end we don't forget to cite @JFLART because it is also
important.

#bibliography(
  bytes(
    "
@misc{JFLA,
  key={JFL},
  author = {},
  title = {{Journées Francophones des Langages Applicatifs}},
  howpublished = {\url{http://jfla.inria.fr}},
  year = {2024},
}

@misc{JFLART,
  author = {Tartempion, Eusèbe and Martin, Cunégonde and Contempierre, Odoacre},
  title = {{Classe LaTeX jflart}},
  howpublished = {\url{https://framagit.org/jfla/jflart}},
  year = {2024},
}
",
  ),
)

















