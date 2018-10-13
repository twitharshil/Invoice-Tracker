<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>PO Show</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/poShow.css">
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
                
                <c:forEach  var="n" items="${PurchaseOrder}" varStatus="status">
                
                 <div class="col-md-6">Organization Name:</div>
                 <div class="col-md-6">${n.orgName }</div>
         <p> &nbsp;</p>
                 <div class="col-md-6">Client SPOC:</div>
                 <div class="col-md-6">${n.clientSpoc }</div>
         <p> &nbsp;</p>
                 <div class="col-md-6">PoNumber:</div>
                 <div class="col-md-6">${n.poNumber }</div> 
         <p> &nbsp;</p>
                 <div class="col-md-6">Description:</div>
                 <div class="col-md-6">${n.description }</div>
         <p> &nbsp;</p>
                 <div class="col-md-6">SacHsn:</div>
                 <div class="col-md-6">${n.sacHsn }</div>
         <p> &nbsp;</p>
                 <div class="col-md-6">Amount:</div>
                 <div class="col-md-6">${n.amount }</div>
         <p> &nbsp;</p>
                 <div class="col-md-6">Po Start Date:</div>
                 <div class="col-md-6">${n.poStartDate }</div>
         <p> &nbsp;</p>
                 <div class="col-md-6">Po End Date:</div>
                 <div class="col-md-6">${n.poEndDate }</div>
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