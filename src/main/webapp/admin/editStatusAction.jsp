<%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String status = request.getParameter("status");
	

	try {
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con
				.prepareStatement("update notes set status=? where id=?");
		ps.setString(1, status);
		ps.setInt(2, id);
		ps.executeUpdate();
		response.sendRedirect("editStatus.jsp?msg=valid");
	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("editStatus.jsp?msg=invalid");
	}
%>