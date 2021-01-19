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
UserServlet u = new UserServlet();
Sensors sr= usr.getLast();
Sensors newsr = u.randomval(sr);
String data2=newsr.getLux();
%>
<%=""+data2 %>

</body>
</html>