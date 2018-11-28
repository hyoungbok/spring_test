package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {

	public static Connection open() {
		Connection con = null;
		
		try {
			Class.forName(Constance.DRIVER);
			try {
				con=DriverManager.getConnection(Constance.URL, Constance.user, Constance.passwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return con;
	}

}
