#import "../../../_settings/typst/template-note-en.typ": conf
#show: doc => conf(
  title: [
    HTML
  ],
  lesson: "WEB",
  chapter: "2 - HTML & CSS",
  definition: "The content covers essential educational objectives in the WEB course, detailing the roles of HTML and CSS, HTML document structure, CSS styling, and utilizing the Document Object Model (DOM). It emphasizes the importance of accessibility, responsive design, and SEO in web development. Additionally, it provides practical examples and explanations of HTML elements, attributes, text formatting, lists, media elements, tables, forms, and semantic elements for improved understanding and implementation. SEO optimization is highlighted as crucial for driving organic traffic to websites.",
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

= HTML & CSS role in web development
HTML (HyperText Markup Language) is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets (CSS) and scripting languages such as JavaScript.

HTML could be seen as the skeleton of your web page, it defines the structure of your content. CSS is the skin, it defines the style of your content. JavaScript is the muscle, it defines the behavior of your content.

== HTML structure
HTML documents are composed of a tree of elements. Elements can have attributes that define their behavior and appearance. The structure of an HTML document is composed of the following elements:

- `<!DOCTYPE html>`: The document type declaration for HTML5
- `<html>`: The root element of an HTML page
- `<head>`: Contains meta-information about the document
- `<title>`: The title of the document

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome page</title>
</head>
<body>
    <h1>Hello students of the Web Technologies course !</h1>
</body>
</html>
```

=== Meta tags
Meta tags are used to provide metadata about the HTML document. Metadata will not be displayed on the page, but will be machine parsable. Meta elements are typically used to specify page description, keywords, author of the document, last modified, and other metadata and can be used to improve SEO and accessibility.

```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

- width=device-width : the width of the page matches the screen width
- initial-scale=1.0 : the initial zoom level

=== Open Graph Protocol
The Open Graph protocol enables any web pages to show some additional information when shared on social media or messaging apps. It is a set of meta tags that you can add to your HTML page to improve the way your content is displayed when shared.

```html
<meta property="og:title" content="The Rock" />
<meta property="og:type" content="video.movie" />
<meta property="og:url" content="https://www.imdb.com/title/tt0117500/" />
<meta property="og:image" content="https://ia.media-imdb.com/images/rock.jpg" />
```

= HTML anatomy
== Elements
Elements are the building blocks of HTML pages. An element is a part of a document, marked up with a start tag, content, and an end tag. Elements can also have attributes that define their behavior and appearance.

#image("../../../_src/img/docs/image copy 34.png")

=== Attributes
Attributes are used to provide additional information about HTML elements. They are always included in the opening tag and are written as name/value pairs.

#image("../../../_src/img/docs/image copy 35.png")

- the id attribute gives an identifier to the element that is unique in the document,
- the class attribute assigns a class to the element, usually used to style it,
- the style attribute provides CSS properties to style the element.

== Text elements
=== Headings
Headings are used to define the structure of the content. There are six levels of headings, from `<h1>` to `<h6>`.
```html
<h1>Heading level 1</h1>
<h2>Heading level 2</h2>
<h3>Heading level 3</h3>
```
=== Paragraphs
Paragraphs are used to define blocks of text. They are defined with the `<p>` element.
```html
<p>This is a paragraph.</p>
```

=== Break line & Horizontal rule 
The `<br>` element is used to insert a single line break. The `<hr>` element is used to insert a horizontal rule.

```html
<p>First line<br>Second line</p>
<hr>
```
=== Formatting
```html
<i>italic</i> <b>bold</b> <u>underline</u>
```

== Lists
=== Unordered lists
Unordered lists are used to list items in no particular order. They are defined with the `<ul>` element.
```html
<ul>
    <li>Item 1</li>
    <li>Item 2</li>
</ul>
```

=== Ordered lists
Ordered lists are used to list items in a specific order. They are defined with the `<ol>` element.
```html
<ol>
    <li>Item 1</li>
    <li>Item 2</li>
</ol>
```

== Hyperlink 
Hyperlinks are used to link from one page to another. They are defined with the `<a>` element.
```html
<a href="https://www.google.com" title="Google" target="_blank">Google</a>
<a href="mailto:username@email.com?subject=hello&body=world!">Hello World!</a>
```

== Media elements
=== Images
```html
<img src="image.jpg" alt="Image description">
```
=== Audio & Video
```html
<audio src="audio.mp3"></audio>
<video src="video.mp4"></video>
```

=== Canvas
The canvas element allows for dynamic, scriptable rendering of 2D and 3D shapes.
```html
<canvas id="myCanvas" width="200" height="100"></canvas>
```

== Tables
Tables are used to display data in a tabular format. They are defined with the `<table>` element.
```html
<table>
    <!-- row -->
    <tr>
        <!-- header column -->
        <th>Student ID</th>
        <th>Grade</th>
    </tr>
    <tr>
        <!-- regular column -->
        <td>4</td>
        <td>5</td>
    </tr>
    <tr>
        <!-- merged columns -->
        <td colspan="2">6</td>
    </tr>
</table>
```

== Forms
Forms are used to collect user input. They are defined with the `<form>` element.
```html
<form action="/submit" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">
    <input type="submit" value="Submit">
</form>
```

- The action attribute defines the location (URL) where the form should be sent when it is submitted.
- The method attribute defines which HTTP method to send the data with (it can be “get” or “post”).

=== Attributes
- name: the name of the input, which is submitted with the form data.
- value: the default value of the input.
- placeholder: the text that appears within the input when empty.
- required: indicates that the input is mandatory. Submission will be blocked if the input is empty.
- readonly: indicates that the input cannot be edited.

== Semantic elements
Semantic elements are HTML elements that clearly describe their meaning in a human- and machine-readable way. They are used to define the structure of the content and provide additional information about the content.

```html
<header>Header</header>
<nav>Navigation</nav>
<main>Main content</main>
<section>Section</section>
<article>Article</article>
<aside>Aside</aside>
<footer>Footer</footer>
```

= SEO optimization
SEO mean Search Engine Optimization. It is the practice of increasing the quantity and quality of traffic to your website through organic search engine results. SEO is important because it helps search engines understand what your content is about and how it can be useful to users.