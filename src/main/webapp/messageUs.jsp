<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
if("invalid".equals(msg)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
 <input class="input-style" type="text" name="subject" id="" placeholder="subject" required>
 <hr>
 <textarea class="input-style" name="body" id="" placeholder="Enter your message" required></textarea>
<hr>
<button class="button" type="submit">Send</button>
</form>
<br><br><br>
</body>
</html>