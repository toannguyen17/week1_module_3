package app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLManager {

	protected static Connection conn;
	protected static Statement  exec;

	private SQLManager(){}

	protected static synchronized void create(String host, String database, String user, String pass) {
		if (conn != null)
			return;

		String url = "jdbc:mysql://" + host + "/" + database;
		System.out.println("MySQL connect: "+url);
		try {
			System.out.println("Connecting...");
			conn = DriverManager.getConnection(url, user, pass);
			exec = conn.createStatement();
			System.out.println("Success!");
		} catch(SQLException e) {
			e.printStackTrace();
			System.exit(0);
		}
	}

	protected static synchronized boolean close() {
		System.out.println("Close connection to database");
		try {
			if(exec != null)
				exec.close();

			if(conn != null)
				conn.close();

			return true;
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
