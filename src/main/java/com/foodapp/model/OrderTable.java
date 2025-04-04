package com.foodapp.model;

public class OrderTable {
	
	private int orderId;
	private int restaurantId;
	private int userId;
	private float totalAmount;
	private String paymentMode;
	private String status;
	
	public OrderTable() {
		super();

	}
	

	public OrderTable(int restaurantId, int userId, float totalAmount, String paymentMode) {
		super();
		this.restaurantId = restaurantId;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.paymentMode = paymentMode;
	}


	public OrderTable(int orderId, int restaurantId, int userId, float totalAmount, String paymentMode, String status) {
		super();
		this.orderId = orderId;
		this.restaurantId = restaurantId;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.paymentMode = paymentMode;
		this.status = status;
	}


	public OrderTable(int restaurantId, int userId, float totalAmount, String paymentMode, String status) {
		super();
		this.restaurantId = restaurantId;
		this.userId = userId;
		this.totalAmount = totalAmount;
		this.paymentMode = paymentMode;
		this.status = status;
	}


	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public float getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	
	public int getRestaurantId() {
		return restaurantId;
	}


	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "OrderTable [orderId=" + orderId + ", restaurantId=" + restaurantId + ", userId=" + userId
				+ ", totalAmount=" + totalAmount + ", paymentMode=" + paymentMode + ", status=" + status + "]";
	}

	
}
