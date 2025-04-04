package com.foodapp.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/RestaurantServlet")
public class RestaurantServlet extends HttpServlet {


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email =  req.getParameter("email");
		
		int userId = 0;
		 if (req.getParameter("userId") != null) {
			 userId = Integer.parseInt(req.getParameter("userId"));
		    }
		 		
	 	RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
	 	ArrayList<Restaurant>  restaurantList = restaurantDAO.fetchAllRestaurants();
	 	
		HttpSession session = req.getSession();
		session.setAttribute("restaurantList", restaurantList);
		session.setAttribute("email", email);
		session.setAttribute("userId", userId);
		resp.sendRedirect("restaurant.jsp");
		
		
	}

}
