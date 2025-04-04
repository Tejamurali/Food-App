package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.Restaurant;
import com.foodapp.model.User;

public interface RestaurantDAO {
	
	int insertUser(Restaurant r);
	int deleteUser(int restaurantId);
	ArrayList<Restaurant> fetchAllRestaurants();
	ArrayList<Restaurant> fetchRestaurantOnId(int restaurantId);
	int updateRestaurant(Restaurant r);
	
}
