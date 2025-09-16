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

#let note(body) = block(
  fill: luma(240),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
)[*#underline(title)* #linebreak() #body]

#let note(title: "Note", body) = block(
  fill: luma(240),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
)[*#underline(title)* #linebreak() #body]

#let attention(title: "Attention", body) = block(
  fill: rgb("#fffacd"),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
)[
  #set text(fill: rgb("ff9500"))
  *#underline(title)*
  #set text(fill: black)
  #linebreak() 
  #body
]

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