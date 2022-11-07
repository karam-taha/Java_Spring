<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ninja</title>
</head>
<body>
	<h1>New Ninja</h1>
		<form:form action="/ninjas" method="post" modelAttribute="ninja">
		<p>
	        <form:label path="dojo">Choose Dojo</form:label>
	        <form:errors path="dojo"/>
	        <form:select path="dojo">
	        <c:forEach var="dojo" items="${dojos}">
	        	<form:option value="${dojo.id}">
	        		<c:out value="${dojo.name}"/>
	        	</form:option>
	        </c:forEach>
	        </form:select>
	    </p> 
	    <p>
	        <form:label path="firstname">First Name: </form:label>
	        <form:errors path="firstname"/>
	        <form:input path="firstname"/>
	    </p>
	    <p>
	        <form:label path="lastname">Last Name: </form:label>
	        <form:errors path="lastname"/>
	        <form:input path="lastname"/>
	    </p>
	    <p>
	        <form:label path="age">Age: </form:label>
	        <form:errors path="age"/>
	        <form:input path="age"/>
	    </p>
    <input type="submit" value="Create"/>
</form:form> 
</body>
</html>