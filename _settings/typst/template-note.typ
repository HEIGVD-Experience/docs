#let resume(chap, title, cols: 1, doc) = {
  set text(size:9pt, font: "Inria Sans")
  set par(leading: 1em)
  set block(above: 0.75em)
  
  set page("a4",
    header: [
      #columns(2)[
        #set text(size: 12pt)
        #chap
        #colbreak()
        #set align(right)
        #title
      ]
    
      #line(length: 100%)
      #v(5pt)
    ],
    header-ascent: 0%,
    footer-descent: 20%,
    columns: cols,
    margin: (x: 8mm, top: 14mm, bottom: 14mm),
    numbering: "1/1"
  )

  doc
}



#let def = (..contents) => {
  box(fill: gray, outset: 10pt)[
    Définition:
    #contents
  ]
}
