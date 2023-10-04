How-To's & Miscellaneous
1.  How to include an HTML file into another HTML file?
Why? So that you don't have to repeat certain HTML codes (such as header, footer) in every file. There are a number of methods, BUT I can't find the best method (each method has its own merits and drawbacks). The methods can be classified into server-side and client-side techniques.

1.1  Server-Side Techniques
Server-side Include: Most of the HTTP servers (such as Apache HTTP server) support a so-called Server-side Include (SSI) technology, where the server can be asked to insert another HTML file into the current HTML file at runtime via a special directive "#include", e.g.,
<html>
<head>
  ......
</head>
<body>
  ......
  <!-- #include file="footer.html" -->
  ......
</body>
</html>
The #include directive is often enclosed inside an HTML comment, meant for those servers/clients not supporting SSI.

This is clean and simple, but although most servers support SSI, they might not allow all users (especially you) to execute SSI.

1.2  Client-Side Techniques
JavaScript: Use JavaScript to print out the HTML codes to be embedded. For example, create the following script and saved as "footer.js":
// Footer.js
document.write('<div id="footer">')
document.write('<p>Sent your comment to xxxx</p>')
document.write('</div>')
You can then include it via:

<script type="text/javascript" src="footer.js"></script>
Drawback?

Not all browsers support JavaScript(?!) Even the browser supports JavaScript, the user might not enable it!
Search engine may not be able to search the JavaScript contents (and therefore NOT for a professional web designer)
HTML Inline Frame: For example,
<iframe src="footer.html" width="780" height="200">
<a href="footer.html">Your browser does not support inline frame.
Click here to see the included contents.</a>
</iframe>
Drawback?

Again, not all browsers support Frame(?!)
Search engine may not be able to search the inline frame's contents.
How much space to be allocated for the inline frame?
2.  How to Format Tables via CSS
Formatting table using CSS is messy?!

How to Centralize a Table (or Block Elements such as Division)?
The old way of centralizing element via align="center|left|right|justify" attribute, e.g.,, <table align="center">...</table>, has been deprecated in HTML 4.
There is no such property called "align" in CSS.
There is only one(?) alignment property in CSS - a text property called text-align="center|left|right|justify". But "text-align:center" does not center the <table>, but centers the texts inside the table..
To center a table (or a block element such as <div>, <img>), you need to set the left and right margins to "auto" (to ask the browsers to compute the margin) as follows:

table {        /* <table> */
   margin-left: auto;
   margin-right: auto;
}

div#header {   /* <div id="header"> */
   margin-left: auto;
   margin-right: auto;
}
Browsers divides the remaining width equally between left and right margins, so as to center the block element.

How to Set the Width of the Table and Individual Columns?
You can use <table style="width:n|n%"> to set the width of the table, where n is measurement such as 300px or 80%. The percentage is relative to the containing element such as <div> or <body>. Take note that width, margin, border and padding properties are NOT inherited by its descendants (<tr>, <td>, and etc.)

To set the width of a columns or a set of columns, first declare appropriate <colgroup> or <col>, then use <colgroup|col span="numOfColumns" style="width:n|n%">. Take note that you can only apply background, border and width properties to <colgroup> and <col>. To make life easier, use only <col> with possibly span, and ignore <colgroup>.

You can also set the width of <td>. This is not recommended, as there are many <td>'s.

Since each table has its own width, it may not be feasible to set the width globally in CSS. I typically set it in the <table> tag. For example, this table has the width of 80% across the screen (or the parent), with 4 columns of width 50%, 10%, 10%, 30% (totaling 100%).

<table style="width:80%">             <!-- The table is 80% of screen width -->
  <col style="width:50%" />           <!-- column 1 is 50% of the table's width -->
  <col span="2" style="width:10%" />  <!-- column 2 and 3 is 10% of the table's width -->
  <col />                             <!-- column 4 takes the remaining -->
  <tr>......</tr>
  <tr>......</tr>
</table>
How to Format Tables via CSS?
Define a class for each sub-class of tables, e.g.,
.table-data { .... }
Note that class selector by itself is efficient, no need to use table.table-data.
Use the Descendant-Selector for the nested <tr>, <th> and <td>, e.g.,
.table-data tr { .... }
.table-data th { .... }  /* descendant, not necessarily child */
.table-data td { .... }
 
.center-block {               /* center a block element */
   margin-left: auto;
   margin-right: auto;
}
In the HTML documents, assign the <table> to the appropriate table's sub-class, e.g.,
<table class="table-data center-block">
  <tr>
    <th>...</th>
    ......
  </tr>
  <tr>
    <td>...</td>
    ......
  </tr>
  ......
</table>
Recall that class attribute can take multiple values. For example, if you need to center the table, you could define a class-selector says ".center-block", and apply this class to the desired HTML element as an additional class value.
How about using ID-selector for table? This works only if there is only one such table in each HTML document, because id must be unique within an HTML document. Not really practical!
How to Set Different Background for Different Columns?
Specify the background-color in <col> or <colgroup>. Sad to find out that <col> and <colgroup> only support attributes background, width and border. You cannot set the font-family, text-align, or even the foreground color. See below.

How to Set Different Styles for Different Columns
You can use the td:first-child to select the first column (or tr > :first-child to include <th>); td:nth-child(3) to select the 3rd column; td:nth-child(odd) to select the odd columns; td:nth-child(even) to select the even columns. The pseudo-element :nth-child(n) select the element only if it is the nth-child of the parent. [Take note that :odd and :even is for jQuery, not CSS.]

.table-data td:first-child {  /* all first column <td> */
   font-family: ...
}

.table-data tr > :first-child {  /* all first-child of <tr>, likely to be <th> or <td> */
   ....
}

.table-data tr > :nth-child(3) {  /* all 3rd-child of <tr> */
   ....
}

.table-data tr > :nth-child(even) {  /* all even-child of <tr> */
   ....
}
 
.table-data td:first-child + td {  /* all second column <td> */
   font-family: ...
}
How to Set Different Background for the Header Row, the Odd and Even Data Rows?
You could use tr:nth-child(even) to select the even rows; tr:nth-child(odd) to select the old rows; tr:first-child for the first row, and tr:last-child for the last row. For example, to set different background colors for alternate rows:

.table-data th {  /* For the header row */
   background-color: #66ffff;
}
 
.table-data tr:nth-child(even) td {  /* even rows */
   background-color: #ccffff;
}
 
.table-data tr.nth-child(odd) td {   /* odd rows */
   background-color: #eeffff;
}
How to Specify HTML <table>'s Deprecated Attributes border, cellpadding and cellspacing in CSS?
You can avoid the deprecated attributes by using the CSS properties border, padding and margin. cellpadding can be replaced by padding.

.table-data  {
   /* margin and padding for this table. Not cells. Not inherited */
   margin: ...;
   padding: ...;

   /* Default color and background color. Inherited. */
   color: ...; 
   background-color: ...;

   border: 2px solid black;     /* border of the table, specify the cells in td or th */
   border-collapse: separate;   /* or collapse|initial|inherit */
   border-spacing: 10px 5px;    /* horizontal and vertical spacing
                                   Replace cellspacing, for border-collapse:separate only */
}
 
.table-data th {
   padding: 4px 10px;  /* more top and bottom padding for header cells */
   margin: ...;
   color: ...;         /* Override colors for header cells */
   background-color: ...;
   border: 1px solid light-gray;
}
 
.table-data td {
   padding: 2px 10px;  /* top right bottom left */
   margin: ...;
   border: 1px solid light-gray;
}
3.  How to ...
3.1  How to underline text
The <u> (underline) tag is deprecated in HTML 4, to avoid confusion with hyperlinks which are often displayed as underlined. [I strong disagree, as I need underline frequently to represent special meaning such as default selection]. Take note that graphic designers generally hate underline, and treat it as a legacy of the old typewriter.

Use CSS property "text-decoration:underline". For example,

.underline {                     /* use this instead of <u> */
   text-decoration: underline;   /* underline text */
}
<p>This <span class="underline">part</span> is underlined.</p>
3.2  How to Center ...
The "align" attribute of most of the HTML tags has been deprecated in HTML 4.01 and XHTML 1.0 Strict DTD. Use CSS instead.

How to center text horizontally?
The presentation attribute align="left|right|center|justify" of the block-level tags (such as <p>, <h1> to <h6>) has been deprecated. Use CSS property "text-align:center" instead. For example,

p, h1, h2, h3 {
  text-align: center;   /* center text horizontally for block-level elements */
}
How to center a block-level element horizontally (e.g., <div>, <table>)?
Set the left and right margin to "auto", for example,

#main-content {                   /* for the main context <div> */
   width: 760px;
   margin: 10px auto 10px auto;   /* top right bottom left */
}

#header {
   width: 800px;
   margin-left: auto;
   margin-right: auto;
}
<div id="header"> ... </div>
<div id="main-content"> ... </div>
How to center an image horizontally?
The <img> tag's align attribute (of top, middle, bottom, left, right) specifies how the image aligns with the surrounding text. It is deprecated in HTML 4.01 and XHTML 1.0 Strict DTD, and cannot be used to centralize an image horizontally.

To centralize an image, you need to make it a block-element and then centralize the block, for example.

img.center {
   display: block;     /* render as a block-level element */
   margin: 5px auto;   /* top/down left/right */
}
<img class="center" src="logo.gif" />
How to center text vertically?
Use text-align to align text horizontally and vertical-align to align text vertically.

text-align: left|right|center|justify
vertical-align: top|middle|bottom|baseline
baseline works like top, except that the baseline of all the first lines of each cells are aligned,

#container {
   min-height: 200px;
   display: table-cell;
   vertical-align: middle;   /* align text vertically */
}
<div id="container">
  <p>Some text here ...</p>
</div>
3.3  How to Ensure that CSS is Refreshed after Modification
If you update a CSS and want to ensure it gets refreshed in every visitor's cache, a very popular method is to add a version number as a GET parameter. In this way, the CSS will get refreshed when the version number changes, but not more often than that. For example,

<link rel="stylesheet" type="text/css" href="styles.css?version=10">
3.4  How to set the tab-size of the browser
Use tab-size attribute. For example,

pre {
   tab-size: 3;       /* for Chrome  */
   -moz-tab-size: 3;  /* for firefox */
   -o-tab-size: 3;    /* for opera   */
}
3.5  How to apply different style for login page and the rest of the pages
In the login page (or home page), attached a class to the <body>, e.g., <body class="home">. You can then define descendant selector (such as .home table) to apply CSS.

4.  Miscellaneous
4.1  Document-Type Declaration <!DOCTYPE>
Does <!DOCTYPE> Matter?
An HTML document begins with a Document-Type Declaration <!DOCTYPE>, supposedly to be used by browsers to validate the HTML document. The DOCTYPE declares the standard (such as HTML5, XHTML1.0, HTML4.01) the document intends to conform to. However, it is interesting to note that no modern browsers actually use the DOCTYPE to validate the document?! So, why DOCTYPE?

The DOCTYPE declaration remains in the HTML5 document for historical reasons. Most browsers (including Internet Explorer and Firefox) operate in two modes: Standards mode and Quirks mode. If no DOCTYPE is detected (as the first line of the document), the browser runs in the quirks mode. Quirks mode is meant for older versions of HTML document (pre-HTML4, before 1999), which tolerates bad syntaxes. However, every browser's quicks mode is different, and you will not get consistent layout across the browsers. On the other hand, if a DOCTYPE is found, the browser runs in the stricter standards mode and renders the document with consistent formatting and layout across browsers.

It is interesting to note that most browsers don't care what DOCTYPE you use. They simply check that you have a DOCTYPE to switch into standards mode!

(To find the operation mode on Firefox, right-click on the page and select "View Page Info". It is shown under the "Render Mode" with value such as "standards compliance mode" or "quirks mode".)

I suggest that you always use HTML5 DOCTYPE in your documents.

HTML5 DOCTYPE (Recommended)
HTML5 defines a short DOCTYPE, which contains the document's root element name, html, as follows:

<!DOCTYPE html>
<html>
  .......
</html>
HTML5 define the shortest possible DOCTYPE to switch the browsers into standards mode. It does not specify the version, i.e., it uses html instead of html5, to signal that it is applicable to all HTML document, old, new and possibly future.

Pre-HTML5, XHTML1.0, HTML5, XHTML5
HTML is a sloppy language. It is easy to write but poses great challenge to browsers. XHTML tidies up HTML with stricter syntactic rules. The differences between HTML4 and XHTML1.0, in terms of syntax validation, are:

All XHTML elements must be properly nested. For example, <a><b>...</a></b> is invalid.
All XHTML elements must be properly closed, either using a pair of opening and closing tags (e.g., <p>...</p>), or a stand-alone tag with a trailing '/' (e.g., <br />).
XHTML elements are case-sensitive. All elements and attributes are defined in lowercase, e.g., <html>, <head>, <body>.
XHTML's attribute values must be quoted (in single quotes or double quotes) in the form of name="value" or name='value'. Missing value is not allowed. Example, you need to write <input type="checkbox" checked="checked">.
XHTML document technically should begin with this declaration to declare that it is a XML document.
<?xml version="1.0" encoding="UTF-8"?>
All XHTML elements are nested inside the root element <html>....</html>, with mandatory <head>...</head> and <body>...</body> sections.
HTML5 loosens many of these restrictions:

The <html>, <head>, and <body> tags are optional. But it is best to keep them.
The tagname and attribute names are NOT case-sensitive, e.g. <HEAD>, <Head> are all valid <head> tag. However, it is best to keep them in lowercase.
The attribute's value is no longer needed to be quoted (but, it is best to quote them). Missing attribute value is allowed, e.g., you can write <input type="checkbox" checked>, instead of <input type="checkbox" checked="checked"> (this is welcomed by developers).
The closing slash of a standalone tag is optional, e.g., you can write <br>, instead of <br />or <br></br> (this is also welcomed by developers).
XHTML5 is HTML5 with the stricter rules of XHTML. You need to include the XHTML5 name-space in the <html> tag, as follows:

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
  ......
</html>
Pre-HTML5 DOCTYPE
I keep this section here for historical review?!

Prior to HTML5, the <!DOCTYPE> element uses a syntax conforms to SGML to refer to a DTD (Document-Type Definition), as follows:

<!DOCTYPE root-element PUBLIC "FPI" "DTD-URI" >
<!DOCTYPE root-element SYSTEM "DTD-URI" >
The root-element is the first element opened (after the DOCTYPE declaration) and last one closed. In this case "html" for HTML document.
The keywords SYSTEM and PUBLIC specifies the type of DTD - one that is on a private SYSTEM or one that is open to the PUBLIC. For PUBLIC DTD, it is followed by a restricted form of "Public Identifier" called Formal Public Identifier (FPI), and a "System Identifier" in the form of URI locating the public DTD file.
The DTD file is a XML document that defines the structure of a valid document.
For example, the DOCTYPE for XHTML 1.0 is as follows:

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
The public identifier is "-//W3C//DTD XHTML 1.0 Strict//EN"; the system identifier (which locates the DTD) is "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd". A validator may use either identifier for locating the referenced external entity.

HTML 4.01 and XHTML 1.0 have three flavors: strict, transitional and frameset. The strict prohibits the use of deprecated tags, whereas transitional and frameset permit the use of deprecated tags. Frameset also recognizes the <frameset> and <frame> tags. The various DOCTYPE declarations are:

HTML 4.01 Strict:
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  .....
</html>
HTML 4.01 Transitional:
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
HTML 4.01 Frameset:
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
XHTML 1.0 Strict:
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  ......
</html>
XHTML 1.0 Transitional:
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
XHTML 1.0 Frameset:
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
4.2  Declaring the Charset
It is important to declared the charset (character encoding scheme) used for the encoding (saving) of the HTML file, so that the browsers can properly decode the document. To understand charset, read "Character Encoding".

The charset is declared in the <meta> tag of the <head> section.

HTML5
HTML5 simplifies this declaration to:

<meta charset="UTF-8">
Pre-HTML-5
<meta http-equiv="Content-Type" content="text/html; charset=your-character-set">
This <meta> tag instructs the HTTP server to include the following response header, when the file is downloaded by web users (to be rendered by the browser):

Content-Type: text/html; charset=your-character-set
UTF-8 Charset
I suggest that you use "UTF-8" character set, which supports Unicode characters for internationalization, and is backward compatible with ASCII. You should save your HTML file as "UTF-8, No BOM (Byte-Order Mark)". For example, in Windows' NotePad or NotePad++, choose UTF-8 encoding in the "save-as" menu; in Mac's TextEdit, set "Format" to "Make Plain Text", and choose "Unicode (UTF-8)" for character encoding.

4.3  The <body> Tag's Deprecated Attributes
The <body> tag's attributes color (text), bgcolor (background color), background (background image), link (unvisited link), vlink (visited link), alink (active link) have been deprecated. Use the following CSS styles instead.

body {
   color: black;                   /* foreground color for texts */ 
   background-color: white;        /* background color */
   background-image: bg_logo.jpg;  /* URL of the background image */
   background-position: top left;  /* image starts from top left corner */
   background-repeat: repeat-y;    /* repeat the image in y-direction */
}
a:link     { color: blue   }       /* unvisited links */
a:visited  { color: gray   }       /* visited links */
a:hover    { color: red    }       /* when you place the mouse over the link */
a:active   { color: yellow }       /* when you click on the link */
4.4  Some Interesting Unicode Symbols
Ticks and Crosses
✓ (&#x2713;) ✔ (&#x2714;) ✕ (&#x2715;) ✖ (&#x2716;) ✗ (&#x2717;) ✘ (&#x2718;)

My choices: ✔ (&#x2714;) ✘ (&#x2718;)

Hidden Characters
→   (&rarr;) for tab

¶   (&para;) for paragraph mark

·   (&middot;) for space

Navigation
•   (&bull;) as separator

▿   (&#x25bf;) white down-pointing small triangle

◃   (&#x25c3;) white left-pointing small triangle

▹   (&#x25b9;) white right-pointing small triangle

▵   (&#x25b5;) white up-pointing small triangle
