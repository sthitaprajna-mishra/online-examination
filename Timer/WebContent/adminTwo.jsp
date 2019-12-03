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
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
input[type=text], input[type=password], select {
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
  font-size: 20px; 
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}


#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

h2{
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
}
</style>
<body>
<h2>Instructions</h2>
<table border="1" id = "customers">
<tr>
<th>Instruction</th>
<th>Delete Instruction</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from instructions";
resultSet = statement.executeQuery(sql);
int i=0;
Random randint = new Random();
String rnum = Integer.toString(randint.nextInt(5000));
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("instr") %></td>
<td><a href="deInst.jsp?instruction=<%=resultSet.getString("num") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>
<%
i++;
}%>
</table>
<br>

<h2>Add new instruction</h2>

<div>
  <form action="addInst.jsp">
    
    <input type="hidden" id="lname" name="num" value = <%= rnum %>>
    
    <label for="fname">New Instruction</label>
    <input type="text" id="fname" name="instruction">
 
    <input type="submit" value="Add">
  </form>
</div>

<%
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>