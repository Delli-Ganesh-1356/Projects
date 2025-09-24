package product;
import  project.ConnectionProviderClass;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class newProduct
 */
@WebServlet("/products")
public class newProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public newProduct() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String price=request.getParameter("price");
		String active=request.getParameter("active");
		Connection con;
		System.out.println("ok");
		try {
			con=ConnectionProviderClass.getcon();
			PreparedStatement ps = con.prepareStatement("insert into product(id,name,category,price,active) values(?,?,?,?,?)");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, category);
			ps.setString(4, price);
			ps.setString(5, active);
			System.out.println("ok");
			ps.executeQuery();
			response.sendRedirect("addNewProduct.jsp?msg=done");
			System.out.println("done");
			}
		catch(Exception e) {
			response.sendRedirect("addNewProduct.jsp?msg=wrong");
		}
	}

}
