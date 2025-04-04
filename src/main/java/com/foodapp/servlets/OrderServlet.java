package com.foodapp.servlets;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;

import com.foodapp.dao.OrderHistoryDAO;
import com.foodapp.dao.OrderItemDAO;
import com.foodapp.dao.OrderTableDAO;
import com.foodapp.daoimpl.OrderHistoryDAOImpl;
import com.foodapp.daoimpl.OrderItemDAOImpl;
import com.foodapp.daoimpl.OrderTableDAOImpl;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.OrderHistory;
import com.foodapp.model.OrderItem;
import com.foodapp.model.OrderTable;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private int maxOrderId;
	private int orderTableStatus;
	private int orderItemStatus;
	private int orderHistoryStatus;
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 HttpSession session = req.getSession();

		 String userIdStr = (String) session.getAttribute("userId");
	        int userId = 0; 

	        if (userIdStr != null) {
	            try {
	                userId = Integer.parseInt(userIdStr);
	            } catch (NumberFormatException e) {
	                e.printStackTrace();
	            }
	        }
		 		 
		 
		 String restaurantIdStr = (String) session.getAttribute("userId");
	        int restaurantId = 0; 

	        if (restaurantIdStr != null) {
	            try {
	            	restaurantId = Integer.parseInt(restaurantIdStr);
	            } catch (NumberFormatException e) {
	                e.printStackTrace();
	            }
	        }
	        	        
	        float totalAmount = (Float) session.getAttribute("totalAmount");
	        String paymentMode = (String) session.getAttribute("paymentMode");
	        Cart cart = (Cart) session.getAttribute("cart");
	       
	        OrderTable ot = new OrderTable(restaurantId,userId,totalAmount,paymentMode);
	        OrderTableDAO otDAO = new OrderTableDAOImpl();
			orderTableStatus = otDAO.insertOrderTable(ot);
			maxOrderId = otDAO.fetchMaxOrderId();			
	        Map<Integer, CartItem> itemsMap = cart.fetchAllItems();
	        for(Entry<Integer, CartItem> entry : itemsMap.entrySet()) {
	        	
	        	int menuId = entry.getValue().getItemId();
	        	int quantity = entry.getValue().getQuantity();
	        	float subTotal = entry.getValue().getSubTotal();
	        	
	        	OrderItem oi = new OrderItem(maxOrderId,menuId,quantity,subTotal);
	        	
	        	OrderItemDAO oiDAO = new OrderItemDAOImpl();
	        	orderItemStatus = oiDAO.insertOrderItem(oi);
	        }
	        
	        OrderHistory oh = new OrderHistory(maxOrderId,userId,totalAmount);
	        OrderHistoryDAO ohDAO = new OrderHistoryDAOImpl();
	        orderHistoryStatus = ohDAO.insertOrderHistory(oh);
	        
	        if(orderTableStatus != 0 && orderItemStatus != 0 && orderHistoryStatus != 0 ) {
	        	session.setAttribute("userId", userId);
	        	resp.sendRedirect("orderSuccess.jsp");
	        }
	        else {
	        	resp.sendRedirect("orderFailure.jsp");
	        }
	        
	        
	}
}
