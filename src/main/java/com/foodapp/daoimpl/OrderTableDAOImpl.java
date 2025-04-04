package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.connection.MyConnection;
import com.foodapp.dao.OrderTableDAO;
import com.foodapp.model.OrderTable;
import com.foodapp.model.User;

public class OrderTableDAOImpl implements OrderTableDAO{
	
	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res;
	
	private final String ADD_ORDERTABLE = "insert into `ordertable`(`restaurantId`,`userId`,`totalAmount`,`paymentMode`) values(?,?,?,?)";
	private final String GET_ALL_ORDERTABLE = "select * from `ordertable`";
	private final String GET_ORDERTABLE_ON_ID = "select * from `ordertable` where `orderId`=?";
	private final String GET_RESTAURANTID_ON_ORDERID = "select `restaurantId` where `orderId`=?";
	private final String GET_MAX_ORDERID = "select max(`orderId`) as maxOrderId from `ordertable`";
	
	ArrayList<OrderTable> orderTableList = new ArrayList<>();
	ArrayList<OrderTable> orderTableOnIdList = new ArrayList<>();
	ArrayList<Integer> restaurantIdList = new ArrayList<>();
	
	private int maxOrderId;
	
	public OrderTableDAOImpl() {
		
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}
	
	

	@Override
	public int insertOrderTable(OrderTable ot) {
		try {
			pstmt = connection.prepareStatement(ADD_ORDERTABLE);
			pstmt.setInt(1, ot.getRestaurantId());
			pstmt.setInt(2, ot.getUserId());
			pstmt.setFloat(3,ot.getTotalAmount());
			pstmt.setString(4,ot.getPaymentMode());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public ArrayList<OrderTable> fetechAllOrderTableData() {
		try {
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_ALL_ORDERTABLE);
			orderTableList = extractOrderTableFromRes(res);
			
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return orderTableList;
	}

	@Override
	public ArrayList<OrderTable> fetchOnId(int orderId) {
		try {
			pstmt = connection.prepareStatement(GET_ORDERTABLE_ON_ID);
			pstmt.setInt(1, orderId);
			
			res = pstmt.executeQuery();
			orderTableOnIdList = extractOrderTableOnId(res);
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderTableOnIdList;
	}
	
	ArrayList<OrderTable> extractOrderTableFromRes(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderTableList.add(new OrderTable (res.getInt("orderId"),
				res.getInt("restaurantId"),
				res.getInt("userId"),
				res.getFloat("totalAmount"),
				res.getString("paymentMode"),
				res.getString("status")
				));
				
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderTableList;
	}
	
	ArrayList<OrderTable> extractOrderTableOnId(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderTableOnIdList.add(new OrderTable (res.getInt("orderId"),
						res.getInt("restaurantId"),
						res.getInt("userId"),
						res.getFloat("totalAmount"),
						res.getString("paymentMode"),
						res.getString("status")
						));
				
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderTableOnIdList;
	}



	@Override
	public int fetchMaxOrderId() {
		try {
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_MAX_ORDERID);
			while(res.next()) {
			maxOrderId = res.getInt("maxOrderId");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return maxOrderId;
	}



	@Override
	public ArrayList<Integer> getRestaurantIdOnOrderId(int orderId) {
		try {
			pstmt = connection.prepareStatement(GET_RESTAURANTID_ON_ORDERID);
			pstmt.setInt(1, orderId);
			
			res = pstmt.executeQuery();
			while(res.next()) {
				restaurantIdList.add(res.getInt("restaurantId"));
			}
			
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return restaurantIdList;
		
	}

}
