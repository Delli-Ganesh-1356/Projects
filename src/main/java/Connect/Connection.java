package Connect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class Connection
 */
@WebServlet("/signup")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connection() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		java.sql.Connection connection ;
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobilenumber");
		String sq=request.getParameter("securityquestion");
		String answer=request.getParameter("answer");
		String password=request.getParameter("password");
		String address="";
		String city="";
		String state="";
		String country="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineecomproject","root","1356");
			String q1="insert into users(name,email,mobilenumber,securityquestion,answer,password,address,city,state,country) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(q1);
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, mobile);
			statement.setString(4, sq);
			statement.setString(5, answer);
			statement.setString(6, password);
			statement.setString(7, address);
			statement.setString(8, city);
			statement.setString(9, state);
			statement.setString(10, country);
			statement.executeUpdate();
			System.out.println(name);
			response.sendRedirect("signup.jsp?msg=valid");
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
			response.sendRedirect("signup.jsp?msg=invalid");
			e.printStackTrace();
		}
	}

}

