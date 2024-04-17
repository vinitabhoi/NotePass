package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.passDAO;
import com.DB.DBConnect;

@WebServlet("/deletePasswordServlet")
public class deletePasswordServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	Integer passid=Integer.parseInt(request.getParameter("pass_id"));
	passDAO dao=new passDAO(DBConnect.getConnection());
	
	boolean f=dao.DeletePassword(passid);
	HttpSession session=null;
	if(f)
	{
		session=request.getSession();
		session.setAttribute("updateMsg", "Delete Successfull");
		response.sendRedirect("showpassword.jsp");
	}
	else
	{
		session=request.getSession();
		session.setAttribute("wrongMsg", "Something went wrong!!");
		response.sendRedirect("showpassword.jsp");
	}
	}

}
