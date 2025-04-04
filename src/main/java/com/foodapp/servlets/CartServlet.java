package com.foodapp.servlets;

import java.io.IOException;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.model.Cart;
import com.foodapp.model.CartItem;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = 0;

		String userIdParam = req.getParameter("userId");

		if (userIdParam != null && !userIdParam.isEmpty()) {
		    try {
		        userId = Integer.parseInt(userIdParam);
		    } catch (NumberFormatException e) {
		        userId = 0;
		    }
		}

		String restaurantId=null;
				
		if(userId == 0) {
			HttpSession session = req.getSession();
			session.setAttribute("loginmsg", "Please Login!! Then You Can Order Food Your wish...");
			resp.sendRedirect("login.jsp");
		}
		else {
			HttpSession session = req.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			
			if(cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			
			String action = req.getParameter("action");
			
			
			if(action.equals("add")) {
			
			addItemToCart(req,cart);
			}else if(action.equals("update")) {
			updateCartItem(req,cart);
			}else if(action.equals("remove")) {
			removeItemFromCart(req,cart);
			}
			if(action.equals("bill")) {
			restaurantId = req.getParameter("restaurantId");
			session.setAttribute("userId", userId);
			session.setAttribute("restaurantId", restaurantId);
			session.setAttribute("cart", cart);
			resp.sendRedirect("billingItem.jsp");
			}else if(action.equals("order")) {
				float totalAmount = Float.parseFloat(req.getParameter("totalAmount"));
				String paymentMode = req.getParameter("paymentMode");
				session.setAttribute("userId", String.valueOf(userId));
				session.setAttribute("restaurantId", String.valueOf(restaurantId));
				session.setAttribute("totalAmount", totalAmount);
				session.setAttribute("paymentMode", paymentMode);
				session.setAttribute("cart", cart);
				resp.sendRedirect("OrderServlet");
			}else if(action.equals("returnToCart")) {
				session.setAttribute("userId", userId);
				session.setAttribute("cart", cart);
				resp.sendRedirect("cart.jsp");
			}
			else {
				session.setAttribute("userId", userId);
				session.setAttribute("cart", cart);
				resp.sendRedirect("cart.jsp");
			}
		
			}
	}

	private void removeItemFromCart(HttpServletRequest req, Cart cart) {
		int itemId = Integer.parseInt(req.getParameter("itemId").trim());
		cart.deleteItem(itemId);
	}

	private void updateCartItem(HttpServletRequest req, Cart cart) {
		int itemId = Integer.parseInt(req.getParameter("itemId").trim());
		int quantity = Integer.parseInt(req.getParameter("quantity").trim());
		
		cart.updateItem(itemId, quantity);
		
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		
		int itemId = Integer.parseInt(req.getParameter("itemId").trim());
		int quantity = Integer.parseInt(req.getParameter("quantity").trim());
		
		
		MenuDAO menuDAO = new MenuDAOImpl();
		Menu menuItem = menuDAO.getMenu(itemId);
		
		
		float subTotal = menuItem.getPrice()*quantity;
		
		HttpSession session = req.getSession();
		
		session.setAttribute("restaurantId", menuItem.getRestaurantId());
		
		if(menuItem != null) {
			
			CartItem item = new CartItem(menuItem.getMenuId(),
					menuItem.getMenuName(),
					menuItem.getRestaurantId(),
					quantity,
					menuItem.getPrice(),
					subTotal,
					menuItem.getImgPath());
			
			cart.addItem(item);
		}
	}

}
