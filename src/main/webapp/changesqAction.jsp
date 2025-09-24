<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String sq=request.getParameter("securityquestion");
String newanswer=request.getParameter("newanswer");
String password=request.getParameter("password");
int check=0;
 try{
	 Connection con=ConnectionProviderClass.getcon();
	 Statement st=con.createStatement();
	 ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set securityquestion='"+sq+"',answer='"+newanswer+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=valid");
	}
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=invalid");
	}
 }
catch(Exception e){
	System.out.println(e);
}
 %>