package com.foodapp.daoimpl;
import com.foodapp.connection.MyConnection;
import com.foodapp.dao.UserDAO;
import com.foodapp.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAOImpl implements UserDAO {
	
	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res ;
	private User user ;
	
	private final String GET_ALLUSER_QUERY = "select * from `user`";
	private final String ADD_USER_QUERY = "insert into `user`(`userName`,`phoneNumber`,`email`,`password`,`address`) values(?,?,?,?,?)";
	private final String DELETE_USER_QUERY = "delete from `user` where `email`=?";
	private final String GET_USER_ON_EMAIL = "select * from `user` where `email`=?";
	private final String UPDATE_ON_EMAIL = "update `user` set `userName` = ?,`phoneNumber` = ?,`password` = ?,`address` = ? where `email` = ?";
	private final String GET_USER_ON_USERID = "select * from `user` where `userId`=?";
	
	ArrayList<User> userList = new ArrayList<>(); 
	
	public UserDAOImpl() {
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}

	@Override
	public int insertUser(User u) {
		try {
			
			pstmt = connection.prepareStatement(ADD_USER_QUERY);
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPhoneNumber());
			pstmt.setString(3, u.getEmail());
			pstmt.setString(4, u.getPassword());
			pstmt.setString(5, u.getAddress());
			
			return pstmt.executeUpdate();
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int deleteUser(String email) {
		
		try {
			
			pstmt = connection.prepareStatement(DELETE_USER_QUERY);
			pstmt.setString(1, email);
			
			return pstmt.executeUpdate();
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public ArrayList<User> fetchAllUsers() {
		
		try {
			
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_ALLUSER_QUERY);
			userList = extractUserFromRes(res);
			
			}
		catch (SQLException e) {
			
				e.printStackTrace();
			
			}
		
		return userList;
		
	}

	@Override
	public User fetchUserOnEmail(String email) {
		try {
			pstmt = connection.prepareStatement(GET_USER_ON_EMAIL);
			pstmt.setString(1, email);
			res = pstmt.executeQuery();
			userList = extractUserOnEmail(res);
			
			if(userList.isEmpty()) {
				
				user = new User();
			}
			else{
				user = userList.get(0);
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public int updateUser(User u) {
		try {
			pstmt = connection.prepareStatement(UPDATE_ON_EMAIL);
			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getPhoneNumber());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getAddress());
			pstmt.setString(5, u.getEmail());
			
			return pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return 0;
 } 
	
	ArrayList<User> extractUserFromRes(ResultSet res) {
		try {
			
			while(res.next()) {
				
				userList.add(new User(res.getInt("userId"),
						res.getString("userName"),
						res.getString("email"),
						res.getString("phoneNumber"),
						res.getString("password"),
						res.getString("address"))
						);
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return userList;
	}
	
	ArrayList<User> extractUserOnEmail(ResultSet res) {
		try {
			
			while(res.next()) {
				userList.add(new User(res.getInt("userId"),
						res.getString("userName"),
						res.getString("email"),
						res.getString("phoneNumber"),
						res.getString("password"),
						res.getString("address"))
						);
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return userList;
	}

	@Override
	public User fetchUserOnUserId(int userId) {
		try {
			pstmt = connection.prepareStatement(GET_USER_ON_USERID);
			pstmt.setInt(1, userId);
			res = pstmt.executeQuery();
			userList = extractUserOnEmail(res);
			
			if(userList.isEmpty()) {
				
				user = new User();
			}
			else{
				user = userList.get(0);
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		return user;
	}
}
