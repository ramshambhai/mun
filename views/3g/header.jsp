<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Locator</title>
<script type="text/javascript" src="../../resources/js/jquery-1.11.3.min.js" ></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/style.css" />
<script>
var dirPath ="../../";
function toUtcTime(dateTime) {
	   // var d = new Date("2017-05-15 14:39");
		 var d = new Date(dateTime);
	    var n = d.toUTCString().replace("GMT","");    
	    var dd = new Date(n);
	    var year = dd.getFullYear();
	   //alert(dd.getHours());
	    var month = ((dd.getMonth()+1).toString().length<=1)?"0"+(parseInt(dd.getMonth())+1):(parseInt(dd.getMonth())+1);
	    var date = (dd.getDate().toString().length<=1)?"0"+(parseInt(dd.getDate())):(parseInt(dd.getDate()));
	    var hour = (dd.getHours().toString().length<=1)?"0"+(parseInt(dd.getHours())):(parseInt(dd.getHours()));
	    var min = (dd.getMinutes().toString().length<=1)?"0"+(parseInt(dd.getMinutes())):(parseInt(dd.getMinutes()));
	    //console.log(dd.getDate());
	    return (year+"-"+month+"-"+date+" "+hour+":"+min);
	    
	}
var mapServerIp = null;
var runningModeGlobe = "null";
var getMapServerIp = function()
{
	var data={"methodName":"getMapServerIp" };
	$.ajax({
		url:"../Operations",
		data:data,
		type:'post',
		async:false,
		success:function(data)
		{
			mapServerIp = data;
		}
	});	
}
var getRunningMode = function()
{
	var data={"methodName":"getRunningMode","cmd":"GET_MONIT_MODE","cmd":"GET_MONIT_MODE","fileName":"nsFlagList.json" };
	$.ajax({
		url:"../Operations",
		data:data,
		type:'post',
		async:false,
		success:function(data)
		{
			console.log
			
			 try {
				 runningModeGlobe = runningMode = jQuery.parseJSON(data);
			    } catch (e) {
			        return false;
			    }
			
			var mode = parseInt(runningMode.IMEITRACEMODE) == 1?"Trace":"Exclusion";
			$("#runningMode").html("");
			$("#runningMode").text(mode);
		}
	});	
}

getMapServerIp();

var getNIBForHeader = function()
{
	var data={"methodName":"getNibIp" };
	$.ajax({
		url:"../Operations",
		data:data,
		type:'post',
		success:function(data)
		{
			//alert(data);
			$("#nib_ip_val_head").html("");
			$("#nib_ip_val_head").text(data);
		}
	});
}

$(document).ready(function()
{
	//getNIBForHeader();
	//getRunningMode();
});

</script>
</head>
<body>
<% String role = (String)session.getAttribute("role"); %>

<div id="nav">
<table style="float:left">
	<tr>		
		<td style="width: 110px;"><a href="index.jsp">Home</a></td>
		<td class="dropdown" style="margin-top:14px;width: 100px;"><a class="dropbtn" href="#">Live Data</a>
		  	<div class="dropdown-content">
			   <a href="livealarm.jsp">Alarm</a>
			   <a href="livededicatedmesevent.jsp">Dedicated Mes Event</a>
			   <a href="liveholdandmesevent.jsp">Hold Mes Event</a>
			   <a href="livelacchangeevent.jsp">Lac Change Event</a>
			   <a href="liveredirectionevent.jsp">Redirection Event</a>
			</div>
		</td>
		<td class="dropdown" style="margin-top:14px;width: 100px;"><a class="dropbtn" href="#">History</a>
		  	<div class="dropdown-content">
			   <a href="Offline3gAlarms.jsp">Alarms</a>
			   <a href="subredirectionevetn.jsp">Redirection Event</a>
			   <a href="Offlineholdmesevent.jsp">Hold Mes Event</a>
			   <a href="dedicatedMeasEvent.jsp">Hold And Meas Event</a>
			   <a href="Offline3glacchange.jsp">Lac Event</a>
			</div>
		</td>
		
		<!-- <td style="width: 110px;"><a href="Offline3gAlarms.jsp">Alarms</a></td>
		<td style="width: 160px;"><a href="subredirectionevetn.jsp">Redirection Event</a></td>
		<td style="width: 160px;"><a href="Offlineholdmesevent.jsp">Hold And Meas Event</a></td>
		<td style="width: 160px;"><a href="dedicatedMeasEvent.jsp">Dedicated Meas Event</a></td>-->
		
		<!-- <td><a href="../../logout">Logout</a></td> -->
	</tr>
</table>
</div>