package com.foodapp.daoimpl;

import com.foodapp.connection.MyConnection;
import com.foodapp.dao.RestaurantDAO;
import com.foodapp.model.Restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class RestaurantDAOImpl implements RestaurantDAO {
	
	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res;

	private final String ADD_RESTAURANT_QUERY = "insert into `restaurant`(`restaurantName`,`deliveryTime`,`cuisineType`,`address`,`ratings`,`isActive`) values(?,?,?,?,?,?)";
	private final String DELETE_RESTURANT_QUERY = "delete from `restaurant` where `restaurantId`=?";
	private final String GET_ALLRESTAURANTS_QUERY = "select * from `restaurant`";
	private final String GET_RESTAURANT_ON_ID = "select * from `restaurant` where `restaurantId`=?";
	private final String UPDATE_RESTAURANT_ON_Id = "update `restaurant` set `restaurantName` = ?,`deliveryTime` = ?,`cuisineType` = ?,`address` = ?,`ratings`= ?,`isActive` = ? where `restaurantId` = ?";
	
	ArrayList<Restaurant> restaurantList = new ArrayList<>();
	ArrayList<Restaurant> restaurantOnIdList = new ArrayList<>();

	public RestaurantDAOImpl() {
		
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}

	@Override
	public int insertUser(Restaurant r) {
		try {
			pstmt = connection.prepareStatement(ADD_RESTAURANT_QUERY);
			pstmt.setString(1,r.getRestaurantName());
			pstmt.setInt(2,r.getDeliveryTime());
			pstmt.setString(3,r.getCuisineType());
			pstmt.setString(4,r.getAddress());
			pstmt.setFloat(5,r.getRatings());
			pstmt.setString(6,r.getIsActive());
			
			return pstmt.executeUpdate();
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deleteUser(int restaurantId) {
		try {
			pstmt = connection.prepareStatement(DELETE_RESTURANT_QUERY);
			pstmt.setInt(1,restaurantId);
			
			return pstmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	@Override
	public ArrayList<Restaurant> fetchAllRestaurants() {
		try {
			
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_ALLRESTAURANTS_QUERY);
			restaurantList = extractRestaurant(res);
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return restaurantList;
	}

	
	@Override
	public ArrayList<Restaurant> fetchRestaurantOnId(int restaurantId) {
		try {
			
			pstmt = connection.prepareStatement(GET_RESTAURANT_ON_ID);
			pstmt.setInt(1, restaurantId);
			
			res = pstmt.executeQuery();
			restaurantOnIdList = extractRestaurantOnId(res);
			
		   } 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return restaurantOnIdList;
	}

	

	
	@Override
	public int updateRestaurant(Restaurant r) {
		try {
			pstmt = connection.prepareStatement(UPDATE_RESTAURANT_ON_Id);
			
			pstmt.setString(1,r.getRestaurantName());
			pstmt.setInt(2,r.getDeliveryTime());
			pstmt.setString(3,r.getCuisineType());
			pstmt.setString(4,r.getAddress());
			pstmt.setFloat(5,r.getRatings());
			pstmt.setString(6,r.getIsActive());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	ArrayList<Restaurant> extractRestaurant(ResultSet res) {
		try {
			
			while(res.next()) {
				
				restaurantList.add(
				new Restaurant(
				res.getInt("restaurantId"),
				res.getString("restaurantName"),
				res.getInt("deliveryTime"),
				res.getString("cuisineType"),
				res.getString("address"),
				res.getFloat("ratings"),
				res.getString("isActive"),
				res.getString("imgPath"))
				);
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return restaurantList;
	}
	
	ArrayList<Restaurant> extractRestaurantOnId(ResultSet res) {
		try {
			
			while(res.next()) {
				
				restaurantOnIdList.add(
						new Restaurant(
								res.getInt("restaurantId"),
								res.getString("restaurantName"),
								res.getInt("deliveryTime"),
								res.getString("cuisineType"),
								res.getString("address"),
								res.getFloat("ratings"),
								res.getString("isActive"),
								res.getString("imgPath"))
				);
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return restaurantOnIdList;
	}

}
