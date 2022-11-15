<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/new_project.css">
</head>
<body class="container">
	<div class="header">
		<h1>Create a new project</h1>
	</div>
	<form:form action="/projects/new" method="post" modelAttribute="project">
		<table>
		    <thead>
		    	<tr>
		            <td class="float-left">Project Title:</td>
		            <td class="float-left">
		            	
						<form:input class="input" path="title"/>
						<form:errors path="title" class="text-danger"/>
		            </td>
		        </tr>
		        <tr>
		            <td class="float-left">Project Description:</td>
		            <td class="float-left">
						<form:textarea rows="3" cols="25" class="input" path="description"/>
						<form:errors path="description" class="text-danger"/>
		            </td>
		        </tr>
		        <tr>
		            <td class="float-left">Due Date:</td>
		            <td class="float-left">
						<form:input path="dueDate" type="date" class="date" />
						<form:errors path="dueDate" class="text-danger"/>
		            </td>
		        </tr>
		        <tr class="buttons">
		        	<td><a class="btn" href="/dashboard">Cancel</a></td>
		        	<td colspan=2><input class="btn" type="submit" value="Submit"/></td>
		        </tr>
		    </thead>
		</table>
	</form:form>
</body>
</html>