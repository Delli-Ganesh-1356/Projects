<%@page import="project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
System.out.println("ok");
String id2=id.toString();
try
{
Connection con=ConnectionProviderClass.getcon();
PreparedStatement st=con.prepareStatement("insert into product values(?,?,?,?,?)");
st.setString(1, id2);
st.setString(2, name);
st.setString(3, category);
st.setString(4, price);
st.setString(5, active);
st.executeUpdate();
System.out.println("s");
response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>
