#import "@preview/theorion:0.6.0": (
  conjecture, corollary, definition, example, lemma, proof, property, remark,
  theorem,
)

#let jfla-conf-template(
  /// Title of the article displayed at the fist page
  title: none,
  /// Running title present in the header after the first page
  running-title: none,
  /// List of all the authors with for each of them a dictionnary with fields :
  /// - name         : complete name of the authors
  /// - running-name : abbreviated name for the header
  /// - affiliation  : complete affiliation of the authors for the title
  authors: none,
  /// Abstract of the article displayed on the first page
  abstract: none,
  /// The number of the instance of the conference. For example JFLA in 2027
  /// was the 38th iteration of the conference so jfla-numbering should be
  /// equal to 38.
  jfla-numbering: 1,
  /// Tells the template if we are in final or review mode.
  /// It only adds
  review-mode: false,
  /// Lang to use for the article.
  /// This can be "fr" for french or "en" for english
  lang: "fr",
  content,
) = [
  // Import
  #import "@preview/theorion:0.6.0": cosmos

  // Computation of stuff for the template
  #let jfla-footer = if lang == "fr" [
    #set text(style: "italic", 9pt)
    JFLA #(1989 + jfla-numbering) – #jfla-numbering#super[es] Journées
    Francophones des Langages Applicatifs
  ] else if lang == "en" [
    #set text(9pt)
    JFLA #(1989 + jfla-numbering) – #jfla-numbering#super[th] Journées
    Francophones des Langages Applicatifs
  ]

  #if running-title == none {
    running-title = title
  }

  // Show & Set Rules
  #show: cosmos.simple.show-theorion
  #show link: underline
  // #show figure.where(kind: table): set figure(kind: image)
  // #show figure.where(kind: raw): set figure(kind: image)
  #show figure.where(kind: image): set figure(supplement: [Figure])
  #show figure.where(kind: image): block.with(above: 5mm, below: 5mm)
  #set figure(kind: image)
  #show figure: set par.line(numbering: none)
  #show figure.caption: it => [
    *#it.supplement #context { it.counter.display(it.numbering) }.*
    #it.body
  ]
  #show raw: set text(font: "Latin Modern Mono 12")
  #set footnote.entry(gap: 1.2mm)
  #set document(
    title: title,
  )
  #set math.equation(numbering: none)
  #set underline(offset: 0.1em)
  #set text(10pt, lang: lang, font: "New Computer Modern", weight: "regular")
  #set par(
    leading: 0.55em,
    spacing: 0.55em,
    first-line-indent: 1em,
    justify: true,
  )
  #set par.line(
    numbering: if review-mode { n => text(red)[#n] } else { none },
  )
  #set terms(hanging-indent: 0em, separator: [*.*#h(1em)])
  #set cite(style: "alphanumeric")

  // geometry reference: found in the .log output of a jflart.sty document:
  // > *geometry* detected driver: pdftex
  // > *geometry* verbose mode - [ preamble ] result:
  // > * driver: pdftex
  // > * paper: <default>
  // > * layout: <same size as paper>
  // > * layoutoffset:(h,v)=(0.0pt,0.0pt)
  // > * modes:
  // > * h-part:(L,W,R)=(101.17755pt, 395.15283pt, 101.17755pt)
  // > * v-part:(T,H,B)=(101.17755pt, 642.69183pt, 101.17755pt)
  // > * \paperwidth=597.50793pt
  // > * \paperheight=845.04694pt
  // > * \textwidth=395.15283pt
  // > * \textheight=642.69183pt
  // > * \oddsidemargin=28.90756pt
  // > * \evensidemargin=28.90756pt
  // > * \topmargin=-4.09244pt
  // > * \headheight=15.0pt
  // > * \headsep=18.0pt
  // > * \topskip=10.0pt
  // > * \footskip=42.0pt
  // > * \marginparwidth=74.68849pt
  // > * \marginparsep=12.8401pt
  // > * \columnsep=10.0pt
  // > * \skip\footins=9.0pt plus 4.0pt minus 2.0pt
  // > * \hoffset=0.0pt
  // > * \voffset=0.0pt
  // > * \mag=1000
  // > * \@twocolumnfalse
  // > * \@twosidefalse
  // > * \@mparswitchfalse
  // > * \@reversemarginfalse
  // > * (1in=72.27pt=25.4mm, 1cm=28.453pt)
  #set page(
    numbering: "1",
    margin: 101.17755pt,
    header: context [
      #set text(style: (if lang == "fr" { "italic" } else { "normal" }), 9pt)
      #if here().page() != 1 {
        stack(
          dir: ltr,
          spacing: 1fr,
          running-title,
          authors
            .map(info => if info.running-name == none { info.name } else {
              info.running-name
            })
            .join(", ", last: " et "),
        )
      }
    ],
    footer: stack(
      dir: ltr,
      spacing: 1fr,
      jfla-footer,
      context counter(page).display("1"),
    ),
  )
  #set heading(numbering: "1.1.1 ")
  #show heading: set block(above: 1.4em, below: 1em)
  #show heading.where(level: 1): set heading(supplement: "Section")
  #show heading.where(level: 1): set text(14pt, weight: "semibold")
  #show heading.where(level: 2): set text(12pt, weight: "semibold")

  #show heading.where(level: 4): it => {
    [\ ]
    set text(weight: "semibold")
    it.body + [.] + h(2pt)
  }

  #show heading.where(level: 5): it => {
    [\ ]
    set text(weight: "semibold")
    h(1em) + it.body + h(2pt)
  }

  #show std.title: set align(center)
  #show std.title: set text(20pt)

  // Spacing before the Title
  #v(30mm)

  // Title
  #std.title()

  // Spacing between Title and Authors
  #v(3.3mm)

  // Authors
  #[
    #set align(center)
    #set text(14pt)

    #(
      authors
        .enumerate()
        .map(((i, info)) => [#info.name#super[#(i + 1)]])
        .join(", ", last: " et ")
    )
  ]

  // Spacing between Authors and Affiliation
  #v(1mm)

  // Affliation
  #[
    #set align(center)
    #set text(9pt)
    #(
      authors
        .enumerate()
        .map(((i, info)) => [#super[#(i + 1)]#info.affiliation \ ])
        .join()
    )
  ]

  // Spacing between Affiliation and abstract
  #v(18mm)

  // Abstract
  #box(inset: (x: 9mm), abstract)

  #content
]
