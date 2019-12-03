<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String abc = "this is a string with spaces";
%>

<h3>Displaying string outside form: </h3>
<p> <%= abc %> </p>

<h3>Displaying string inside form:</h3>
<form>
	<input type = "text" value = <%= abc %>>
</form>
</body>
</html>