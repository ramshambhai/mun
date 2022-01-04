<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:include page='header.jsp' />
<script>var autoFlag = false;</script> 
<link rel="stylesheet" type="text/css" href="../../resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="../../resources/css/index.css" />
<div class="wrapper">
<jsp:include page='nav.jsp' />
<div id="pageloadBox"></div>
<div id="container">
		<div id="topdiv" style="width: 100%;margin-bottom: 15px;">
			<div id="req_box">
			<table id="req_tab">
				<!--<tr>
					<td colspan="5">
						<label>PLMN Selection</label>
					</td>
				</tr>-->
				
			    <tr>
				<!--
					<td>
						<label id="countryLabel">Country</label>
						<select id="countrySelect"></select>
					</td>
					-->
					<td>
						<label id="allOperatorsLabel">List of Operators</label>
						<select id="allOperatorsSelect" multiple size="3">
						</select>
					</td>
					<td>
						<label id="allAntennaLabel">Antenna</label>
						<select id="addAllAntenna" multiple size="3">
						</select>
					</td>
					<td>
				       <input type="button" class="btn btn-default" id="findtheTechandCellId" onclick="getTechAndCellsFxn();" value="Show Cells" />
					</td>
					<td>
						<label id="TechAndCellsLabel">Cells</label>
						<select id="TechAndCellsSelect" multiple size="5" style=width:600px;>
						</select>
					</td>
					<td>
				       <input type="button" class="btn btn-default" id="generatePacket" value="GET SCANNED FILTERED CELLS" />
					</td>
					
					
					
					
					
				<!-- 	<td>
				     <a class="btn btn-default" href="operation.jsp">Close</a>
					</td>
				 -->	
				 
				 
				 
				</tr>
					<!--
					<td>
						<label id="plmnListLabel">PLMN List</label>
						<select id="plmnListSelect"></select>
					</td>
					
					<td>
						<label id="finalPlmnListLabel">Final PLMN List</label>
						<select id="finalPlmnListSelect"></select>
					</td>
					-->

				<!--<tr>
					<td colspan="5">
						<label>Scan Network</label>
					</td>
				</tr>
				<tr>			
					<td>
						<label>RSSI_THRESHOLD(dbm)</label>
						<input type="number" id="scan_rssi_threshold" name="scan_rssi_threshold" />
					</td>
					<td>
						<label>REPITITION_FREQ</label>
						<input type="number" id="scan_rep_freq" name="scan_rep_freq"/>
					</td>						
					<td>
						<label>Scan Duration</label>
						<input type="number" id="schedulerPeriodicity" class="input_type" name="periodicity"/>
					</td>
					<td>
						<button class="btn-match" id="startScan">Start Scan</button>
						<button class="btn-match" id="stopScan">Stop Scan</button>
					</td>
				</tr>	
				-->				



			</table>
			</div>
		</div>	
<div id="bottom_div" style="width:100%;height:100%;display:table;">
<div id="req_box_bottom" style="height:75%;overflow:auto;">
<div style="float: left;width: 50%;">
<table id="req_tab_bottom" border="1" style="text-align: center;min-width: 600px;"  border=1 style="margin: 0 auto 10px 10px;" class="table table-bordered">
			<thead id="req_tab_bottom_thead">
				<tr>
					<th style="text-align: center;" colspan="14">SCANNED FILTERED CELLS</th>					
				</tr>
			</thead>
			<tbody id="generatedPackets">				
			</tbody>
		</table>
		<img  id ="loading_screen" style="display: none; margin-left:15%" src="../../resources/images/Loading_icon.gif"/> 
		</div>
		<!--<label style="float: right;">Repitition Frequency</label>
		<input type="number" id="frequency" style="width: 100px;height: 20px;float: right;" />
		<label style="float: right;">Total Duration</label>
		<input type="number" id="duration" style="width: 100px;;height: 20px;float: right;" />
		<input class="btn btn-default" type="button" id="start" value="Start" style="float: right;" />
		<input class="btn btn-default" type="button" id="stop" value="Stop" style="float: right;" />-->
		<div id="bottom_right_div" style="float: right;width: 22%;">
		<table  class="table table-bordered">
		<thead id="operations_table_thead">
		<tr>
		<th colspan="2">
		Operations
		</th>
		</tr>
		</thead>
		<tbody id="operations_table_tbody" style="display: none;">
		<tr>
		<th>
		<label>No. of repetition</label>
		</th>
		<th>
		<input type="number" id="frequency" style="width: 100px;height: 20px;" value="1" />
		</th>
		</tr>
		<tr>
		<th>
		<label>Cell Active Time<span class="timeUnitClass">(sec)</span></label>
		</th>
		<th>
		<input type="number" id="duration" style="width: 100px;height: 20px;" value="60"  max ="900" min ="30"/>
		</th>
		</tr>
		<!--<label>Total Duration</label>
		<input type="number" id="duration" style="width: 100px;;height: 20px;" />-->
		<tr>
		<th colspan="2">
		<input class="btn btn-default" type="button" id="startConfig" value="Start" />
		<input class="btn btn-default" type="button" id="stopConfig" value="Stop" />
		</th>
		</tr>
		</tbody>
		</table>
		</div>
</div>
</div>	
	</div>
	
		<div class="modal fade" id="showNeighbours" role="dialog" aria-labelledby="myModalLabel" style="width:1360px !important;">
		<div class="modal-dialog" style="width: 1240px !important;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="showNeighbourslLabel">NEIGHBOURS</h4>
				</div>
				<div class="modal-body">
				<div id="showNeighboursDiv" >			 
				<table border=1 style="margin: 0 auto 10px 10px;" class="table table-bordered">
				<thead>
				<tr>
				<td><label>SNo.</label></td>
				<td><label>TECH</label></td>
				<td><label>PLMN</label></td>
			    <td><label>LAC</label></td>	
			    <td><label>CELL</label></td>	
			    <td><label>ARFCN</label></td>
				<td><label>UARFCN</label></td>				
			    <td><label>BSIC</label></td>	
				<td><label>PSC</label></td>				
			    <td><label>RSSI</label></td>
				</tr>
				</thead>
				<tbody id="neighbourTableTbody">
			   </tbody>
				</table>
				</div>
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div><!-- modal-content -->
		</div><!-- modal-dialog -->
	</div><!-- modal -->
<% String ip= "'"+request.getServerName()+"'"; %>
<script>
var ipAddress =<%= ip %>;
</script>
 	<script type="text/javascript" src="../../resources/js/configupdate.js"></script>
 	<style>
 		#container
 		{
 			height:93%;
 		}
 		
 		.timeUnitClass{
 			font-weight: 200;
 		}

 		.input_type
 		{
 			width: 116px;
    		margin-left: 3px;
    		border: 1px solid #3a5795;
    		border-radius: 2px;
		}
		
		#bottomTable
		{
			width: 80%;
    margin: 0 auto;
    padding: 10px;
    background: white;
    border: 4px solid #3a5795;
    border-radius: 8px;
		}
		#bottomTable td
		{
			width:50%;
		}
		
				#req_box
 		{
 			font-size: 16px;
		    font-weight: 500;
		    margin: 0 auto;
		    border: 1px solid #3a5795;
		    border-radius: 10px;
		    padding: 15px;
		    width:1330px;
		    background-color: rgba(255, 255, 255, 0.69);
 		}
 		#req_box select
 		{
 			width:150px;
 		}
 		#req_box td
 		{
 			padding:5px;
 		}
		 #req_box_bottom
 		{
 			font-size: 16px;
		    font-weight: 500;
			margin: 0 auto;
		    border: 1px solid #3a5795;
		    border-radius: 10px;
		    padding: 25px;
		    width:1330px;
			height:400px;
		    background-color: rgba(255, 255, 255, 0.69);
 		}
		
		#map_div {
			    
			    width: 100%;
			    height: 466px;
			    border: 3px solid #3a5795;
			    border-radius: 5px;
			}
			
		#loadingBox
 		{
 			font-size: 16px;
		    font-weight: 500;
		    margin: 0 auto;
		    border: 5px solid #3a5795;
		    border-radius: 9px;
		    padding: 30px;
		    width: 453px;
		    background-color: rgba(255, 255, 255, 0.69);
 		}
 		#opr_buttons button{font-size:10px;}
 		#opr_buttons_2 button{font-size:10px;}
		
		.operationButton{
		 background-color: #3a5795;
		color: white;
		border-radius: 5px;
		padding: 4px;
		margin-right: 3px;
		margin-left: 3px;
		border-color: #4365af;
		}
		body{
		overflow: hidden;
		}
		.table-tailored{
			margin: 0 auto 10px 10px;
			background: #FFF;
			border: 1px solid #ddd;
			margin-bottom: 20px;
			border-spacing: 0;
			border-collapse: collapse;
		}
		.table-tailored thead
		{
			background: #99ccfe;
			color: white;
		}
		
		.table-tailored tr ,.table-tailored th
		{
			font-size: 16px;
			font-weight: 500;
			padding: 0.5px;
			vertical-align: middle;
			border-bottom-width: 0;
			border-top: 1px solid #CCC5B9;
			border: 1px solid #ddd;
			line-height: 1.42857143;
		}
		.table-tailored  thead
		{
			font-size: 20px;
			font-weight: 900;
			padding: 0.5px;
			vertical-align: middle;
			border-bottom-width: 0;
			border-top: 1px solid #CCC5B9;
			border: 1px solid #ddd;
			line-height: 0.42857143;
		}
		.table-tailored td{
			padding: 1px;
		}
		th 
		{
		text-align: left;
		}
		.table-tailored > tbody > tr 
		{
			position: relative;
		}
		
		.showNeighbourClass
		{
			font-size: 12px;
			margin-top: -7px;
		 }
		/* .highlightPacket
		 {
			border: 3px solid #3b10e8;
		 }*/
		 .highlightPacket td:nth-child(2){
			font-weight: Override;
		 }
		<%= session.getAttribute("themeCss")%>
 	</style>	
</body>
</html>
