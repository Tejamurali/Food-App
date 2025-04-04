package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.connection.MyConnection;
import com.foodapp.dao.OrderHistoryDAO;
import com.foodapp.model.OrderHistory;
import com.foodapp.model.User;

public class OrderHistoryDAOImpl implements OrderHistoryDAO{
	

	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res;
	
	ArrayList<OrderHistory> orderHistoryList = new ArrayList<>();
	ArrayList<OrderHistory> orderHistoryOnIdList = new ArrayList<>(1);
	
	private final String ADD_ORDERHISTORY = "insert into `orderhistory`(`orderId`,`userId`,`totalAmount`) values(?,?,?)";
	private final String GET_ALL_ORDERHISTORY = "select * from `orderhistory`";
	private final String GET_ORDERHISTORY_ON_ID = "select * from `orderhistory` where `orderHistoryId`=?";
	private final String GET_ORDERHISTORY_ON_USERID = "select * from `orderhistory` where `userId`=?";
	
	public OrderHistoryDAOImpl() {
		
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}

	
	
	@Override
	public int insertOrderHistory(OrderHistory oh) {
		try {
			pstmt = connection.prepareStatement(ADD_ORDERHISTORY);
			pstmt.setInt(1, oh.getOrderId());
			pstmt.setInt(2, oh.getUserId());
			pstmt.setFloat(3,oh.getTotalAmount());
			
			return pstmt.executeUpdate();
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public ArrayList<OrderHistory> fetechAllOrderHistory() {
		try {
			stmt = connection.createStatement();
			res  = stmt.executeQuery(GET_ALL_ORDERHISTORY);
			orderHistoryList = extractUserFromRes(res);
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderHistoryList;
	}

	@Override
	public ArrayList<OrderHistory> fetchHisoryOnId(int orderHistoryId) {
		try {
			pstmt = connection.prepareStatement(GET_ORDERHISTORY_ON_ID);
			pstmt.setInt(1, orderHistoryId);
			
			res = pstmt.executeQuery();
			orderHistoryOnIdList = extractOrderHistoryOnId(res);
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderHistoryOnIdList;
	}
	
	ArrayList<OrderHistory> extractUserFromRes(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderHistoryList.add(new OrderHistory(res.getInt("orderHistoryId"),
						res.getInt("orderId"),
						res.getInt("userId"),
						res.getString("orderDate"),
						res.getFloat("totalAmount"),
						res.getString("status")
						));
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderHistoryList;
	}
	
	ArrayList<OrderHistory> extractOrderHistoryOnId(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderHistoryOnIdList.add(new OrderHistory(res.getInt("orderHistoryId"),
						res.getInt("orderId"),
						res.getInt("userId"),
						res.getString("orderDate"),
						res.getFloat("totalAmount"),
						res.getString("status")
						));
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderHistoryOnIdList;
	}



	@Override
	public ArrayList<OrderHistory> fetchHistoryOnUserId(int userId) {
		try {
			pstmt = connection.prepareStatement(GET_ORDERHISTORY_ON_USERID);
			
			pstmt.setInt(1, userId);
			
			res = pstmt.executeQuery();
			orderHistoryList = extractOrderHistoryFromResult(res);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return orderHistoryList;
	}
	
	ArrayList<OrderHistory> extractOrderHistoryFromResult(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderHistoryList.add(new OrderHistory(res.getInt("orderHistoryId"),
						res.getInt("orderId"),
						res.getInt("userId"),
						res.getString("orderDate"),
						res.getFloat("totalAmount"),
						res.getString("status")
						));
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderHistoryList;
	}

}
