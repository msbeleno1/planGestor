package planGestor.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConection {
	
	public static Connection getConectionToDatabase() {
		
		Connection connection = null;
		
		try {
			// load the driver class
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("MySQL JDBC Driver Registered");
			
			// get the DriverManager
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdplangestor", "plangestor", "plangestor2021.");
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			System.out.println("Where is your MySQL JDBC Driver?");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection failed! Check output console");
			e.printStackTrace();
		} // end try catch
		
		System.out.println("Connection to made to DB!");
		return connection;
	}

}
