<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body
	style="background: rgb(0, 212, 255); background: linear-gradient(180deg, rgba(0, 212, 255, 1) 0%, rgba(42, 204, 107, 1) 35%, rgba(93, 135, 52, 1) 100%); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">

	<!--NAVBAR  -->

	<nav class="navbar navbar-expand-lg navbar-light bg-custom">
		<a class="navbar-brand text-white" href="index.jsp">Notes and Password Manager</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="home.jsp">Home </a></li>
					
				<li class="nav-item"><a class="nav-link" href="addnotes.jsp">Add Notes</a>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="shownotes.jsp">Show Notes</a>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="password.jsp">Password</a>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="about.jsp">About us</a>
				</li>
				
				
			</ul>
	
				<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-circle-o" style="font-size: 24px"> Login </i></a>
				<a href="register.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa fa-user-plus" style="font-size: 24px">Register</i></a>
		
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center c-head text-white">
						<i class="fa fa-user-circle-o" style="font-size: 36px"></i>
						<h5>LOGIN FORM</h5>
					</div>

					<%
					String invalidMsg= (String) session.getAttribute("login-failed");
					
					if (invalidMsg != null) {
					%>
					<div class="alert alert-warning" role="alert"><%=invalidMsg%></div>
					<%
					session.removeAttribute("login-failed");
					}
					%>
					
					<%
					String woLogin = (String)session.getAttribute("Login-error");
					if(woLogin != null) {
					%>
					<div class="alert alert-warning" role="alert"><%=woLogin%></div>
					<% 
					session.removeAttribute("Login-error");
					}
					%>
					
					<%
					String lgMsg = (String)session.getAttribute("logoutMsg");
					if(lgMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=lgMsg%></div>
					<% 
					session.removeAttribute("logoutMsg");
					}
					%>	
				

					<div class="card-body">
						<form action="loginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" name="password">
							</div>
							<button type="submit"
								class="btn btn-primary btn-block badge-pill">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="footer">
            <h3> Copyright &#169; TE COMPS A, 2023. All Rights Reserved.</h3>
      </div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>