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
	<table>
	    <thead>
	        <tr>
	            <th>Songs by <c:out value="${artist}"></c:out></th>
	            <th>
		            <form class="in-line" action="/dashboard" method="post">
		
						<input class="in-line" type="text" id="artist" name="artist" placeholder="Search"/>
						<input class="in-line" class="button" type="submit" value="Submit"/>
						
					</form>
	            </th>
	            <th><a class="in-line" href="/dashboard">Dashboard</a></th>
	        </tr>
	    </thead>
	</table>
	<hr>
	<table>
	    <thead>
	        <tr>
	            <th>Name</th>
	            <th>Rating</th>
	            <th>Action</th>
	        </tr>
	    </thead>
	    <tbody>
			<c:forEach var="song" items="${songs}">
				<tr>
					<td><a href="/songs/${song.id}"><c:out value="${song.title}"></c:out></a></td>
					<td><c:out value="${song.rating}"></c:out></td>
					<td><a href="/delete/${song.id}">delete</a></td>
				</tr>	
			</c:forEach>
	    </tbody>
	</table>
</body>
</html>