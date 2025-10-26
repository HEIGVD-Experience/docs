#import "infobox.typ": *

#let conf(
  title: none,
  course: none,
  author: "Guillaume Trüeb",
  date: none,
  toc: true,
  col: 1,
  doc,
) = {
  
  // Configuration de base du document
  set text(
    font: "New Computer Modern",  // ou "Times New Roman"
    size: 11pt,
    lang: "fr"
  )
  
  set document(
    title: title,
    author: author
  )
  
  // Configuration de la page
  set page(
    "a4",
    margin: (x: 2cm, top: 2cm, bottom: 2cm),
    numbering: "1 / 1",
    number-align: center,
    
    // En-tête
    header: context {
      set text(size: 9pt, style: "italic")
      grid(
        columns: (1fr, 1fr),
        align: (left, right),
        [#author],
        [#course -- #title]
      )
      line(length: 100%, stroke: 0.5pt)
    },
    header-ascent: 15%,
    footer-descent: 15%,
  )
  
  // Configuration des paragraphes
  set par(justify: true, leading: 0.65em)
  
  // ============================================
  // EN-TÊTE DU DOCUMENT
  // ============================================
  
  set align(center)
  
  // Cours
  if course != none {
    v(1em)
    text(size: 12pt, weight: "semibold")[#course]
    v(0.3em)
  }
  
  // Titre
  if title != none {
    text(size: 16pt, weight: "bold")[#title]
    v(0.4em)
  }
  
  // Date
  if date != none {
    text(size: 10pt, style: "italic")[#date]
  } else {
    text(size: 10pt, style: "italic")[
      #datetime.today().display("[day] [month repr:long] [year]")
    ]
  }
  
  v(1.5em)
  
  set align(left)
  
  // ============================================
  // CONFIGURATION DES TITRES
  // ============================================
  
  set heading(numbering: "1.1")
  
  show heading.where(level: 1): it => {
    if it.body != [Table des matières] and col == 1 {
      colbreak()
    }

    set text(size: 14pt, weight: "bold")
    block(above: 1.2em, below: 0.8em)[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
  }
  
  show heading.where(level: 2): it => {
    set text(size: 12pt, weight: "semibold")
    block(above: 1em, below: 0.6em)[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
  }
  
  show heading.where(level: 3): it => {
    set text(size: 11pt, weight: "semibold", style: "italic")
    block(above: 0.8em, below: 0.5em)[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
  }

  show heading.where(level: 4): it => {
    set text(size: 11pt, weight: "semibold", style: "italic")
    block(above: 0.6em, below: 0.4em)[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        h(0.5em)
      }
      #it.body
    ]
  }
  
  // ============================================
  // CODE INLINE ET BLOCS
  // ============================================
  
  // Code inline
  show raw.where(block: false): it => box(
    fill: luma(245),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
    text(font: "Courier New", size: 0.9em)[#it]
  )
  
  // Blocs de code
  show raw.where(block: true): it => block(
    fill: luma(245),
    stroke: 0.5pt + luma(200),
    inset: 10pt,
    radius: 3pt,
    width: 100%,
    above: 0.8em,
    below: 0.8em,
    breakable: true,
  )[
    #set text(font: "Courier New", size: 0.9em)
    #it
  ]
  
  // ============================================
  // CONFIGURATION DES LISTES
  // ============================================
  
  set list(indent: 1em, body-indent: 0.5em)
  set enum(indent: 1em, body-indent: 0.5em)
  
  // ============================================
  // CONFIGURATION DES FIGURES
  // ============================================
  
  show figure: it => {
    set align(center)
    it.body
    v(0.5em)
    set text(size: 10pt, style: "italic")
    it.caption
  }
  
  // ============================================
  // TABLE DES MATIÈRES
  // ============================================
  
  if toc {
    show outline.entry.where(level: 1): it => {
      v(10pt, weak: true)
      strong(it)
    }
    
    outline(
      title: [Table des matières],
      indent: auto,
      depth: 10
    )

    if( col > 1 ) {
      pagebreak()
    }

    
    v(1.5em)
  }
  
  // ============================================
  // CONTENU PRINCIPAL
  // ============================================
  
  if col > 1 {
    columns(col, doc)
  } else {
    doc
  }
}

// ============================================
// FONCTIONS UTILITAIRES
// ============================================

// Zone de texte encadrée simple
#let zone(body) = block(
  fill: luma(250),
  stroke: 0.5pt + luma(180),
  inset: 10pt,
  radius: 3pt,
  width: 100%,
  above: 0.8em,
  below: 0.8em,
  breakable: true,
)[#body]

// Insertion d'image avec légende
#let img(path, caption, width: 100%) = figure(
  image(path, width: width),
  caption: caption
)

// Image depuis les slides de cours HEIG
#let heigimg(path, caption, width: 100%) = figure(
  image("../../" + path, width: width),
  caption: [Capture des slides du cours -- #caption]
)

// Référence à une figure
#let figref(label) = {
  link(label)[Figure~@#label]
}