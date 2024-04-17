package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entities.User;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		User us=new User();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao=new UserDAO(DBConnect.getConnection());
		boolean f=dao.userRegister(us);
		HttpSession session;
		
		if(f)
		{
			session=request.getSession();
			session.setAttribute("reg-success", "Registration successfull !!!");
			response.sendRedirect("register.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("failed-msg", "Something went wrong. Try again!!!");
			response.sendRedirect("register.jsp");
		}
		
	}

}
