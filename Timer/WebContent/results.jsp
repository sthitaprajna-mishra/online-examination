<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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


try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

Statement stmt = connection.createStatement();
String noOfAttempted = "select count(*) from answers";

String compareAnswer = "SELECT answer FROM questions LEFT JOIN answers USING (answer) WHERE answers.answer IS NULL";
Statement compare = connection.createStatement();
ResultSet rs = compare.executeQuery(compareAnswer);
ResultSet no = stmt.executeQuery(noOfAttempted);
int total = 0;
while (no.next()) {
	total = no.getInt(1);
}
int noOfWrongs = 0;
while (rs.next()) {
	noOfWrongs++;
}
int correct = total - noOfWrongs;

PreparedStatement ps = connection.prepareStatement("insert into displayResults values(?, ?, ?)");
ps.setInt(1, total);
ps.setInt(2, correct);
ps.setInt(3,  correct);

while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
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

a{
	text-decoration: none;
	color: white;
	font-weight: bold;
}

</style>
<body>
<button><a href = "home.html">Exit</a></button>
<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>1</td>
<td>2</td>

</tr>

<tr>
<td>Number of questions attempted</td>
<td><%=resultSet.getString(1) %></td>
</tr>
<tr>
<td>Number of correct answers</td>
<td><%=resultSet.getString(2) %></td>
</tr>
<tr>
<td>Total marks obtained</td>
<td><%=resultSet.getString(3) %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


</body>
</html>