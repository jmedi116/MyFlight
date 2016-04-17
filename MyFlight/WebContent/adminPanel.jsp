<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>   
<%@ page import ="javax.sql.*" %>
<%@page import="MyFlight.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script>
         $(function() {
            $( "#date" ).datepicker({
               dateFormat:"yy-mm-dd",
               showOn: "button",
               buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
               buttonImageOnly: true,
               buttonText: 'From',
            minDate: "dateToday"
            });
         });
      </script>
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
	height:45%;
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
<option value=0 selected>Select the action to apply</option>
<option value=1>Add Flight</option>
<option value=2>Delete Flight</option>
<option value=3>Change Price</option>
<option value=4>Delete User</option>
</select>
<br/>
<input type="submit" value="Continue" name="submitButton">
</form>
</div>
<%}
	else if (Integer.parseInt(request.getParameter("action"))==1){
	%>
<div class="panel">
Input Flight Details:
	<form action="insertFlight.jsp" method=post>
	<table>
	<tr><td>Flight Number:</td><td colspan="3"> <input type="text" name="flightNumber"/></td></tr>
	<tr><td>Aircraft:</td><td colspan="3"> <input type="text" name="aircraftNumber"/></td></tr>
	<tr><td>Date:</td><td colspan="3"><input type="text" name="date" id="date"/></td></tr>
	<tr><td>Time:</td><td colspan="3"><input type="text" name="time"/></td></tr>
	<tr><td>From:</td><td colspan="3"><input type="text" name="from"/></td></tr>
	<tr><td>To:</td><td colspan="3"><input type="text" name="to"/></td></tr>
	<tr><td>Coach Seats:</td><td> <input type="text" name="seatsCoach"/></td><td>Price:</td><td> <input type="text" name="priceCoach"/></td></tr>
	<tr><td>Economy Plus Seats:</td><td><input type="text" name="seatsEconomyPlus"/></td><td>Price:</td><td> <input type="text" name="priceEconomy"/></td></tr>
	<tr><td>First Class Seats:</td><td><input type="text" name="seatsFirstClass"/></td><td>Price:</td><td> <input type="text" name="priceFirst"/></td></tr>
		</table>
	<input type="submit" value="Continue" name="submitButton">
	</form>
</div>
	
	<%
	
	}
else if (Integer.parseInt(request.getParameter("action"))==2){
		
	}
else if (Integer.parseInt(request.getParameter("action"))==3){
	
}
else if (Integer.parseInt(request.getParameter("action"))==4){
%>
<div class="panel">
Enter user email address to delete:
<br/><br/>
<form action="removeUser.jsp" method=post>
Email: <input type="text" name="email"/>
<br/><br/>
<input type="submit" value="Continue" name="submitButton">
</form>
</div>
<%	
	}
}
}%>
</body>
</html>