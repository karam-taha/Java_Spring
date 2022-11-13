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
<link rel="stylesheet" href="/css/showbook.css">
</head>
<body class="container">
	<div class="title">
		<h1><c:out value="${book.title}"/></h1>
		<h4><a href="/books">back to shelves</a></h4>
	</div>
	<div style="font-size:20px; font-weight:bold" class="main">
		<span style="color:red"><c:out value="${reader.userName}"/></span> read 
		<span style="color:purple"><c:out value="${book.title}"/></span> by 
		<span style="color:green"><c:out value="${book.author_name}"/></span>.
	</div>
	<h4>Here are <c:out value="${reader.userName}"/>'s thoughts:</h4>
	<div class="line"></div>
	<div class="thoughts">
		<h5><c:out value="${book.my_thoughts}"/></h5>
	</div>
	<div class="line"></div>
	<div class="buttons">
		<c:if test="${book.user.id==userId}">
			<a href="/books/${book.id}/edit" class="btn">Edit</a>
			<form action="/books/${book.id}" method="post">
		    	<input type="hidden" name="_method" value="delete">
		    	<input type="submit" value="Delete" class="btn">
		    </form>
		</c:if>
	</div>
</body>
</html>