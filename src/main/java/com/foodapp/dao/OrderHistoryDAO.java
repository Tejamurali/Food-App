package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.OrderHistory;

public interface OrderHistoryDAO {
	int insertOrderHistory(OrderHistory oh);
	ArrayList<OrderHistory> fetechAllOrderHistory();
	ArrayList<OrderHistory> fetchHisoryOnId(int orderHistoryId);
	ArrayList<OrderHistory> fetchHistoryOnUserId(int userId);
}
