package com.foodapp.servlets;

import java.io.IOException;

import com.foodapp.dao.UserDAO;
import com.foodapp.daoimpl.UserDAOImpl;
import com.foodapp.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ReturnToHome")
public class ReturnToHome extends HttpServlet {
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
				
		if(userId == 0) {
			HttpSession session = req.getSession();
			session.setAttribute("loginmsg", "Please Login!! Then You Can Order Food Your wish...");
			resp.sendRedirect("login.jsp");
		}
		else {
			UserDAO userDAO = new UserDAOImpl();
			User user = userDAO.fetchUserOnUserId(userId);
			HttpSession session = req.getSession();
			session.setAttribute("loggedInUser", user);
			resp.sendRedirect("home.jsp");
		}
		
		
		
		
	}
}
