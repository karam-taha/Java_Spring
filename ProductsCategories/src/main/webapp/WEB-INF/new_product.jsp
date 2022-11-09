<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isErrorPage="true" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>new product</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/index.css">
</head>
<body>
	<h1>New Product</h1>
	<h4><a href="/">Home</a></h4>
	<div class="line"></div>
	<form:form action="/products/new" method="post" modelAttribute="product">
		<table class="table">
	    <thead>
	    	<tr>
	    		<td class="float-left">
					<form:label path="name">Name: </form:label>
				</td>
	            <td class="float-right">
	            	<form:errors path="name" class="text-danger"/>
					<form:input class="input" path="name"/>
	            </td>
	        </tr>
	        <tr>
	        	<td class="float-left">
					<form:label path="description">Description: </form:label>
				</td>

	            <td class="float-right">
	            	<form:errors path="description" class="text-danger"/>
					<form:input class="input" path="description"/>
	            </td>
	        </tr>        
	        <tr>
				<td class="float-left">
					<form:label path="price">Price: </form:label>
				</td>
	            <td class="float-right">
	            	<form:errors path="price" class="text-danger"/>
					<form:input type="number" class="input" path="price"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input class="input button" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
		</table>
	</form:form>
</body>
</html>