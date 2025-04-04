package com.foodapp.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.foodapp.connection.MyConnection;
import com.foodapp.dao.MenuDAO;
import com.foodapp.model.Menu;

public class MenuDAOImpl implements MenuDAO{

	private MyConnection myCon;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet res;
	private Menu menu;
	
	private final String ADD_MENU_QUERY = "insert into `menu`(`menuName`,`price`,`description`,`isAvailable`) values(?,?,?,?)";
	private final String DELETE_MENU_QUERY = "delete from `menu` where `menuId`=?";
	private final String GET_ALL_MENU_QUERY = "select * from `menu`";
	private final String GET_MENU_ON_RESTAURANTID = "select * from `menu` where `restaurantId`=?";
	private final String GET_MENU_ON_MENUID = "select * from `menu` where `menuId`=?";
	private final String UPDATE_MENU_ON_ID = "update `menu` set `menuName` = ?,`price` = ?,`description` = ?, `isAvailable`=? where `menuId` = ?";
	
	ArrayList<Menu> menuList = new ArrayList<>(); 
	
	
	public MenuDAOImpl() {
		myCon = MyConnection.getMyConnection();
		connection = myCon.connect();
	}

	@Override
	public int insertMenu(Menu m) {
		
		try {
			pstmt = connection.prepareStatement(ADD_MENU_QUERY);
			pstmt.setString(1,m.getMenuName());
			pstmt.setFloat(2,m.getPrice());
			pstmt.setString(3,m.getDescription());
			pstmt.setString(4,m.getIsAvailable());
			
			return pstmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int deleteMenu(int menuId) {
		try {
			pstmt = connection.prepareStatement(DELETE_MENU_QUERY);
			pstmt.setInt(1, menuId);
			
			return pstmt.executeUpdate();
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public ArrayList<Menu> fetchAllMenu() {
		try {
			stmt = connection.createStatement();
			res = stmt.executeQuery(GET_ALL_MENU_QUERY);
			menuList = extractMenuFromRes(res);
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return menuList;
	}

	@Override
	public ArrayList<Menu> fetchMenuOnId(int restaurantId) {
		
		try {
			pstmt = connection.prepareStatement(GET_MENU_ON_RESTAURANTID);
			pstmt.setInt(1, restaurantId);
			res = pstmt.executeQuery();
			menuList = extractMenuFromRes(res);
			
			}
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		return menuList;
	}

	@Override
	public int updateMenu(Menu m) {
		
		try {
			pstmt = connection.prepareStatement(UPDATE_MENU_ON_ID);
			pstmt.setString(1,m.getMenuName());
			pstmt.setFloat(2,m.getPrice());
			pstmt.setString(3,m.getDescription());
			pstmt.setString(4,m.getIsAvailable());
			
			return pstmt.executeUpdate();
			
		}
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		return 0;
	}
	
	ArrayList<Menu> extractMenuFromRes(ResultSet res) {
		try {
			
			while(res.next()) {
				menuList.add(new Menu(res.getInt("menuId"),
				res.getInt("restaurantId"),
				res.getString("menuName"),
				res.getFloat("price"),
				res.getString("description"),
				res.getString("isAvailable"),
				res.getString("imgPath"))
						
				);
				
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return menuList;
	}
	
	Menu extractMenuOnId(ResultSet res) {
		try {
			
			while(res.next()) {
			menu = new Menu(res.getInt("menuId"),
					res.getInt("restaurantId"),
					res.getString("menuName"),
					res.getFloat("price"),
					res.getString("description"),
					res.getString("isAvailable"),
					res.getString("imgPath"));
				
			}
			
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return menu;
	}

	@Override
	public Menu getMenu(int menuId) {
		try {
			
			pstmt = connection.prepareStatement(GET_MENU_ON_MENUID);			
			pstmt.setInt(1, menuId);
			res = pstmt.executeQuery();
			menu = extractMenuOnId(res);
			}
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		return menu;
	}

}
