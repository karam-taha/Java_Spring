<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
	<link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
    <h1>Send an Omikuji!</h1>
    <form action="/omikuji/submit" method="post">
        <div class="number">
        	<label>Pick a number from 5 to 25</label>
        	<input type="number" name="number" min="5" max="25" value="5">
        </div>
        <div>
        	<label>Enter the name of any city.</label>
        	<input type="text" name="city">
        </div>
        <div>
	        <label>Enter the name of any real person.</label>
	        <input type="text" name="person">
        </div>
		<div>
			<label>Enter professional endeavor or hobby.</label>
        	<input type="text" name="hobby">
		</div>
        <div>
        	<label>Enter any type of living thing.</label>
        	<input type="text" name="live">
        </div>
		<div>
			<label>say something nice to someone</label>
        	<textarea rows="7" cols="10" name="desc"></textarea>
		</div>
        <div><h3>send and show a friend.</h3></div>
        <div class="send">
        	<input type="submit" value="send">
        </div>
    </form>
</body>
</html>