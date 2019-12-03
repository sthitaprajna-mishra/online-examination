package com.questions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewResults extends HttpServlet{
	
	static final String url = "jdbc:mysql://localhost:3306/exam?verifyServerCertificate=false&useSSL=true";
	static final String uname = "root";
	static final String pass = "19571966";
	
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException, NullPointerException {

		Connection conn = null;
		Statement stmt = null;
		try {
			
			/*Loading class `com.mysql.jdbc.Driver'. 
			 * This is deprecated. The new driver class is `com.mysql.cj.jdbc.Driver'. 
			 * The driver is automatically registered via the SPI 
			 * and manual loading of the driver class is generally unnecessary.
			*/
			
			//Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, uname, pass);
			stmt = conn.createStatement();
			String noOfAttempted = "select count(*) from answers";
			PrintWriter out = response.getWriter();
			String compareAnswer = "SELECT answer FROM questions LEFT JOIN answers USING (answer) WHERE answers.answer IS NULL";
			Statement compare = conn.createStatement();
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
	        String htmlResponse = "<html>";
	        htmlResponse += "<head>\r\n" + 
	        		"<style>\r\n" + 
	        		"table {\r\n" + 
	        		"  font-family: \"Trebuchet MS\", Arial, Helvetica, sans-serif;\r\n" + 
	        		"  border-collapse: collapse;\r\n" + 
	        		"  width: 50%;\r\n" + 
	        		"}\r\n" + 
	        		"\r\n" + 
	        		"table td, table th {\r\n" + 
	        		"  border: 1px solid #ddd;\r\n" + 
	        		"  padding: 8px;\r\n" + 
	        		"}\r\n" + 
	        		"\r\n" + 
	        		"table tr:nth-child(even){background-color: #f2f2f2;}\r\n" + 
	        		"\r\n" + 
	        		"table tr:hover {background-color: #ddd;}\r\n" + 
	        		"\r\n" + 
	        		"table th {\r\n" + 
	        		"  padding-top: 12px;\r\n" + 
	        		"  padding-bottom: 12px;\r\n" + 
	        		"  text-align: left;\r\n" + 
	        		"  background-color: #0066ff;\r\n" + 
	        		"  color: white;\r\n" + 
	        		"}" + 
					"button {\r\n" + 
					"  background-color: #4CAF50; /* Green */\r\n" + 
					"  border: none;\r\n" + 
					"  padding: 15px 32px;\r\n" + 
					"  text-align: center;\r\n" + 
					"  text-decoration: none;\r\n" + 
					"  display: inline-block;\r\n" + 
					"  font-size: 16px;\r\n" + 
					"  margin: 4px 2px;\r\n" + 
					"  border-radius: 12px;\r\n" + 
					"  cursor: pointer;\r\n" + 
					"}\r\n" + 
					"\r\n" + 
					"a{\r\n" + 
					"	text-decoration: none;\r\n" + 
					"	color: white;\r\n" + 
					"	font-weight: bold;\r\n" + 
					"}" +
	        		"</style>\r\n" + 
	        		"</head>";

	        htmlResponse += "<center><table>" +
	        				"<tr><th><center>Results</center></th><th> </th></tr>" +
	        				"<tr>" +
	        				"<td>Number of questions attempted: </td>" +
	        				"<td>" + total + "</td>" +
	        				"</tr>" +
	        				"<tr>" +
	        				"<td>Number of correct answers: </td>" +
	        				"<td>" + correct + "</td>" +
	        				"</tr>" +
	        				"<tr>" +
	        				"<td>Total marks obtained: </td>" +
	        				"<td>" + correct + "</td>" +
	        				"</tr></table><br><button><a href = \"home.html\">Exit</a></button></center>" +
	        				"</html>";
	         
	        out.println(htmlResponse);
			
//			PreparedStatement ps = conn.prepareStatement("insert into displayResults values(?, ?, ?)");
//			ps.setInt(1, total);
//			ps.setInt(2, correct);
//			ps.setInt(3,  correct);
		}
		catch(Exception e){
			System.out.println(e);
		}
		finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
