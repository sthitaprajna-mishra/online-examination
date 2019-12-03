<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("username");
String password = request.getParameter("pwd");
String id = request.getParameter("userid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "19571966");
PreparedStatement st=conn.prepareStatement("insert into students values(?, ?, ?)");
st.setString(1, id);
st.setString(2, password);
st.setString(3, name);
st.executeUpdate();
out.print("<p style=\"color:red\">Data added successfully!</p>"); %> 
<jsp:include page="adminOne.jsp"/>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>