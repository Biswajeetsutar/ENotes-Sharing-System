<%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString();
	String oldPassword = request.getParameter("oldpassword");
	String newPassword = request.getParameter("newpassword");
	String confirmPassword = request.getParameter("confirmpassword");

	if (!confirmPassword.equals(newPassword))
		response.sendRedirect("changePassword.jsp?msg=notMatch");
	else {
		int check = 0;
		try {
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(
					"select * from admin where email='" + email + "' and password='" + oldPassword + "'");
			while (rs.next()) {
				check = 1;
				st.executeUpdate("update admin set password='" + newPassword + "' where email='" + email + "'");
				response.sendRedirect("adminChangePassword.jsp?msg=done");
			}
			if (check == 0)
				response.sendRedirect("adminChangePassword.jsp?msg=wrong");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
%>