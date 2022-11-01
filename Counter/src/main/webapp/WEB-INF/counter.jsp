<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Counter</title>
	<link rel="stylesheet" href="/css/counter.css"/>
</head>
<body>
	<h2>You have visited <a href="/your_server"><c:out value="${page}"/> </a><c:out value="${count}"/> times</h2>
	<h2><a href="/your_server">Test another visit?</a></h2>
	<h2><a href="/your_server/double-counter">visit this page to add +2</a></h2>
	<h2><a href="/your_server/reset-counter">reset counter</a></h2>
</body>
</html>