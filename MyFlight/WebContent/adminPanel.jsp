<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>   
<%@ page import ="javax.sql.*" %>
<%@page import="MyFlight.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	background-image: url("http://localhost/img/homeBackrgound.jpg");
	backrgound-repeat: no-repeat;	
	background-size: cover;
}
select{
	width: 80%;
}
.header{
top: 1%;

	}
input[type=submit]{
 	float: right;
    margin:10px 55px 10px 0;
    font-weight: bold;
    line-height: 1;
    padding: 6px 10px;
}
.panel{
	top:20%;
	padding-top: 1%;
	font-weight: bold;
	position: absolute;
	width:45%;
	height:30%;
	background: #ffcc99;
	border-width:0px 1px 1px 0px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../style.css" type="text/css" >

<title>MyFlightReservation</title>
</head>
<body >
<%
if(session.getAttribute("user")==null){
	out.println("You need to login in order to access this page");
	response.setHeader("Refresh", "5;url=Home.jsp");
	}
else {
	Person p=(Person)session.getAttribute("user");
	if(p.getRole()<2){
		out.println("Error: Not a valid Administrator Credentials");
		response.setHeader("Refresh", "5;url=Home.jsp");
	}
	else{
	if(request.getParameter("submitButton")==null){
%>
<div class="header">
<jsp:include page="header.jsp"/>
</div>
<div class="panel">
<form action="adminPanel.jsp" method=post>
<select name="action">
<option value="0" selected>Select the action to apply</option>
<option value="addFlight">Add Flight</option>
<option value="deleteFlight">Delete Flight</option>
<option value="changePrices">Change Price</option>
<option value="deleteUsers">Delete User</option>
</select>
</form>
</div>
<%} 
}
}%>
</body>
</html>