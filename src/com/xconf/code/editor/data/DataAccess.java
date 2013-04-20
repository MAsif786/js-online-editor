package com.xconf.code.editor.data;

import java.sql.*;

public class DataAccess {

    private static final String CONNECTION_STRING = "jdbc:microsoft:sqlserver://localhost:1433;databaseName=xconf";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "!4321abcd";

    public DataAccess() throws SQLException {
        try {

            Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
        } catch (InstantiationException e) {
            throw new SQLException("Unable to load driver", e);
        } catch (IllegalAccessException e) {
            throw new SQLException("Unable to load driver", e);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Unable to load driver", e);
        }
    }

    public void saveCodeSnippet(CodeSnippet codeSnippet) throws SQLException {
        Connection connection = DriverManager.getConnection(CONNECTION_STRING, USERNAME, PASSWORD);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into codesnippet values(?,?,?,?)");
            preparedStatement.setString(1, codeSnippet.getSnippetIdentifier());
            preparedStatement.setString(2, codeSnippet.getHtmlCode());
            preparedStatement.setString(3, codeSnippet.getJavascriptCode());
            preparedStatement.setString(4, codeSnippet.getCssCode());

            preparedStatement.executeUpdate();
        } finally {
            connection.close();
        }

    }

    public CodeSnippet fetchCodeSnippet(String snippetIdentifier) throws SQLException {
        Connection connection = DriverManager.getConnection(CONNECTION_STRING, USERNAME, PASSWORD);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from codesnippet where snippetidentifier=?");
            preparedStatement.setString(1, snippetIdentifier);
            ResultSet resultSet = preparedStatement.executeQuery();
            CodeSnippet codeSnippet = null;
            if (resultSet.next()) {
                codeSnippet = new CodeSnippet(resultSet.getString("htmlcode"), resultSet.getString("javascriptcode"), resultSet.getString("csscode"), snippetIdentifier);
            }
            return codeSnippet;
        } finally {
            connection.close();
        }
    }

}
