<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<style> 
p { 
text-align: center; 
font-size: 60px; 
} 
</style> 
</head> 

<body> 
<p id="demo"></p> 
<script> 
var deadline = new Date("Nov 22, 2019 18:35:25").getTime(); 
var x = setInterval(function() { 
var now = new Date().getTime(); 
var t = deadline - now; 
var days = Math.floor(t / (1000 * 60 * 60 * 24)); 
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60)); 
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
var seconds = Math.floor((t % (1000 * 60)) / 1000); 
document.getElementById("demo").innerHTML = days + "d " 
+ hours + "h " + minutes + "m " + seconds + "s "; 
	if (t < 0) { 
		clearInterval(x); 
		document.getElementById("demo").innerHTML = "EXPIRED"; 
	} 
}, 1000); 
</script> 


</body>
</html>