package com.foodapp.dao;

import java.util.ArrayList;

import com.foodapp.model.Menu;

public interface MenuDAO {
	
	int insertMenu(Menu m);
	int deleteMenu(int menuId);
	ArrayList<Menu> fetchAllMenu();
	ArrayList<Menu> fetchMenuOnId(int menuId);
	int updateMenu(Menu m);
	Menu getMenu(int menuId);
}
