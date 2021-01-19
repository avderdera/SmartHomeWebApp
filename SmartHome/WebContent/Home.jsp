<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page  import="smartHome.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to Home IQ</title>

<style><%@include file="css/home.css"  %></style>

</head>
<body>

<nav >
		<ul>
		  <li><a href="home">Home</a></li>
		  <li><a href="history">History</a></li>
		  <li class="logout"><a href="logout"> Log out</a> </li>
		</ul>
</nav>





<div class="title">
	<div id="new"> 
		Home IQ 
	</div>
	<h4 style="margin-bottom:0;font-size:0.6em;">Welcome <c:out value="${name}"/> </h4>
</div>

<div class="row">
	
	<div class="column">
		<div class="grid-container" id="shadow">
			<div id="room">Living Room</div>
			<div class="grid-item temp"><span id="temp1"><c:out value="${data.temp}"/></span> °C</div>
			<div class="grid-item">Humidity: <span id="humid1"><c:out value="${data.humid}"/></span> %</div>
			<div class="grid-item">Pressure: <span id="press1"> <c:out value="${data.pressure}"/> </span> Pa</div>
			<div class="grid-item">Air quality:  <span id="air1"> <c:out value="${data.airquality}"/> </span> PPM</div>
			<div class="grid-item">Light Intensity: <span id="lux1"> <c:out value="${data.lux}"/> </span> LUX</div>
			
			
		</div>
	</div>
	
	<div class="column">
		<div class="grid-container" id="shadow">
			<div id="room">Bedroom</div>
			<div class="grid-item temp"><span id="temp2"> <c:out value="${datab.temp}"/> </span> °C</div>
			<div class="grid-item">Humidity: <span id="humid2"> <c:out value="${datab.humid}"/> </span> %</div>
			<div class="grid-item">Pressure: <span id="press2"> <c:out value="${datab.pressure}"/> </span> Pa</div>
			<div class="grid-item">Air quality: <span id="air2"> <c:out value="${datab.airquality}"/> </span> PPM</div>
			<div class="grid-item">Light Intensity: <span id="lux2"> <c:out value="${datab.lux}"/> </span> LUX</div>
			
			
		</div>
	</div>
	
	<div class="column">
		<div class="grid-container" id="shadow">
			<div id="room">Kids room</div>
			<div class="grid-item temp"> <span id="temp3"> <c:out value="${datac.temp}"/> </span> °C</div>
			<div class="grid-item">Humidity: <span id="humid3"> <c:out value="${datac.humid}"/> </span> %</div>
			<div class="grid-item">Pressure: <span id="press3"> <c:out value="${datac.pressure}"/> </span> Pa</div>
			<div class="grid-item">Air quality: <span id="air3"> <c:out value="${datac.airquality}"/> </span> PPM</div>
			<div class="grid-item">Light Intensity: <span id="lux3"> <c:out value="${datac.lux}"/>  </span>LUX</div>
			
			
			
		</div>
	</div>
	
	<div class="column" style="background-image:url(https://i.ibb.co/vJzhVZD/main.png); width:500px;height:500px;">
			
			<div style="position:relative; " class="livingbulb" >
				Living Room
				<div style="padding-left:20px;">
					<a onclick="change(); test();">
						<img src="https://i.ibb.co/HhX5xyK/light-bulb-off.png" alt="light-bulb-off" border="0" width="40px" id="livlight">
					</a>
				</div>
			</div>
			
			<div style="position:relative; " class="bedbulb">
				Bedroom
				<div style="padding-left:10px;">
					<a onclick="change2(); test();">
						<img src="https://i.ibb.co/HhX5xyK/light-bulb-off.png" alt="light-bulb-off" border="0" width="40px" id="bedlight">
					</a>
				</div>
			</div>	
			
			<div style="position:relative; " class="kidsbulb">
				Kids Room 
				<div style="padding-left:10px;">
					<a onclick="change3(); test();">
						<img src="https://i.ibb.co/HhX5xyK/light-bulb-off.png" alt="light-bulb-on" border="0" width="40" id="kidslight">
					</a>
				</div>
			</div>
	</div>
	
	<div class="column">
		<div class="grid-container" id="shadow">
			<h2>Lighting handler /overview</h2>
			Living room &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="checkbox" class="cm-toggle" id="checkliv" onclick="change(); test();">
			<br>
			Bedroom &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <input type="checkbox" name="checkbox" class="cm-toggle" id="checkbed" onclick="change2(); test();">
			<br>
			
			Kids Room&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="checkbox" name="checkbox" class="cm-toggle" id="checkkid" onclick="change3()">
			<br><br>
			
			Customer's Automation<input type="checkbox" name="checkbox" class="cm-toggle" id="automation" onclick="test(); run3();">
			<br>
		</div>
	</div>
	
	<p id="test"></p>
	
</div>


<script>

setInterval(sensor1updater, 30000); 
setInterval(sensor2updater, 30000);
setInterval(sensor3updater, 30000);
var toggle1 = false;
var toggle2 = false;
var toggle3 = false;
var openedbyswitch = false;

function change(){
	var v =document.getElementById("livlight");
	var vs =document.getElementById("checkliv");
	if (toggle1 === false){
		v.setAttribute("src","https://i.ibb.co/ZcJdh5v/light-bulb-on.png");
		document.getElementById("checkliv").checked= true;
	}else{
		v.setAttribute("src","https://i.ibb.co/HhX5xyK/light-bulb-off.png");
		document.getElementById("checkliv").checked= false;
	}
	toggle1= !toggle1;
	run();
}

// ============================================================================

function change2(){
	var v =document.getElementById("bedlight");
	var vs =document.getElementById("checkbed");
	if (toggle2 === false){
		v.setAttribute("src","https://i.ibb.co/ZcJdh5v/light-bulb-on.png");
		document.getElementById("checkbed").checked= true;
		
	}else{
		v.setAttribute("src","https://i.ibb.co/HhX5xyK/light-bulb-off.png");
		document.getElementById("checkbed").checked= false;
		
	}
	toggle2= !toggle2;
	run1();
	//document.getElementById("test").innerHTML = toggle;
}

// =============================================================================

function change3(){
	var v =document.getElementById("kidslight");
	var vs =document.getElementById("checkkid");
	if (toggle3 === false){
		v.setAttribute("src","https://i.ibb.co/ZcJdh5v/light-bulb-on.png");
		document.getElementById("checkkid").checked= true;
		openedbyswitch = true;
	}else{
		v.setAttribute("src","https://i.ibb.co/HhX5xyK/light-bulb-off.png");
		document.getElementById("checkkid").checked= false;
		openedbyswitch = false;
	}
	toggle3= !toggle3;
	run2();
	//document.getElementById("test").innerHTML = toggle;
}

//============================================================================

function test(){
	var vs =document.getElementById("checkliv").checked;
	var vds =document.getElementById("checkbed").checked;
	var vr =document.getElementById("kidslight");
	var auto =document.getElementById("automation").checked;
	
	//document.getElementById("test").innerHTML = auto;
	if (auto === true ){
		//document.getElementById("test").innerHTML = auto;
		if (vs === true){
			if(vds === true){
				vr.setAttribute("src","https://i.ibb.co/ZcJdh5v/light-bulb-on.png");
				document.getElementById("checkkid").checked= true;
			}
		}
		
		if(!openedbyswitch){
			if(!vs || !vds) {
				vr.setAttribute("src","https://i.ibb.co/HhX5xyK/light-bulb-off.png");
				document.getElementById("checkkid").checked= false;
			}
		}
		
	}
	
}
//============================================================================
	
function sensor1updater() {
	temp1();
	humid1();
	air1();
	press1();
	lux1();
}

function sensor2updater() {
	temp2();
	humid2();
	air2();
	press2();
	lux2();
}

function sensor3updater() {
	temp3();
	humid3();
	air3();
	press3();
	lux3();
}

//============================================================================


// start of sensor1 data ----------------------------

function temp1(){
	var xhttps, xmlDoc;
	xhttps = new XMLHttpRequest();
	xhttps.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	    document.getElementById("temp1").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = xmlDoc;
	  }
	};
	xhttps.open("GET", "temp1.jsp", true);
	xhttps.send();
}

function humid1(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	    document.getElementById("humid1").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "humid1.jsp", true);
	xhttp.send();
}

function press1(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("press1").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "pressure1.jsp", true);
	xhttp.send();
}

function air1(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("air1").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "air1.jsp", true);
	xhttp.send();
}

function lux1(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("lux1").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "lux1.jsp", true);
	xhttp.send();
}

// end of sensor1 data ---------------------------------------

// ============================================================================

// start of sensor2 data ----------------------------

function temp2(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	    document.getElementById("temp2").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = xmlDoc;
	  }
	};
	xhttp.open("GET", "temp2.jsp", true);
	xhttp.send();
}

function humid2(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	    document.getElementById("humid2").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "humid2.jsp", true);
	xhttp.send();
}

function press2(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("press2").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "pressure2.jsp", true);
	xhttp.send();
}

function air2(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("air2").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "air2.jsp", true);
	xhttp.send();
}

function lux2(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("lux2").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "lux2.jsp", true);
	xhttp.send();
}

// end of sensor2 data ---------------------------------------

// ============================================================================

// start of sensor3 data ----------------------------

function temp3(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	    document.getElementById("temp3").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "temp3.jsp", true);
	xhttp.send();
}

function humid3(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	    document.getElementById("humid3").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "humid3.jsp", true);
	xhttp.send();
}

function press3(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("press3").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "pressure3.jsp", true);
	xhttp.send();
}

function air3(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("air3").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "air3.jsp", true);
	xhttp.send();
}

function lux3(){
	var xhttp, xmlDoc;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	  if (this.readyState == 4 && this.status == 200) {
	    xmlDoc = this.responseText;
	   
	    document.getElementById("lux3").innerHTML = xmlDoc;
	    //document.getElementById("test").innerHTML = x;
	  }
	};
	xhttp.open("GET", "lux3.jsp", true);
	xhttp.send();
}

// end of sensor3 data ---------------------------------------

// ============================================================================

function run(){
    var xhttp, xmlDoc;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      }
    };
    xhttp.open("GET", "python.jsp", false);
    xhttp.send();
}
function run1(){
    var xhttp, xmlDoc;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      }
    };
    xhttp.open("GET", "python1.jsp", false);
    xhttp.send();
}
function run2(){
    var xhttp, xmlDoc;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      }
    };
    xhttp.open("GET", "python2.jsp", false);
    xhttp.send();
}
function run3(){
    var xhttp, xmlDoc;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
      }
    };
    xhttp.open("GET", "python3.jsp", false);
    xhttp.send();
}
	

</script>

<script >
// works ****

window.addEventListener('load', mInlineJsLoadFunc, false);
function mInlineJsLoadFunc()
{
	
	sensor1updater() ;
	sensor2updater() ;
	sensor3updater() ;
	

}

</script>

</body>
</html>