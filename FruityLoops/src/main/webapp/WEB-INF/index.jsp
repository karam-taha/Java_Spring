<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
	<div class="container">
	<h1>Fruit Store</h1>
	<table class="table">
	    <tr>
	      <th scope="col">Name</th>
	      <th scope="col">Price</th>
	    </tr>
	      <c:forEach var="fruit" items="${fruits}">
	    <tr>
	      <td><c:out value="${fruit.name}"/></td>
	      <td><c:out value="${fruit.price}"/></td>
	    </tr>
	      </c:forEach>
	</table>
	</div>
</body>
</html>