//jsonurl = "/Contract/JSON-RPC"; // context has to be passed
//jsonrpc = null;
//var jrecords = null;

/*function jsonLoad(contextPath){

 contextPath = contextPath+'/JSON-RPC';      
      jsonurl = contextPath;
      alert(jsonurl);
    try {
      jsonrpc = new JSONRpcClient(jsonurl);
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}

function getContractStatus()
{
alert("IN GET cONTRACT sTATUS");
 jrecords=jsonrpc.handler.getContractStatus();   
   alert('List : '+jrecords["list"]);
   if(jrecords != null ||jrecords["list"] != null){
      for(i=0; i<jrecords["list"].length; i++){
         alert('Adding '+ jrecords["list"][i].statusCode+' to dropdown : ');
         //superTheater.options[i+1]= new Option(jrecords["list"][i].nodeName, jrecords["list"][i].nodeName);
      }
   }

}
*/

//Search Results Page values...

function getContractSearchValues(pageNo, sortId, procid,sortOrder,prevSortId,callingfrom)
{
//alert('inside showData'+' with sortId : '+sortId+'Page no::'+pageNo);

   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
     
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='getContractSearchFilterList';
    if(document.getElementById('strWithincontext').value!=null)
   {  
   		parameters[i++]='strWithincontext';
   		parameters[i++]=document.getElementById('strWithincontext').value;
   	}
   if(document.getElementById('strContext').value !=null)
   {
   		parameters[i++]='strContext';
   		parameters[i++]=document.getElementById('strContext').value;
   	}
   if(document.getElementById('strContextValue').value !=null)
   {
   		parameters[i++]='strContextValue';
   		parameters[i++]=document.getElementById('strContextValue').value;
   	}
   parameters[i++]='strProcId';
   parameters[i++]=procid;
   
   parameters[i++]='Contract#';
   parameters[i++]=document.getElementById('Contract#').value;
   parameters[i++]='billToName';
   parameters[i++]=document.getElementById('billToName').value;
   parameters[i++]='ContractName';
   parameters[i++]=document.getElementById('ContractName').value;
   parameters[i++]='from_date';
   parameters[i++]=document.getElementById('from_date').value;
   parameters[i++]='from_date2';
   parameters[i++]=document.getElementById('from_date2').value;
   parameters[i++]='from_date3';
   parameters[i++]=document.getElementById('from_date3').value;
   parameters[i++]='to_date';
   parameters[i++]=document.getElementById('to_date').value;
   parameters[i++]='to_date2';
    
   parameters[i++]=document.getElementById('to_date2').value;
   
   parameters[i++]='to_date3';
   parameters[i++]=document.getElementById('to_date3').value;
   //alert('inside showData'+' with sortId : '+sortId+'Page no::'+pageNo);
   
   
   if(document.getElementById('statusCnt')!='undefined' && document.getElementById('statusCnt').value != null && document.getElementById('statusCnt').value !="") {
	   var xCnt=document.getElementById('statusCnt').value;
	   var statCntr=0;
	  // alert("here.."+xCnt);
		   for(var x=0;x<xCnt;x++)
		   {
		   y='StatusList_'+x;
		   
			   if(document.getElementById(y).checked){
			   parameters[i++]='StatusList_'+x;
			  // alert('StatusList_'+x);
			  //alert("y=="+y +"value=  "+document.getElementById(y).checked+" val "+eval("document.contactSearchForm."+y+".value"));
			   parameters[i++]=document.getElementById(y).value;
			   statCntr++;
			   }
		   }

		parameters[i++]='statusCnt';
		parameters[i++]=xCnt; 
   }
   
   if(document.getElementById('servicelvlCnt')!='undefined' && document.getElementById('servicelvlCnt').value !=null && document.getElementById('servicelvlCnt').value !="") {
	   var yCnt=document.getElementById('servicelvlCnt').value;
	   var servLvlCntr=0;
	  // alert("here.."+xCnt);
		   for(var xi=0;xi<yCnt;xi++)
		   {
		   ySrvlvl='selectedServiceLevels'+xi;
		   
			   if(document.getElementById(ySrvlvl).checked){
			   parameters[i++]='servLvl'+xi;
			  // alert('servLvl'+xi);
			  //	alert("y=="+ySrvlvl +"value=  "+document.getElementById(ySrvlvl).checked+" val "+eval("document.contactSearchForm."+ySrvlvl+".value"));
			   parameters[i++]=document.getElementById(ySrvlvl).value;
			   servLvlCntr++;
			   }
		   }

		parameters[i++]='servicelvlCnt';
		parameters[i++]=yCnt;  
   }

    parameters[i++]='strSourceSystem';
    parameters[i++]=document.getElementById("strSourceSystem").value;    
    parameters[i++]='strCCOUserId';
    parameters[i++]=document.getElementById("strCCOUserId").value;    
    parameters[i++]='strAuthLevel';
    parameters[i++]=document.getElementById("strAuthLevel").value;    
    parameters[i++]='strSelectType';
    parameters[i++]=document.getElementById("strSelectType").value;
    parameters[i++]='strStatus';
    parameters[i++]=document.getElementById("strStatus").value;
       
   if(pageNo!="-1")
   {   
      parameters[i++]='pageNo';
      parameters[i++]=pageNo;  
   }   
   
   //alert(sortId==-1);
   //alert(sortId=="-1");
   
   if(sortId!="-1")
   {
      //alert("sortId is not -1 "+sortId);
      parameters[i++]='sortId';
      parameters[i++]=sortId;      
   }
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='callingfrom';
   parameters[i++]=callingfrom;

   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);

	document.getElementById('pickerContractList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
 	//  alert('creating a request '+parameters);
   var response = XMLHttpRequestSender('./contractSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','contractresults', displayPopupResults);

                                   
   //alert('got response : '+response);
   //alert('Showing loading test ');
   
  // document.getElementById('pickerContractList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
}



function changeSearchPageData(sortId,procid,sortOrder,prevSortId,callingfrom)
{   
   //alert('Inside changeSearchPageData with sortId : '+ sortId);
   var pageNum = document.getElementById('searchPageNumber').value;   
  // alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId+' proc id :: '+procid);
   getContractSearchValues(pageNum, sortId, procid,sortOrder,prevSortId,callingfrom);
}


function displayPopupResults(req,idToChange) 
{
 // alert('Inside displayPopupResults into '+idToChange);
   var result = req.responseText;
 //  alert(result);
   document.getElementById(idToChange).innerHTML=result;
   //alert(document.getElementById('emessage').value);
 if(document.getElementById('emessage').value!='')
 {
 document.getElementById('contractresults1').innerHTML='';
  }
   
   //alert(objs);
   var lineItemsList = document.contactSearchForm.selectLineItem;
   //alert(objs.length);
   //alert(lineItemsList.length);
   
   for(j=0;j<objs.length;j++)
   {
      for(k=0;k<lineItemsList.length;k++)
      {
         //alert('objs[j] : '+objs[j]);
         //alert('lineItemsList[k].value : '+lineItemsList[k].value);
         if(objs[j]==lineItemsList[k].value)
            lineItemsList[k].checked="true";
      }
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
            //alert('readyState : '+XMLHttpReq.readyState);
          //  alert('Status : '+XMLHttpReq.status);
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


function adjustCustArray()
{

   var contactList = document.contactSearchForm.selectLineItem;
   //alert(contactList.length);
   if(contactList != undefined && contactList.length == undefined){
     objs = addVal(objs, contactList.value);
   }
   else{
		if(contactList != undefined ) {
		   for(j=0;j<contactList.length;j++)
		   {
				if (contactList[j].checked == true)
				{
			//		alert("INside adjustcustarray");
					objs = addVal(objs,contactList[j].value);
			//		 alert(objs.length);
				}
				else
				{
					objs = deleteVal(objs,contactList[j].value);
				}
		   } // END OF for
		} // end of if customer list undefined condition
   } // end of else part
 //  alert(objs.length);
}


////// Front End Validations 



//Validate for length < 3 and blank value

function validateLength(value){

if(!trim(value) || trim(value).length<3 )
			 return true;

return false;
}

//Validate for length > 40

function validateLen(value){

if(value.length>200 )
	 return true;

return false;
}

// Removes leading whitespaces
function LTrim( value ) {
	
	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");
	
}

// Removes ending whitespaces
function RTrim( value ) {
	
	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");
	
}

// Removes leading and ending whitespaces
function trim( value ) {
	
	return LTrim(RTrim(value));
	
}

//Special characters validations

function charValidations(value){
 var iChars = "!@$%^*()+=[]\\\;./{}|\":<>?";
  trimvalue = trim(value);
  for (var i = 0; i < trimvalue.length; i++) {
  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
//		trimvalue.focus();
  		
  	return false;
  	}
  }
	return true;
	}


function refreshSelectedAll(v){
//alert("---Aravind-");
 if(!v.checked){        
        document.contactSearchForm.selectAll.checked = false ;
    }    
    else{
     document.contactSearchForm.selectAll.checked = checkSelecAll();
    }  
        
  }
  
function checkSelecAll(){
  var contactList = document.contactSearchForm.selectLineItem;
   
     for(var d=0;d<contactList.length;d++)
      {
        // alert('inside For loop contactList '+contactList[d].checked);        
         if(contactList[d].checked==false)
         {
             return false;            
         }
         
      }//end of for
      
  return true; 
}