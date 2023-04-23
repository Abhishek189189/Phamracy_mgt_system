package com.pharmacy_mgt.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Employee {

	private final String url = "jdbc:postgresql://localhost/pharma_mgt_sys";
	private final String user = "postgres";
	private final String password = "root";

	private static final String INSERT_USERS_SQL = "INSERT INTO users_info" + "  (name, email, password) VALUES "
			+ " (?, ?, ?);";
	
//    public static void main(String[] args) throws SQLException {

//    }
	
	public static void save(String uname,String email,String pass)throws SQLException
	{
        Employee createTableExample = new Employee();
        createTableExample.insertRecord(uname,email,pass);
	}
	
	
	
	
	 public  void insertRecord(String name,String email,String pass) throws SQLException {
	        System.out.println(INSERT_USERS_SQL);
	        
	        
	        
	        System.out.println("url:"+url+" user:"+user+" password:"+password);
	        
	        System.out.println("Name:"+name+"Email:"+email+"Pass:"+pass);
	        

	        try (Connection connection = DriverManager.getConnection(url, user, password);

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
//	            preparedStatement.setInt(1, 1);
	            preparedStatement.setString(1, name);
	            preparedStatement.setString(2, email);
	            preparedStatement.setString(3, pass);
//	            preparedStatement.setString(5, "secret");

	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            preparedStatement.executeUpdate();
	            connection.close();
	        } catch (SQLException e) {

	            // print SQL exception information
	            printSQLException(e);
	        }

	        // Step 4: try-with-resource statement will auto close the connection.
	    }
	 
	 

	public static void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}

		// Step 4: try-with-resource statement will auto close the connection.
	}

}
