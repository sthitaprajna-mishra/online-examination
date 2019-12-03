<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html><head>
<%
String mins = "0";
if( mins == null ) mins = "1";
  
String secs = "10";
if( secs == null ) secs = "1";
%>
<script>
<!--
var mins = <%=mins%>; // write mins to javascript
var secs = <%=secs%>; // write secs to javascript
function timer()
{
// tic tac
if( --secs == -1 )
{
secs = 59;
--mins;
}
 
// leading zero? formatting
if( secs < 10 ) secs = "0" + secs;             
if( mins < 10 ) mins = "0" + parseInt( mins, 10 );
 
// display
document.forma.mins.value = mins; 
document.forma.secs.value = secs;
 
// continue?
if( secs == 0 && mins == 0 ) // time over
{
document.forma.ok.disabled = true;
document.formb.results.style.display = "block";
}
else // call timer() recursively every 1000 ms == 1 sec
{
window.setTimeout( "timer()", 1000 );
}
}
//-->
</script></head>
<body>
<form action="<%=request.getRequestURL()%>" name="forma">
Time remaining: <input type="text" name="mins" size="1" style="border:0px solid black;text-align:right">:<input type="text" name="secs" size="1" style="border:0px solid black">
<hr>
Question: What is green and turns red if you hit the button?<br>
Answer: <input type="text" name="answer"> 
<input type="submit" name="ok" value="OK"> 
</form>
<hr>
<form action="#" name="formb">
<input type="submit" name="results" value="show results" style="display:none;"> 
</form>
<script>
<!--
timer(); // call timer() after page is loaded
//-->
</script>
</body></html>








if( seconds == 0 && minutes == 0 ) // time over
{
document.forma.p.disabled = true;
document.forma.n.disabled = true;
document.formb.send.style.display = "block";
}
else // call timer() recursively every 1000 ms == 1 sec
{
window.setTimeout( "timer()", 1000 );
}



