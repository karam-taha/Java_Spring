<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>edit</title>
</head>
<body style="margin: 10vw;">
	<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
		<input type="hidden" name="_method" value="put">
	
		<div>
			<form:label path="name">Name: </form:label><br />
			<form:errors path="name" class="text-danger"/>
			<form:input style="width:250px;" path="name"/>
		</div>
	
		<div>
			<form:label path="creator">Creator: </form:label><br />
			<form:errors path="creator" class="text-danger"/>
			<form:input style="width:250px;" path="creator"/>
		</div>
		
		<div>
			<form:label path="version">Version: </form:label><br />
			<form:errors path="version" class="text-danger"/>
			<form:input style="width:250px;" type="double" path="version"/>
		</div>
		
		<div>
			<input type="submit" value="Submit"/>
		</div>

	</form:form>
</body>
</html>