<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.UserDAOImpl"%>
<%@page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
		<%@include file="component/navbar1.jsp"%>


	<div class="container mt-5"
		style="font-family: 'IBM Plex Sans', sans-serif;">
		<div class="row">

			<div class="col-sm-6 mt-5">
				<h2 class="text-center text-danger">Edit Profile</h2>
				<hr>

				<%
					 int id = Integer.parseInt(request.getParameter("id"));
				    UserDAOImpl dao= new UserDAOImpl(DbConnect.getConn());
					User u =dao.getUserById(id);
				%>
				<form action="editprofile" method="post">
					<div class="row register-form">
						<div class="col-md-6">

							<div class="form-group">
								<label> First Name</label> <input type="text"
									class="form-control" placeholder="First Name *" name="fname"
									id="inputAddress" value="<%=u.getFname()%>" required>
							</div>

							<div class="form-group">
								<label> Contact</label> <input type="number"
									class="form-control" placeholder="Enter Contact Number"
									name="contact" id="inputAddress" style="width: 540px;"
									value="<%=u.getContact()%>" required>
							</div>

							<div class="form-group">
								<label> Email Address</label> <input type="email"
									class="form-control" placeholder="Enter Email Address"
									id="email" name="email" style="width: 540px;"
									value="<%=u.getEmail()%>" required="true" readonly>
							</div>

							<div class="form-group">
								<label> Branch</label> <select class="form-control"
									name="branch" id="inlineFormCustomSelectPref"
									style="width: 540px;" value="<%=u.getBranch()%>" required>
									<option value="Computer Science">Computer Science</option>
									<option value="Mechanical">Mechanical</option>
									<option value="Civil">Civil</option>
									<option value="Electronics">Electronics</option>
									<option value="Electric">Electric</option>
									<option value="IT">IT</option>
								</select>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>Last Name</label> <input type="text" class="form-control"
									placeholder="Last Name *" name="lname"
									onkeydown="return alphaOnly(event);"
									value="<%=u.getLname()%>" required>
							</div>
						</div>
						
						 <input type="hidden" name="id" value="<%=u.getId()%>" >

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Update
								Profile</button>
						</div>
					</div>
			   </div>
			</form>

			<div class="col-sm-6 mt-5">
				<img src="image/editnotes.png" style="width: 90%; height: 450px">
			</div>
		</div>
	</div>
	
</body>
</html>