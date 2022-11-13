<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>register and login</title>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header>
	<h1>Book Broker</h1>
	<p>A place for friends to share thoughts on books.</p>
</header>
<main>
	<form:form action="/register" method="post" modelAttribute="newUser" class="register">
	<table>
		<thead>
	    	<tr>
	            <td colspan="2" class="title">Register</td>
	        </tr>
	    </thead>
	    <thead>
	    	<tr>
	            <td class="float-left">User Name:</td>
	            <td class="float-right">
					<form:input class="input" path="userName"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Email:</td>
	            <td class="float-right">
					<form:input class="input" path="email" type="email"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Password:</td>
	            <td class="float-right">
					<form:input class="input" path="password" type="password"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Confirm PW:</td>
	            <td class="float-right">
					<form:input class="input" path="confirm" type="password"/>
	            </td>
	        </tr>
	        <tr class="button-area">
	        	<td colspan=2><input class="input button" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
		<div class="message"><form:errors path="userName" class="text-danger"/></div>
		<div class="message"><form:errors path="email" class="text-danger"/></div>
		<div class="message"><form:errors path="password" class="text-danger"/></div>
		<div class="message"><form:errors path="confirm" class="text-danger"/></div>
</form:form>
<form:form action="/login" method="post" modelAttribute="newLogin" class="login">

	<table>
		<thead>
	    	<tr>
	            <td colspan="2" class="title">Log In</td>
	        </tr>
	    </thead>
	    <thead>
	        <tr>
	            <td class="float-left">Email:</td>
	            <td class="float-right">
					<form:input class="input" path="email" type="email"/>
					
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Password:</td>
	            <td class="float-right">
					<form:input class="input" path="password" type="password"/>
					
	            </td>
	        </tr>
	        <tr class="button-area">
	        	<td colspan=2><input class="input button" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
		<div class="message"><form:errors path="email" class="text-danger"/></div>
		<div class="message"><form:errors path="password" class="text-danger"/></div>
</form:form>  
</main>
</body>
</html>