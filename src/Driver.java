import java.sql.*;

import javax.activation.DataSource;
public class Driver {

	public static void main(String[] args) {
		try{
			//1. Get a connection to database
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-commerce?autoReconnect=true&useSSL=false", "root", "joseph");
			
			//2. Create a statement
			Statement stmt = conn.createStatement();
			
			//3. Execute a sql query
			ResultSet resultSet = stmt.executeQuery("SELECT * FROM userinfo");
			
			
			
			//4. Process the result set
			while(resultSet.next()){
				System.out.println(resultSet.getString("userid"));
			}
		
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

}
