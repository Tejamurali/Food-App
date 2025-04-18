package com.foodapp.model;

public class Restaurant {
	private int restaurantId;
	private String restaurantName;
	private int deliveryTime;
	private String cuisineType;
	private String address;
	private float ratings;
	private String isActive;
	private String imgPath;
	
	public Restaurant() {
		super();
	}

	public Restaurant(String restaurantName, int deliveryTime, String cuisineType, String address, float ratings,
			String isActive, String imgPath) {
		super();
		this.restaurantName = restaurantName;
		this.deliveryTime = deliveryTime;
		this.cuisineType = cuisineType;
		this.address = address;
		this.ratings = ratings;
		this.isActive = isActive;
		this.imgPath = imgPath;
	}

	public Restaurant(int restaurantId, String restaurantName, int deliveryTime, String cuisineType, String address,
			float ratings, String isActive, String imgPath) {
		super();
		this.restaurantId = restaurantId;
		this.restaurantName = restaurantName;
		this.deliveryTime = deliveryTime;
		this.cuisineType = cuisineType;
		this.address = address;
		this.ratings = ratings;
		this.isActive = isActive;
		this.imgPath = imgPath;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public float getRatings() {
		return ratings;
	}

	public void setRatings(float ratings) {
		this.ratings = ratings;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", deliveryTime="
				+ deliveryTime + ", cuisineType=" + cuisineType + ", address=" + address + ", ratings=" + ratings
				+ ", isActive=" + isActive + ", imgPath=" + imgPath + "]";
	}

}
