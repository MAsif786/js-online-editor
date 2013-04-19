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
    <script type="text/javascript" src="js/jquery.notify.js"></script>
    <script type="text/javascript" src="js/mousetrap.js"></script>
    <script type="text/javascript" src="js/jquery.simplemodal.js"></script>
    <script type="text/javascript" src="js/editor.js"></script>

    <!-- image preloading -->
    <script type="text/javascript">
        (function preloadImages() {
            var images = ["images/dialog-warning.png", "images/dialog-error.png", "images/dialog-information.png"];
            for (var index = 0; index < images.length; index++) {
                new Image().src = images[index];
            }
        })();
    </script>

    <!-- stylesheets -->
    <link href="css/codemirror.css" type="text/css" rel="stylesheet"/>
    <link href="css/editor.css" type="text/css" rel="stylesheet"/>
    <link href="css/theme/lesser-dark.css" type="text/css" rel="stylesheet"/>
    <link href="css/notify.css" type="text/css" rel="stylesheet"/>
    <link href="css/basic.css" type="text/css" rel="stylesheet"/>

    <!-- Web fonts -->
    <link href='http://fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Noto+Serif' rel='stylesheet' type='text/css'>

</head>
<body>
See the output <a href="output.jsp" target="_blank">here</a>
<button id="submit-code">Save</button>
<button id="share-code">Share</button>
<div id="shortcuts-help-dialog">
    <h1>Keyboard shortcuts</h1>
    <table>
        <tr>
            <th>Key binding</th>
            <th>Purpose</th>
        </tr>
        <tr>
            <td>Cmd+h, Ctrl+h</td>
            <td>Focus the HTML editor</td>
        </tr>
        <tr>
            <td>Cmd+j, Ctrl+j</td>
            <td>Focus the Javascript editor</td>
        </tr>
        <tr>
            <td>Cmd+k, Ctrl+k</td>
            <td>Focus the CSS editor</td>
        </tr>
        <tr>
            <td>Cmd+s, Ctrl+s</td>
            <td>Save your code</td>
        </tr>
        <tr>
            <td>?</td>
            <td>Show the help dialog</td>
        </tr>
    </table>
    When you're already inside the editor, press Esc and then use these shortcuts, we were too lazy to add one more event listener :)
</div>
<div>
    <div id="html-editor">
        <label for="html-input" class="maximizable">HTML:</label>
        <textarea id="html-input" class="editor-area">${sessionScope["HtmlInput"]}</textarea>
    </div>
    <div id="javascript-editor">
        <label for="javascript-input" class="maximizable">Javascript:</label>
        <textarea id="javascript-input" class="editor-area">${sessionScope["JavascriptInput"]}</textarea>
    </div>
    <div id="css-editor">
        <label for="css-input" class="maximizable">CSS:</label>
        <textarea id="css-input" class="editor-area">${sessionScope["CssInput"]}</textarea>
    </div>
</div>
</body>
</html>