$(function () {
    window.javascriptEditor = CodeMirror.fromTextArea(document.getElementById("javascript-input"),
        {
            mode: "javascript",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true
        });
    window.cssEditor = CodeMirror.fromTextArea(document.getElementById("css-input"),
        {
            mode: "css",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true
        });
    window.htmlEditor = CodeMirror.fromTextArea(document.getElementById("html-input"),
        {
            mode: "htmlmixed",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true
        });

    $(".maximizable").click(function (event) {
        var elementToBeMoved = event.currentTarget;
        var parentElement = elementToBeMoved.parentElement;
        var leftPaneElement = document.getElementById("")
    });

    $("#submit-code").click(function () {
        $.ajax({
            url: "savecode",
            type: "POST",
            data: {
                css: cssEditor.getValue(),
                javascript: javascriptEditor.getValue(),
                html: htmlEditor.getValue()
            }
        }).done(function () {
                alert("Refresh the results page to see the output");
            });
    });
});