<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
	<link rel="stylesheet" href="/css/show.css"/>
</head>
<body>
    <h1>Here's Your Omikuji!</h1>
    <div>
    	<p>In <c:out value="${number}"/> years, you will live in <c:out value="${city}"/> with <c:out value="${person}"/> as your roommate, 
    	<c:out value="${hobby}"/>. The next time you see a <c:out value="${live}"/>, you will have a good luck. Also, <c:out value="${desc}"/></p>
    </div>
</body>
</html>