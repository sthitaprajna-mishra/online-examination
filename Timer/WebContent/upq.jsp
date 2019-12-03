<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String question = request.getParameter("question");
String op1 = request.getParameter("op1");
String op2 = request.getParameter("op2");
String op3 = request.getParameter("op3");
String op4 = request.getParameter("op4");
String answer = request.getParameter("answer");
String num = request.getParameter("id");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "19571966");
Statement st=conn.createStatement();
st.executeUpdate("update questions set question = \'" + question + "\' , op1 = \'" + op1 + "\' , op2 = \'" + op2 + "\' , op3 = \'" + op3 + "\' , op4 = \'" + op4 + "\' , answer = \'" + answer + "\' where num ="+num);
out.print("<p style=\"color:red\">Data updated successfully!</p>"); %> 
<jsp:include page="adminThree.jsp"/>
<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>