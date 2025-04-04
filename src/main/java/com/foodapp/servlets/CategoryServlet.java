package com.foodapp.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.foodapp.dao.CategoryDAO;
import com.foodapp.daoimpl.CategoryDAOImpl;
import com.foodapp.model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
		private ArrayList<Category> categoryList;

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int userId = 0;
			 if (req.getParameter("userId") != null) {
				 userId = Integer.parseInt(req.getParameter("userId"));
			    }
			HttpSession session = req.getSession();
			CategoryDAO cateDAO = new CategoryDAOImpl();
			categoryList = cateDAO.fetchAllCategory();
			session.setAttribute("userId", userId);
			session.setAttribute("categoryList", categoryList);
			resp.sendRedirect("category.jsp");
			
			
		}
}
