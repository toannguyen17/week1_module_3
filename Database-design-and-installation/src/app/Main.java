package app;

public class Main {

	private static String mysql_host     = "127.0.0.1";
	private static String mysql_database = "bookmanager";
	private static String mysql_user     = "root";
	private static String mysql_pass     = "";

	public static void main(String[] args) {
		// Connected database
		SQLManager.create(mysql_host, mysql_database, mysql_user, mysql_pass);
	}
}
