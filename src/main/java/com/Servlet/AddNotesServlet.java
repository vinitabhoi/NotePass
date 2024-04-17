package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.DB.DBConnect;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		
		PostDAO dao=new PostDAO(DBConnect.getConnection());
		boolean f=dao.AddNotes(title, content, uid);
		HttpSession session=null;
		
		if(f)
		{
			System.out.println("Success");
			session = request.getSession();
			session.setAttribute("updateMsg", "Note added Successfully!!!");
			response.sendRedirect("shownotes.jsp");
		}
		else
		{
			System.out.println("No Success");
			session = request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong!!!");
		}
		
	}

}
