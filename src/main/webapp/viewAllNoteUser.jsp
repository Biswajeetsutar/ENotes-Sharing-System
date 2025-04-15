<%@page import="com.entity.NotesDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.NotesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes : User</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	  <%@include file="component/navbar1.jsp"%>
  <br><br>
  <div class="container mt-5">
  <h1 class="text-success text-center"></h1>
  		  
            <h4 class="text-center text-danger">View All Notes</h4>
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
					</tr>
				</thead>
				<tbody>
				<%				  
				    NotesDAOImpl dao = new NotesDAOImpl(DbConnect.getConn());
				    List<NotesDtls> list =  dao.getViewAllNotes();
				    for (NotesDtls n : list) {
			      %>
			  <tr>
				 <td><%=n.getId()%></td>
				 <td><%=n.getEmail()%></td>
				 <td><%=n.getUploadingdate()%></td>
				 <td><%=n.getBranch()%></td>
				 <td><%=n.getSubject()%></td>
				 <td><a href="notes\<%=n.getNotesfile()%>" download><%=n.getNotesfile()%></a></td>
				 <td><%=n.getFiletype()%></td>
				 <td><%=n.getDescription()%></td>
			  </tr>
			<%
				}
			%>
		</tbody>
				
			</table>
</div>
	
</body>
</html>