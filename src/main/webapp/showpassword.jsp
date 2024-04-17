<%@page import="com.entities.Pass"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.passDAO"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user4 = (User) session.getAttribute("userD");

if (user4 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Passwords</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<!--NAVBAR  -->
	<nav class="navbar navbar-expand-lg navbar-light bg-custom">
		<a class="navbar-brand text-white" href="index.jsp">Notes and
			Password Manager</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<li class="nav-item"><a class="nav-link" href="home.jsp">Home
				</a></li>

				<li class="nav-item"><a class="nav-link" href="addnotes.jsp">Add
						Notes</a></li>

				<li class="nav-item"><a class="nav-link" href="shownotes.jsp">Show
						Notes</a></li>

				<li class="nav-item"><a class="nav-link" href="password.jsp">Password</a>
				</li>

				<li class="nav-item"><a class="nav-link" href="about.jsp">About
						us</a></li>


			</ul>
			<%
			User user = (User) session.getAttribute("userD");

			if (user != null) {
			%>
			<a href="#" class="btn btn-light my-2 my-sm-0 mr-2"
				data-toggle="modal" data-target="#exampleModal" type="submit"><i
				class="fa fa-user-circle-o" style="font-size: 24px"> <%=user.getName()%></i></a>

			<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0"
				type="submit"><i class="fa fa-sign-out" style="font-size: 24px">Logout</i></a>

			<!-- Button trigger modal -->
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="container text-center">
								<i class="fa fa-user fa-3x"></i>
								<h4>
									<%=user.getName()%></h4>

								<table class="table">
									<tbody>
										<tr>
											<th>User Id</th>
											<td><%=user.getId()%></td>
										</tr>

										<tr>
											<th>User Name</th>
											<td><%=user.getName()%></td>
										</tr>

										<tr>
											<th>User Email</th>
											<td><%=user.getEmail()%></td>
										</tr>
									</tbody>

								</table>
								<div>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-user-circle-o"
				style="font-size: 24px"> Login </i></a> <a href="register.jsp"
				class="btn btn-light my-2 my-sm-0" type="submit"><i
				class="fa fa-user-plus" style="font-size: 24px">Register</i></a>
			<%
			}
			%>

		</div>
	</nav>

	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert">
		<%=updateMsg%>
	</div>
	<%
	session.removeAttribute("updateMsg");
	}
	%>

	<%
	String wrongMsg = (String) session.getAttribute("wrongMsg");
	if (updateMsg == null) {
	%>
	<div class="alert alert-danger" role="alert">
		<%=wrongMsg%>
	</div>
	<%
	session.removeAttribute("wrongMsg");
	}
	%>

	<br>
	<br>

	<div class="container">
		<h2 class="text-center">All Passwords</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (user4 != null) {
					passDAO nb = new passDAO(DBConnect.getConnection());
					List<Pass> pass = nb.getData(user4.getId());
					
					for (Pass pa : pass) {
				%>
				<div class="card mt-3">
					<img alt="page" src="images/nice.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px;">

					<div class="card-body p-4">
						<div class="card-title">


							<h5>
								<b class="text-success">Account name: <%=pa.getAccount()%>
								</b><br> <b class="text-primary"></b>
							</h5>

							<h5>
								<b class="text-success">Password: <%=pa.getPassword()%>
								</b><br> <b class="text-primary"></b>
							</h5>

							<div class="container text-center mt-2">
								<a href="deletePasswordServlet?pass_id=<%=pa.getId()%>"
									class="btn btn-danger"> Delete </a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>

			</div>
		</div>
	</div>

	<div class="footer">
		<h3>Copyright &#169; TE COMPS A,2023. All Rights
			Reserved.</h3>
	</div>



</body>
</html>
















