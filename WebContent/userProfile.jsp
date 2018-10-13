<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clientProfile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
  </div>
  
  <div class="container">
  <div class="row">
  <div id="userprofile" >
      <form class="form-inline" action="userShowProcess" method = "post">
        
        <div class="col-md-6"><br>Name:</div>
        <div class="col-md-6">
       <!--  <input type="text" name="Name" placeholder="User Name" required class="form-control"> -->
        <select id = "DescriptionList" name="userId" class="form-control">
        <option Selected Disabled value="">User Name</option>
        <c:forEach var="u" items = "${User }" >
        <option value="${u.userId }">${u.name } </option>
        </c:forEach>        
        </select>
        </div>
        
        <!-- <div class="col-md-6"><br>Email:</div>
        <div class="col-md-6"><input type="email" name="Email" placeholder="Email" required class="form-control"></div> -->
        &nbsp;
        <p align="right" class="submit" ><input type="submit"  name="commit" value="View Profile" class="form-control" ></p>     
     
     </form>
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