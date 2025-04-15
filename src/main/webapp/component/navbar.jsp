<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ENotes Sharing Site</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
<h4 style="padding :1%"><span style="color:red">E</span><span style="color:green">Notes</span></h4>
 <nav class="navbar navbar-expand-sm justify-content-center" style = "background-color : #fbe9e7;">
  <ul class="navbar-nav">
      <li class="navbar-item">
          <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> HOME</a>
      </li>

      <li class="navbar-item">
          <a class="nav-link" href="about.jsp"><i class="far fa-address-card"></i> ABOUT</a>
      </li>

      <li class="navbar-item">
          <a class="nav-link" href="contact.jsp"><i class="fas fa-phone-square-alt"></i> CONTACT</a>
      </li>

      <li class="navbar-item">
          <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> LOGIN</a>
      </li>

      <li class="navbar-item">
          <a class="nav-link" href="adminlogin.jsp"><i class="fas fa-sign-in-alt"></i> ADMIN LOGIN</a>
      </li>
  </ul>
 </nav>
</body>
</html>