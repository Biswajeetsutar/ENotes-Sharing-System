<%@page import="com.conn.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		st.executeUpdate("delete from notes where id='"+id+"'");
		response.sendRedirect("view_User.jsp?msg=delete");
	} catch (Exception e) {
		System.out.println(e);
	}
%>