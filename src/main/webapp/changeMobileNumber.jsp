<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change mobile number</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>
<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changemobilenumberAction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="newmobilenumber" id="" placeholder="Enter your new mobile number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" id="" placeholder="Enter your Password (for security)" required>
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>