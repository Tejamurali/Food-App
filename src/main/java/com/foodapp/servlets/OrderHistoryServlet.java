package com.foodapp.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;

import com.foodapp.dao.MenuDAO;
import com.foodapp.dao.OrderHistoryDAO;
import com.foodapp.dao.RestaurantDAO;
import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.daoimpl.OrderHistoryDAOImpl;
import com.foodapp.daoimpl.OrderItemDAOImpl;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Menu;
import com.foodapp.model.OrderHistory;
import com.foodapp.model.OrderItem;
import com.foodapp.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
	
	
	private Menu Menu;
	private ArrayList<Integer> tempMenuIdList;
	private ArrayList<OrderItem> allOrderItemList;
	private ArrayList<Restaurant> restaurantList;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = 0;
		if (req.getParameter("userId") != null) {
		    userId = Integer.parseInt(req.getParameter("userId"));
		}
		HttpSession session = req.getSession();

		OrderHistoryDAO ohDAO = new OrderHistoryDAOImpl();
		OrderItemDAOImpl oiDAO = new OrderItemDAOImpl();
		MenuDAO menuDAO = new MenuDAOImpl();
		RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

		ArrayList<OrderHistory> orderHistoryList = ohDAO.fetchHistoryOnUserId(userId);
		
		ArrayList<Integer> menuIdList = new ArrayList<>();
		ArrayList<Integer> orderIdList = new ArrayList<>();
		ArrayList<Menu> menuList = new ArrayList<>();
		LinkedHashSet<Integer> restaurantListInMenu = new LinkedHashSet<>();

		for (OrderHistory oh : orderHistoryList) {
		    int orderId = oh.getOrderId();
		    orderIdList.add(orderId);
		}
		
		for (int orderId : orderIdList) {
		    tempMenuIdList = oiDAO.fetchItemOnOrderId(orderId);
		}
		for(int orderId : orderIdList) {
			allOrderItemList = oiDAO.fetchAllItemsOnOrderId(orderId);
		}
		if(tempMenuIdList==null) {
			resp.sendRedirect("failure.jsp");
		}
		else {
		
		for(int menuId : tempMenuIdList) {
			menuIdList.add(menuId);
		}

		for(int menuId: menuIdList) {
			Menu = menuDAO.getMenu(menuId);
			menuList.add(Menu);
		}
		
		for(Menu menu : menuList) {
			int restaurantId = menu.getRestaurantId();
			restaurantListInMenu.add(restaurantId);
		}
		for(int restaurantId : restaurantListInMenu) {
			restaurantList = restaurantDAO.fetchRestaurantOnId(restaurantId);
		}
		
		session.setAttribute("restaurantList", restaurantList);
		session.setAttribute("orderHistoryList", orderHistoryList);
		session.setAttribute("allOrderItemList", allOrderItemList);
		session.setAttribute("menuList", menuList);
		resp.sendRedirect("orderHistory.jsp");
		}
	}
}
