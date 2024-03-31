#let conf(
  title: none,
  lesson: none,
  chapter: none,
  definition: [],
  doc,
) = {
  set align(center)
  text(18pt, title)

  par(justify: true)[
    #v(15pt)
    *#lesson* \
    #chapter
  ]
  
  v(15pt)

  par(justify: true)[
    *Definition* \
    #definition
  ]

  v(20pt)

  set align(left)
  outline(indent: auto)

  pagebreak()

  set align(left)
  columns(2, doc)
}