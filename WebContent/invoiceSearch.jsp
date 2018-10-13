<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>Invoice Search</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clientProfile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
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
  <div id="profile" >
  
            <form class="form-inline"  action ="invoiceSearch" method ="post">
                
                <div class="col-md-6"><br>Invoice:</div>
                <div class="col-md-6">            
                 <Select id="DescriptionList" name="search" class="form-control">               
                    <option Selected value="3" >All Invoice</option>
                    <option  value="1" >Open Invoice</option>
                    <option  value="2" >Closed Invoice</option>     
                </Select>
                </div>
                &nbsp;
                <p align="right" ><input type="submit"  name="commit" value="Submit" class="form-control">
                
                </p>
            </form>
            </div>
  </div>
  </div>
</div>

<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container " id="home">
  
</header>


</body>
</html>