// Fonction générique pour les boîtes d'information
#let infobox(
  title: "Info",
  body,
  bg: rgb("#f0f0f0"), // couleur de fond
  textcolor: black, // couleur du texte
  accent: black, // couleur du titre
  icon: none, // icône facultative (string ou none)
) = block(
  fill: bg,
  inset: 10pt,
  radius: 6pt,
  width: 100%,
)[
  #set text(fill: accent)
  #text(spacing: 6pt, size: 12pt)[*#icon -- #title*]
  #set text(fill: textcolor)
  #linebreak()
  #body
]

#let info(title: "Info", body) = infobox(
  title: title,
  body,
  bg: rgb(233, 239, 250),
  accent: rgb("#0055aa"),
  icon: "📝",
)

#let hint(title: "Hint", body) = infobox(
  title: "Hint",
  body,
  bg: rgb(220, 255, 220),
  accent: rgb("#22863a"),
  icon: "💡",
)

#let warning(title: "Warning", body) = infobox(
  title: title,
  body,
  bg: rgb(251, 242, 233),
  accent: rgb("#ff9500"),
  icon: "⚠️",
)

#let danger(title: "Danger", body) = infobox(
  title: title,
  body,
  bg: rgb(251, 236, 237),
  accent: rgb("#d73a49"),
  icon: "❗",
)

#let success(title: "Success", body) = infobox(
  title: title,
  body,
  bg: rgb(237, 248, 238),
  accent: rgb(34, 134, 58),
  icon: "✅",
)

#let quote(title: "Quote", body) = infobox(
  title: title,
  body,
  bg: rgb(250, 250, 250),
  accent: rgb(106, 115, 125),
  icon: "💬",
)