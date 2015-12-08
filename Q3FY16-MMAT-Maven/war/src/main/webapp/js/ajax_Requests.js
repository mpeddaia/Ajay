function makeSortAjaxRequest(idToSortOn,idDivElement)
{
	alert('laskjdflkjdfld');
	var parameters= new Array();
	parameters[0]='idToSortOn';
	parameters[1]=idToSortOn;

	var response = XMLHttpRequestSender('./CAMapCorpRevTest.do',
										parameters,
										'true',
										'GET',
										'1000',
										'3',idDivElement, parseMessages);
}

function onSelectAjaxRequest(selNodeName,selView,srcNodeLevel,destNode)
{
	var parameters= new Array();
	parameters[0]='testParam';
	parameters[1]='onSelect';
	parameters[2]='selNodeName';
	parameters[3]=(document.getElementById(selNodeName).value);
	parameters[4]='selView';
	parameters[5]=(document.getElementById(selView).value);
	parameters[6]='srcNodeLevel';
	parameters[7]=srcNodeLevel;
	alert(destNode);
	var response = XMLHttpRequestSender('./CAMapCorpRevTest.do',
										parameters,
										'true',
										'GET',
										'1000',
										'3',destNode,populateDropDown);
	
}

function makePaginationAjaxRequest(idToSortOn,idDivElement,pageID,selectionID)
{
	if(pageID=='last')
	{
	var parameters= new Array();
	parameters[0]='idToSortOn';
	parameters[1]=idToSortOn;
	parameters[2]='pageID';
	parameters[3]=pageID;
	var response = XMLHttpRequestSender('./welcome123.do',
											parameters,
											'true',
											'GET',
											'1000',
											'3',idDivElement, parseMessages);
	}

	if(pageID=='first')
	{
	var parameters= new Array();
	parameters[0]='idToSortOn';
	parameters[1]=idToSortOn;
	parameters[2]='pageID';
	parameters[3]=pageID;
	var response = XMLHttpRequestSender('./welcome123.do',
											parameters,
											'true',
											'GET',
											'1000',
											'3',idDivElement, parseMessages);
	}

	if(selectionID)
	{
	var parameters= new Array();
	parameters[0]='idToSortOn';
	parameters[1]=idToSortOn;
	parameters[2]='pageID';
	parameters[3]=selectionID.value;
	var response = XMLHttpRequestSender('./welcome123.do',
											parameters,
											'true',
											'GET',
											'1000',
											'3',idDivElement, parseMessages);
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
				if (XMLHttpReq.readyState == 4) 
				{
					clearTimeout(timer);
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
					          callBackFunction(XMLHttpReq,idToChange);		         
			 		    }
					}
			XMLHttpReq.send(UrlParameters);
			}
		}
		
}


function parseMessages(req,idToChange) 
{
	var response = req.responseText;
	document.getElementById(idToChange).innerHTML=response;
}

function submitform(id)
{
	var myform=id;
    document.forms[myform].submit();
}

function populateDropDown(req, idToChange){
	alert('Testing the populateDropDown method');
	alert(req.responseText); 
	var nodes = req.responseXML.getElementsByTagName("node");
	selectObject = document.getElementById(idToChange);
	//alert('oldsize');
	//alert(selectObject.length);
	for (var j = 0; j < selectObject.length; j ++)
	{
		selectObject.remove(j);
	}
	//alert('newsize');
	//alert(selectObject.length);
	selectObject.options[0] = new Option("SelectOne","SelectOne");
	for (var i = 0; i < nodes.length; i ++)
	{
		var node = new Option(nodes[i].firstChild.nodeValue, nodes[i].firstChild.nodeValue);
		selectObject.options[i+1] = node;
	}
}






