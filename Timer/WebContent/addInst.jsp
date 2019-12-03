<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("instruction");
String num = request.getParameter("num");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "19571966");
PreparedStatement st=conn.prepareStatement("insert into instructions values(?, ?)");
st.setString(1, name);
st.setString(2, num);
st.executeUpdate();
out.print("<p style=\"color:red\">Data added successfully!</p>"); %> 
<jsp:include page="adminTwo.jsp"/>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>