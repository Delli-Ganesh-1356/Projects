package forgot;
import project.ConnectionProviderClass;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ForgotPassword
 */

@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  String email=request.getParameter("email");
	  String mobile=request.getParameter("mobilenumber");
	  String sq=request.getParameter("securityquestion");
	  String answer=request.getParameter("answer");
	  String newpassword=request.getParameter("npassword");
	  
	  int check=0;
	  try {
		  Connection con=ConnectionProviderClass.getcon();
		  Statement st = con.createStatement();
		  ResultSet query = st.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+mobile+"' and securityquestion='"+sq+"' and answer='"+answer+"'");
		  
		  while (query.next()) {
			check =1 ;
			st.executeQuery("update users set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("forgotPassword.jsp?msg=done");
			System.out.println("done");
		}
		  if (check==0) {
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
	  }
	  catch(Exception e) {
		  System.out.println(e);
	  }
	}

}
