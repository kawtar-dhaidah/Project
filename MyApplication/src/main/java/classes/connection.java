package classes;
import java.sql.Connection;
import java.sql.DriverManager;

public class connection {
	private static Connection con;
	static {
		  try{
        	
            //Class.forName("com.mysql.jdbc.Driver");
            
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/sys","root","123);
            System.out.println("Xampp Mysql connected ..");
           
        }
        catch(Exception e){
            System.out.println("no connection");

        }
		

	}
	public static Connection getCon() {
		return con;
	}
}
