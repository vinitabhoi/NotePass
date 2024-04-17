<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INDEX</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

	<!--NAVBAR  -->
	<nav class="navbar navbar-expand-lg navbar-light bg-custom">
  <a class="navbar-brand text-white" href="#">Notes and Password Manager</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">Home </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addnotes.jsp">Add Notes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="shownotes.jsp">Show Notes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="password.jsp">Passwords</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="about.jsp">About us</a>
      </li>
     
      
    </ul>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
				type="submit"><i class="fa fa-user-circle-o"
				style="font-size: 24px"> Login </i></a> <a href="register.jsp"
				class="btn btn-light my-2 my-sm-0" type="submit"><i
				class="fa fa-user-plus" style="font-size: 24px">Register</i></a>

		</div>
	</nav>


	<div class="row">
		<div class="col-md-12">

			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="images/first.png"
							alt="First slide">
						<div class="carousel-caption d-none d-md-block">
							<h5 class="h-pri mb-15" style="text: black;">Welcome to Notes and Password Manager</h5>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="images/login.webp"
							alt="Second slide">

						<div class="carousel-caption d-none d-md-block">
							<h5 class="h-pri">Secure your data</h5>
							<p class="p-pri">All Notes and Passwords in one account</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100 h-80" src="images/pass.webp"
							alt="Third slide">

						<div class="carousel-caption d-none d-md-block">
							<h5 class="h-pri">Generate and store</h5>
							<p class="p-pri">All your Notes and Passwords</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	
	<%@include file="about.jsp" %>

	<div class="footer">
		<h3>Copyright &#169; TE COMPS A, 2023. All Rights
			Reserved.</h3>
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