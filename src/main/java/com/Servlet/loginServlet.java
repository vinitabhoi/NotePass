package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entities.User;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	User us=new User();
	us.setEmail(email);
	us.setPassword(password);
	
	UserDAO dao=new UserDAO(DBConnect.getConnection());
	User user=dao.loginUser(us);
	
	if(user != null)
	{
		HttpSession session=request.getSession();
		session.setAttribute("userD", user);
		response.sendRedirect("home.jsp");
	}
	else
	{
		HttpSession session=request.getSession();
		session.setAttribute("login-failed", "Invalid Username or Password");
		response.sendRedirect("login.jsp");
	}
	
	
	
	}

}
