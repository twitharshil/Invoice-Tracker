<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User </title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/userpage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<script>
function searchViaAjax(){
	alert("Hello");
	 var SubmitRequest = function(){
	$.ajax({
	    type: "POST",
	    url: "dropdownProcess",
	    data: document.getElementById('DescriptionList'),
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
      
       <%-- <a href="${pageContext.request.contextPath}/invoice/" class="w3-bar-item w3-button"><i class="fa fa-usd"></i> INVOICE</a> --%>
      
    </div>
  </div>

       <div id="profile" >
       <form class="form-inline" action="invoiceStatusProcess"  method = "post" >
          
          <Select id="DescriptionList" onchange="searchViaAjax();" name="orgId" class="form-control">
                <option disabled selected value="" >Organization Name</option>
                <c:forEach var="j" items="${User}">
                <option value="${j.orgId }"> ${j.orgName }</option>
                </c:forEach>
                </Select>
            
           <Select id="DescriptionList1" name="poId" class="form-control" >
                <option disabled selected value="" >PO Description </option>
                <c:forEach var="d" items="${User}">
                <option value="${d.poId }">${d.poNumber}  ${d.description }</option>
                </c:forEach>
           </Select>
           
                
           <select id="DescriptionList2" name="description" class="form-control" >               
                <option disabled selected value="" >Invoice</option>                 
                <c:forEach  var="l" items="${User}">
                <option  value="${l.description}" >${l.description}</option>
                </c:forEach>
           </select>
           
                     	       
                <p align = "right" class="submit"><input type="submit" name="commit" value="Submit" class="form-control" onclick="myFunction()"></p>
            </form>
        </div>

        <div class="col-md-8" align="right" id="invoice"></div>
  </div>

<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container " id="home">
  
</header>
<div class="footer">
            <p >&copy 2018</p>
        </div>
</body>
</html>