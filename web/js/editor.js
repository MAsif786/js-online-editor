$(function () {
    window.javascriptEditor = CodeMirror.fromTextArea(document.getElementById("javascript-input"),
        {
            mode: "javascript",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true,
            theme: "erlang-dark"
        });
    window.cssEditor = CodeMirror.fromTextArea(document.getElementById("css-input"),
        {
            mode: "css",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true,
            theme: "erlang-dark"
        });
    window.htmlEditor = CodeMirror.fromTextArea(document.getElementById("html-input"),
        {
            mode: "htmlmixed",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true,
            theme: "erlang-dark"
        });

    var saveCode = function (successCallback) {
        $.ajax({
            url: "savecode",
            type: "POST",
            data: {
                css: cssEditor.getValue(),
                javascript: javascriptEditor.getValue(),
                html: htmlEditor.getValue()
            }
        }).done(successCallback);
    };

    $("#submit-code").click(function () {
        saveCode(function () {
            $.notify({text: "Checkout the output page for changes", title: "Saved!", icon: "images/dialog-information.png"});
        });
    });

    $("#share-code").click(function () {
        saveCode(function () {

        });
    });

});