<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
 <%@include file="component/allCss.jsp" %>
</head>
<body>
	  <%@include file="component/navbar1.jsp" %>
  <br>
  
   <div class="container mt-5">
     <h2 class="text-center text-danger">PROFILE</h2>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Full Name : </b>

       </div>
       <div class="col-md-6" style="text-transform: capitalize">
           <%out.println(fname +" "+lname); %>  
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Email ID : </b>
        
       </div>
       <div class="col-md-6" style="text-transform: capitalize">
               <%out.println(email); %> 
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Contact : </b>
        
       </div>
       <div class="col-md-6" style="text-transform: capitalize">
              <%out.println(contact); %>
       </div> 
     </DIV>
     <hr>
     
     <DIV class="row">
       <div class="col-md-6">
        <b>Branch : </b>
        
       </div>
       <div class="col-md-6" style="text-transform: capitalize">
              <%out.println(branch); %>
       </div> 
     </DIV>
     <hr>     
     <a href="editProfile.jsp?id=<%=session.getAttribute("userId")%>" class="btn btn-primary mt-5">Edit Profile</a>
   </div>	
</body>
</html>