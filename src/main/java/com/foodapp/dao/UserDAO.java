package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.User;

public interface UserDAO {
	
	int insertUser(User u);
	int deleteUser(String email);
	ArrayList<User> fetchAllUsers();
	User fetchUserOnEmail(String email);
	int updateUser(User u);
	User fetchUserOnUserId(int userId);
}
