<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<title>Instructions | Online Examination Portal | CET Bhubaneshwar</title>
</head>

<style>

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

String connectionURL = "jdbc:mysql://localhost:3306/exam";
// declare a connection by using Connection interface
Connection connection = null;
/* declare object of Statement interface that is used for executing sql 
statements. */
Statement statement = null;
Statement st = null; 
//Statement st = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
ResultSet r = null;
//ResultSet newrs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("com.mysql.jdbc.Driver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
connection = DriverManager.getConnection(connectionURL, "root", "19571966");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
st = connection.createStatement();
//st = connection.createStatement(); 
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from instructions";
rs = statement.executeQuery(QueryString);
r = st.executeQuery("select * from students where userId = " + uid);
String name = null;
while(r.next()){
	name = r.getString("studentName");
}
//String query = "select studentName from students where userId = '" + uid + "' and password = '" + upwd +"';";
//while (newrs.next()){
	//newrs.getString(1);
//}
%>

<center>
<h1 style = "color: #333333;">Welcome, <%= name %></h1><br>
<u><h2 style = "color: #333333;">Instructions</h2></u><br>


<TABLE>
<%
while (rs.next()) {
%>
<TR>
<TD style = "color: #4d4d4d;"><%=rs.getString(1)%></TD>
</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println(ex);
}
%>
</TABLE><br>
<button><a href = "practice.jsp">Start exam</a></button>
</center>
</font>
</body>
</html>