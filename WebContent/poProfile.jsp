<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<title>PO profile</title>
<head>
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
  <div id="profile" >
      <form class="form-inline" action="poShowProcess" method = "post">
        
        <div class="col-md-6"><br>Organization Name:</div>
        <div class="col-md-6">
        <!-- <input type="text" name="OrganizationName" placeholder="Organization Name" required class="form-control"> -->
        <Select id="DescriptionList" name="orgId" class="form-control">
                <option disabled selected value="" >Organization Name</option>
                <c:forEach var="j" items="${OrganizationName}">
                <option value="${j.orgId }">${j.orgName }</option>
                </c:forEach>
                </Select>
        </div>
        
        <div class="col-md-6"><br>Client SPOC:</div>
        <div class="col-md-6">
        <!-- <input type="text" name="ClientSpoc" placeholder="Name" required class="form-control">    -->
        <select id="DescriptionList" name="clientId" class="form-control">
        <option disabled selected value="">Client SPOC</option>
        <c:forEach var="c" items="${Client }">
        <option value="${c.clientId }">${c.clientSpoc }</option>
        </c:forEach>
        </select>        
        
        </div>
        
         <div class="col-md-6"><br>Project:</div>
        <div class="col-md-6">
        <!-- <input type="text" name="project" placeholder="Project" required class="form-control"> -->
        <Select id="DescriptionList" name="description" class="form-control">
                <option disabled selected value="" >Project Description</option>
                <c:forEach var="d" items="${Description}">
                <option value="${d.description }">${d.poNumber}  ${d.description }</option>
                </c:forEach>
                </Select>
        </div>
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