

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Welcome
 */

public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		if (request.getParameter("go") != null) {
			RequestDispatcher rd=request.getRequestDispatcher("next.jsp");  
		}
		else {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("invalid");			
		}
	}

}
