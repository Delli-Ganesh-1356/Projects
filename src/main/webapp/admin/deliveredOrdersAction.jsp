<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String id=request.getParameter("id");
String status="delivered";
try{
	Connection con=ConnectionProviderClass.getcon();
	Statement st=con.createStatement();
	st.execute("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=invalid");
}
%>