<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "19571966");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM questions WHERE num="+id);
out.print("<p style=\"color:red\">Data deleted successfully!</p>"); %>
<jsp:include page="adminThree.jsp"/>
<% 
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>