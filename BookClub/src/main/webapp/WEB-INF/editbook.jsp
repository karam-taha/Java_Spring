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
<link rel="stylesheet" href="/css/editbook.css">
</head>
<body class="container">
	<div class="title">
		<h1>Change your Entry</h1>
		<h4><a href="/books">back to shelves</a></h4>
	</div>
	<form:form action="/books/${book.id}" method="post" modelAttribute="book">
	    <input type="hidden" name="_method" value="put">
		<form:input type="hidden" path="user" value="${user.id}"/>
		<p class="error" style="color: red;"><form:errors path="title"/></p>
		<p class="error" style="color: red;"><form:errors path="author_name"/></p>
		<p class="error" style="color: red;"><form:errors path="my_thoughts"/></p>
	    <p>
	        <form:label path="title">Title</form:label>
	        <form:input path="title"/>
	    </p>
	    <p>
	        <form:label path="author_name">Author</form:label>
	        <form:input path="author_name"/>
	    </p>
	    <p class="thoughts">
	        <form:label path="my_thoughts">My Thoughts</form:label>
	        <form:textarea path="my_thoughts"/>
	    </p>   
	    <div class="button">
	    	<input type="submit" value="Submit" class="btn"/>
	    </div>
	</form:form>
</body>
</html>