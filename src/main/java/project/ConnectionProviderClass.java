package project;
import java.sql.*;
public class ConnectionProviderClass {
	public static Connection getcon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineecomproject","root","1356");
			return con;
		} catch (ClassNotFoundException | SQLException e) {
		System.out.println(e);
		return null;
		}
	}
}
