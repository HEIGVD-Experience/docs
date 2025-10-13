// ============================================
// BOÎTES D'INFORMATION (INFOBOXES)
// ============================================

// Fonction générique pour les boîtes d'information
#let infobox(
  title: "Info",
  body,
  bg: rgb("#f0f0f0"),
  textcolor: black,
  accent: black,
  bordercolor: none,
  icon: none,
) = {
  let border-color = if bordercolor != none { bordercolor } else { accent }
  
  block(
    fill: bg,
    stroke: (left: 3pt + border-color),
    inset: 10pt,
    radius: 2pt,
    width: 100%,
    breakable: true
  )[
    #text(fill: accent, weight: "bold")[
      #if icon != none [#icon ]
      #title
    ]
    #v(0.3em)
    #set text(fill: textcolor)
    #body
  ]
}

// Info box - Pour informations générales
#let info(title: "Info", body) = infobox(
  title: title,
  body,
  bg: rgb("#e8f4f8"),
  accent: rgb("#0066cc"),
  icon: "ℹ️",
)

// Note box - Pour des remarques importantes
#let note(title: "Note", body) = infobox(
  title: title,
  body,
  bg: rgb("#e8f4f8"),
  accent: rgb("#0066cc"),
  icon: "📝",
)

// Hint box - Pour des astuces et conseils
#let hint(title: "Hint", body) = infobox(
  title: title,
  body,
  bg: rgb("#dcffdc"),
  accent: rgb("#22863a"),
  icon: "💡",
)

// Warning box - Pour des avertissements
#let warning(title: "Warning", body) = infobox(
  title: title,
  body,
  bg: rgb("#fff8e1"),
  accent: rgb("#ff9800"),
  icon: "⚠️",
)

// Attention box (alias de warning)
#let attention(title: "Attention", body) = warning(title: title, body)

// Danger box - Pour des alertes critiques
#let danger(title: "Danger", body) = infobox(
  title: title,
  body,
  bg: rgb("#ffebee"),
  accent: rgb("#d32f2f"),
  icon: "❗",
)

// Important box (alias de danger)
#let important(title: "Important", body) = danger(title: title, body)

// Success box - Pour des réussites ou validations
#let success(title: "Success", body) = infobox(
  title: title,
  body,
  bg: rgb("#e8f5e9"),
  accent: rgb("#2e7d32"),
  icon: "✅",
)

// Quote box - Pour des citations
#let quote(title: "Quote", body) = infobox(
  title: title,
  body,
  bg: rgb("#fafafa"),
  accent: rgb("#6a737d"),
  icon: "💬",
)

// Definition box - Pour des définitions académiques
#let definition(title: "Définition", body) = infobox(
  title: title,
  body,
  bg: rgb("#f3e5f5"),
  accent: rgb("#7b1fa2"),
  icon: "📚",
)

// Example box - Pour des exemples
#let example(title: "Example", body) = infobox(
  title: title,
  body,
  bg: rgb("#fff3e0"),
  accent: rgb("#e65100"),
  icon: "📌",
)

// Tip box - Pour des astuces pratiques
#let tip(title: "Tip", body) = infobox(
  title: title,
  body,
  bg: rgb("#e1f5fe"),
  accent: rgb("#0277bd"),
  icon: "🔔",
)