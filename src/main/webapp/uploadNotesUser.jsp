<%@ page import="com.conn.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uploads Notes</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
<%@include file="component/navbar1.jsp"%>

	<%
		String succMsg = (String) session.getAttribute("succMsg");
		String failedMsg = (String) session.getAttribute("failedMsg");

	 if (succMsg != null) {
	%>
	<script>
		alert("Notes Added Successfully ");
		window.location.assign("viewMyNotesUser.jsp");
	</script>
	<%
		session.removeAttribute("succMsg");
		}
	%>
	<%
		if (failedMsg != null) {
	%>
	<script>
		alert("Something went Wrong..!!");
		window.location.assign("uploadNotesUser.jsp");
	</script>
	<%
		session.removeAttribute("failedMsg");
		}
	%>
	<div class="container mt-5"
		style="font-family: 'IBM Plex Sans', sans-serif;">
		<div class="row">
			<div class="col-sm-6 mt-5">
				<img src="image/upload.png" style="width: 90%; height: 500px">
			</div>

			<div class="col-sm-6">
				<h2 class="text-center text-danger">Upload Notes</h2>
				<hr>

				<form action="uploadFile" enctype="multipart/form-data"
					method="post">
					<div class="row register-form">
						<div class="col-md-6">
                   <input type="hidden" name="email" value="<%out.println(email);%>">
							<div class="form-group">
								<label> Branch</label> <select class="form-control"
									name="branch" id="inlineFormCustomSelectPref"
									style="width: 540px;" required>
									  <option value="Computer Science">Computer Science</option>
									  <option value="Mechanical">Mechanical</option>
									  <option value="Civil">Civil</option>
									  <option value="Electronics">Electronics</option>
									  <option value="Electric">Electric</option>
									  <option value="IT">IT</option>

								</select>
							</div>


							<div class="form-group">
								<label> Subject</label> <input type="text" class="form-control"
									placeholder="Enter Subject" name="subject" id="inputAddress"
									style="width: 540px;" required>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Notes File</label> <input
									type="file" name="notesfile" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<div class="form-group">
								<label> File Type</label> <select class="form-control"
									name="filetype" id="inlineFormCustomSelectPref"
									style="width: 540px;" required>
									<option value="PDF">PDF</option>
									<option value="PPT">PPT</option>
									<option value="DOC/DOCX">DOC/DOCX</option>
									<option value="TXT">TXT</option>
									<option value="Image">Image</option>
									<option value="ZIP/RAR">ZIP/RAR</option>
								</select>
							</div>

							<div class="form-group">
								<label for="descr">Description</label>
								<textarea class="form-control" rows="3" id="descr" name="descr"
									style="width: 540px;"></textarea>
							</div>

							<div class="form-group">
							<div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							</div>
						</div>
					</div>
				</form>

			</div>
		</div>
</body>
</html>