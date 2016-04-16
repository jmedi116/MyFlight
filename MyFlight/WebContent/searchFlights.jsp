<%@page import="MyFlight.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%

SearchManager s=new SearchManager();
String srchFromFlight=request.getParameter("srchFromFlight");
String srchToFlight=request.getParameter("srchToFlight");
String fromDate=request.getParameter("fromDate");
String toDate=request.getParameter("toDate");
int passengers=1;//Integer.parseInt(request.getParameter("passengers"));
boolean nonstop=!(request.getParameter("nonstop")==null);


ArrayList<Flight> list= s.searchFlight(srchFromFlight, srchToFlight, fromDate, passengers, nonstop);
%>
<body>
<div class="header">
<jsp:include page="header.jsp"/>
</div> 
<% if (!list.isEmpty()){ %>
<table class="results"> 
<tr>
<td width="12%">
Date
</td>
<td width="12%">
From
</td>
<td width="12%">
To
</td>
<td width="12%">
Time
</td>
<td width="12%">
Available Coach
</td>
<td width="12%">
Available Economy Plus
</td>
<td width="12%">
Available First Class
</td>
<td width="12%">
Book
</td>
</tr>
  <%
     for(int i=0;i<list.size();i++){
    	 	out.println("<tr><td>"+list.get(i).getDate()+"</td><td>"+list.get(i).getOrigin()+"</td><td>"+list.get(i).getDestination()+"</td><td>"+list.get(i).getTime()+"</td><td>"+list.get(i).getAvailableCoach()+"</td><td>"+list.get(i).getAvailableEconomyPlus()+"</td><td>"+list.get(i).getAvailableFirstClass()+"</td><td><a href='book.jsp?flight_number="+list.get(i).getFlightNumber()+"&date="+list.get(i).getDate()+"' target='_blank'>Book</a></td></tr>");    	 
     }
  %>
 </table>
<%
}
else
{
	out.println(" <h3>Sorry, no flights were found for the requested date</h3>");
	}
%> 
</body>
</html>