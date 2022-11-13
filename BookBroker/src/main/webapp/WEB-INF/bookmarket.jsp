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
<body>
   <main class="container">
		<h4>Hello, <c:out value="${currentUser.userName}"/>. Welcome to..</h4>
		<h1>The Book Broker!</h1>
		<h4><a href="/books">back to the shelves</a></h4>
		<h4>Available Books to Borrow</h4>
		<table class="table table-bordered border-dark">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Owner</th>
					<th>Actions</th>
				</tr>
			</thead>
			<c:forEach var="book" items="${restBooks}">
			<tr>
				<td class="text-center col-md-1"><c:out value="${book.id}"/></td>
				<td class="text-center col-md-3"><a href="/books/<c:out value="${book.id}"/>"><c:out value="${book.title}"/></a></td>
				<td class="text-center col-md-3"><c:out value="${book.author_name}"/></td>
				<td class="text-center col-md-3"><c:out value="${book.user.userName}"/></td>
				<c:choose>
				    <c:when test="${book.user.id==userId}">
				        <td class="actions">
				        	<a href="/books/${book.id}/edit">Edit</a>
							<form action="/books/${book.id}" method="post">
	    						<input type="hidden" name="_method" value="delete">
	    						<input type="submit" value="Delete" class="delete">
	    					</form>
	    				</td>
				    </c:when>    
				    <c:otherwise>
				        <td class="text-center col-md-1"><a href="/bookmarket/borrow/${book.id}">Borrow</a></td>
				    </c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
		<h4>Books I'm Borrowing..</h4>
		<table class="table table-bordered border-dark">
			<thead class="table-dark">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Owner</th>
					<th>Actions</th>
				</tr>
			</thead>
			<c:forEach var="book" items="${currentUser.borrowedBooks}">
			<tr>
				<td scope="row"><c:out value="${book.id}"/></td>
				<td><a href="/books/<c:out value="${book.id}"/>"><c:out value="${book.title}"/></a></td>
				<td><c:out value="${book.author_name}"/></td>
				<td><c:out value="${book.user.userName}"/></td>
				<td><a href="/bookmarket/return/${book.id}">Return</a></td>
			</tr>
			</c:forEach>
		</table>
	</main>
</body>
</html>