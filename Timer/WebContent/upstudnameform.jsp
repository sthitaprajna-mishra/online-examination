<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random" %>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "exam";
String userid = "root";
String password = "19571966";
String match = request.getParameter("id");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from students where userId = " + match;
resultSet = statement.executeQuery(sql);
String name = null;
String id = null;
while(resultSet.next()){
	name = resultSet.getString("studentName");
	id = resultSet.getString("userId");
}
%>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

<div>
<form name = "forma" action = "upstudname.jsp">
	New Student Name: <input id = "fname" type = "text" name = "studname">
	Old Student Name: <input id = "lname" type = "text" name = "oldname" value = "<%= name %>"> 
	<input type = "hidden" name = "studid" value = <%= id %>>
	<input type ="submit" value = "Update">
</form>
</div>