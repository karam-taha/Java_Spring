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
<link rel="stylesheet" href="/css/success.css">
</head>
<body class="container">
	<div class="title">
		<h1>Welcome, <c:out value="${currentUser.userName}"/></h1>
		<h4><a href="/logout">logout</a></h4>
	</div>
	<div class="addbook">
		<h4>Books from everyone's shelves:</h4>
		<h4><a href="/books/new">+ Add a book to my shelf!</a></h4>
	</div>
	<table class="table table-bordered border-dark">
		<thead class="table-dark">
			<tr>
				<th class="text-center">ID</th>
				<th class="text-center">Title</th>
				<th class="text-center">Author Name</th>
				<th class="text-center">Posted By</th>
			</tr>
		</thead>
		<c:forEach var="book" items="${allBooks}">
		<tr class="table-secondary table-bordered border-dark">
			<td class="text-center col-md-1"><c:out value="${book.id}"/></td>
			<td class="text-center col-md-4"><a href="/books/<c:out value="${book.id}"/>"><c:out value="${book.title}"/></a></td>
			<td class="text-center col-md-4"><c:out value="${book.author_name}"/></td>
			<td class="text-center col-md-3"><c:out value="${book.user.userName}"/></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>