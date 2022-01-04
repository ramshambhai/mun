        var serverData = [];
        $(document).ready(function () {
            $("#jqGrid").
            jqGrid({
               // url: '../resources/test.json',
                //mtype: "GET",
                datatype: "jsonstring",
                datastr: serverData,
               // loadonce:true,
                colModel: 
                [
             			{ label: 'Id', name: 'id', width: 75,search: false,hidden:true },       
             			//{ label: 'S-Type', name: 'stype', width: 150,search: true },
    					{ label: 'OPR Name', name: 'name', width: 150,search: true },
    					{ label: 'OPR Loc', name: 'loc', width: 150,search: true },    					
    					{ label: 'IP', name: 'ip', width: 150,search: true },
    					{ label: 'count', name: 'count', width: 150,search: true },
    					{ label: 'Power', name: 'power', width: 150,search: true },
                        { label: 'Freq', name: 'freq', width: 150,search: true },
                        { label: 'A-Angle', name: 'aangle', width: 150,search: true },
                        { label: 'T-Stmp', name: 'tstmp', width: 150,search: true },
                        { label: 'Lat-Lon', name: 'latlon', width: 150,search: true },
                        { label: 'A-Type', name: 'atype', width: 150,search: true },
    					{ label: 'A-Gain', name: 'again', width: 150,search: true },
    					{ label: 'A-Height', name: 'aheight', width: 150,search: true },
    					{ label: 'A-elevation', name: 'aelevation', width: 150,search: true },
    					{ label: 'A-Direction', name: 'adirection', width: 150,search: true },
                        { label: 'Log Time', name: 'logtime', width: 150,search: true }
                    
                ],
				viewrecords: true,
                width: 1300,				
                height: 250,
                rowNum: 20,
                pager: "#jqGridPager"
            });
            jQuery("#jqGrid").jqGrid('navGrid','#jqGridPager',{edit:false,add:false,del:false,refresh:false});
            registerEvents();
        });
        var registerEvents = function()
        {
        	
        	$("#downloadReport").click(function(){
        		getDataExcelExport();
        	});
        	$("#get_cdr_data").click(function(){
        		if($("#startTime").val() == null || $("#startTime").val() == "")
            	{
            		alert("Please Fill the Start Date");
            		return;
            	}
            	if($("#endTime").val() == null || $("#endTime").val() == "")
            	{
            		alert("Please Fill the End Date");
            		return;
            	}
        		$.ajax({
        			url:"../Operations",
        			//url:"../resources/test.json",
        			data:{"methodName":"getwidsReportData","startTime":toUtcTime($("#startTime").val()),"endTime":toUtcTime($("#endTime").val())},
        			type:"post",
        			success:function(cdrData)
        			{
        				serverData = JSON.parse(cdrData);
        				
        				if(serverData[0].result != undefined && serverData[0].result == "fail")
        				{
        					alert("Limit Exceed Please try Short time span");
        				}
        				else
        				{	
        					$("#jqGrid").jqGrid('setGridParam', {
            			        datatype: 'local',
            			        data: serverData
            			    });
            				$("#jqGrid").trigger("reloadGrid");
        				}
        				
        				
        			}
        		});
        	});
        }        
        
        
        var getDataExcelExport = function()
        {
                    	if(serverData.length <=0){alert("Please generate report first!!");return false;}
        				var reportNameString="WIDS Operations Report";
              			
        					var colArray=[];
                    		var exportColumnName = getColumnsData();
                    	 //for( var i=0; i<exportColumnName.length ; i++)
                    		 for( var i in exportColumnName)
                    	 {
                    			colData={};
                    		
                    			colData.headertext=i;
                    			colData.datatype="string";
                    			colData.datafield=exportColumnName[i];
                                //colData.width= "100px" ;
                    			colData.ishidden= "false"; 
                    			colArray.push(colData);	
                    	 }
        				 console.log(colArray);
                    	 
                    		var headerText = '<br>'+reportNameString+'<br><br>Generated Time: ' + new Date()+'<br><br>';    
                    		var header = headerText.bold();		
                    		$("#btn_dataExport").battatech_excelexport({
                    						containerid: "btn_dataExport"
                    						, datatype: 'json'
                    						, dataset: serverData
                    						, columns: colArray
                    						, reportName:header 
                    					});	
        }
        
        function getColumnsData()
        {
        	
        	var collnames={};
    		collnames['Opr Name']='name';
    		collnames['Loc']='loc';        		        		
    		collnames['IP']='ip';        		
    		collnames['Count']='count';
    	    collnames['Power']='power';        	    
    		collnames['Freq']='freq';
    		collnames['Angle']='aangle';
    		collnames['T-Stmp']='tstmp';
    		collnames['Lat-Lon']='latlon';
    		//collnames['Lon']='lon';
    		collnames['A-Type']='atype';
    		collnames['A-Gain']='again';
    		collnames['A-Height']='aheight';
    		collnames['A-Elevation']='aelevation';
    		collnames['A-Direction']='adirection';
    		collnames['Logtime']='logtime';      	    
    		
        	return collnames;
        }
