#import "../../../_settings/typst/template-note-en.typ": conf
#show: doc => conf(
  title: [
    CSS
  ],
  lesson: "WEB",
  chapter: "2 - HTML & CSS",
  definition: "The text covers fundamental educational objectives in web development, elucidating the roles of HTML and CSS, HTML document structure, and the integration of CSS styling. It emphasizes the application of HTML elements, CSS properties, and the importance of understanding the Document Object Model (DOM). Additionally, it delves into advanced layout techniques like Grid and Flexbox, alongside responsive design using Media Queries. The narrative underscores the significance of accessibility and SEO, elucidating various methods to enhance SEO practices. Furthermore, it provides comprehensive insights into CSS anatomy, selectors, properties, layout models like Flexbox and Grid, and the implementation of Media Queries for responsive design.",
  col: 1,
  doc,
)

= Educational objectives
- Describe the role of HTML and CSS in web development
- Describe the structure of an HTML document
- Create a HTML document with a CSS stylesheet
- Use HTML elements and CSS properties
- Describe the role of the Document Object Model (DOM) and it’s structure
- Use Grid and Flexbox for layout
- Use Media Queries for responsive design
- Cite the importance of accessibility and SEO (Search Engine Optimization) in web development
- Cite different ways to enhance SEO

= Anatomy of CSS document
== Ruleset
A CSS document is a sequence of rulesets, used for styling specified parts of the document.

#image("../../../_src/img/docs/image copy 36.png")

A ruleset is composed of

- a comma-separated list of selectors, and
- a declarations block describing the styling of the selected elements.

Rulesets apply declarations to specific parts of the document. Declaration blocks are preceded by one or more comma-separated selectors. Selectors are conditions selecting some elements of the page.

== Declaration
A declaration is a property-value pair that describes the styling of the selected elements. A declaration block is a sequence of declarations enclosed in curly braces.

```css
selector {
  property: value;
}
```

= Adding CSS to HTML
CSS can be added to an HTML document in three ways:
== Inline
Inline CSS is added directly to the HTML element using the `style` attribute.

```html
<p style="color: red;">This is a red paragraph.</p>
```

== Internal
Internal CSS is added to the HTML document using the `<style>` tag in the `<head>` section.

```html
<!DOCTYPE html>
<html>
<head>
  <style>
    p {
      color: red;
    }
  </style>
</head>
<body>
  <p>This is a red paragraph.</p>
</body>
</html>
```

== External
External CSS is added to the HTML document using the `<link>` tag in the `<head>` section.

```html
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <p>This is a red paragraph.</p>
</body>
</html>
```

= CSS Selectors
CSS selectors are used to select the elements to which the ruleset will apply. There are several types of selectors:

== Type
Type selectors select elements based on their tag name.

```css
p {
  color: red;
}
```
*This rule will apply to all `<p>` elements. in the html page.*

== Id 
Id selectors select elements based on their `id` attribute.

```css
#myId {
  color: red;
}
```
*This rule will apply to the element with the `id="myId"` attribute.*

== Class
Class selectors select elements based on their `class` attribute.

```css
.myClass {
  color: red;
}
```
*This rule will apply to all elements with the `class="myClass"` attribute.*

== Universal
The universal selector `*` selects all elements.

```css
* {
  color: red;
}
```
*This rule will apply to all elements in the html page.*

== Grouping
Grouping selectors select multiple elements.

```css
h1, h2, h3 {
  color: red;
}
```

== Descendant
Descendant selectors select elements that are descendants of another element.

```css
div p {
  color: red;
}
```
*This rule will apply to all `<p>` elements that are descendants of a `<div>` element.*

== Child
Child selectors select elements that are direct children of another element.

```css
div > p {
  color: red;
}
```
*This rule will apply to all `<p>` elements that are direct children of a `<div>` element.*

*Exemple*
```html
<!DOCTYPE html>
<html>
<head>
  <style>
    div > p {
      color: red;
    }
  </style>
</head>
<body>
  <div>
    <p>This is a red paragraph.</p>
    <span>
      <p>This isn't a red paragraph.</p>
    </span>
  </div>
</body>
</html>
```

== Other selectors
- a b selects all elements that match b and are (potentially non-direct) descendants of elements that match a.
- a > b selects all elements that match b and are direct children of elements that match a.
- a ~ b selects all elements that match b and are siblings of elements that match a (i.e. both a and b have the same parent) and b appears after a.
- a + b selects all elements that match b and are adjacent siblings of elements that match a (i.e. both a and b have the same parent, and b immediately follows a).

== Precise selectors
The id, class and attribute selectors can be combined by adding them as suffixes to other selectors.

```css
p#myid                     /* a p element with id "myid" */
*.myclass                  /* any element with class "myclass" */
p.myclass#myid[attr=value] /* a p with class "myclass", id "myid" and "attr=value" */
```

= Pseudo-classes and pseudo-elements
== Pseudo-class
Pseudo-classes are used to define the special state of an element.

```css
a:link {
  color: blue;
}
```
*This rule will apply to all `<a>` elements that are unvisited links.*

== Pseudo-element
Pseudo-elements are used to style parts of an element.

```css
p::first-line {
  color: red;
}
```
*This rule will apply to the first line of all `<p>` elements.*

= CSS Properties
CSS properties are used to describe the styling of the selected elements. There are several types of properties:

== Text properties
```css
p {
    text-align: center;
    line-height: 2em;
    letter-spacing: 2em;
    text-decoration: underline;
    text-transform: uppercase;
}
```

== Background properties
```css
body {
    background-color: blue;
    background-image: url('../image.jpg');
    background-repeat: no-repeat;
    background-size: auto;
}
```

== Color properties
```css
p {
    /* named-color values */
    color: red;
    color: orange;

    /* hex-color values */
    color: #090;
    color: #009900;

    /* rgb() values, rgba() also has alpha (opacity) */
    color: rgb(34, 12, 64);
    color: rgba(34, 12, 64, 0.6);
}
```

== Font properties
```css
p {
    font-family: Arial, sans-serif;
    font-size: 16px;
    font-weight: bold;
    font-style: italic;
}
```
The font property sets an element’s font to a system font.

- The first font specified that is available is used to display the element.
- The recommended font size units are px, em and %. Pixels are fixed, wheareas em and % are relative to the font size specified for the document.

=== External font
```css
@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');

body{
    font-family: 'Roboto', sans-serif;
}
```
== Properties and Inheritance
Some properties are inherited by child elements.

- *Do Inherit*: color, font, line-height, letter-spacing, text-align, etc.
- *Do not Inherit*: background-color, border, padding, margin, etc.

= Layout
The display property specifies if/how an element is displayed.

The default value of display depends on the element. The most common values are:

- block: element generates line break before and after itself. Can have specified height and width. If unspecified, takes up the whole width of its parent element (e.g. div, p, h1, h2, etc.).
- inline: element does not generate line breaks, only takes up as much width as necessary (e.g. span, a, img, etc.). It will be on the same line as other inline elements, if there is space.
- inline-block: element is displayed as an inline element, but can have specified width and height (e.g. buttons, input fields, etc.).
- none: element is not displayed at all.
- flex: element is displayed as a block-level flex container (e.g. div, section, etc.).

== Positioning
The position property specifies the type of positioning method used for an element.

- static: The element is positioned according to the normal flow of the document.
- relative: The element is positioned according to the normal flow of the document, and then offset relative to itself.
- absolute: The element is positioned relative to its closest non-static positioned ancestor.
- fixed: The element is positioned relative to the initial containing block established by the viewport and does not move with scroll.
- sticky: The element is positonned according to the normal flow of the document, but behaves like fixed when scrolled out of view. If another element is positioned sticky nearby, they will “push” each other out of the way.

#image("../../../_src/img/docs/image copy 37.png")

#colbreak()

== Flexbox
Flexbox is a layout model that allows elements to align and distribute space within a container.

```html
<div class="container">
    <div class="item">Item A</div>
    <div class="item">Item B</div>
    <div class="item">Item C</div>
</div>
```
```css
.container {
    display: flex;
    flex-direction: row;
}
.item {
    order: 1;
    flex-grow: 1
}
```

- Container (parent) properties : flex-direction, flex-wrap, flex-flow, justify-content, align-items, align-content
- Item (child) properties : order, flex-grow, flex-shrink, flex-basis, flex, align-self

== Grid
Grid is a layout model that allows elements to align and distribute space in two dimensions.

```html
<div class="container">
    <div class="item">Item A</div>
    <div class="item">Item
    B</div>
    <div class="item">Item C</div>
</div>
```
```css
.container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
}
.item {
    grid-column: 1 / 3;
}
```

- Container (parent) properties : grid-template-column, grid-template-rows, grid-template-areas, grid-template, ...
- Item (child) properties : grid-column-start, grid-column-end, grid-column, grid-row, grid-area, ...

#image("../../../_src/img/docs/image copy 38.png")

= Media Queries
Media queries are used to apply different styles based on the device’s characteristics.

```css
h1 { font-size: 50px; }     /* General rule */

@media (min-width: 576px) { /* Tablet dimensions */
    h1 { font-size: 60px; }
}

@media (min-width: 768px) { /* Desktop dimensions */
    h1 { font-size: 70px; }
}
```

== Define variables
```css
:root { /* Global variables */
    --main-color: #06c;
    --main-bg-color: #fff;
}

.subcontent { /* Local variables ; override global variables */
    --main-color: #c06;
    --main-bg-color: #fff;
    --content-specific-color: #f00;
}
```

== Accessibing variables
```css
.my-element {
    color: var(--main-color);
    background-color: var(--main-bg-color);
}
```
The var() function can take fallback values in case one of the variables is not defined.
```css
.my-element {
    color: var(--main-color, #06c);
    background-color: var(--main-bg-color, #fff);
}
```