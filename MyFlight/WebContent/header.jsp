<%@page import="MyFlight.Person"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
padding-top: 10%;
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<td width="10%">
</td>
<td>
<a href="Home.jsp"><img src="http://localhost/img/banner.png" width="70px" height="90px"/>  </a>
</td>
<td width="40%">
</td>
<td align="left">

<%
if(session.getAttribute("user")==null){
	out.print("<h4>Welcome to the Flight Reservation System ");
%>
<a href="login.jsp" target="_self">	Login</a>
<%
}
else{
	Person p=(Person)session.getAttribute("user");
	out.print("<h4>Welcome "+p.getName());
%>
<a href="Home.jsp" target="_self">Home</a>
<a href="reservations.jsp" target="_self">My Reservations</a>
<%
if(p.getRole()==2){
%>
<a href="adminPanel.jsp" target="_self">Admin Panel</a>
<% }%>
<a href="logoff.jsp" target="_self">Log Off</a>
<%} %>
</td>
</tr>
</table>
</body>
</html>