<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>User Profile</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/showProfile.css">
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
                
                <c:forEach  var="n" items="${Invoice}" varStatus="status">
                
                <%--  <div class="col-md-6">Line No.</div>
                 <div class="col-md-6">${status.index + 1}</div> --%>
                
                 <div class="col-md-6">PO Number:</div>
                 <div class="col-md-6">${n.poNumber }</div>
                <p> &nbsp;</p>
                 <div class="col-md-6">Description:</div>
                 <div class="col-md-6">${n.description } ${n.milestone }</div>
                <p> &nbsp;</p>
                 <div class="col-md-6">Amount in INR:</div>
                 <div class="col-md-6">${n.amount }</div>
                <p> &nbsp;</p>
                 <div class="col-md-6">Invoice Start Date:</div>
                 <div class="col-md-6">${n.invStartDate }</div>
                <p> &nbsp;</p>
                 <div class="col-md-6">Invoice Dispatch Date:</div>
                 <div class="col-md-6">${n.invDispatchDate }</div>
                <p> &nbsp;</p>
                 <div class="col-md-6">Invoice Closed Date:</div>
                 <div class="col-md-6">${n.invClosedDate }</div>
                <p> &nbsp;</p>
                
                 <div class="col-md-6">Remarks:</div>
                 <div class="col-md-6">${n.remark }</div>
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