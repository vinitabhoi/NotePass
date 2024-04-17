<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    User user2=(User)session.getAttribute("userD");
    
    if(user2 == null)
    {
    	response.sendRedirect("login.jsp");
    	session.setAttribute("Login-error", "Please Login");
    }
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GENERATE</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<link rel="stylesheet" href="style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
#button {
font-size: 15px;
margin-top: 40px;
margin-left:20px;
width: 120px;
height: 45px;
text-align: center;
background: green;
display: flex;
color: white;
justify-content: center;
align-items: center;
cursor: pointer;
border:solid;
border-radius: 10px;
}
</style>

</head>
<body>

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

				<li class="nav-item"><a class="nav-link" href="shownotes.jsp">Show
						Notes</a></li>
						
				<li class="nav-item"><a class="nav-link" href="#">Password</a>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="about.jsp">About us</a>
				</li>
				

			</ul>
			<%
			User user = (User) session.getAttribute("userD");

			if (user != null) {
			%>
			<a href="#" class="btn btn-light my-2 my-sm-0 mr-2" data-toggle="modal" data-target="#exampleModal"
				type="submit"><i class="fa fa-user-circle-o"
				style="font-size: 24px"> <%=user.getName() %></i></a>
				
				<a href="LogoutServlet"
				class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa fa-sign-out" style="font-size:24px">Logout</i></a>
				
			<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
       <div class="container text-center">
       <i class="fa fa-user fa-3x"></i>
       <h4> <%=user.getName()%></h4>
       
       <table class="table">
       <tbody>
       	<tr> 
       		<th> User Id </th>
       		<td> <%=user.getId() %> </td>
       	</tr>
       	
       	<tr> 
       		<th> User Name </th>
       		<td> <%=user.getName() %> </td>
       	</tr>
       	
       	<tr> 
       		<th> User Email </th>
       		<td> <%=user.getEmail() %> </td>
       	</tr>
       </tbody>
       
       </table>
      <div>
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
	
<h1 class="text-center mt-3">Generate and Store Passwords</h1>

<div class="container">
<div class="row mt-5">
<div class="col-md-12">
<form action="AddPasswordServlet" method="post">
  <div class="form-group">

<%
  User us=(User)session.getAttribute("userD");
  
  if(us != null)
  {%>
   <input type="hidden" value="<%=us.getId()%>" name="usid">
   <%}
  
  %>  
  
    <label for="exampleInputEmail1">Account</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="account" placeholder="Enter account name">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Enter length</label>
    <input type="number" class="form-control" id="lengthchar" name="length">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="text" class="form-control" id="password" readonly="readonly" name="password">
    <table>
    <tr>
    <th> <div id="button" class="btn1" onclick="genPassword()"> Generate</div> </th>
    <th> <a id="button" class="btn2" onclick="copyPassword()"> Copy</a> </th> 
   </tr>
   </table>
   </div>
    <script type="text/javascript">
    var password=document.getElementById("password");
    function genPassword(){
    	var chars = "0123456789abcdefghijklmnopqrstuvwxyz@!#$%^&*_+ABCDEFGHHIJKLMNOPQRSTUVWXYZ"
    	var passwordLength = document.getElementById("lengthchar").value;
        var password = "";
     for (var i = 0; i < passwordLength; i++) {
       var randomNumber = Math.floor(Math.random() * chars.length);
       password += chars.substring(randomNumber, randomNumber +1);
      }
            document.getElementById("password").value = password;
     }

    function copyPassword() {
      var copyText = document.getElementById("password");
      copyText.select();
      document.execCommand("copy");  
    }
    </script>
    <div class="container text-center">
  <button type="submit" class="btn btn-primary mt-3">Submit</button>
  </div> 
    </form>
    
</div>
</div>
</div>


<div class="footer">
            <h3> Copyright &#169; TE COMPS A,2023. All Rights Reserved.</h3>
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