<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<title>Login</title>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>

<script >
$(document).ready(function() {
	alert("INside Function");
        var remember = $.cookie('RememberMe');
        if (remember == 'true') 
        {
            var username = $.cookie('username');
            var password = $.cookie('password');
            // autofill the fields
            $('#username').val(username);
            $('#password').val(password);
        }


    $("#login").submit(function() {
        if ($('#remember').is(':checked')) {
            var username = $('#username').val();
            var password = $('#password').val();

            // set cookies to expire in 14 days
            $.cookie('username', username, { expires: 14 });
            $.cookie('password', password, { expires: 14 });
            $.cookie('RememberMe', true, { expires: 14 });                
        }
        else
        {
            // reset cookies
            $.cookie('username', null);
            $.cookie('password', null);
            $.cookie('RememberMe', null);
        }
  });
});

</script>
</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      
       <button class="button" onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
      
    </div>
  </div>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="loginProcess" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="login">
    <p align = "center"><font size = "5"><b>Login - PO Tracker</b></font></p>
      
      <input type="text" name="username" placeholder="Enter Username or Email" value="" required>

      <input type="password" name="password" placeholder="Enter Password" value="" required>
      
        <center>${message }</center> 
      &nbsp;
     
      <button type="submit" name="commit" value="Login">Login</button>
      
    </div>
    
    <div class="container" style="background-color:#f1f1f1">
        <p align = "center"><a href="#">Forgot password?</a></p>
    </div>
  
  </form>
</div>
</div>
<header class="bgimg-1 w3-display-container" id="home"> 
</header>



<div class="footer">
            <p >&copy 2018</p>
        </div>
</body>
</html>

    