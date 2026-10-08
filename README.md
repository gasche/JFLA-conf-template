# JFLA-conf-template

Typst template for the JFLA (journées français des languages applicatifs) conference.

This package has not (yet) been published to Typst Universe. So to use it you have to copy paste the `jfla.typ` file.

# Minimal Example

Here is a minimal example assuming the `jfla.typ' file is in the same directory
as the example : 

```
#import "jfla.typ": *
#show: jfla-conf-template.with(
  title: [The title of the article],
  authors: (
    (
      name: "Firstname Surname",
      running-name: "Firstname S.",
      affiliation: "ENS Rennes, Rennes, 35000, France",
    ),
    (
      name: "SecondAuthorName Withonename Andasecond",
      running-name: "SecondAuthorName W. A.",
      affiliation: "IRIF, Paris, France",
    ),
  ),
  abstract: [
    Here is a small abstract to test the template. You can write the
    short resume of what your article does here.
  ],
  jfla-numbering: 38,
  // Here you can pass in review mode when submitting
  review-mode: false,
  // Here you can change the language to "en" or "fr"
  lang: "en",
)

= Introduction <section:introduction>

#lorem(300)

= Related Work

In the @section:introduction we talked about the problem at hand.
#lorem(1000)

= Important Section

#lorem(2000)
#figure(
  box(width: 200pt, height: 100pt, stroke: 1pt),
  caption: [Some very pretty empty black box]    
)

= Other Important Section

#definition[
  Here I define something very important for the theorem I will expose next.
]

#theorem[
  A beautiful theorem that will be very easy to proove in an elegant way.
]


#proof[
  A very hard long and difficult proof that is wrong for a very specific and
  weird reason. #lorem(200).
]

#lorem(1000)


= Conclusion and Future work

#lorem(300)


// Here we assume that the bibliography is present in the file "bib.bib"
// and in the same directory as this file
#bibliography("bib.bib")
```

# How to build Typst document

The general way to compile a file in Typst is to run this command :
```
typst compile main.typ main.pdf
```

(`main.pdf` is not necessary here because the file is named `main.typ`)

Typst cannot use files outside of the working directory which is by default the
directory of the file you are compiling. To change this default run this :
```
typst c main.typ main.pdf --root other/root/directory/
```

(you can write `c` for `compile`)

<!-- Fonts cannot be embedded inside of Typst packages. Typst by default look at -->
<!-- system fonts. We are using specific 2 fonts : -->
<!-- - "New Computer Modern" which is embedded inside the typst binary so this should not pose any probrem -->
