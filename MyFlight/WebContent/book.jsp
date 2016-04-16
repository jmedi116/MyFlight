<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="MyFlight.SearchManager" %>
    <%@page import="MyFlight.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
if(session.getAttribute("user")==null){
		out.println("You need to login in order to access this page");
		response.setHeader("Refresh", "5;url=Home.jsp");
		}
	SearchManager s=new SearchManager();
	Person p=(Person)session.getAttribute("user");
	String email=p.getEmail();
	String results=s.getReservationsByUser(email);
	

%>
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
<%
Flight f=null;
if(request.getParameter("submitButton")==null){
	String flightNumber=request.getParameter("flight_number");
	String date=request.getParameter("date");
	SearchManager s=new SearchManager();
	f=s.searchSingleFlight(flightNumber, date);
	session.setAttribute("flight", f);
	
%>
<div class="header">
<jsp:include page="header.jsp"/>
</div>
<div class="results">
<h4>
You have selected to book the following flight:
</h4>
<table>
<tr>
<td>
Date
</td>
<td>
From
</td>
<td>
To
</td>
<td>
Time
</td></tr>
 <%
 if(f!=null)
 out.println("<tr><td>"+f.getDate()+"</td><td>"+f.getOrigin()+"</td><td>"+f.getDestination()+"</td><td>"+f.getTime()+"</td></tr>");
%>
<tr></tr><tr></tr><tr></tr>
<tr>
<td colspan="4">
Please select the number of seats to buy:
</td>
</tr>
</table>
<form action="book.jsp" method="post">
<Select name="coachSeats" id="coachSeats">
<option value="0" selected>Coach Seats</option>
<option value="1">1</option>
<option value="1">2</option>
<option value="1">3</option>
<option value="1">4</option>
<option value="1">5</option>
<option value="1">6</option>
</Select>
<Select name="economyPlus" id="economyPlus">
<option value="0" selected>Economy Seats</option>
<option value="1">1</option>
<option value="1">2</option>
<option value="1">3</option>
<option value="1">4</option>
<option value="1">5</option>
<option value="1">6</option>
</Select>
<Select name="firstClass" id="firstClass">
<option value="0" selected>First Class</option>
<option value="1">1</option>
<option value="1">2</option>
<option value="1">3</option>
<option value="1">4</option>
<option value="1">5</option>
<option value="1">6</option>
</Select>
<br/>
<br/>

<input type="submit" value="Continue" name="submitButton">
</form>





</div>
<%}
else
{
	f=(Flight)session.getAttribute("flight");
	System.out.println(f.getAvailableEconomyPlus());
	int coach=Integer.parseInt(request.getParameter("coachSeats"));
	int economy=Integer.parseInt(request.getParameter("economyPlus"));
	int first=Integer.parseInt(request.getParameter("firstClass"));
	f.book();
	response.sendRedirect("reservations.jsp");
} %>
</body>
</html>