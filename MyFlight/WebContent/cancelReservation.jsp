<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="MyFlight.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body{
	background-image: url("http://localhost/img/homeBackrgound.jpg");
	backrgound-repeat: no-repeat;	
	background-size: cover;
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
.results{
	top:20%;
	padding-top: 1%;
	font-weight: bold;
	position: absolute;
	width:45%;
	height:45%;
	background: #ffcc99;
	border-width:0px 1px 1px 0px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyFlight</title>
</head>
<body>
<%
if(session.getAttribute("user")==null){
	out.println("<div class='results'>You need to login in order to access this page</div>");
	response.setHeader("Refresh", "5;url=login.jsp");
	}
else{
String reservationNumber=request.getParameter("reservation_number");
SearchManager s=new SearchManager();
Reservation r=s.searchSingleReservation(reservationNumber);	
r.Cancel();
response.sendRedirect("reservations.jsp");
%>
<div class="header">
<jsp:include page="header.jsp"/>
</div>
<div class="results">
</div>
<%} %>
</body>
</html>