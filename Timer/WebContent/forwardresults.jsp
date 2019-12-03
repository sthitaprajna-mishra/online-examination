<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam Over | Online Examination Portal | CET Bhubaneshwar</title>
</head>

<style>

	h2{
		color: #666666;
	}
	
	#b {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  border-radius: 12px;
	  color: white;
	  font-weight: bold;
	  text-decoration: none;
	  cursor: pointer;
	}

</style>
<body>
	<center>	
	
	<h2>Hurray! <br>You completed the exam! Click below to check your results.</h2>
	
	<form action = "results" method = "post">
		<input id = "b" type = "submit" value = "Check results">
	</form>
	
	</center>


</body>
</html>