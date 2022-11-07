<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" href="/css/show.css">
</head>
<body>
	<h1><c:out value="${dojo.name}"/> Ninjas</h1>
	<table class="table table-dark table-bordered">
		<thead>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
		</tr>
		</thead>
		<c:forEach var="ninja" items="${dojo.ninjas}">
		<tr>
			<td><c:out value="${ninja.firstname}"/></td>
			<td><c:out value="${ninja.lastname}"/></td>
			<td><c:out value="${ninja.age}"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>