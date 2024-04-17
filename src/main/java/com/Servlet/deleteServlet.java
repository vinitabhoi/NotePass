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

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer noteid=Integer.parseInt(request.getParameter("note_id"));
		PostDAO dao=new PostDAO(DBConnect.getConnection());
		
		boolean f=dao.DeleteNotes(noteid);
		HttpSession session=null;
		if(f)
		{
			session=request.getSession();
			session.setAttribute("updateMsg", "Delete Successfull");
			response.sendRedirect("shownotes.jsp");
		}
		else
		{
			session=request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong!!");
			response.sendRedirect("shownotes.jsp");
		}
		
	}

}
