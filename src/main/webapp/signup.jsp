<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="signup" method="post">
     <input type="text" name="name" id="" placeholder="Enter your name">
      <input type="email" name="email" id="" placeholder="Enter your email id">
      <input type="number" name="mobilenumber" id="" placeholder="Enter your mobile number">
      <select name="securityquestion" id="">
       <option value="What is favourite sport?">What is favourite sport?</option>
       <option value="Your elementary school name">Your elementary school name</option>
       <option value="Who is your favourite sportsperson?">Who is your favourite sportsperson?</option>
      </select>
      <input type="text" name="answer" id="" placeholder="answer">
      <input type="password" name="password" id="" placeholder="Password">
      <input type="submit" value="submit">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>Successfully Registered</h1>
<% }%>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>