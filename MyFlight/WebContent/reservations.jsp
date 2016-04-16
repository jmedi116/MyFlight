<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="MyFlight.SearchManager"%>
  <%@page import="MyFlight.Person"%>
   <%@page import="java.sql.*" %>   
<%@ page import ="javax.sql.*" %>
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
<table>
<%
	out.println(results);
%>
</table>

</div>
</body>
</html>