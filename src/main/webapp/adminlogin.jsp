<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Login</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
    <br><br>
    <%
		String validMsg = (String) session.getAttribute("validMsg");
		String invalidMsg = (String) session.getAttribute("invalidMsg");

		if (validMsg != null) {
	%>
	<script>
		alert("Successfully Login...");
		window.location.assign("admin/dashboard.jsp");
	</script>
	<%
		session.removeAttribute("validMsg");
		}
	%>
	<%
		if (invalidMsg != null) {
	%>
	<script>
		alert("Something went Wrong..!!");
		window.location.assign("adminlogin.jsp");
	</script>
	<%
		session.removeAttribute("invalidMsg");
		}
	%>
	
	<div class="container mt-5">
		<div class="row">
			<div class="col-sm-6">
				<img src="image/adminlog.jpg" class="img-thumbnail"
					style="width: 100%; height: 350px;">
			</div>

			<div class="col-sm-6">
				<h2 class="text-center">ADMIN LOGIN</h2>
				<p>Enter your Username and Password for access Admin Panel</p>
				<hr>

				<form action="adminlogin" method="post">
					<label>User Name</label> <input type="text" name="email"
						class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter User Name"
						required> 
					<label>Password</label> <input type="password"
						name="password" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter Password" required>
					<hr>
					<div class="text-center">
						<button type="submit" class="btn btn-danger">Login</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>