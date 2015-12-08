jsonurl = null;  //"/SalesRegion/JSON-RPC";// context has to be passed
jsonrpc = null;
var jrecords = null;

function jsonLoad(contextPath){

 contextPath = contextPath+'/JSON-RPC';      
      jsonurl = contextPath;
    try {
      jsonrpc = new JSONRpcClient(jsonurl);
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
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
     //       alert('readyState : '+XMLHttpReq.readyState);
            if (XMLHttpReq.readyState == 4) 
            {
               clearTimeout(timer);               
               if (XMLHttpReq.status == 200) 
               {
                   callBackFunction(XMLHttpReq,idToChange);  
        
               }
            }     
         }     
         XMLHttpReq.send('');
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


function sendEmail(toName, emailAddress, emailSubject, emailComent,copyEmail,selfMail)
{
 // alert("Inside send email");
    emailSubject = emailSubject.replace(/<(.+?)>/g, "");
	//emailSubject = emailSubject.replace(/[\r|\n]+/g, "");
   
   	emailComent = emailComent.replace(/<(.+?)>/g, "");
	//emailComent = emailComent.replace(/[\r|\n]+/g, "");
	
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onSendEmail';
   
   parameters[i++]='referenceId';
   parameters[i++]=document.getElementById('referenceId').value;
   
   parameters[i++]='reqId';
   parameters[i++]=document.getElementById('reqId').value;
  
  
  /*parameters[i++]='emailFormatType';
   parameters[i++]=document.getElementById('emailFormatType').value;
  */
  
  parameters[i++]='toName';
   parameters[i++]=toName;
  
  
  parameters[i++]='emailAddress';
   parameters[i++]=emailAddress;
  
  
  parameters[i++]='emailSubject';
   parameters[i++]=escape(emailSubject);
  
  parameters[i++]='emailComent';
   parameters[i++]=escape(emailComent);
  
   parameters[i++]='copyEmail';
   parameters[i++]=copyEmail;
  
   parameters[i++]='selfMail';
   parameters[i++]=selfMail;
  
  // alert("calling.. busy..");
 //  document.getElementById('BusyDiv').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
//	alert("Before Response");
    var response = XMLHttpRequestSender('./requestDetailsDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','mailconf', displayPopupResults);

                            
//  alert("After Response"+response); 


}


function showRequestDetails()
{
  //alert("Inside Show Request Details");
   
   var refid=document.getElementById("referenceId").value;
		//alert ("here"+refid);
		
		if (refid == "")  {
		   alert("XXCSS_CT:650079 - Please select Reference ID and then click on either Go or Refresh button");
		   return;
		 }
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onDisplayDemoRequestDetails';
   parameters[i++]='referenceId';
   parameters[i++]=document.getElementById('referenceId').value;
   parameters[i++]='requestId';
   parameters[i++]=document.getElementById("reqId").value;
   
  
  // alert("calling.. busy..");
 //  document.getElementById('BusyDiv').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
//	alert("Before Response");
    var response = XMLHttpRequestSender('./requestDetailsDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','table', displayPopupResults);

                            
//  alert("After Response"+response); 


}

function displayPopupResults(req,idToChange) 
{
	//alert("id to change::"+idToChange);
   var result = req.responseText;

   document.getElementById(idToChange).innerHTML=result;

}

