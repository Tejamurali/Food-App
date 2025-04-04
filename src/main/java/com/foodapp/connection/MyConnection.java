package com.foodapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class MyConnection {
	
private MyConnection() {
		
	}
	
	private static MyConnection connection = new MyConnection();
	
	public static MyConnection getMyConnection() {
		return connection;
	}
	public static Connection connect() {
	
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				return DriverManager.getConnection("jdbc:mysql://localhost:3306/foodapp","root","root");
				
			} 
			catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
			}
			
			return null;	
	}
}
