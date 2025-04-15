<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="com.conn.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.container1 {
	background-color: lightgrey;
	border-radius: 8px;
}

h2, h4 {
	padding: 10px;
}

.mydiv:hover {
	transform: translateY(-10px)
}

.glow {
	font-size: 80px;
	color: #fff;
	text-align: center;
	-webkit-animation: glow 1s ease-in-out infinite alternate;
}

@-webkit-keyframes glow {
  from { 
  text-shadow :0 0 10px #fff, 0 0 20px #fff, 0 0 30px #e60073,
	0 0 40px #e60073, 0 0 50px #e60073, 0 0 60px #e60073, 0 0 70px #e60073;
  }

  to {
	text-shadow: 0 0 20px #fff, 0 0 30px #ff4da6, 0 0 40px #ff4da6, 0 0 50px
		#ff4da6, 0 0 60px #ff4da6, 0 0 70px #ff4da6, 0 0 80px #ff4da6;
  }
}
</style>
</head>
<body>
	<%@include file="nav.jsp"%>
	<br><br>
	
	<div class="container mt-5">
		<div class="row">
            <%
			try {
				int count = 0;
				Connection con = ConnectionProvider.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from notes where status='pending'");
				while (rs.next()) {
					count++;
				}
		    %>
			<div class="col-sm-3 text-center mydiv">
				<div class="container1">
					<h2 class="text-primary"><%out.println(count);%></h2>
					<a href="viewPendingNotes.jsp"><h4 class="text-dark">Pending Notes</h4></a>
				</div>
			</div>
        <%
			
		%>
			<div class="col-sm-3 text-center mydiv">
			 <%
				int count1 = 0;
					ResultSet rs1 = st.executeQuery("select * from notes where status='accept'");
					while (rs1.next()) {
						count1++;
					}
			 %>
				<div class="container1">
					<h2 class="text-primary"><%out.println(count1);%></h2>
					<a href="viewAcceptedNotes.jsp"><h4 class="text-dark">Accepted Notes</h4></a>
				</div>
			</div>

			<div class="col-sm-3 text-center mydiv">
			<%
				int count2 = 0;
					ResultSet rs2 = st.executeQuery("select * from notes where status='reject'");
					while (rs2.next()) {
						count2++;
					}
			 %>
				<div class="container1">
					<h2 class="text-primary"><%out.println(count2);%></h2>
					<a href="viewRejectedNotes.jsp"><h4 class="text-dark">Rejected Notes</h4></a>
				</div>
			</div>

			<div class="col-sm-3 text-center mydiv">
			<%
				int count3 = 0;
					ResultSet rs3 = st.executeQuery("select * from notes");
					while (rs3.next()) {
						count3++;
					}
			 %>
				<div class="container1">
					<h2 class="text-primary"><%out.println(count3);%></h2>
					<a href="viewAllNotes.jsp"><h4 class="text-dark">All Notes</h4></a>
				</div>
			</div>

		</div>
	</div>
    <%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>
	 
</body>
</html>