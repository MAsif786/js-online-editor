package com.xconf.code.editor.servlets;

import com.xconf.code.editor.data.CodeSnippet;
import com.xconf.code.editor.data.DataAccess;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;

public class ShareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String html = session.getAttribute("HtmlInput").toString();
        String css = session.getAttribute("CssInput").toString();
        String javascript = session.getAttribute("JavascriptInput").toString();
        String snippetIdentifier = session.getId() + System.currentTimeMillis();
        String ajaxResponse = "";
        try {
            new DataAccess().saveCodeSnippet(new CodeSnippet(html, css, javascript, snippetIdentifier));
            ajaxResponse = "loadsnippet?id="+ URLEncoder.encode(snippetIdentifier, "UTF8");
            response.setStatus(200);
        } catch (SQLException e) {
            response.setStatus(500);
            e.printStackTrace();
        }
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.print(ajaxResponse);
        outputStream.close();
    }
}
