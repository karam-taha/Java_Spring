<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcome</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<br>
	<br>
	<p class="float-right"><a href="/dashboard">Dashboard</a></p>
	
	<table>
	    <thead>
	    	<tr>
	            <td class="float-left">Title:</td>
	            <td class="float-left"><c:out value="${song.title}"></c:out></td>
	        </tr>
	        <tr>
	            <td class="float-left">Artist:</td>
	            <td class="float-left"><c:out value="${song.artist}"></c:out></td>
	        </tr>
	        <tr>
	            <td class="float-left">Rating (1-10):</td>
	            <td class="float-left"><c:out value="${song.rating}"></c:out></td>
	        </tr>
	    </thead>
	</table>
	<br>
	<a href="/delete/${song.id}">Delete</a>
</body>
</html>