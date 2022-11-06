<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>show</title>
<!-- CSS only -->
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" href="/css/style.css">
<body>
 
<h1>All Books</h1>
<table class="table table-dark table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Language</th>
            <th># Pages</th>
        </tr>
    </thead>
    <tbody>
         <c:forEach var="book" items="${books}">
         	<tr>
	         	<td><c:out value="${book.id}"/></td>
				<td><a href="/books/<c:out value="${book.id}"/>"><c:out value="${book.title}"/></a></td>
				<td><c:out value="${book.language}"/></td>
	         	<td><c:out value="${book.numberOfPages}"/></td>
         	</tr>
         </c:forEach>
    </tbody>
</table>

</body>
</html>