<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.UserDAOImpl"%>
<%@page import="com.conn.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : View User</title>
<%@include file="allCss.jsp" %>
</head>
<body>
  <%@include file="nav.jsp" %>
  <br>	<span style="color: red"><h4 style="margin-top: 10px" class="pl-3">
			Welcome</span>:
	<span style="color: blue"> Admin
		</h4>
	</span>
	<br>
  
    <%
		String msg = request.getParameter("msg");
		if ("detele".equals(msg)) {
	%>
	<script>
		alert("User has been Deleted...!!");
		window.location.assign("view_User.jsp");
	</script>
	<%
		}
	%>
	
  <div class="container mt-5">
  <h1 class="text-success text-center"></h1>
  		  
            <h4 class="text-center text-danger">View All Users</h4>
			<br>
			<table class="table table-bordered" id="example">
				<thead style="background-color: #9e9e9e">
					<tr>
						<th>S.No</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Contact</th>
						<th>Branch</th>
						<th>Role</th>
						<th>Action</th>
					</tr>
				</thead>	
				<tbody>
					<%
					   try
					   {
						Connection con=ConnectionProvider.getCon();
						Statement st=con.createStatement();
						ResultSet rs = st.executeQuery("select * from users");
						int i =0;
						while(rs.next())
						{
							i++;
					  %>
					  <tr>
					   <td><%=i %></td>
					   <td><%=rs.getString("fname") %><%=rs.getString("lname") %></td>
					   <td><%=rs.getString("email") %></td>
					   <td><%=rs.getString("contact") %></td>
					   <td><%=rs.getString("branch") %></td>
					   <td><%=rs.getString("role") %></td>
					   <td><a href="deleteUser.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Deleted</a></td>
					  </tr> 
					  <% 		
						}
					  }
					  catch(Exception e)
					  {
						  System.out.println(e);
					  }
					 %>
				</tbody>			
			</table>
  </div>

</body>
</html>