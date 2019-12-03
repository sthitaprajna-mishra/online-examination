<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String newName = request.getParameter("studname");
String oldId = request.getParameter("studid");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "19571966");
Statement st=conn.createStatement();
st.executeUpdate("update students set studentName = \'" + newName + "\' where userId ="+oldId);
out.print("<p style=\"color:red\">Data updated successfully!</p>"); %> 
<jsp:include page="adminOne.jsp"/>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>