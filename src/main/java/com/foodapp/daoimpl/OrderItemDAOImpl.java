package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.connection.MyConnection;
import com.foodapp.dao.OrderItemDAO;
import com.foodapp.model.OrderItem;
import com.foodapp.model.User;

public class OrderItemDAOImpl implements OrderItemDAO{

	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res;
	
	private final String SET_ORDERITEM = "insert into `orderitem`(`orderId`,`menuId`,`quantity`,`subTotal`) values(?,?,?,?)";
	private final String GET_ALL_ORDERITEMS = "select * from `orderitem`";
	private final String GET_ORDERITEM_ON_ID = "select * from `orderitem` where `orderItemId`=?";
	private final String GET_ORDERITEM_ON_ORDERID = "select `menuId` from `orderitem` where `orderId`=?";
	private final String GET_ALL_ITEMS_ON_ORDERID = "select * from `orderitem` where `orderId`=?";
	
	ArrayList<OrderItem> orderItemList = new ArrayList<>();
	ArrayList<OrderItem> orderItemOnIdList = new ArrayList<>(1);
	ArrayList<Integer> menuIdList =  new ArrayList<>();
	
	public OrderItemDAOImpl() {
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}

	@Override
	public int insertOrderItem(OrderItem oi) {
		try {
			pstmt = connection.prepareStatement(SET_ORDERITEM);
			pstmt.setInt(1, oi.getOrderId());
			pstmt.setInt(2, oi.getMenuId());
			pstmt.setInt(3,oi.getQuantity());
			pstmt.setFloat(4,oi.getSubTotal());
			
			return pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public ArrayList<OrderItem> fetechAllOrderItems() {
		try {
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_ALL_ORDERITEMS);
			
			orderItemList = extractOrderItemFromRes(res);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return orderItemList;
	}

	@Override
	public ArrayList<OrderItem> fetchItemOnId(int orderItemId) {
		
		try {
			pstmt = connection.prepareStatement(GET_ORDERITEM_ON_ID);
			pstmt.setInt(1, orderItemId);
			
			res = pstmt.executeQuery();
			orderItemOnIdList = extractOrderItemOnId(res);
					
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderItemOnIdList;
	}
	
	ArrayList<OrderItem> extractOrderItemFromRes(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderItemList.add(new OrderItem(res.getInt("orderItemId"),
				res.getInt("orderId"),
				res.getInt("menuId"),
				res.getInt("quantity"),
				res.getFloat("subTotal")));
				
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderItemList;
	}
	
	ArrayList<OrderItem> extractOrderItemOnId(ResultSet res) {
		try {
			
			while(res.next()) {
				
				orderItemOnIdList.add(new OrderItem(res.getInt("orderItemId"),
						res.getInt("orderId"),
						res.getInt("menuId"),
						res.getInt("quantity"),
						res.getFloat("subTotal")));
				
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderItemOnIdList;
	}

	@Override
	public ArrayList<Integer> fetchItemOnOrderId(int orderId) {
		try {
			pstmt = connection.prepareStatement(GET_ORDERITEM_ON_ORDERID);
			pstmt.setInt(1, orderId);
			
			res = pstmt.executeQuery();
			while (res.next()) {
				menuIdList.add(res.getInt("menuId"));
			}
					
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return menuIdList;
	}

	@Override
	public ArrayList<OrderItem> fetchAllItemsOnOrderId(int orderId) {
		try {
			pstmt = connection.prepareStatement(GET_ALL_ITEMS_ON_ORDERID);
			pstmt.setInt(1, orderId);
			
			res = pstmt.executeQuery();
			orderItemList = extractOrderItemFromRes(res);
			
					
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return orderItemList;
		
	}
	

}
