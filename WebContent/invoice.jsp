<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>Invoice</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/invoice.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/number.js"></script>

</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
     <%--  <a href="${pageContext.request.contextPath}/clientmanagerProfile/" class="w3-bar-item w3-button"><i class="fa fa-user"></i> PROFILE</a> --%>
    </div>
  </div>
  <div class="container">
  <div class="row">
 
            <div id="invoice" >
              
            <form class="form-inline" action="invoiceRegister" method = "post">
            
                
            
                <div class="col-md-6"><br>PO Number:</div>  
                <div class="col-md-6">
                <Select id="DescriptionList" name = "poId" class="form-control"> 
                <option disabled Selected  value="" >PO Number</option>          
                <c:forEach  var="p" items="${Description}">
                <option value="${p.poId}" >${p.poNumber}</option>   
                 </c:forEach>
                </select>
                </div>
                
              
                <div class="col-md-6"><br>Description: </div>
                <div class="col-md-6">
                  <Select id="DescriptionList" name = "description" class="form-control"> 
                  <option disabled Selected  value="" >DescriptionOnHSNCode</option>          
                  <c:forEach  var="d" items="${Description}">
                  <option value="${d.description}" >${d.description}</option>
                  </c:forEach>
                  </select>
                </div>
                
                <div class="col-md-6"><br>Milestone:</div>
                <div class="col-md-6">
                <input type="text"  placeholder="Milestone " name="milestone" class="form-control">
                </div>
                
                <div class="col-md-6"><br>Amount in INR:</div>
                <div class="col-md-6">
                <input type="text"  placeholder="Total Amount" name="amount" id="result" onkeypress="return number(event,this)" class="form-control">
                </div>
                
                <div class="col-md-6"><br>Invoice Start Date: </div>
                <div class="col-md-6">
                  <input type="date" name="invStartDate" placeholder="Invoice Start Date"  required class="form-control" >
                </div>
                
                <div class="col-md-6"><br>Invoice Dispatch Date:</div>
                <div class="col-md-6">
                  <input type="date" name="invDispatchDate" placeholder="Invoice Dispatch Date"  required class="form-control" >
                </div>
                
                <div class="col-md-6"><br>Invoice Closed Date </div>
                <div class="col-md-6">
                  <input type="date" name="invClosedDate" placeholder="Invoice Closed Date"  required class="form-control" >
                </div>
                
                <div class="col-md-6"><br>Remarks:</div>
                <div class="col-md-6">
                <input type="text" name="remark" placeholder="Remarks" required class="form-control">
                </div>
                
                <div class="col-md-6" >&nbsp;</div>
                
                <div class="col-md-6" >
                
                <center>${message }</center>
                                                                                                                 
                <p align="right" class="submit" ><br><input type="submit" name="commit" value="Submit" class="form-control">
                </p>
                 </div>
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