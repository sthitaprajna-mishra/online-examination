<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>Admin Dashboard | Online Examination Portal | CET Bhubaneshwar</title>
</head>

<style>

#ex{
	color: #4CAF50;
}

button {
  background-color: #4CAF50; /* Green */
  border: none;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  border-radius: 12px;
  cursor: pointer;
}

table{
	font-size: 20px;
}

a{
	text-decoration: none;
	color: white;
	font-weight: bold;
}

</style>

<body>

<%
try {
/* Create string of connection url within specified format with machine
name, port number and database name. Here machine name id localhost and 
database name is student. */

String uid = request.getParameter("username");
String upwd = request.getParameter("userpass");

%>

<center>
<h1 style = "color: #333333;">Welcome, <%= uid %></h1><br>

<TABLE>

<TR>
<TD style = "color: #4d4d4d;"><button><a href = "adminOne.jsp">Add/Update Student</a></button></TD>
<TD style = "color: #4d4d4d;"><button><a href = "adminTwo.jsp">Add/Update Instruction</a></button></TD>
</TR>

<TR>
<TD style = "color: #4d4d4d;"><button><a href = "adminThree.jsp">Add/Update Question</a></button></TD>
<TD style = "color: #4d4d4d;"><button><a href = "home.html">Exit<span id ="ex">/Update Instruction</span></a></button></TD>
</TR>

<%

} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println(ex);
}
%>
</TABLE><br>
</center>
</font>
</body>
</html>