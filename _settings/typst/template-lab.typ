#let conf(
  title: none,
  lesson: none,
  lab: none,
  author: "Guillaume T.",
  toc: none,
  col: 2,
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
        #datetime.today().display("[month]-[year]")
      ]
      #v(13pt)
    ],
    header-ascent: 0%,
    footer-descent: 20%,
    margin: (x: 14mm, top: 14mm, bottom: 14mm),
    numbering: "1/1"
  )

  v(15pt)

  set align(center + horizon)

  par()[
    #text(18pt, title) \
    #text(14pt, lesson, weight: "bold") \
    #text(14pt, lab)
  ]

  set align(center + top)

  v(15pt)

  set align(left)
  set heading(numbering: "1.")
  show outline.entry.where(
    level: 1
      ): it => {
        v(10pt, weak: true)
        strong(it)
    }

  if(toc) {
    outline(title: "Table des matières", indent: auto)
  }

  show heading.where(level: 1): it => block[
    #colbreak()
    #it
  ]
  
  columns(col, doc)
}