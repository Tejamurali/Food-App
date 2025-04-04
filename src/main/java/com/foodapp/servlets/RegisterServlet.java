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


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private int status = 0;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("userName");
		String email = req.getParameter("email");
		String phoneNumber = req.getParameter("phoneNumber");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		
		HttpSession session = req.getSession();
		
		
		User user = new User(userName,email,phoneNumber,password,address);
		
		UserDAO userDAO = new UserDAOImpl();
		
		status = userDAO.insertUser(user);
	
		if(status!=0) {
			session.setAttribute("registeredUser", userName);
			resp.sendRedirect("home.jsp");
		}
		else {
			User existingUser = userDAO.fetchUserOnEmail(email);
			if(existingUser!=null) {
				
				session.setAttribute("existingEmail", "Email Is Allready Exist!! Please Try Again....");
				resp.sendRedirect("failure.jsp");
			}
			else {
				resp.sendRedirect("failure.jsp");
			}
			
		}
		
	}
}
