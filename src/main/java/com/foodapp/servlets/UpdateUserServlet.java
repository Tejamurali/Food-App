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


@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private int status;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String userName = req.getParameter("userName");
		String phoneNumber = req.getParameter("phoneNumber");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		
		User user = new User(userName,email,phoneNumber,password,address);
		UserDAO userDAO = new UserDAOImpl();
		status = userDAO.updateUser(user);
		if(status != 0) {
			resp.sendRedirect("login.jsp");
		}
		else {
			resp.sendRedirect("failure.jsp");
		}
		
	}
}
