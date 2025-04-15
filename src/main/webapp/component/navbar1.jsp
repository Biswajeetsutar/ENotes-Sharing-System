<%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString().trim();;
    String fname = "";
	String lname = "";
	String contact = "";
	String branch = "";
	String role = "";
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='" + email + "'");
		if (rs.next()) {
			
			fname = rs.getString(2);
			lname = rs.getString(3);
			contact = rs.getString(4);
			branch = rs.getString(7);
			role = rs.getString(8);
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ENotes Sharing Site</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="{% static 'css/mystyle.css' %}">

<!-- datatable start -->
        
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.0.1/js/buttons.html5.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.0.1/css/buttons.dataTables.min.css">
    
    <script>
    $(document).ready(function() {
        $('#example').DataTable( {
            dom: 'Bfrtip',
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5',
                'pdfHtml5'
            ]
        } );
    } );
    </script>
    <!-- datatable end -->
</head>
<body>
	<h4 style="padding: 1%">
		<span style="color: red">E</span><span style="color: green">
			Notes</span>
	</h4>
	<nav class="navbar navbar-expand-sm justify-content-center"
		style="background-color: #fbe9e7;">
		<ul class="navbar-nav">
			<li class="navbar-item"><a class="nav-link" href="profile.jsp"><i
					class="fas fa-home"></i> HOME</a></li>

			<li class="navbar-item"><a class="nav-link"
				href="uploadNotesUser.jsp"><i class="fas fa-cloud-upload-alt"></i>
					UPLOAD NOTES</a></li>

			<li class="navbar-item"><a class="nav-link"
				href="viewMyNotesUser.jsp"><i class="fas fa-eye"></i> VIEW MY
					NOTES</a></li>

			<li class="navbar-item"><a class="nav-link"
				href="viewAllNoteUser.jsp"><i class="fas fa-eye"></i> VIEW ALL
					NOTES</a></li>

			<li class="navbar-item"><a class="nav-link"
				href="changePassword.jsp"><i class="fas fa-key"></i> CHANGE
					PASSWORD</a></li>

			<li class="navbar-item"><a class="nav-link" href="logout.jsp"><i
					class="fas fa-circle-notch"></i> LOGOUT</a></li>

			<div class="dropdown">
				<button class="btn btn-primary dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Welcome <% out.println(fname + " " + lname);%></button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="profile.jsp">PROFILE</a>  <a
						class="dropdown-item" href="changePassword.jsp">CHANGE PASSWORD</a>
				</div>
			</div>

<!--  
			<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">
					Welcome
					<%
					out.println(fname + " " + lname);
				%>
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">PROFILE</a> <a
						class="dropdown-item" href="#">EDIT PROFILE</a> <a
						class="dropdown-item" href="#">CHANGE PASSWORD</a>
				</div>
			</div> -->

		</ul>
	</nav>
</body>

</html>