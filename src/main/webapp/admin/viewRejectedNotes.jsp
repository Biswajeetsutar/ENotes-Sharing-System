<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : View Rejected Notes</title>
<%@include file="allCss.jsp" %>
</head>
<body>
 <%@include file="nav.jsp" %>
 <br>
	<span style="color: red"><h4 style="margin-top: 10px"
			class="pl-3">Welcome</span>:
	<span style="color: blue"> Admin
		</h4>
	</span>
	<br><br>
   <div class="container mt-5">
  <h1 class="text-success text-center"></h1>
  		  
            <h4 class="text-center text-danger">View Rejected Notes</h4>
			<br>
			<table class="table table-bordered" id="example">
				<thead style="background-color: #9e9e9e">
					<tr>
						<th>S.No</th>
						<th>Uploaded By</th>
						<th>Uploading Date</th>
						<th>Branch</th>
						<th>Subject</th>
						<th>Download Notes</th>
						<th>File Type</th>
						<th>Description</th>
						<th>Status</th>
						<th>Assign Status</th>
						<th>Action</th>			
					</tr>
				</thead>
				<tbody>
					<%
					   try
					   {
						Connection con=ConnectionProvider.getCon();
						Statement st=con.createStatement();
						ResultSet rs = st.executeQuery("select * from notes where status='reject'");
						int i =0;
						while(rs.next())
						{
							i++;
					  %>
					  <tr>
					   <td><%=i %></td>
					   <td><%=rs.getString("email") %></td>
					   <td><%=rs.getString("uploadingdate") %></td>
					   <td><%=rs.getString("branch") %></td>
					   <td><%=rs.getString("subject") %></td>
					   <td><a href="../notes/<%=rs.getString("notesfile")%>" download><%=rs.getString("notesfile")%></a></td>
					   <td><%=rs.getString("filetype") %></td>
					   <td><%=rs.getString("description") %></td>
					   <td><%=rs.getString("status") %></td>
					   <td><a href="editStatus.jsp?id=<%=rs.getString("id")%>" class="btn btn-sm btn-danger"> Assign Status</a></td>
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