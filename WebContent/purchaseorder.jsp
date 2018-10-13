<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Purchase Order</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/purchaseorder.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/resources/js/number.js"></script>
<c:url var="home" value="/" scope="request" />
<script>
function searchViaAjax(){
	alert("document.getElementById('DescriptionList')=="+document.getElementById('DescriptionList').value);
	 
	$.ajax({
	    type: "POST",
	    url: "/InvoiceTracker/purchaseorder/fetchDropdown",
	    data: "{orgId:"+orgId+" , document.getElementById('DescriptionList').value}",
	     
	});
}

</script>

</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <a href='/InvoiceTracker/' class="w3-bar-item w3-button w3-wide"><i class="fa fa-home"></i>HOME</a>
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
     <%--  <a href="${pageContext.request.contextPath}/poProfile/" class="w3-bar-item w3-button"><i class="fa fa-user"></i> PROFILE</a> --%>
    </div>
  </div>
  <div class="container">
  <div class="row">
   <div id="profile" >
   
       <form class="form-inline" action="PoRegisterProcess" method = "post" >
                
                <div class="col-md-6"><br>Organization Name:</div>
                <div class="col-md-6">            
                 <Select id="DescriptionList" name="orgId" class="form-control" >               
                    <option disabled Selected  value="" >Organization Name</option>
                    <c:forEach  var="j" items="${OrganizationName}">
                    <option value="${j.orgId}" >${j.orgName}</option>
                    </c:forEach>
                </Select>
                </div>
                
                <div class="col-md-6"><br>Client SPOC:</div>
                <div class="col-md-6">                
                <Select id="DescriptionList" name="clientId" class="form-control"   onchange="searchViaAjax();" >               
                    <option disabled Selected  value="" >Client SPOC</option>
                    <c:forEach  var="k" items="${ClientName}">
                    <option value="${k.clientId}" >${k.clientSpoc}</option>
                    </c:forEach>
                </Select>
                </div>
                
               <!--  <div class="col-md-6"><br>E-mail:</div>
                <div class="col-md-6">
                <input type="email" name="email" placeholder="Email"  required class="form-control">
                </div>
                
                 
                <div class="col-md-6"><br>Contact No.:</div>
                <div class="col-md-6">
                <input type="text" name="contactNo"  placeholder="+91-" maxlength="10" onkeypress="return number(event,this)" required  class="form-control">
                </div> --> 
                
                <div class="col-md-6"><br>PO Number:</div>
                <div class="col-md-6">
                <input type="text" name="poNumber" placeholder="PO Number" onkeypress="return number(event,this)" required class="form-control">
                </div>
               
                <div class="col-md-6"><br>Description:</div>
                <div class="col-md-6">
                <Select id="DescriptionList" name="description" class="form-control" >               
                    <option disabled Selected  value="" >Project Description</option>
                    <c:forEach  var="k" items="${ClientName}">
                    <option value="${k.project}" >${k.project}</option>
                    </c:forEach>
                </Select>
                </div>
                
                <div class="col-md-6"><br>SAC/HSN:</div>
                <div class="col-md-6">
                <input type="text" name="sacHsn" placeholder="SAC/HSN" onkeypress="return number(event,this)" required class="form-control">
                </div>
                
                <div class="col-md-6"><br>Amount in INR:</div>
                <div class="col-md-6">
                <input type="text"  placeholder="Total Amount" name="amount" id="result" onkeypress="return number(event,this)" class="form-control">
                </div>
                
                <div class="col-md-6"><br>PO Start Date: </div>
                <div class="col-md-6">
                <input type="date" name="poStartDate" placeholder="PO Start Date"  required class="form-control">
                </div> 
                
                <div class="col-md-6"><br>PO End Date:</div>
                <div class="col-md-6">
                <input type="date" name="poEndDate" placeholder="PO End Date"  required class="form-control">
                </div>
                 &nbsp;
                <p align="right"> <input type="submit" name="commit" value="Submit" class="form-control">
               </p>
               
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