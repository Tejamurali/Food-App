package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.OrderTable;

public interface OrderTableDAO {
	
	int insertOrderTable(OrderTable ot);
	ArrayList<OrderTable> fetechAllOrderTableData();
	ArrayList<OrderTable> fetchOnId(int orderId);
	int fetchMaxOrderId();
	ArrayList<Integer> getRestaurantIdOnOrderId(int orderId);
	
}
