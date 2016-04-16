<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="MyFlight.SearchManager" %>
    <%@page import="MyFlight.Flight" %>
<%
	String flightNumber=request.getParameter("flight_number");
	String date=request.getParameter("date");
	SearchManager s=new SearchManager();
	Flight f=s.searchFlight(flight_number, date);
	
%>
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
.results{
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyFlight</title>
</head>
<body>
<div class="header">
<jsp:include page="header.jsp"/>
</div>
<div class="results">
<h4>
Please click continue to confirm you would like to book the following flight?
</h4>
<table>
 <%
 out.println("<tr><td>"+f.getDate()+"</td><td>"+f.getOrigin()+"</td><td>"+f.getDestination()+"</td><td>"+f.getTime()+"</td></tr>");    	 
%>

</table>


</div>

</body>
</html>