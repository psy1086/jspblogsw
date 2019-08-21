package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DButil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3307/jakuwa";
			String dbID ="root";
			String dbPASSWD ="1234";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPASSWD);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
