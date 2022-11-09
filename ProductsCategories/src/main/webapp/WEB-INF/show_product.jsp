<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show product</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/show.css">
</head>
<body>
	<h1><c:out value="${product.name}"/></h1>
	<h4><a href="/">Home</a></h4>
	<h3>Categories:</h3>
	<div class="line"></div>
	<ul>
		<c:forEach var="category" items="${assignedCategories}">
			<li><c:out value="${category.name}"></c:out></li>
		</c:forEach>
	</ul>
	<hr>
	<form action="/products/${id}" method="post">
		<h4>Add Category:</h4>				
		<select name="categoryId" id="categoryId" class="input">
		    <c:forEach var="category" items="${unassignedCategories}">
		    	<option value="${category.id}">${category.name}</option>
		    </c:forEach>
		</select>
		<input class="input button" type="submit" value="Add"/>
	</form>
</body>
</html>