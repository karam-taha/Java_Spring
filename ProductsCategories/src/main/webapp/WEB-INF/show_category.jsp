<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show category</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/show.css">
</head>
<body>
	<h1><c:out value="${category.name}"/></h1>
	<h4><a href="/">Home</a></h4>
	<div class="line"></div>
	<h3>Products:</h3>
	<ul>
		<c:forEach var="product" items="${assignedProducts}">
			<li>- <c:out value="${product.name}"></c:out></li>
		</c:forEach>
	</ul>
	<hr>
	<form action="/categories/${id}" method="post">
		<h4>Add Product:</h4>				
		<select name="productId" id="productId" class="input">
		    <c:forEach var="product" items="${unassignedProducts}">
		    	<option value="${product.id}">${product.name}</option>
		    </c:forEach>
		</select>
		<input class="input button" type="submit" value="Add"/>
	</form>
</body>
</html>