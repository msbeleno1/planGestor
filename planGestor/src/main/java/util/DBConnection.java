package util;

import java.sql.*;

public class DBConnection {
	
public static Connection getConectionToDatabase() {
		
		Connection connection = null;
		
		try {
			// load the driver class
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// get the DriverManager
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdplangestor", "plangestor", "plangestor2021.");
			
		} catch (ClassNotFoundException e) {
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
			
		} catch (SQLException e) {
			System.out.println("Connection failed! Check output console");
			e.printStackTrace();
		} // end try catch
		
		return connection;
	}

}
