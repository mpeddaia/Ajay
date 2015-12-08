	//Function to make sort ajax request call. The idToSortOn is the request parameter
//name that will be in turn sent to the XMLHttpRequestSender function, which 
//makes the actual call. 
//-------idToSortOn - The column id to sort on . It needs to be sent from the view
//-------idDivElement - Any DOM element or div element that needs to be displayed or replaced.
//-------url - url to which the ajax request has to be send. 
function makeSortAjaxRequest(idToSortOn,idDivElement, url){
//alert(idToSortOn);
var temp = idToSortOn.split(',');
//alert(temp.length);
var parameters= new Array();
parameters[0]='idToSortOn';
parameters[1]=temp[0];
//alert('----->idToSortOn-->'+idToSortOn);
if( temp.length > 1) {
	parameters[2]='rwFlag';
	parameters[3]=temp[1];
	parameters[4]='AdvSearchFlag';
	parameters[5]=temp[2];
	//alert(parameters.toString());
}

var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'POST',
									'100000',
									'3',
									idDivElement, 
									parseMessages);
}


//Function to make pagination ajax request call. The pageID is the request parameter
//name that will be in turn sent to the XMLHttpRequestSender function, which 
//makes the actual call. 
//-------pageID - Is the page the user has to go to. This is divided into 
//		 pageID='last'  (Puts 'last' as the value for request parameter pageID)
//		 pageID='first' (Puts 'first' as the value for request parameter pageID)
//		 pageID='next'  (Puts 'next' as the value for request parameter pageID)
//		 pageID='previous'  (Puts 'previous' as the value for request parameter pageID)
//		 pageID=selectionID.value  (Puts the actual page value (extracting it from the select tag )as the value for request parameter pageID)
//-------idDivElement - Any DOM element or div element that needs to be displayed or replaced.
//-------selectionID - The select tag DOM object which takes the user to a specific page
//-------url - url to which the ajax request has to be send. 

function makePaginationAjaxRequest(pageID,idDivElement,selectionID, url){

//document.getElementById(idDivElement).innerHTML='Wait ra nee ayya';

if(pageID=='last'){
var parameters= new Array();
parameters[0]='pageID';
parameters[1]=pageID;
var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'GET',
									'1000000',
									'3',
									idDivElement, 
									parseMessages);

}

if(pageID=='first'){
var parameters= new Array();
parameters[0]='pageID';
parameters[1]=pageID;
var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'GET',
									'1000',
									'3',
									idDivElement, 
									parseMessages);

}

if(pageID=='next'){
var parameters= new Array();
parameters[0]='pageID';
parameters[1]=pageID;
var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'GET',
									'1000',
									'3',
									idDivElement, 
									parseMessages);

}

if(pageID=='previous'){
var parameters= new Array();
parameters[0]='pageID';
parameters[1]=pageID;
var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'GET',
									'1000',
									'3',
									idDivElement, 
									parseMessages);

}

if(selectionID){
var parameters= new Array();
parameters[0]='pageID';
parameters[1]=selectionID.value;

var response = XMLHttpRequestSender(url,
									parameters,
									'true',
									'GET',
									'1000000',
									'3',
									idDivElement, 
									parseMessages);
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
		
		function createXMLHttpReq(){
		
		try { return new ActiveXObject("Msxml2.XMLHTTP");}
			catch (e) {}
		try { return new ActiveXObject("Microsoft.XMLHTTP");}
			catch (e) {}
		try { return new XMLHttpRequest();}
			catch (e) {}	
	
		}

		if(Encode = "true"){	
			for(i=0; i < Parameters.length/2; i++){
				if(j+i < Parameters.length){			
					Names[x++] = escape(Parameters[j+i]);
					j++;		
				}
				if(k+i < Parameters.length){			
					Values[y++] = escape(Parameters[k+i]);	
					k++;		
				}
			}
			for(m in Names){
				UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"&";		
			}
			
		}
		else{

			for(i in Parameters){
				if(j+i < Parameters.length){
					Names[x++] = Parameters[j+i];
					j++;				
				}
				if(k+i < Parameters.length){			
					Values[y++] = Parameters[k+i];
					k++;							
				}	
			}

			for(m in Names){
				UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"\&";		
			}		

		}


		
		if( requestType == "GET"){
			url = URL+"?"+UrlParameters;
			XMLHttpReq.open("GET",url,true);
			

			timer = setTimeout( function() {
					XMLHttpReq.abort();
					 },timeOut);		
					 
				loadingMeassage(idToChange);	 
				XMLHttpReq.onreadystatechange = function()
				{
					//alert('onreadystate Change');
			
					if (XMLHttpReq.readyState == 4) 
					{
						//alert('Complete');
						clearTimeout(timer);
					
	    				if (XMLHttpReq.status == 200) 
	    				{
    						//alert('Before submitting');
    						callBackFunction(XMLHttpReq,idToChange);	
    						         
		 			    }
		 		    	
					}		
				}		
			XMLHttpReq.send(null);
		}

		else if( requestType == "POST")
		{
		//alert('in post');
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
			}
		XMLHttpReq.send(UrlParameters);
	}
}

function parseMessages(req,idToChange) {
	//alert('inside alert');
	var response = req.responseText;
	document.getElementById(idToChange).innerHTML=response;
}
function loadingMeassage(idToChange) {
	var response = "<table width='10%' border='0' bgcolor='#FF0000'> <tr> <td><font color='#FFFFFF'>Loading...</font></td> </tr></table>";
	document.getElementById(idToChange).innerHTML=response;
}


// The var docForm should be a reference to a <form>

function formData2QueryString(docForm) {

  var submitContent = '';
  var formElem;
  var lastElemName = '';
  
  for (i = 0; i < docForm.elements.length; i++) {
    
    formElem = docForm.elements[i];
    switch (formElem.type) {
      // Text fields, hidden form elements
      case 'text':
      case 'hidden':
      case 'password':
      case 'textarea':
      case 'select-one':
        submitContent += formElem.name + '=' + escape(formElem.value) + '&'
        break;
        
      // Radio buttons
      case 'radio':
        if (formElem.checked) {
          submitContent += formElem.name + '=' + escape(formElem.value) + '&'
        }
        break;
        
      // Checkboxes
      case 'checkbox':
        if (formElem.checked) {
          // Continuing multiple, same-name checkboxes
          if (formElem.name == lastElemName) {
            // Strip of end ampersand if there is one
            if (submitContent.lastIndexOf('&') == submitContent.length-1) {
              submitContent = submitContent.substr(0, submitContent.length - 1);
            }
            // Append value as comma-delimited string
            submitContent += ',' + escape(formElem.value);
          }
          else {
            submitContent += formElem.name + '=' + escape(formElem.value);
          }
          submitContent += '&';
          lastElemName = formElem.name;
        }
        break;
        
    }
  }
  // Remove trailing separator
  submitContent = submitContent.substr(0, submitContent.length - 1);
  return submitContent;
}




