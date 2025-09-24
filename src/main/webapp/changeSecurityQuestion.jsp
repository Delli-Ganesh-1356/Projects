<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%

if("invalid".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
 
 <form action="changesqAction.jsp">
<h3>Select Your New Securtiy Question</h3>
  <select name="securityquestion" class="input-style">
  <option value="Your elementary school name">Your elementary school name</option>
  <option value="What is favourite sport?">What is favourite sport?</option>
  <option value="Who is your favourite sportsperson?">Who is your favourite sportsperson?</option>
  </select>
 <hr>

 <h3>Enter Your New Answer</h3>
       <input type="text" name="newanswer" id="" placeholder="Enter your new answer" required class="input-style">
<hr>
<h3>Enter Password (For Security)</h3>
       <input type="password" name="password" id="" placeholder="Enter your Password(for security)" required class="input-style">

<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>

</body>
<br><br><br>
</html>