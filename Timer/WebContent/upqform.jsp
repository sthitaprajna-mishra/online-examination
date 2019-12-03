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
String sql ="select * from questions where num = " + match;
resultSet = statement.executeQuery(sql);
String q = null;
String o1 = null;
String o2 = null;
String o3 = null;
String o4 = null;
String a = null;
String abc = null;
while(resultSet.next()){
	q = resultSet.getString("question");
	o1 = resultSet.getString("op1");
	o2 = resultSet.getString("op2");
	o3 = resultSet.getString("op3");
	o4 = resultSet.getString("op4");
	a = resultSet.getString("answer");
}
abc = "this is a string with spaces";
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
<form name = "forma" action = "upq.jsp">
	<h3>Edit question set</h3>
	Question: <input type = "text" name = "question" value = "<%= q %>">
	Option 1: <input type = "text" name = "op1" value = "<%= o1 %>"> 
	Option 2: <input type = "text" name = "op2" value = "<%= o2 %>"> 
	Option 3: <input type = "text" name = "op3" value = "<%= o3 %>"> 
	Option 4: <input type = "text" name = "op4" value = "<%= o4 %>"> 
	Answer: <input type = "text" name = "answer" value = "<%= a %>"> 
	<input type = "hidden" name = "id" value = <%= match %>>
	<input type ="submit" value = "Update">
</form>
</div>