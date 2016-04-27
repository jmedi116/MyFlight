<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>   
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body{
	background-image: url("http://localhost/img/background.png");
	backrgound-repeat: no-repeat;	
	background-size: cover;
	background-color: lightblue;
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
.search{
	top:20%;
	padding-top: 1%;
	font-weight: bold;
	position: absolute;
	width:45%;
	height:30%;
	background: #C0C0C0;
	border-width:0px 1px 1px 0px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../style.css" type="text/css" >
<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
 <script>
         $(function() {
            $( "#fromDate" ).datepicker({
               dateFormat:"yy-mm-dd",
               showOn: "button",
               buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
               buttonImageOnly: true,
               buttonText: 'From',
            minDate: "dateToday",
            onClose: function( selectedDate ) {
            	$( "#departure" ).datepicker( "option", "minDate", selectedDate);
            	}
            });
            $( "#toDate" ).datepicker({
                dateFormat:"mm-dd-yy",
                showOn: "button",
             buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
                buttonImageOnly: true,
                buttonText: 'From'
             });
            $("#fromDate").datepicker().datepicker("setDate", new Date());
           
         });
      </script>
<title>MyFlightReservation</title>
</head>
<body >
<div class="header">
<jsp:include page="header.jsp"/>
</div>  
<div class="search">
<form id="searchFlight" method="post" action="searchFlights.jsp">
<table>
<tr>
<td colspan="3">
<input type="radio" name="flightType" value="roundtrip" checked>Roundtrip
<input type="radio" name="flightType" value="oneway">One-Way
</td>
</tr>
<tr>
<td width="30%">
From: 
</td>
<td width="30%">
To:
</td>
<td width="30%">
Number of Passengers:
</td>
</tr>
<tr>
<td>
<select id="srchFromFlight" name="srchFromFlight">
<option>Miami</option>
</select>
</td>
<td>
<select id="srchToFlight" name="srchToFlight" >
<option>New York</option>
</select>
</td>
<td>
<select id="passengers" name="passengers" >
<option value="1">1</option>
<option value="1">2</option>
<option value="1">3</option>
<option value="1">4</option>
<option value="1">5</option>
<option value="1">6</option>
</select>
</td>
</tr>
<tr>
</tr>
<tr>
<td>
<input type="text" id="fromDate" name="fromDate"><br/>
</td>
<td colspan="2">
<input type="text" id="toDate" name="toDate">
</td>
</tr>
<tr>
<td colspan="3">
<input type="checkbox" id="nonstop" name="nonstop">Non-stop
</td>
</tr>
<tr>
<td>
</td>
<td>
</td>
<td>
<input type="submit" value="Search">
</td>
</tr>
</table>
</form>
</div>

</body>
</html>