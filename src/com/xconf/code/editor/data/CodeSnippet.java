package com.xconf.code.editor.data;

public class CodeSnippet {
    private String htmlCode;
    private String javascriptCode;
    private String cssCode;
    private String snippetIdentifier;

    public CodeSnippet(String htmlCode, String javascriptCode, String cssCode, String snippetIdentifier) {
        this.htmlCode = htmlCode;
        this.javascriptCode = javascriptCode;
        this.cssCode = cssCode;
        this.snippetIdentifier = snippetIdentifier;
    }

    public String getHtmlCode() {
        return htmlCode;
    }

    public String getJavascriptCode() {
        return javascriptCode;
    }

    public String getCssCode() {
        return cssCode;
    }

    public String getSnippetIdentifier() {
        return snippetIdentifier;
    }
}
