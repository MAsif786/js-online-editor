package com.xconf.code.editor.servlets;

import com.xconf.code.editor.data.CodeSnippet;
import com.xconf.code.editor.data.DataAccess;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LoadSnippetServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String snippetIdentifier = request.getParameter("id");
        HttpSession session = request.getSession(true);
        if(snippetIdentifier != null && !snippetIdentifier.isEmpty()) {
            try {
                CodeSnippet codeSnippet = new DataAccess().fetchCodeSnippet(snippetIdentifier);
                session.setAttribute("HtmlInput", codeSnippet.getHtmlCode());
                session.setAttribute("CssInput", codeSnippet.getCssCode());
                session.setAttribute("JavascriptInput", codeSnippet.getJavascriptCode());
            } catch (SQLException ex) {
            }
        }
        response.sendRedirect("/editor");
    }
}
