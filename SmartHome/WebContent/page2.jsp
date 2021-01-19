<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Welcome home 

<c:forEach var="user" items="${list}" >
	<c:out value="${user.name}"/>
	<c:out value="${user.password}"/><br>


</c:forEach>


	<c:out value="${data.temp}"/><br>
	<c:out value="${data.ts}"/><br>
	<c:out value="${data.humid}"/><br>
	<c:out value="${data.id}"/><br>
	motion value is :<c:out value="${data.motion}"/><br>


</body>
</html>