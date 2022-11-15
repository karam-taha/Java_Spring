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
<link rel="stylesheet" href="/css/view_project.css">
</head>
<body class="container">
	<div class="header">
		<h1>Project Details</h1>
		<h4><a href="/dashboard">Back to Dashboard</a></h4>
	</div>
	<table>
	    <tbody>
	    	<tr>
	            <td><label class="one">Project: </label> <c:out value="${project.title}"></c:out></td>
	        </tr>
	        
	        <tr>
	            <td><label class="two">Description: </label> <c:out value="${project.description}"></c:out></td>
	        </tr>
	        
	        <tr>
	            <td><label class="three">Due Date: </label> <fmt:formatDate value="${project.dueDate}" pattern="M/d/yyyy"/></td>
	        </tr>
	    </tbody>
	</table>
	<div class="second-main">
		<h5><a href="/projects/${project.id}/tasks">See Tasks</a></h5>
		<c:if test = "${project.lead.id==userId}">
		    <h5><a href="/projects/delete/${project.id}">Delete Project</a></h5>
		</c:if>
	</div>
</body>
</html>