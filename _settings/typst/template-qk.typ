#let conf(
  title: none,
  lesson: none,
  author: "Guillaume T.",
  col: 1,
  doc,
) = {

  set text(font: "Inter")

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

  doc
}
