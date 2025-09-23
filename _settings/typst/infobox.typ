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
  *#underline(if icon != none { icon + " " } else { "" } + title)*
  #set text(fill: textcolor)
  #linebreak()
  #body
]

// Déclinaisons pratiques avec icônes
#let note(title: "Note", body) = infobox(
  title: title,
  body,
  bg: luma(240),
  accent: rgb("#0055aa"),
  icon: "📝",
)

#let attention(title: "Attention", body) = infobox(
  title: title,
  body,
  bg: rgb("#fffacd"),
  accent: rgb("#ff9500"),
  icon: "⚠️",
)

#let tip(title: "Astuce", body) = infobox(
  title: title,
  body,
  bg: rgb("#e6ffed"),
  accent: rgb("#22863a"),
  icon: "💡",
)

#let danger(title: "Danger", body) = infobox(
  title: title,
  body,
  bg: rgb("#ffeef0"),
  accent: rgb("#d73a49"),
  icon: "❗",
)

#let success(title: "Succès", body) = infobox(
  title: title,
  body,
  bg: rgb("#e6ffed"),
  accent: rgb("#22863a"),
  icon: "✅",
)