package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.connection.MyConnection;
import com.foodapp.dao.CategoryDAO;
import com.foodapp.model.Category;
import com.foodapp.model.User;

public class CategoryDAOImpl implements CategoryDAO {
	
	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res ;
	private User user ;
	
	private final String GET_ALL_CATEGORY = "select * from `category`";
	
	ArrayList<Category> categoryList = new ArrayList<>(); 
	
	public CategoryDAOImpl() {
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}
	
	@Override
	public ArrayList<Category> fetchAllCategory() {
		try {
			
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_ALL_CATEGORY);
			categoryList = extractUserFromRes(res);
			
			}
		catch (SQLException e) {
			
				e.printStackTrace();
			
			}
		
		return categoryList;
	}
	
	ArrayList<Category> extractUserFromRes(ResultSet res) {
		try {
			
			while(res.next()) {
				
				categoryList.add(new Category(res.getInt("categoryId"),
						res.getString("categoryName"),
						res.getString("imgPath")));
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return categoryList;
	}

}
