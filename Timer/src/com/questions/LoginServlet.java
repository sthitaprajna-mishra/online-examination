package com.questions;


import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.questions.LoginDao;

public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 102831973239L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException, NullPointerException {  

        response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String n=request.getParameter("username");  
        String p=request.getParameter("userpass"); 
        
        HttpSession session = request.getSession(false);
        if(session!=null)
        session.setAttribute("name", n);

        if(LoginDao.validate(n, p)){  
            RequestDispatcher rd=request.getRequestDispatcher("test.jsp");  
            rd.forward(request,response);  
        }  
        else{  
            out.print("<p style=\"color:red\">Sorry username or password error</p>");  
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
            rd.include(request,response);  
        }  

        out.close();  
    }  
} 