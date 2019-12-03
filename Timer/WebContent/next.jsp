<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<HTML>
<BODY>
<% int current = 0;
Connection connection = null;
ResultSet rs = null;
%>
<FORM NAME="forma" ACTION="next.jsp" METHOD="post"><%
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

<h4><%=rs.getString(1)%></h4>

<input type = "radio" name = "op" value = "<%=rs.getString(2)%>"><%=rs.getString(2)%>
<input type = "radio" name = "op" value = "<%=rs.getString(3)%>"><%=rs.getString(3)%>
<input type = "radio" name = "op" value = "<%=rs.getString(4)%>"><%=rs.getString(4)%>
<input type = "radio" name = "op" value = "<%=rs.getString(5)%>"><%=rs.getString(5)%>

<BR>
<INPUT TYPE="hidden" NAME="hidden" VALUE="<%=current%>">
<INPUT TYPE="BUTTON" VALUE="Next" ONCLICK="moveNext()">
<INPUT TYPE="BUTTON" VALUE="Previous" ONCLICK="movePrevious()">
</FORM>
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

<SCRIPT LANGUAGE="JavaScript">
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


        </SCRIPT>
</body>
</html>