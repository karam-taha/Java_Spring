<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
    <header>
        <h4><strong>Your GOLD: </strong></h4>
        <div class="output"><c:out value="${score}"/></div>
    </header>
    <main>
        <section>
            <h1>Farm</h1>
            <h3>(earns 10-20 gold)</h3>
            <form action="/process" method="post">
                <input type="hidden" name="gold" value="farm">
                <button type="submit"><strong>Find Gold!</strong></button>
            </form>
        </section>
        <section>
            <h1>Cave</h1>
            <h3>(earns 5-10 gold)</h3>
            <form action="/process" method="post">
                <input type="hidden" name="gold" value="cave">
                <button type="submit"><strong>Find Gold!</strong></button>
            </form>
        </section>
        <section>
            <h1>House</h1>
            <h3>(earns 2-5 gold)</h3>
            <form action="/process" method="post">
                <input type="hidden" name="gold" value="house">
                <button type="submit"><strong>Find Gold!</strong></button>
            </form>
        </section>
        <section>
            <h1>Quest</h1>
            <h3>(earns/takes 0-50 gold)</h3>
            <form action="/process" method="post">
                <input type="hidden" name="gold" value="quest">
                <button type="submit"><strong>Find Gold!</strong></button>
            </form>
        </section>
    </main>
	<footer>
        <h2>Activities:</h2>
        <div class="activities">
		    <c:forEach var="message" items="${messages}">
		    	<c:if test = "${fn:contains(message, 'lost')}">
		        	<p class="red"><c:out value="${message}"/></p>
		        </c:if>
		        <c:if test = "${fn:contains(message, 'earned')}">
		        	<p class="activity"><c:out value="${message}"/></p>
		        </c:if>
		    </c:forEach>
        </div>
        <a href="/reset">Start New Game</a>
    </footer>
</body>
</html>