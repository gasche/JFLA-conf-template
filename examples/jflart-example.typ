// compilation command: typst compile --root .. jflart-example.typ
#import "../jfla.typ": *

#import "@preview/metalogo:1.2.0": LaTeX

#show: jfla-conf-template.with(
  title: [Soumettre un article aux Journées Francophones des Langages Applicatifs en utilisant la classe `jflart.cls`],
  running-title: [Du bon usage de `jflart.cls`],
  authors: (
    (
      name: "Eusèbe Tartempion",
      running-name: "Tartempion",
      affiliation: "Université Paris Université, CNRS, INRIA, CEA, INRA, INSERM, Paris, 75013, France",
    ),
    (
      name: "Cunégonde Martin",
      running-name: "Martin",
      affiliation: "Université Sorbonne Très Grand Sud, Nice, 06000, France",
    ),
    (
      name: "Odoacre Contempierre",
      running-name: "Contempierre",
      affiliation: "Université Sorbonne Très Grand Sud, Nice, 06000, France",
    ),
  ),
  abstract: [
    Le résumé peut venir avant ou après la commande maketitle.
    //
    Il devrait contenir aussi peu de commandes #LaTeX que possible
pour faciliter la conversion vers HTML nécessaire à son inclusion dans
les actes et sur le site web des JFLA.
  ],
  jfla-numbering: 36,
  review-mode: false,
  lang: "fr",
)

= Introduction

Les Journées Francophones des Langages Applicatifs~@JFLA sont organisées
par vos collègues de façon volontaire et bénévole.
//
L'objectif des présentes instructions est de simplifier le processus de
relecture des articles soumis et la publication des articles acceptés.

= Consignes générales

Pour maintenir l'uniformité des actes des JFLA, nous vous demandons de ne
changer ni la police par défaut ni sa taille (10 points).
//
En particulier, l'usage de paquets comme~`times` ou~`libertine`
est interdit.
//
Modifier les paramètres typographiques qui régissent l'apparence du code
informatique ou des formules mathématiques pour faire tenir un contenu trop
dense dans une zone trop étroite est également de mauvais aloi.

#let cmd(name) = raw("\\" + name)

L'usage des commandes de positionnement et d'espacement explicites,
notamment~#cmd("vspace") et ses cousines, doit être minimisé.
//
La commande~#cmd("sloppy") ne doit être utilisée qu'en ultime recours,
lorsqu'aucune reformulation du texte n'est possible.

L'option~`review` doit impérativement être utilisée lors de la production
de la version soumise pour relecture.
//
Elle devra être remplacée par l'option~`final` pour la version finale.

= Options de la classe

==== Option~`english`.
//
La classe suppose par défaut un article rédigé en langue française.
//
Cette option est à utiliser si l'article est rédigé en langue anglaise.

==== Option~`review`.
//
Cette option rajoute les numéros de lignes dans la marge.

==== Option~`final`.
//
L'option~`final` prépare l'article à l'inclusion dans les actes de la
conférence.

= Paquets chargés par défaut

La classe~`jflart.cls` charge un certain nombre de paquets par défaut.

- Le paquet~`babel` pour la prise en charge de la langue française ou
  anglaise.
- Les paquets~`color` et~`graphicx`, pour permettre l'usage de
  couleurs et l'inclusion d'images.
- Le paquet~`hyperref`, pour l'ajout des hyperliens.
  //
  Ceux-ci, par défaut, ne sont pas mis en surbrillance afin de préserver le gris
  typographique du texte.
- Les paquets de l'_American Mathematical Society_, à
  savoir~`amsmath`, `amssymb` et~`amsthm`.
  //
  Nous recommandons vivement l'usage des environnements proposés par ces paquets
  pour énoncer théorèmes, lemmes et définitions (voir plus bas), ainsi que pour
  aligner d'éventuelles équations et
  formules~(environnements~`align`,~`aligned`,~`cases`,
  etc.).
- Le paquet~`marthpartir` de D.~Rémy, qui propose un support natif pour
  les mathématiques en mode paragraphe ainsi qu'une commande pour les règles
  d'inférence.

= Divers

== Figures

#figure(
  image("jfla.jpg", width: 80%),
  caption: [Les JFLA 2002, photographie par Maxence Guesdon],
) <fig:bienbelle>

L'usage de~`includegraphics` avec une option~`width` permet une
utilisation facile d'images, comme illustré par la @fig:bienbelle.

== Mathématiques

Les environnements suivants ont été prédéfinis via le paquet~`amsthm`.

#h(1fr) #box(width: 60%)[
#table(
  columns: (1fr, 1fr, 1fr,),
  table.hline(position: bottom),
  [Environnement], [Nom Français], [Nom anglais],
  [`theo`], [Théorème], [_Theorem_],
  [`prop`], [Proposition], [_Proposition_],
  [`conj`], [Conjecture], [_Conjecture_],
  [`coro`], [Corollaire], [_Corollary_],
  [`lemm`], [Lemme], [_Lemma_],
  [`defi`], [Définition], [_Definition_],
  [`rema`], [Remarque], [_Remark_],
  [`exem`], [Exemple], [_Example_],
)] #h(1fr)
  
== Code source

La classe~`jflart.cls` ne propose pas de paquet pour la coloration
syntaxique par défaut.
//
Les paquets~`listings` et~`minted` sont les plus fréquemment
utilisés.

// Pour utiliser le paquet~`listings`, il est recommandé de
// charger ce paquet en lui passant l'option~`final`~:
// `\usepackage[final]{listings}`. Ainsi, les extraits de code
// source seront bien affichés dans votre article, même lors de la
// production de la version soumise à relecture pour évaluation avec
// l'option~`review` de la classe `jflart.cls`.

== Bibliographie

Vous pouvez au choix utiliser bibtex ou biblatex pour gérer votre bibliographie.
//
Merci d'utiliser le style de citation~`alpha-fr` avec bibtex, ou son
équivalent biblatex.

== Remerciements

La classe ne propose pas d'environnement dédié pour les remerciements et sources de financement éventuelles.
//
Nous vous suggérons d'utiliser la commande~`\paragraph{Remerciements.}` en
fin d'article.

== Autres ressources

La classe~`jflart.cls` et sa documentation sont disponibles en
ligne~@JFLART.

#bibliography("jflart.bib")
