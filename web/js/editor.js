$(function () {
    CodeMirror.commands.autocomplete = function(cm) {
        CodeMirror.showHint(cm, CodeMirror.javascriptHint);
    }
    window.javascriptEditor = CodeMirror.fromTextArea(document.getElementById("javascript-input"),
        {
            mode: "javascript",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            extraKeys: {"Ctrl-Space": "autocomplete"},
            styleActiveLine: true,
            theme: "lesser-dark"
        });
    window.cssEditor = CodeMirror.fromTextArea(document.getElementById("css-input"),
        {
            mode: "css",
            lineNumbers: true,
            matchBrackets: true,
            autoCloseBrackets: true,
            styleActiveLine: true,
            theme: "lesser-dark"
        });
    window.htmlEditor = CodeMirror.fromTextArea(document.getElementById("html-input"),
        {
            mode: "htmlmixed",
            lineNumbers: true,
            autoCloseTags: true,
            styleActiveLine: true,
            theme: "lesser-dark"
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

    var saveWithNotification = function () {
        saveCode(function () {
            $.notify({text: "Checkout the output page for changes", title: "Saved!", icon: "images/dialog-information.png"});
        });
    };

    $("#submit-code").click(function () {
        saveWithNotification();
    });

    $("#share-code").click(function () {
        saveCode(function () {

        });
    });

    Mousetrap.bind(["command+k", "ctrl+k"], function () {
        cssEditor.focus();
        return false;
    });

    Mousetrap.bind(["command+h", "ctrl+h"], function () {
        htmlEditor.focus();
        return false;
    });

    Mousetrap.bind(["command+j", "ctrl+j"], function () {
        javascriptEditor.focus();
        return false;
    });

    Mousetrap.bind(["command+s", "ctrl+s"], function () {
        saveWithNotification();
        return false;
    });

    Mousetrap.bind("?", function () {
        $("#shortcuts-help-dialog").modal();
        return false;
    });

});