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
.result{
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
	String flight=request.getParameter("flightNumber");
	String aircraft=request.getParameter("aircraftNumber");
	String date=request.getParameter("date");
	String time=request.getParameter("time");
	String origin=request.getParameter("from");
	String destination=request.getParameter("to");
	int coachSeats=Integer.parseInt(request.getParameter("seatsCoach"));
	int economySeats=Integer.parseInt(request.getParameter("seatsEconomyPlus"));
	int firstSeats=Integer.parseInt(request.getParameter("seatsFirstClass"));
	int priceCoach=Integer.parseInt(request.getParameter("priceCoach"));
	int priceEconomy=Integer.parseInt(request.getParameter("priceEconomy"));
	int priceFirst=Integer.parseInt(request.getParameter("priceFirst"));
	Flight f=new Flight(flight, date,origin,destination,time,coachSeats, economySeats, firstSeats);
	f.addFlight(aircraft, priceCoach, priceEconomy, priceFirst);
	response.sendRedirect("Home.jsp");
%>
<div class="header">
<jsp:include page="header.jsp"/>
</div>  
<div class="result">

</div>

</body>
</html>