<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
 <%@include file="component/allCss.jsp" %>
<style>
.image{
 width :100%;
 height : 500px;
 background-image :url('image/notes1.jpg'); 
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp" %>
  
  <div class="image">
    <div class="transparentbox">
      <p>Online Study Notes Sharing Site</p>     
    </div>
  </div> 
  
  <h4 class="text-center text-danger mt-5">Just 4 step to follow</h4>

  <div class="container mt-5">
    <div class="row">

        <div class="col-sm-3">
            <div class="box1">
                <p class="halfcircle"><i class="fas fa-user-circle text-white mt-4" style="font-size : 40px;"></i></p>
                <p class="halfcircleBottom" style="font-size : 20px;">Create Account</p>
            </div>
        </div>

        <div class="col-sm-3">
            <div class="box1">
                <p class="halfcircle"><i class="fas fa-sign-in-alt text-white mt-4" style="font-size : 40px;"></i></p>
                <p class="halfcircleBottom" style="font-size : 20px;">Login</p>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="box1">
                <p class="halfcircle"><i class="fas fa-upload text-white mt-4" style="font-size : 40px;"></i></p>
                <p class="halfcircleBottom" style="font-size : 20px;">Upload Notes</p>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="box1">
                <p class="halfcircle"><i class="fas fa-download text-white mt-4" style="font-size : 40px;"></i></p>
                <p class="halfcircleBottom" style="font-size : 20px;">Download Notes</p>
            </div>
        </div>

    </div>
  </div>
  <br><br>
 <%@include file="component/footer.jsp" %> 
</body>
</html>