package com.bridgelabz.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import com.bridgelabz.model.LoginUser;
import com.bridgelabz.model.User;

public class UserDatabase {
	public static List<LoginUser> usersLogin=new ArrayList<LoginUser>();
	// Connect to MySQL
	public static Connection getMySQLConnection() throws SQLException, ClassNotFoundException {
		String hostName = "localhost";
		String dbName = "ServletProject";
		String userName = "root";
		String password = "password";
		return getMySQLConnection(hostName, dbName, userName, password);
	}

	public static Connection getMySQLConnection(String hostName, String dbName, String userName, String password)
			throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
		return conn;
	}
	
	public static void registration(User user) throws ClassNotFoundException, SQLException
	{
		String query="insert into User values(?,?,?,?,?)";
		 Connection conn=getMySQLConnection();
         PreparedStatement preparedStmt = conn.prepareStatement(query);
         preparedStmt.setInt(1, 0);
         preparedStmt.setString (2, user.getName());
         preparedStmt.setString (3, user.getEmail());
         preparedStmt.setString(4, user.getPassword());
         preparedStmt.setString(5, user.getMobileNumber());
         preparedStmt.execute();
         conn.close();
	}
	public static User login(LoginUser loginUser) throws ClassNotFoundException, SQLException
	{
		String query="select * from User where email=? and password=?";
		 Connection conn=getMySQLConnection();
		 PreparedStatement stmt = conn.prepareStatement(query);
		 stmt.setString(1, loginUser.getEmail());
		 stmt.setString(2, loginUser.getPassword());
	     ResultSet rs = stmt.executeQuery(); 
	        User user = null;
	        while (rs.next()) { 
	        	user= new User();
//	        	user.setName(rs.getString(2));
//	        	user.setEmail(rs.getString(3));
//	        	user.setMobileNumber(rs.getString(5));
	        }
	        rs.close();
	        stmt.close(); 
	        conn.close(); 
	        return user;      
	}
}