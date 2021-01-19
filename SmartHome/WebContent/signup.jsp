<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<style>
body{
	background-color:#2e5978;
	
}
.border {
	background-color: rgba(255,255,255,.9);
	width: auto;
	margin-top:300px;
	margin-left: 40%;
	margin-right: 40%;
	text-align:center;
	border-radius: 8px;
	box-shadow: 0 0 10px #111, 0 0 10px #000, 4px 5px 2px #000;
}

#pass {
height: 40px;
width: 300px;
margin-bottom: 10px;
}

#username {
height: 40px;
width: 300px;
margin-bottom: 10px;
}

#sign {
	margin-top: 20px;
	padding: 20px;
	font-size: 2em;
}

#btn {
color: white;
background: radial-gradient(ellipse at center, #6A107D 1%, #944BA4 5%, #C59237 100%);
margin: 30px;
margin-bottom: 0;
width: 310px;
height: 40px;
font-size: 1.3em;
padding-bottom: 0px;

margin-bottom: 20px;	
}

#btn:hover {
color: white;
background: radial-gradient(ellipse at center, #6A107D 50%, #944BA4 60%, #C59237 100%);
box-shadow: 0 0 5px #FFF,
			 0 0 10px #FFF,
			 0 0 15px #FFF,
 			 0 0 20px #C59237,
			 0 0 30px #C59237;
	 
}



</style>
<body>
<div class="border">
	<form action="insert" method="post">
			<p id="sign">Sign Up</p>
		<input type="text" id="username" name="name" placeholder="Insert Username here..." >
		<br>
		<input type="password" name ="pass" placeholder=" Enter Password here..." id="pass">
		<br>
		<input type="password" name ="pass2" placeholder=" Re-enter Password here..." id="pass">
		<br>
		<input type="submit" value="SIGN UP" id="btn">
			<div style="color:red;">
			<c:if test="${error=='100' }">
				<c:out value="${mm }"/>
				<br>
			</c:if>
			<c:if test="${error=='same' }">
				Username already exists !!!
				<br>
			</c:if>
			</div>
	</form>
</div>

</body>
</html>