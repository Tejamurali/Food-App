package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.Category;

public interface CategoryDAO {
	ArrayList<Category> fetchAllCategory();
}
