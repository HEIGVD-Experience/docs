#import "infobox.typ": *

#let conf(
  title: none,
  lesson: none,
  author: "Guillaume T.",
  col: 1,
  doc,
) = {
  set text(font: "Times New Roman")
  set page("a4",
    header: [
      #columns(2)[
        #set align(left)
        #set text(size: 12pt)
        #author
        #colbreak()
        #set align(right)
        #lesson - #title
      ]
      #v(13pt)
    ],
    header-ascent: 0%,
    footer-descent: 20%,
    margin: (x: 14mm, top: 14mm, bottom: 14mm),
    numbering: "1/1"
  )
  
  set align(left)
  set heading(numbering: "1.")
  
  // Stylisation des blocs de code inline
  show raw.where(block: false): it => box(
    fill: rgb("#f7f6f6"), // Gris solide sans transparence
    inset: (x: 3pt, y: 1pt),
    radius: 4pt,
    text(
      font: "Courier New", // Police monospace
      size: 1em,
      fill: rgb("#000000"), // Noir pur et opaque
      it
    )
  )
  
  // Stylisation des blocs de code multiligne
  show raw.where(block: true): it => block(
    fill: rgb("#f7f6f6"), // Gris très clair solide
    stroke: 1pt + rgb("#d0d0d0"), // Bordure grise solide
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    above: 0.8em,
    below: 0.8em,
    breakable: true,
  )[
    #set text(
      font: "Courier New", // Police monospace
      size: 1em,
      fill: rgb("#000000") // Noir pur et opaque
    )
    #it
  ]
  
  show outline.entry.where(
    level: 1
  ): it => {
    v(10pt, weak: true)
    strong(it)
  }
  
  outline(title: "Table des matières", indent: auto)
  
  show heading.where(level: 1): it => {
    colbreak()
    block[#it]
  }
  
  doc
}

#let zone(content) = block(
  stroke: 0.5pt + black,
  inset: 8pt,
  radius: 3pt,
  width: 100%,
  above: 0.8em,
  below: 0.8em,
  breakable: true,
)[
  #content
]

#let img(path, title, width: 100%) = figure(caption: title)[
  #image("../../" + path, width: width)
]

#let heigimg(path, title, width: 100%) = img(
  path,
  "Capture des slides de cours correspondant - " + title,
  width: width
)