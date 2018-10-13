<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>

<style>
body, html {
    height: 100%;
    line-height: 1.8;
    margin: 0;
   overflow-y: hidden;
}

.w3-bar .w3-button {
    padding: 16px;
}

</style>
</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
    
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
    
   
      <div class="w3-dropdown-hover">
       <button  class="w3-button" >
       <i class="fa fa-user"></i> CLIENT <i class="fa fa-caret-down"></i></button>
      
      <div id="demo" class="w3-dropdown-content w3-bar-block w3-card">
        <a href="${pageContext.request.contextPath}/organization/" class="w3-bar-item w3-button">Organization</a>
        <a href="${pageContext.request.contextPath}/clientmanager/" class="w3-bar-item w3-button">Client Create</a>
        <a href="${pageContext.request.contextPath}/clientProfile/" class="w3-bar-item w3-button">Profile</a>
      </div>
      </div>
      
      <div class="w3-dropdown-hover">
       <button  class="w3-button" >
      <i class="fa fa-user"></i> USER MANAGER <i class="fa fa-caret-down"></i></button>
      
      <div id="demo" class="w3-dropdown-content w3-bar-block w3-card">
        <a href="${pageContext.request.contextPath}/usermanager/" class="w3-bar-item w3-button">User Create</a>
        <a href="${pageContext.request.contextPath}/userProfile/" class="w3-bar-item w3-button">Profile</a>
      </div>
      </div>
      
      <div class="w3-dropdown-hover">
       <button  class="w3-button" >
      <i class="fa fa-th"></i> PURCHASE ORDER <i class="fa fa-caret-down"></i></button>
      
      <div id="demo" class="w3-dropdown-content w3-bar-block w3-card">
        <a href="${pageContext.request.contextPath}/purchaseorder/" class="w3-bar-item w3-button">PO Create</a>
        <a href="${pageContext.request.contextPath}/poProfile/" class="w3-bar-item w3-button">Profile</a>
      </div>
      </div>
      
      <div class="w3-dropdown-hover">
       <button  class="w3-button" >
       <i class="fa fa-usd"></i> INVOICE <i class="fa fa-caret-down"></i></button>
      
      <div id="demo" class="w3-dropdown-content w3-bar-block w3-card">
        <a href="${pageContext.request.contextPath}/invoice/" class="w3-bar-item w3-button">Invoice Create</a>
        <a href="${pageContext.request.contextPath}/invoiceStatus/" class="w3-bar-item w3-button">Status</a>
        <a href="${pageContext.request.contextPath}/invoiceSearch/" class="w3-bar-item w3-button">Search</a>
      </div>
      </div>

    </div>
  </div>
</div>





<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container " id="home">
  
</header>
<div class="footer">
            <p >&copy 2018</p>
        </div>
</body>
</html>

