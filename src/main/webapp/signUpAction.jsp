<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String securityquestion = request.getParameter("securityquestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");

if(name != null && email != null && mobilenumber != null && securityquestion != null && answer != null && password != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineecomproject", "root", "1356");
        String query = "INSERT INTO users(name,email,mobilenumber,securityquestion,answer,password) VALUES(?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobilenumber);
        ps.setString(4, securityquestion);
        ps.setString(5, answer);
        ps.setString(6, password);
        int i = ps.executeUpdate();

        if(i > 0) {
            response.sendRedirect("signup.jsp?msg=valid");
        } else {
            response.sendRedirect("signup.jsp?msg=invalid");
        }

    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("signup.jsp?msg=invalid");
    }
} else {
    response.sendRedirect("signup.jsp?msg=invalid");
}
%>
    