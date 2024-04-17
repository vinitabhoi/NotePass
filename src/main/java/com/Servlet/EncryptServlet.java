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

@WebServlet("/EncryptServlet")
public class EncryptServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
		Integer passid=Integer.parseInt(request.getParameter("pass_id"));
		String password=request.getParameter("password");
		byte[] encrypt=Base64.getEncoder().encode(password.getBytes());
		System.out.println("Encrypted: "+ new String(encrypt));
		
		passDAO dao=new passDAO(DBConnect.getConnection());
		boolean f=dao.EncryptDecrypt(passid, password);
		HttpSession session = null;
		
		if(f)
		{
			System.out.println("SUCCESSFULL");
			session = request.getSession();
			session.setAttribute("updateMsg", "Encrytion Successfull!!!");
			response.sendRedirect("showpassword.jsp");
		}
		else
		{
			System.out.println("NOT SUCCESSFULL");
			session = request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong!!!");
			response.sendRedirect("showpassword.jsp");
		}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
