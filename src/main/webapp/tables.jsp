<%@page import="project.ConnectionProviderClass" %>
<%@page import="java.sql.*" %>
<%
try{
	Connection con=ConnectionProviderClass.getcon();
	Statement st=con.createStatement();
	String q1="create table users(name varchar(100),email varchar(50)primary key,mobilenumber bigint, securityquestion varchar(200),answer varchar(200),password varchar(100),address varchar(500), city varchar(100),state varchar(100),country varchar(100))";
	String q2="create table product(id int,name varchar(50),category varchar(50),price int,active varchar(3))";
	String q3="create table cart (email varchar(200),product_id int,quantity int,price int,total int,address varchar(500),city varchar(100), state varchar(100),country varchar(100),mobilenumber varchar(10),orderdate varchar(100),deliverydate varchar(100),paymentmethod varchar(100),transaction_id varchar(100),status varchar(100));";
	String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),PRIMARY KEY(id))";
	//System.out.println(q3);
	System.out.println(q4);
	//st.executeUpdate(q1);
	//st.executeUpdate(q2);
	st.executeUpdate(q4);
	System.out.println("table created");
	con.close();
}
catch (Exception e){
	System.out.println(e);
	
}
%>