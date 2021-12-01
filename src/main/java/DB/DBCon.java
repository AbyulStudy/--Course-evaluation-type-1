package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		String id = "system";
		String pw = "root";
		Connection con = DriverManager.getConnection(url,id,pw);
		
		return con;
	}
}
