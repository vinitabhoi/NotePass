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

@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		try {
			
			Integer noteid=Integer.parseInt(request.getParameter("noteid"));
			String Title=request.getParameter("title");
			String Content=request.getParameter("content");
			
			PostDAO dao=new PostDAO(DBConnect.getConnection());
			boolean f=dao.PostUpdate(noteid, Title, Content);
			HttpSession session = null;
			
			if(f)
			{
				System.out.println("SUCCESSFULL");
				session = request.getSession();
				session.setAttribute("updateMsg", "Update Successfull!!!");
				response.sendRedirect("shownotes.jsp");
			}
			else
			{
				System.out.println("NOT SUCCESSFULL");
				session = request.getSession();
				session.setAttribute("wrongMsg", "Update not Successfull!!!");
				response.sendRedirect("shownotes.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
