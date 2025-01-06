package starttup;
import java.sql.*;
public class connectDB {
	
	static Connection con=null;
public static Connection connect()
{
	if(con==null)
	{
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/start_up","root","Rohit@299");
		
		System.out.println("Connectd");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		System.out.println("Something went wrong");
		e.printStackTrace();
	}
	}
	return con;
}
}



