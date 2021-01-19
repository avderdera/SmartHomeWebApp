<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page  import="smartHome.*"%>  
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
UserServlet usr = new UserServlet();
String temp[] =usr.getarraytemp();
String temp2[] = usr.getarraytemp2();
String temp3[] = usr.getarraytemp3();

%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
		History Overview
	</div>
	
</div>

<form action=""> 
  <select name="customers" onchange="graphHandler(this.value)">
    <option value="load">Select a room:</option>
    <option value="l">Living Room</option>
    <option value="b">Bedroom</option>
    <option value="k">Kids Room</option>
  </select>
</form>
<br><br><br>

<script>

function graphHandler(value){
	var v = value;
	if (v=="l"){
		showgraph();
	}else if (v=="b"){
		showgraph2();
	}else if (v=="k"){
		showgraph3();
	}else if(v=="load"){
		onl();
	}
}


function showgraph(){
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark1",
		title: {
			text: "Living Room's Temperature overview for previous Day"
		},
		axisX: {
			title: "Temperature every hour",
			suffix: ":00"
				
		},
		axisY: {
			title: "Temperature (in °C)",
			suffix: "°C",
			includeZero: true
		},
		data: [{
			type: "line",
			yValueFormatString: "##°C ",
			dataPoints: [
				<%for (int i=0;i<24;i++){%>
				
				{ x: <%out.print(i); %>, y: <% out.print(temp[i]);%> },
				
				<% } %>
			]
			
		}]
	});
	chart.render();
}

function showgraph2(){
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark1",
		title: {
			text: "BedRoom's Temperature overview for previous Day"
		},
		axisX: {
			title: "Temperature every hour",
			suffix: ":00"
				
		},
		axisY: {
			title: "Temperature (in °C)",
			suffix: "°C",
			includeZero: true
		},
		data: [{
			type: "line",
			yValueFormatString: "##°C ",
			dataPoints: [
				<%for (int i=0;i<24;i++){%>
				
				{ x: <%out.print(i); %>, y: <% out.print(temp2[i]);%> },
				
				<% } %>
			]
			
		}]
	});
	chart.render();
}

function showgraph3(){
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark1",
		title: {
			text: "KidsRoom's Temperature overview for previous Day"
		},
		axisX: {
			title: "Temperature every hour",
			suffix: ":00"
				
		},
		axisY: {
			title: "Temperature (in °C)",
			suffix: "°C",
			includeZero: true
		},
		data: [{
			type: "line",
			yValueFormatString: "##°C ",
			dataPoints: [
				<%for (int i=0;i<24;i++){%>
				
				{ x: <%out.print(i); %>, y: <% out.print(temp3[i]);%> },
				
				<% } %>
			]
			
		}]
	});
	chart.render();
}
</script>


<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script >

window.addEventListener('load', onl, false);
function onl()
{
	var chart = new CanvasJS.Chart("chartContainer", {
		theme: "dark1",
		title: {
			text: "Rooms' Temperatures Display"
		},
		axisX: {
			title: "Temperature every hour",
			suffix: ":00"
		},
		axisY: {
			title: "Temperature (in °C)",
			suffix: "°C",
			includeZero: true
		},
		
		legend: {
			cursor: "pointer",
			verticalAlign: "top",
			horizontalAlign: "center",
			dockInsidePlotArea: true,
			itemclick: toogleDataSeries
		},
		data: [{
			type:"line",
			name: "Living Room",
			showInLegend: true,
			markerSize: 0,
			yValueFormatString: "##°C ",
			dataPoints: [		
				<%for (int i=0;i<24;i++){%>
				
				{ x: <%out.print(i); %>, y: <% out.print(temp[i]);%> },
				
				<% } %>
			]
		},
		
		{
			type: "line",
			name: "BedRoom",
			showInLegend: true,
			markerSize: 0,
			yValueFormatString: "##°C ",
			dataPoints: [
				<%for (int i=0;i<24;i++){%>
				
				{ x: <%out.print(i); %>, y: <% out.print(temp2[i]);%> },
				
				<% } %>
			]
		},
		{
			type: "line",
			name: "KidsRoom",
			showInLegend: true,
			markerSize: 0,
			yValueFormatString: "##°C ",
			dataPoints: [
				<%for (int i=0;i<24;i++){%>
				
				{ x: <%out.print(i); %>, y: <% out.print(temp3[i]);%> },
				
				<% } %>
			]
		}]
	});
	chart.render();

	function toogleDataSeries(e){
		if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else{
			e.dataSeries.visible = true;
		}
		chart.render();
	}

}

</script>

</body>

</html>                 