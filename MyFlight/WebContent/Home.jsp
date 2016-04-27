<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>   
<%@ page import ="javax.sql.*" %>
<%@page import="MyFlight.*" %>
<%@page import="java.util.ArrayList" %>
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
                dateFormat:"yy-mm-dd",
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
<%
SearchManager s=new SearchManager();
ArrayList<City> list=s.searchCities();
%>
<div class="header">
<jsp:include page="header.jsp"/>
</div>  
<div class="search">
<form id="searchFlight" method="post" action="searchFlights.jsp" onsubmit="return validateForm();">
<table>
<tr>
<td colspan="3">
<input type="radio" name="flightType" value="roundtrip" checked>Round Trip
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
<%
for(int i=0;i<list.size();i++){
	out.println("<option value='"+list.get(i).getDescr()+"'>"+list.get(i).getDescr()+"</option>");	
}
%>
</select>
</td>
<td>
<select id="srchToFlight" name="srchToFlight" >
<%
for(int i=0;i<list.size();i++){
	out.println("<option value='"+list.get(i).getDescr()+"'>"+list.get(i).getDescr()+"</option>");	
}
%>
</select>
</td>
<td>
<select id="passengers" name="passengers" >
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
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
<script>
function validateForm(){
		var fromDate=document.getElementById("fromDate").value;
		var toDate=document.getElementById("toDate").value;
		var srchFromFlight=document.getElementById("srchFromFlight").value;
		var srchToFlight=document.getElementById("srchToFlight").value;
		if(srchFromFlight==srchToFlight){
			alert("There are no flights to the same city...");
			return false;
			
		}
		if(toDate!=""){
		if(fromDate>=toDate){
				alert("Return date must be after departure date");
				return false;
			
		}
		}
		return true;
	
}
</script>
</html>