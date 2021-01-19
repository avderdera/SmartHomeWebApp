<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page  import="smartHome.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<% UserDAL usr = new UserDAL();
Sensors sr= usr.getLast();
String lux1=sr.getLux();
%>
<%=""+lux1 %>

</body>
</html>