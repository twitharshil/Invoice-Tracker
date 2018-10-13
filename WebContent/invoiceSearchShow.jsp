<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>Invoice Show</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/invoiceSearchProfile.css">
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
                &nbsp;
                <table class="table">  
                  <tr>
                    <th>&nbsp;</th>
                    <th>Line No.</th>
                    <th>PO Number:</th> 
                    <th>Description</th>
                    <th>Amount in INR:</th>
                    <th>Invoice Start Date:</th>
                    <th>Invoice Dispatch Date:</th>
                    <th>Invoice Closed Date:</th>
                    <th>Remarks:</th>
                    <th>Amount Received?</th>
                  </tr>
                 
                  <c:forEach  var="n" items="${Invoice}" varStatus="status">
                   <tr>
                     <td>&nbsp;</td>
                     <td>${status.index + 1}</td>
                     <td>${n.poNumber }</td>
                     <td>${n.description }</td>
                     <td>${n.amount }</td>
                     <td>${n.invStartDate }</td>
                     <td>${n.invDispatchDate }</td>
                     <td>${n.invClosedDate }</td>
                     <td>${n.remark }</td>
                     <td>${n.invoiceState }</td>
                   </tr>
                   </c:forEach>  
                </table>
               </form>
             </div>
             </div>
            </div>        
</div>
<header class="bgimg-1 w3-display-container " id="home">
  
</header>
</body>
</html>