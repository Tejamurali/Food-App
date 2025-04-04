package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.OrderItem;

public interface OrderItemDAO {
	
	int insertOrderItem(OrderItem oi);
	ArrayList<OrderItem> fetechAllOrderItems();
	ArrayList<OrderItem> fetchItemOnId(int orderItemId);
	ArrayList<Integer> fetchItemOnOrderId(int orderId);
	ArrayList<OrderItem> fetchAllItemsOnOrderId(int orderId);
}
