package com.questions;

import java.sql.*;
import java.io.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Instructions
 */

public class Instructions extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:mysql://localhost:3306/exam?verifyServerCertificate=false&useSSL=true";
		String uname = "root";
		String pass = "19571966";
		

			Connection conn = null;
			Statement stmt = null;
			Statement newst = null;
			PrintWriter out = response.getWriter();
			String uid = request.getParameter("uid");
			String upwd = request.getParameter("upwd");
			try {
				response.setContentType("text/html");
				conn = DriverManager.getConnection(url, uname, pass);
				stmt = conn.createStatement();
				newst = conn.createStatement();
				String sql = "select * from instructions";
				String newsql = "select studentName from students where userId = '" + uid + "' and password = '" + upwd +"';";
				ResultSet newrs = newst.executeQuery(newsql);
				ResultSet rs = stmt.executeQuery(sql);
			    out.println("<html>");
			    out.println("<head>");
			    out.println("<title>Hola</title>");
			    out.println("</head>");
			    out.println("<body bgcolor=\"white\">");
			    
				while(newrs.next()) {
					out.println("<h3>Welcome, " + newrs.getString(1) + "</h3>");
				}
				
				while (rs.next()) {
					out.println("<ul>");
					out.println("<li>" + rs.getString(1) + "</li>");
					out.println("</ul>");
				}
				out.println("<form action = \"welcome\" method = \"post\">");
				out.println("<input type = \"submit\" name = \"go\" ");
				out.println("</form>");
			    out.println("</body>");
			    out.println("</html>");
				

			}
			catch(Exception e){
				System.out.println(e);
			}
			finally{
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
