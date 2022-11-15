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
<link rel="stylesheet" href="/css/tasks.css">
</head>
<body class="container">
	<h2><a href="/dashboard">Dashboard</a></h2>
	
	<h1>Project: ${project.title}</h1>
	<h5>Project Lead: ${project.lead.firstName}</h5>
	
	<form:form action="/projects/${project.id}/tasks" method="post" modelAttribute="task">
		<table>
		    <thead>
		        <tr>
		            <td class="float-left">Add a task ticket for this team:</td>
		            <td class="float-left">
		            	<form:errors path="name" class="text-danger"/>
						<form:textarea rows="4" class="input" path="name"/>
		            </td>
		        </tr>
		        <tr>
		        	<td colspan=2><input class="input" class="button" type="submit" value="Submit"/></td>
		        </tr>
		    </thead>
		</table>
	</form:form>
	<hr>
	<c:forEach var="task" items="${tasks}">
		<h4>Added by <c:out value="${task.creator.firstName}"></c:out> at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h4>
		<p><c:out value="${task.name}"></c:out></p>
	</c:forEach>
</body>
</html>