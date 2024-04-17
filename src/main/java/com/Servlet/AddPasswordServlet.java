package com.Servlet;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.passDAO;
import com.DB.DBConnect;


@WebServlet("/AddPasswordServlet")
public class AddPasswordServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int usid=Integer.parseInt(request.getParameter("usid"));
		String account=request.getParameter("account");
		int length=Integer.parseInt(request.getParameter("length"));
		String password=request.getParameter("password");
		
		
		passDAO dao=new passDAO(DBConnect.getConnection());
		boolean f=dao.AddPassword(account, length, usid, password);
		HttpSession session=null;
		
		if(f)
		{
			System.out.println("Success");
			session = request.getSession();
			session.setAttribute("updateMsg", "Password added Successfully!!!");
			response.sendRedirect("showpassword.jsp");
		}
		else
		{
			System.out.println("No Success");
			session = request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong!!!");
		}
	}

}
