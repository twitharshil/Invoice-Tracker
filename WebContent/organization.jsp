<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organization</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/organization.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

</head>
<body>

<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <%-- <a href="${pageContext.request.contextPath}/clientmanagerProfile/" class="w3-bar-item w3-button"><i class="fa fa-user"></i> PROFILE</a> --%>
    </div>
  </div>
  
  <div class="container">
    <div class="row">
      <div id="profile">
        <form class="form-inline" action="organizationProcess" method = "post">
  
               <div class="col-md-6"><br>Organization Name:</div>
               <div class="col-md-6">
               <input type="text" name="orgName" placeholder="Organization Name" required class="form-control" >
                </div>
                
                <div class="col-md-6"><br>Country:</div>
                <div class="col-md-6">
                <Select id="ClientName" name="country" class="form-control">                    
                    <option disabled Selected  value="" >Country</option>  
                     <c:forEach  var="j" items="${CountryName}">
                    <option value="${j.country}" >${j.country}</option>
                    </c:forEach> 
                </Select>
                </div>                
                
                <div class="col-md-6"><br>State:</div>
                <div class="col-md-6">
                <Select id="ClientName" name="state" class="form-control">                    
                    <option disabled Selected  value="" >State</option>
                    <c:forEach  var="k" items="${StateName}">
                    <option value="${k.state}" >${k.state}</option>
                    </c:forEach>   
                </Select>
                </div>
               
                <div class="col-md-6"><br>City:</div>
                <div class="col-md-6">
                <input type = "text" name = "city" placeholder = "City" required class="form-control"> 
                </div>
                
                <div class="col-md-6"><br>Pincode:</div>
                <div class="col-md-6">
                <input type = "text" name = "pincode" placeholder = "Pincode" required class="form-control"> 
                </div>
                
                <div class="col-md-6"><br>Street:</div>
                <div class="col-md-6">
                <input type = "text" name = "address" placeholder = "Street" required class="form-control"> 
                </div>
                
                <div class="col-md-6"><br>Website:</div>
                <div class="col-md-6">
                <input type = "url" name = "website" placeholder = "website" required class="form-control">
                </div>
                &nbsp;
                <p align="right" class="submit"><input type="submit"  name="commit" value="Submit" class="form-control"></p>
                
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
               

