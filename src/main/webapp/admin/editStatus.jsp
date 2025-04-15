<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Edit Status</title>
<%@include file="allCss.jsp" %>
</head>
<body>
  <%@include file="nav.jsp" %>
  <br>
  
    <%
		String msg = request.getParameter("msg");
		if ("valid".equals(msg)) {
	%>
	<script>
		alert("Status has been Updated..");
		window.location.assign("viewAllNotes.jsp");
	</script>
	<%
		}
	%>
	<%
		if ("invalid".equals(msg)) {
	%>
	<script>
		alert("Something went wrong! Try Again..");
	</script>
	<%
		}
	%>
	
	<%
		String id = request.getParameter("id");
		String t = "";
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from notes where id=" + id + "");
			while (rs.next()) {
				t = rs.getString(1);
	%>
  
  <div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-5">

					<div class="card-header primary-background text-black text-center">
						<h2>Change Status</h2>
					</div>

					<div class="card-body">
						<form action="editStatusAction.jsp" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Notes Id</label> <input
									type="text" class="form-control" id="tickettype"
									name="tickettype" aria-describedby="emailHelp"
									value="<%=rs.getString(1)%>" required="true"
									readonly>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Status</label> 
								<select class="form-control" name="status">
								<option value="Accept">Accept</option>
								<option value="Reject">Reject</option>
                                </select>
							</div>
							<input type="hidden" name="id" value="<%=rs.getString("id")%>">
							<hr>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<%
		}
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
</body></html>