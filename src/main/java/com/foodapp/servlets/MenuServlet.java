package com.foodapp.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.foodapp.dao.MenuDAO;
import com.foodapp.daoimpl.MenuDAOImpl;
import com.foodapp.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		String restaurantName = req.getParameter("restaurantName");
		String address = req.getParameter("address");
		String ratings = req.getParameter("ratings");
		String email = req.getParameter("email");
		
		int userId = 0;
		 if (req.getParameter("userId") != null) {
			 userId = Integer.parseInt(req.getParameter("userId"));
		    }
		MenuDAO menuDAO = new MenuDAOImpl();
		ArrayList<Menu> menuList = menuDAO.fetchMenuOnId(restaurantId);
		
		HttpSession session = req.getSession();
		session.setAttribute("address", address);
		session.setAttribute("restaurantName", restaurantName);
		session.setAttribute("ratings", ratings);
		session.setAttribute("menuList", menuList);
		session.setAttribute("userId", userId);
		session.setAttribute("email", email);
		resp.sendRedirect("menu.jsp");
		
	}
}
