package com.foodapp.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.foodapp.dao.RestaurantDAO;
import com.foodapp.dao.UserDAO;
import com.foodapp.daoimpl.RestaurantDAOImpl;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.Restaurant;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	ArrayList<User> userList;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDAO userDAO = new UserDAOImpl();
		User user = userDAO.fetchUserOnEmail(email);
		RestaurantDAO restaurantDAO = new RestaurantDAOImpl();
	 	ArrayList<Restaurant>  restaurantList = restaurantDAO.fetchAllRestaurants();
		HttpSession session = req.getSession();
		
		if(user.getEmail() != null) {
			
			if(user.getEmail().equals(email)) {
				
				
				if(user.getPassword()!=null) {
				
					if(user.getPassword().equals(password)) {
							session.setAttribute("restaurantList", restaurantList);
							session.setAttribute("loggedInUser", user);
							resp.sendRedirect("home.jsp");
					
					}else {
						req.setAttribute("password",password);
						req.setAttribute("email",email);
						req.setAttribute("passwordWrong","Please check your password!!");
						req.getRequestDispatcher("/login.jsp").forward(req, resp);
						}
				}else {
					req.setAttribute("email",email);
					req.setAttribute("passwordWrong","Please check your password!!");
					req.getRequestDispatcher("/login.jsp").forward(req, resp);
				}
			}else {
				req.setAttribute("email",email);
				req.setAttribute("emailWrong","Please check your email!!");
				req.getRequestDispatcher("/login.jsp").forward(req, resp);
			}
		
		}else {
			req.setAttribute("email",email);
			req.setAttribute("emailWrong","Please check your email!!");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}
		
		
		
	}

}
