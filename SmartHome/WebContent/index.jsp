<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>

<style>
body{
	background-color:#2e5978;
	
}
.border {
	background-color: rgba(255,255,255,.9);
	width: 380px;
	margin-top:300px;
	margin-left: 40%;
	
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

#signup {

padding-bottom: 20px;
}

.get{
text-decoration: none;
}
.get:hover{
	text-decoration: underline;
	color: darkblue;
}

.error {
	font-size: 1.1em;
	color: white;
	text-shadow: 0 0 3px #fff,
				 0 0 4px  #fff,
				 0 0 6px #f00,
				 0 0 9px #f00;
}
</style>
<body>


<div class="border">
	<form action="confirm" method="post">
			<p id="sign">Account Login</p>
			<div>
			<c:if test="${error=='10' }">
				<p class="error">Wrong Password !!!</p>
			</c:if>
			<c:if test="${output=='77' }">
				<p class="error">No User detected with name "<c:out value="${name }"/>".<br>Please sign up!</p>
			</c:if>
		<input type="text" id="username" name="name" placeholder="Insert Username here..." >
		<br>
		<input type="password" name ="pass" placeholder=" Enter Password here..." id="pass">
		</div>
		<br>
		<input type="submit" value="SIGN IN" id="btn">
			<div id="signup">
				<span class="txt1">
					Create an account?
				</span>

				<a href="signup" class="get">
					Sign up
				</a>
			</div>
	</form>
</div>

</body>
</html>