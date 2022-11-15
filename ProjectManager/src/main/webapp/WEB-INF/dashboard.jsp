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
<link rel="stylesheet" href="/css/dashboard.css">
</head>
<body class="container">
	<div class="header">
		<h1>Welcome, <c:out value="${currentUser.firstName}"/></h1>
		<h4><a href="/logout">logout</a></h4>
	</div>
	<div class="header">
		<h2>All Projects</h2>
		<a class="btn btn-primary" href="/projects/new">+ Add Project</a>
	</div>
	<table class="table table-bordered border-dark">
		<thead class="table-dark">
			<tr>
				<th class="text-center">Project</th>
				<th class="text-center">Team Lead</th>
				<th class="text-center">Due Date</th>
				<th class="text-center">Actions</th>
			</tr>
		</thead>
		<c:forEach var="project" items="${unassignedProjects}">
		<tr>
			<c:if test = "${project.lead.id!=user.id}">
			<td class="text-center"><a href="/projects/${project.id}">${project.title}</a></td>
			<td class="text-center"><c:out value="${project.lead.firstName}"></c:out></td>
			<td class="text-center"><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
		    <td class="text-center"><a href="/dashboard/join/${project.id}">Join Team</a></td>
		    </c:if>
		</tr>
		</c:forEach>
	</table>
	
	<div class="header"><h4>Your Projects</h4></div>
	<table class="table table-bordered border-dark">
	    <thead class="table-dark"> 
	    	<tr>
	    		<th class="text-center">Project</th>
	    		<th class="text-center">Team Lead</th>
	    		<th class="text-center">Due Date</th>
	    		<th class="text-center">Actions</th>
	    	</tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="project" items="${assignedProjects}">
			<tr>
				<td class="text-center"><a href="/projects/${project.id}">${project.title}</a></td>
				<td class="text-center"><c:out value="${project.lead.firstName}"></c:out></td>
				<td class="text-center"><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
				<c:if test = "${project.lead.id==user.id}">
			       <td class="text-center"><a href="/projects/edit/${project.id}">Edit Project</a></td>
			    </c:if>
			    <c:if test = "${project.lead.id!=user.id}">
			       <td class="text-center"><a href="/dashboard/leave/${project.id}">Leave Team</a></td>
			    </c:if>
			</tr>	
		</c:forEach>
	    </tbody>
	</table>
</body>
</html>