<%@page import="MyFlight.LoginManager"%>
<%@page import="MyFlight.Person"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.header{
top: 1%;

	}
.login{
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
<%
String email=request.getParameter("userEmail");

String password=request.getParameter("userPassword");
if(email!=null){
	System.out.println(password);
	LoginManager log=new LoginManager(email, password);
			Person p=log.login();
			if(p!=null){
				session.setAttribute("user", p);	
				System.out.println("sucess");
				 response.sendRedirect("userPanel.jsp");
			}
			else {
				out.println("Invalid Login, you are been redirected to the login page...");
				response.setHeader("Refresh", "5;url=login.jsp");
			}
}
else{
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyFlight</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="login">

<form id="loginForm" action="login.jsp" method="post">
<table>
<tr><td>Email Address:</td><td><input type="text" id="userEmail" name="userEmail"/></td></tr>
<tr><td>Password: </td><td><input type="password" id="userPassword" name="userPassword"/></td></tr>
<tr><td></td><td><input type="submit" value="Login"></td></tr>
<tr>
<td>
 <a href="register.jsp" target="_self">Register Here</a>
</td>
<td>
<a href="resetPassword.jsp" target="_self">Forgot Password</a>
</td>
</tr>
</table>
</form>
</div>
<%} %>
</body>
</html>