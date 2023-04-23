package com.pharmacy_mgt_sys.dao;
import java.sql.*;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Connection_postgre {
    private final String url = "jdbc:postgresql://localhost:5432/pharma_mgt_sys";
    private final String user = "postgres";
    private final String password = "root";

    /**
     * Connect to the PostgreSQL database
     *
     * @return a Connection object
     */
    public Connection connect() {
        Connection conn = null;
        try {
        	
        	Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pharma_mgt_sys", "postgres", "root");
            
            

            if (conn != null) {
                System.out.println("Connected to the PostgreSQL server successfully.");
            } else {
                System.out.println("Failed to make connection!");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return conn;
    }

    /**
     * @param args the command line arguments
     * @throws SQLException 
     */
    public static void main(String[] args) throws SQLException {
        Connection_postgre app = new Connection_postgre();
//        app.insert("akk","akk@gmail.com","akkr");
        
    }
    
    public static void insert(String uname, String email, String pass) throws SQLException
    {
        Connection_postgre app = new Connection_postgre();
        Connection con=app.connect();
    	
    	String INSERT_USERS_SQL = "INSERT INTO users_info" + "  (name, email, password) VALUES "
    			+ " (?, ?, ?);";
    	
        PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL);

        preparedStatement.setString(1, uname);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, pass);
        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();
        con.close();
    }
    
    
    



    
    
    

    
    public static boolean check(String uname, String email, String pass) throws SQLException
    {
    	boolean cheks;
        Connection_postgre app = new Connection_postgre();
        Connection con=app.connect();
    	
//    	String READ_USERS_SQL = "INSERT INTO users_info" + "  (name, email, password) VALUES "
//    			+ " (?, ?, ?);";
    	
        String READ_USER_SQL = "SELECT * FROM users_info WHERE name = ? AND email = ? AND password = ?";

        PreparedStatement preparedStatement = con.prepareStatement(READ_USER_SQL);

        preparedStatement.setString(1, uname);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, pass);
    	
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            // User found, print their data
            System.out.println("User found:");
            System.out.println("Name: " + resultSet.getString("name"));
            System.out.println("Email: " + resultSet.getString("email"));
            System.out.println("Password: " + resultSet.getString("password"));
            cheks=true;
        } else {
            System.out.println("User not found");
            cheks=false;
        }

        con.close();
		return cheks;

    }
    
    
}
