package login;
import project.ConnectionProviderClass;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LoginPage
 */

@WebServlet("/login")
public class LoginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	int z = 0;
	
	if ("admin@gmail.com".equals(email) && "admin".equals(pass)) {
		HttpSession session=request.getSession() ;
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	
	else {
		try {
			Connection con=ConnectionProviderClass.getcon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+pass+"'");
			while (rs.next()) {
				z=1;
				HttpSession session=request.getSession() ;
				session.setAttribute("email", email);
				response.sendRedirect("home.jsp");
			}
			
			if (z==0) {
				response.sendRedirect("login.jsp?msg=notexist");
			}
		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("login.jsp?msg=invalid");

		}
	}
		
	}

}
