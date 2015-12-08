//--inputs 
//--Array, var, var.
var actionType ='FALSE';
function buildAjaxRequest (actionParameters , idDivElement, url) {
//parameters is an array here.
var parameters =  actionParameters;
//alert(actionParameters);
if(url == 'oppAdvSearch.do') {
	actionType = 'TRUE';
}
var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'POST',
									'1000000',
									'3',
									idDivElement, 
									parseMessagesAndChangeActionDropDown); //callback function added by Rasika TD# 74508
									
document.getElementById(idDivElement).innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3"></font></td></tr></table>'; 
}


function makeAjaxRequest (actionParameters ,idDivElement, url) {

var parameters =  new Array();
parameters[0]='method';
parameters[1]=actionParameters;

var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'GET',
									'100000',
									'3',
									idDivElement, 
									parseMessages);
									
document.getElementById(idDivElement).innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3"></font></td></tr></table>'; 
}


function onViewSelectAjaxRequest(selView)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onViewSelect';
	parameters[4]='selView';
	parameters[5]=(document.getElementById(selView).value);

	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'100000',
										'3',divId, parseMessages);
}


function onSelectAjaxRequest(selNodeName,selView,srcNodeLevel,destNode)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onSelectNode';
	parameters[2]='selNodeName';
	parameters[3]=(document.getElementById(selNodeName).value);
	parameters[4]='selView';
	parameters[5]=(document.getElementById(selView).value);
	parameters[6]='srcNodeLevel';
	parameters[7]=srcNodeLevel;
	var destNodeLevel = ++srcNodeLevel;
	var response = XMLHttpReqSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'100000',
										'3',destNode,populateDropDowns,destNodeLevel);
	
	
}
function onPopUpSelectAjaxRequest(selNodeName,selView,srcNodeLevel,destNode)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onSelectNode';
	parameters[2]='selNodeName';
	parameters[3]=(document.getElementById(selNodeName).value);
	parameters[4]='selView';
	parameters[5]=selView;
	parameters[6]='srcNodeLevel';
	parameters[7]=srcNodeLevel;
	var destNodeLevel = ++srcNodeLevel;
	var response = XMLHttpReqSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'100000',
										'3',destNode,populateDropDowns,destNodeLevel);
}


function onSetFiltersAjaxRequest(view,superTheater,theater,consolidation,area,operation,salesRegion,MappingStatus,HierarchyStatus,divId)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onSetFilters';
	parameters[2]='view';
	parameters[3]=document.getElementById(view).value;
	parameters[4]='superTheater';
	parameters[5]=document.getElementById(superTheater).value;
	parameters[6]='theater';
	parameters[7]=document.getElementById(theater).value;
	parameters[8]='consolidation';
	parameters[9]=document.getElementById(consolidation).value;
	parameters[10]='area';
	parameters[11]=document.getElementById(area).value;
	parameters[12]='operation';
	parameters[13]=document.getElementById(operation).value;
	parameters[14]='salesRegion';
	parameters[15]=document.getElementById(salesRegion).value;
	parameters[16]='MappingStatus';
	parameters[17]=document.getElementById(MappingStatus).value;
	parameters[18]='HierarchyStatus';
	parameters[19]=document.getElementById(HierarchyStatus).value;
	
	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'1000000',
										'3',divId, parseMessages);
	
}
function onPopUpSetFiltersAjaxRequest(action,selView,superTheater,theater,consolidation,area,operation,divId)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onPopUpSetFilters';
	parameters[2]='selView';
	parameters[3]=selView;
	parameters[4]='superTheater';
	parameters[5]=document.getElementById(superTheater).value;
	parameters[6]='theater';
	parameters[7]=document.getElementById(theater).value;
	parameters[8]='consolidation';
	parameters[9]=document.getElementById(consolidation).value;
	parameters[10]='area';
	parameters[11]=document.getElementById(area).value;
	parameters[12]='operation';
	parameters[13]=document.getElementById(operation).value;
	parameters[14]='action';
	parameters[15]=action;
	
	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'1000000',
										'3',divId, parseMessages);
	
}

function onSortAjaxRequest(view,selNodeName,MappingStatus,HierarchyStatus,sortColumn,divId)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onSortColumn';
	parameters[2]='view';
	parameters[3]= view;
	parameters[4]='selNodeName';
	parameters[5]= selNodeName;
	parameters[6]='MappingStatus';
	parameters[7]= MappingStatus;
	parameters[8]='HierarchyStatus';
	parameters[9]= HierarchyStatus;
	parameters[10]='sortColumn';
	parameters[11]=sortColumn;
	
	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'1000000',
										'3',divId, parseMessages);
	
}

function onPaginationAjaxRequest(view,selNodeName,MappingStatus,HierarchyStatus,pageNum,divId)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onPagination';
	parameters[2]='view';
	parameters[3]= view;
	parameters[4]='selNodeName';
	parameters[5]= selNodeName;
	parameters[6]='MappingStatus';
	parameters[7]= MappingStatus;
	parameters[8]='HierarchyStatus';
	parameters[9]= HierarchyStatus;
	parameters[10]='pageNum';
	parameters[11]= document.getElementById(pageNum).value;
	
	
	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'1000000',
										'3',divId, parseMessages);
	
}
function onPageAjaxRequest(view,selNodeName,MappingStatus,HierarchyStatus,pageNum,divId)
{
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onPagination';
	parameters[2]='view';
	parameters[3]=view;
	parameters[4]='selNodeName';
	parameters[5]= selNodeName;
	parameters[6]='MappingStatus';
	parameters[7]=MappingStatus;
	parameters[8]='HierarchyStatus';
	parameters[9]=HierarchyStatus;
	parameters[10]='pageNum';
	parameters[11]=pageNum;
	
	
	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'1000000',
										'3',divId, parseMessages);
	
}
function submitMapping(view,superTheater,theater,consolidation,area,operation,salesRegion)
{
	alert('submitting the new Assignment');
	var parameters= new Array();
	parameters[0]='mapParam';
	parameters[1]='onSaveMapping';
	parameters[2]='view';
	parameters[3]=view;
	parameters[4]='superTheater';
	parameters[5]=document.getElementById(superTheater).value;
	parameters[6]='theater';
	parameters[7]=document.getElementById(theater).value;
	parameters[8]='consolidation';
	parameters[9]=document.getElementById(consolidation).value;
	parameters[10]='area';
	parameters[11]=document.getElementById(area).value;
	parameters[12]='operation';
	parameters[13]=document.getElementById(operation).value;
	parameters[14]='salesRegion';
	parameters[15]=document.getElementById(salesRegion).value;
	parameters[16]='userID';
	parameters[17]=document.getElementById(userID).value;
	parameters[18]='startDate';
	parameters[19]=document.getElementById(startDate).value;
	parameters[20]='endDate';
	parameters[21]=document.getElementById(endDate).value;

	alert(parameters);
	var response = XMLHttpRequestSender('./CAMapCorpRevAction.do',
										parameters,
										'true',
										'GET',
										'1000000',
										'3',divId, parseMessages);
	
}

function submitAssignment()
{
    document.caMapCorpRev.submit();
}

function setFilterClassfn(method,theater) {
var parameters =  new Array();
parameters[0] = 'command';
parameters[1] = method;
parameters[2] = 'superTheater'
parameters[3]= theater; 

var response = XMLHttpRequestSenderOppt('./renContract.do',
											parameters,
											'true',
											'GET',
											'10000000',
											'3',postProcessUpdate,'out');
//		alert(" Ajax call sent"+parameters.toString());
		var contProcessDivObj = document.getElementById('reassignProcessDiv');
    	contProcessDivObj.innerHTML = '<table width="100%"><tr><td valign="middle" align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">Processing..</td></tr></table>';
}
//Arguments for this function are 
//--------URL to send request
//--------parameters - An array of name value pairs (Look at the example above to create the array of parameters).
//--------Encode - a boolean. Pass either true or false. 
//--------requestType - GET or POST (used only for XMLHttpRequest)
//--------timeOut - spcify time in milliseconds (used only for XMLHttpRequest)
//--------maxResults - ask Praveen/Mahesh
//--------idToChange - The DOM element id that needs to be replaced. 
//--------callBackFunction - Pass a reference to the function that needs to parse the response.

function XMLHttpRequestSender()
{
		var serverResponse,url,URL,Encode,requestType,timeOut,maxResults,idToChange;
		var timer,UrlParameters="";
		var i,j=0,k=1,x=0,y=0,m;
		var Names = new Array();
		var Values = new Array();
		var Parameters = new Array();	
		URL = arguments[0];
		Parameters = arguments[1];
		Encode = arguments[2];
		requestType = arguments[3];
		timeOut = arguments[4];
		maxResults = arguments[5];
		idToChange = arguments[6];
		callBackFunction = arguments[7];
		
		var XMLHttpReq = createXMLHttpReq();
		
		function createXMLHttpReq()
		{
			try { 
				return new ActiveXObject("Msxml2.XMLHTTP");
			}catch (e) {}
			try { 
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch (e) {}
			try {
				return new XMLHttpRequest();
			}catch (e) {}	
		}
		if(Encode = "true")
		{	
			for(i=0; i < Parameters.length/2; i++)
			{
				if(j+i < Parameters.length)
				{			
					Names[x++] = escape(Parameters[j+i]);
					j++;		
				}
				if(k+i < Parameters.length)
				{			
					Values[y++] = escape(Parameters[k+i]);	
					k++;		
				}
			}
			for(m in Names)
			{
				UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"&";		
			}
			
		}
		else
		{
			for(i in Parameters)
			{
				if(j+i < Parameters.length){
					Names[x++] = Parameters[j+i];
					j++;				
				}
				if(k+i < Parameters.length){			
					Values[y++] = Parameters[k+i];
					k++;							
				}	
			}

			for(m in Names)
			{
				UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"\&";		
			}		

		}

		if( requestType == "GET")
		{
			url = URL+"?"+UrlParameters;
			XMLHttpReq.open("GET",url,true);
			timer = setTimeout( function() {
					XMLHttpReq.abort();
					 },timeOut);		
			XMLHttpReq.onreadystatechange = function()
			{
//			alert(" reposnse state=>"+XMLHttpReq.readyState);
				if (XMLHttpReq.readyState == 4) 
				{
					clearTimeout(timer);
//					alert(" reposnse status=>"+XMLHttpReq.status);
	    			if (XMLHttpReq.status == 200) 
	    			{
					    callBackFunction(XMLHttpReq,idToChange);		         
			 		}
				}		
			}		
			XMLHttpReq.send(null);
		}

		else if( requestType == "POST")
		{
//	  			alert('requestType is POST');
//	  			alert('url==>'+ UrlParameters);
	  			url = URL;	
	  			XMLHttpReq.open("POST",url,true);
	  			XMLHttpReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	  			
	  			timer = setTimeout( function() {
	  					XMLHttpReq.abort();
	  					 },timeOut);
	  			XMLHttpReq.onreadystatechange = function()
	  			{
//	  				alert("state "+XMLHttpReq.readyState+" status "+XMLHttpReq.status);
	  				
	  				if (XMLHttpReq.readyState == 4) 
	  					{
	  					//alert('response: ' + XMLHttpReq.responseText);
	  						clearTimeout(timer);
	  						
	      					if (XMLHttpReq.status == 200) 
	      					{
	      						//alert("Success");
	  				          	callBackFunction(XMLHttpReq,idToChange);		         
	  			 		    }
	  					}
	  			}
	  		XMLHttpReq.send(UrlParameters);
		}
		
}


function parseMessages(req,idToChange) 
{
	var response = req.responseText;
	document.getElementById(idToChange).innerHTML=response;
}
//---- callback function added by Rasika TD# 74508
function parseMessagesAndChangeActionDropDown(req,idToChange) 
{
//    alert(" New Result Size =>I am here");
	var response = req.responseText;
	document.getElementById(idToChange).innerHTML=response;
	if(actionType == 'FALSE' ) {
		var size1 = document.result_manager.OppResultSize;
		if(size1.value == 0) {
	//		alert("Valusis ==>"+size1.value);
			selectObject = document.getElementById("selectName");
			selectObject.disabled = true;
			document.getElementById("goButton").disabled = true;
		}
		else {
	//		alert(size1.value);
			selectObject = document.getElementById("selectName");
			selectObject.disabled = false;
			document.getElementById("goButton").disabled = false;
		}
	}	
}

function submitform(id)
{
	var myform=id;
    document.forms[myform].submit();
}

function populateDropDown(req, idToChange){
	var nodes = req.responseXML.getElementsByTagName("node");
	selectObject = document.getElementById(idToChange);
	for (var j = 0; j < selectObject.length; j ++)
	{
		selectObject.remove(j);
	}
	selectObject.options[0] = new Option("SelectOne","SelectOne");
	for (var i = 0; i < nodes.length; i ++)
	{
		var node = new Option(nodes[i].firstChild.nodeValue, nodes[i].firstChild.nodeValue);
		selectObject.options[i+1] = node;
	}
}
//Arguments for this function are 
//--------URL to send request
//--------parameters - An array of name value pairs (Look at the example above to create the array of parameters).
//--------Encode - a boolean. Pass either true or false. 
//--------requestType - GET or POST (used only for XMLHttpRequest)
//--------timeOut - spcify time in milliseconds (used only for XMLHttpRequest)
//--------maxResults - ask Praveen/Mahesh
//--------idToChange - The DOM element id that needs to be replaced. 
//--------callBackFunction - Pass a reference to the function that needs to parse the response.

function XMLHttpReqSender()
{
		var serverResponse,url,URL,Encode,requestType,timeOut,maxResults,idToChange;
		var timer,UrlParameters="";
		var i,j=0,k=1,x=0,y=0,m;
		var Names = new Array();
		var Values = new Array();
		var Parameters = new Array();	
		URL = arguments[0];
		Parameters = arguments[1];
		Encode = arguments[2];
		requestType = arguments[3];
		timeOut = arguments[4];
		maxResults = arguments[5];
		idToChange = arguments[6];
		callBackFunction = arguments[7];
		destNodeLevel = arguments[8];
		var XMLHttpReq = createXMLHttpReq();
		
		function createXMLHttpReq()
		{
			try { 
				return new ActiveXObject("Msxml2.XMLHTTP");
			}catch (e) {}
			try { 
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch (e) {}
			try {
				return new XMLHttpRequest();
			}catch (e) {}	
		}
		if(Encode = "true")
		{	
			for(i=0; i < Parameters.length/2; i++)
			{
				if(j+i < Parameters.length)
				{			
					Names[x++] = escape(Parameters[j+i]);
					j++;		
				}
				if(k+i < Parameters.length)
				{			
					Values[y++] = escape(Parameters[k+i]);	
					k++;		
				}
			}
			for(m in Names)
			{
				UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"&";		
			}
			
		}
		else
		{
			for(i in Parameters)
			{
				if(j+i < Parameters.length){
					Names[x++] = Parameters[j+i];
					j++;				
				}
				if(k+i < Parameters.length){			
					Values[y++] = Parameters[k+i];
					k++;							
				}	
			}

			for(m in Names)
			{
				UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"\&";		
			}		

		}

		if( requestType == "GET")
		{
			url = URL+"?"+UrlParameters;
			XMLHttpReq.open("GET",url,true);
			timer = setTimeout( function() {
					XMLHttpReq.abort();
					 },timeOut);		
			XMLHttpReq.onreadystatechange = function()
			{
				if (XMLHttpReq.readyState == 4) 
				{
					clearTimeout(timer);
	    			if (XMLHttpReq.status == 200) 
	    			{
					    callBackFunction(XMLHttpReq,destNodeLevel,idToChange);		         
			 		}
				}		
			}		
			XMLHttpReq.send(null);
		}

		else if( requestType == "POST")
		{
			url = URL;	
			XMLHttpReq.open("POST",url,true);
			XMLHttpReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			
			timer = setTimeout( function() {
					XMLHttpReq.abort();
					 },timeOut);
			XMLHttpReq.onreadystatechange = function()
			{
					if (XMLHttpReq.readyState == 4) 
					{
						clearTimeout(timer);
	    				if (XMLHttpReq.status == 200) 
	    				{
					          callBackFunction(XMLHttpReq,destNodeLevel,idToChange);		         
			 		    }
					}
			XMLHttpReq.send(UrlParameters);
			}
		}
		
}

function populateDropDowns(req, destNodeLevel,idToChange){
	var nodes = req.responseXML.getElementsByTagName("node");
	selectObject = document.getElementById(idToChange);
	for (var j = 0; j < selectObject.length; j ++)
	{
		selectObject.remove(j);
	}
	
	selectObject.options[0] = new Option("SelectOne","SelectOne");
	for (var i = 0; i < nodes.length; i ++)
	{
		var node = new Option(nodes[i].firstChild.nodeValue, nodes[i].firstChild.nodeValue);
		selectObject.options[i+1] = node;
	}
	var x = ++destNodeLevel;
	for(k = x; k<7; k++){
		if(k == 3){
			selectObject = document.getElementById("consolidation");
			selectObject.options.length = 0;
			selectObject.options[0] = new Option("SelectOne","SelectOne");
		}
		if(k == 4){
			selectObject = document.getElementById("area");
			selectObject.options.length = 0;
			selectObject.options[0] = new Option("SelectOne","SelectOne");
		}
		if(k == 5){
			selectObject = document.getElementById("operation");
			selectObject.options.length = 0;
			selectObject.options[0] = new Option("SelectOne","SelectOne");
		} 
		if(k == 6){
			selectObject = document.getElementById("salesRegion");
			selectObject.options.length = 0;
			selectObject.options[0] = new Option("SelectOne","SelectOne");
		}  
	}
}






