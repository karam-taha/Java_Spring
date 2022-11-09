<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/index.css">
</head>
<body>
   <h1>Home Page</h1>
   <h4><a href="/products/new">New Product</a></h4>
   <h4><a href="/categories/new">New Category</a></h4>
   <div class="line"></div>
   <table class="table table-striped table-bordered">
    <thead>
        <tr>
            <th class="text-center">Products</th>
            <th class="text-center">Categories</th>
        </tr>
    </thead>
    <tbody>
		<tr>
			<td>
				<ul>
					<c:forEach var="product" items="${products}">
						<li>- <a href="/products/${product.id}"><c:out value="${product.name}"></c:out></a></li>
					</c:forEach>
				</ul>
			</td>
			
			<td>
				<ul>
					<c:forEach var="category" items="${categories}">
						<li>- <a href="/categories/${category.id}"><c:out value="${category.name}"></c:out></a></li>
					</c:forEach>
				</ul>
			</td>
		</tr>
   </tbody>
</table>
</body>
</html>