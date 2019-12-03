<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<script>

function moveNext()
{
    var counter = 0
    counter = parseInt(document.forma.hidden.value) + 1
    document.forma.hidden.value = counter
    forma.submit()
}    
function movePrevious()
{
    var counter = 0
    counter = parseInt(document.forma.hidden.value) - 1
    document.forma.hidden.value = counter
    forma.submit()
} 


var deadline = new Date("Nov 26, 2019 12:55:55").getTime(); 
var x = setInterval(function() { 
var now = new Date().getTime(); 
var t = deadline - now; 
var days = Math.floor(t / (1000 * 60 * 60 * 24)); 
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60)); 
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
var seconds = Math.floor((t % (1000 * 60)) / 1000); 
document.getElementById("demo").innerHTML = hours + "h " + minutes + "m " + seconds + "s "; 
	if (t < 0) { 
		clearInterval(x); 
		document.getElementById("demo").innerHTML = "EXPIRED"; 
		document.forma.p.disabled = true;
		document.forma.n.disabled = true;
		document.formb.send.style.display = "block";
	} 
}, 1000);


</script>

<style>

	#timer, #demo{
		float: right;
		font-size: 30px;
		font-weight: bold;
	}
	
	#demo{
		color: #00cc00;
	}
	
	#extra{
		color: white;
	}
	
	h3{
		padding-left: 30px;
	}

</style>
<body>

<% int current = 0;
Connection connection = null;
ResultSet rs = null;
%>
<FORM NAME="forma" ACTION="practice.jsp" METHOD="post">
	
    <div id = "timer">Timer: <span id = "extra">h</span> <span id="demo"></span></div>

<%

if (request.getParameter("hidden") != null) {
current = Integer.parseInt(request.getParameter("hidden"));
}

Statement statement = null;
PreparedStatement insert = null;
PreparedStatement compare = null;
String insertAnswer = "insert into answers values(?)";
String compareAnswer = "SELECT answer FROM questions LEFT JOIN answers USING (answer) WHERE answers.answer IS NULL";
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam",
"root", "19571966");
statement = connection.createStatement();
if (request.getParameter("op") != null){
	insert =  connection.prepareStatement(insertAnswer);
	insert.setString(1, request.getParameter("op"));
	insert.executeUpdate();	
}
compare = connection.prepareStatement(compareAnswer);
rs = statement.executeQuery("select * from questions");
for (int i = 0; i < current; i++) {
rs.next();
}

if (!rs.next()) {
	%><jsp:forward page = "forwardresults.jsp"/> <%
	out.println("You are out of questions"); 
} else {
%>

<center><br><br><br>
<h3>Q. <%=rs.getString(1)%></h3>

<input type = "radio" name = "op" value = "<%=rs.getString(2)%>"><%=rs.getString(2)%>
<input type = "radio" name = "op" value = "<%=rs.getString(3)%>"><%=rs.getString(3)%><br><br>
<input type = "radio" name = "op" value = "<%=rs.getString(4)%>"><%=rs.getString(4)%>
<input type = "radio" name = "op" value = "<%=rs.getString(5)%>"><%=rs.getString(5)%>

<BR><br><br>
<INPUT TYPE="hidden" NAME="hidden" VALUE="<%=current%>">
<INPUT TYPE="BUTTON" name = "p" VALUE="Previous" ONCLICK="movePrevious()">
<INPUT TYPE="BUTTON" name = "n" VALUE="Next" ONCLICK="moveNext()">
</center>
</FORM>

<form action="results" name="formb" method = "post">
	<input type="submit" name="send" value="show results" style="display:none;"> 
</form>


<%

}
}
catch (Exception ex) {
}
finally {
rs.close();
statement.close();
connection.close();
}
%>

</body>
</html>