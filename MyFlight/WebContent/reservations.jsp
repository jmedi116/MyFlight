<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="MyFlight.*"%>
   <%@page import="java.sql.*" %>   
<%@ page import ="javax.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%
if(session.getAttribute("user")==null){
		out.println("You need to login in order to access this page");
		response.setHeader("Refresh", "5;url=login.jsp");
		}

	SearchManager s=new SearchManager();
	Person p=(Person)session.getAttribute("user");
	String email=p.getEmail();
	ArrayList <Reservation> list=s.getReservationsByUser(email);


%>
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
.results{
	top:20%;
	padding-top: 1%;
	font-weight: bold;
	position: absolute;
	width:65%;
	height:60%;
	background: #C0C0C0;
	border-width:0px 1px 1px 0px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../style.css" type="text/css" >
<title>MyFlightReservation</title>
</head>
<body >
<div class="header">
<jsp:include page="header.jsp"/>
</div>  
<div class="results">
<h4>
Your previously reserved flights:
</h4>
<table border="1">
<tr><td>Reservation Number</td><td>Flight</td><td>Date</td><td>Time</td><td>From</td><td>To</td><td>Class Reserved</td><td>Cancel</td></tr>
<%
	for(int i=0;i<list.size();i++){
			Flight f=list.get(i).getFlight();
			out.println("<tr><td>"+list.get(i).getReservationNumber()+"</td><td>"+f.getFlightNumber()+"</td><td>"+f.getDate()+"</td><td>"+f.getTime()+"</td><td>"+f.getOrigin()+"</td><td>"+f.getDestination()+"</td><td>"+list.get(i).getClassReserved()+"</td><td><a href='cancelReservation.jsp?reservation_number="+list.get(i).getReservationNumber()+"' target='_blank'>Cancel</a></td></tr>");
		
	}
%>
</table>

</div>
</body>
</html>