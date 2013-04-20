package com.xconf.code.editor.servlets;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;

public class SaveServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession(true);
        session.setAttribute("HtmlInput", request.getParameter("html"));
        session.setAttribute("CssInput", request.getParameter("css"));
        session.setAttribute("JavascriptInput", request.getParameter("javascript"));
    }
}
