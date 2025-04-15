<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Change Password</title>
 <%@include file="allCss.jsp" %>
</head>
<body>
  <%@include file="nav.jsp" %>
  
   <%
		String msg = request.getParameter("msg");
		if ("notMatch".equals(msg)) {
	%>
	<script>
		alert("New password and Confirm password does not match!");
		window.location.assign("adminChangePassword.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("wrong".equals(msg)) {
	%>
	<script>
		alert("Your old Password is wrong!");
		window.location.assign("adminChangePassword.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("done".equals(msg)) {
	%>
	<script>
		alert("Password changed successfully!");
		window.location.assign("adminlogin.jsp");
	</script>

	<%
		}
	%>
  
  <div class="container mt-5">
		<div class="row">
			<div class="col-sm-6">
				<h2 class="text-center text-danger">CHANGE PASSWORD</h2>
				<hr>
				<form action="adminChangePasswordAction.jsp" method="post">
					<label>Old Password</label> <input type="password"
						name="oldpassword" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter Old Password" required>
						
					<label>New Password</label> <input type="password"
						name="newpassword" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter New Password" required>
					<label>Confirm Password</label> <input type="password"
						name="confirmpassword" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" placeholder="Enter New Password Again" required>
					<hr>
					<input type="submit" class="btn btn-danger mt-2" value="Submit">
					
				</form>
			</div>
			<div class="col-sm-6">
				<img src="../image/adminchangepass.png" style="width: 90%; height: 400px">
			</div>

		</div>
	</div>
</body>
</html>