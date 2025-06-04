#let resume(title, name, cols: 2, doc) = {
  set text(size:7.5pt, font: "Times New Roman")
  set par(leading: 0.45em)
  set block(above: 0.5em)

  show heading.where(level: 1): it => block(
    fill: luma(240),
    stroke: 0.5pt + black,
    inset: 4pt,
    width: 100%,
    radius: 3pt,
    breakable: true
    )[
    #it
  ]

  show heading.where(level: 2): it => block(breakable: true)[
    #set text(size: 1.1em) 
    #it
  ]

  show heading.where(level: 3): it => block(breakable: true)[
    #set text(size: 1.1em)
    #set block(above: 0.5em)
    #it
  ]
  show heading.where(level: 4): it => block(breakable: true)[
    #set text(size: 1em)
    #set block(above: 0.5em)
    #it
  ]

  show par: set pad(top: 0pt)
  set table(stroke: 0.25pt + black)

  
  set page("a4",
    header: [
      #columns(3)[
        #set text(size: 12pt)
        #name
        #colbreak()
        #set align(center)
        #title
        #colbreak()
        #set align(right)
        #datetime.today().display("[day]-[month]-[year]")
      ]
    
      #line(length: 100%)
      #v(5pt)
    ],
    header-ascent: 0%,
    footer-descent: 40%,
    columns: (cols),
    margin: (x: 5mm, top: 14mm, bottom: 14mm),
    numbering: "1/1"
  )

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