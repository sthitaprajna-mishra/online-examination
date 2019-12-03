<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String question =request.getParameter("question");
String one = request.getParameter("op1");
String two = request.getParameter("op2");
String three = request.getParameter("op3");
String four = request.getParameter("op4");
String answer = request.getParameter("answer");
String num = request.getParameter("num");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "19571966");
PreparedStatement st=conn.prepareStatement("insert into questions values(?, ?, ?, ?, ?, ?, ?)");
st.setString(1, question);
st.setString(2, one);
st.setString(3, two);
st.setString(4, three);
st.setString(5, four);
st.setString(6, answer);
st.setString(7, num);
st.executeUpdate();
out.print("<p style=\"color:red\">Data added successfully!</p>"); %> 
<jsp:include page="adminThree.jsp"/>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>