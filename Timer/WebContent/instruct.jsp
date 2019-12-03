<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h2>Hurray! You logged in! Click below to start the exam.</h2>
		<%
	
	String uid = request.getParameter("username");
	String upwd = request.getParameter("userpass");
	
	%>
	<form action = "Instructions" method = "post">

		<input type = "text" value = <%= uid %> name = "uid">
		<input type = "password" value = <%= upwd %> name = "upwd">
		<input type = "submit" value = "Go!">
	</form>

</body>
</html>