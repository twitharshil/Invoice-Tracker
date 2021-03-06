<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>Client Show</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clientShow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<body>
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
  </div>
     
                <div class="container">
                <div class = "row">
                 <div id="profile" >
                <form class="form-inline" method="post">
                
                <c:forEach  var="n" items="${Client}" varStatus="status">
          
                <%--  <div class="col-md-6">Line No.</div>
                 <div class="col-md-6">${status.index + 1}</div> --%>
                 
                 <div class="col-md-6">Organization Name:</div>
                 <div class="col-md-6">${n.orgName }</div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Address:</div>
                 <div class="col-md-6">${n.address } ${n.city }  ${n.pincode } ${n.state } ${n.country } </div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Website</div>
                 <div class="col-md-6">${n.website }</div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Project:</div>
                 <div class="col-md-6">${n.project }</div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Client SPOC:</div>
                 <div class="col-md-6">${n.clientSpoc }</div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Contact No:</div>
                 <div class="col-md-6">${n.contactNo }</div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Email:</div>
                 <div class="col-md-6">${n.email }</div>
                  <p> &nbsp;</p>
                 <div class="col-md-6">Password:</div>
                 <div class="col-md-6">${n.password }</div>
                  <p> &nbsp;</p>
       
                </c:forEach>
               </form>
             </div>
             </div>
            </div>        
</div>
<header class="bgimg-1 w3-display-container " id="home">
  
</header>
</body>
</html>