<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<html>
<head>
    <title>Code Editor</title>
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript" src="js/codemirror/codemirror.js"></script>
    <script type="text/javascript" src="js/codemirror/mode/css.js"></script>
    <script type="text/javascript" src="js/codemirror/mode/javascript.js"></script>
    <script type="text/javascript" src="js/codemirror/mode/xml.js"></script>
    <script type="text/javascript" src="js/codemirror/mode/htmlmixed.js"></script>
    <script type="text/javascript" src="js/codemirror/addon/matchbrackets.js"></script>
    <script type="text/javascript" src="js/codemirror/addon/continuecomment.js"></script>
    <script type="text/javascript" src="js/codemirror/addon/closetag.js"></script>
    <script type="text/javascript" src="js/codemirror/addon/closebrackets.js"></script>
    <script type="text/javascript" src="js/codemirror/addon/active-line.js"></script>
    <script type="text/javascript" src="js/editor.js"></script>
    <link href="css/codemirror.css" type="text/css" rel="stylesheet"/>
    <link href="css/editor.css" type="text/css" rel="stylesheet"/>
</head>
<body>
See the output <a href="output.jsp" target="_blank">here</a>
<button id="submit-code">Save</button>
<div>
    <div id="left-pane">
        <div id="html-editor">
            <label for="html-input" class="maximizable">HTML:</label>
            <textarea id="html-input" class="editor-area">${sessionScope["HtmlInput"]}</textarea>
        </div>
    </div>
    <div id="right-pane">
        <div id="javascript-editor">
            <label for="javascript-input" class="maximizable">Javascript:</label>
            <textarea id="javascript-input" class="editor-area">${sessionScope["JavascriptInput"]}</textarea>
        </div>
        <div id="css-editor">
            <label for="css-input" class="maximizable">CSS:</label>
            <textarea id="css-input" class="editor-area">${sessionScope["CssInput"]}</textarea>
        </div>
    </div>
</div>
</body>
</html>