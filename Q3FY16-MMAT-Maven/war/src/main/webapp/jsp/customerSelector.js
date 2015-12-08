jsonurl = null;
jsonrpc = null;
var jrecords = null;

function jsonLoad(contextPath){   
      contextPath = contextPath+'/JSON-RPC';      
      jsonurl = contextPath;
    try {
      jsonrpc = new JSONRpcClient(jsonurl);
//     alert('Page loaded completely');
    } 
    catch(e) {
   // alert('inside catch');
    }
}
// start  Q3FY12 TD#20791 by vpasunoo
function ipStrManipulation(){
	var ipString = document.getElementById('strRequestedData1').value;
	newIpStr = takeAString(ipString);
	return newIpStr;
}
function takeAString(ipStr){
	 var validationCheck=false;
 	 var finalStr='';
 	 for (var i = 0; i < ipStr.length; i++) {
 	 	if(ipStr.charAt(i) == '%'){		 
			 if(!validationCheck){
			 	finalStr=finalStr+ipStr.charAt(i);
			 }
			 validationCheck=true;
	   }else{
			 if(ipStr.charAt(i) == ' '){			
				   if(!validationCheck){
					 finalStr=finalStr+ipStr.charAt(i);
				   }
			 }else{
				 validationCheck=false;				
				 finalStr=finalStr+ipStr.charAt(i);
			}
	   }
 	 }
 	 return finalStr;
}

// End of Q3FY12 TD#20791 by vpasunoo

//Search Results Page values...

function showFilterPageData(divName,pageNo,sortId,procId,sortOrder,prevSortId)
{

   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='getCustomerSearchFilterList';

   parameters[i++]='strRequestedData1';
   parameters[i++]=ipStrManipulation(); // added for TD#20791 Q3FY12 by vpasunoo

//   alert("Setting params");
//	alert("Page No: " + pageNo);

   parameters[i++]='strSourceSystem';
   parameters[i++]=document.getElementById('strSourceSystem').value;

   parameters[i++]='strWithinContext';
   parameters[i++]=document.getElementById('strWithinContext').value;
	 
   parameters[i++]='strContext';
   parameters[i++]=document.getElementById('strContext').value;
   
   parameters[i++]='strContextValue';
   parameters[i++]=document.getElementById('strContextValue').value;
   
   parameters[i++]='strRequestedData';
   parameters[i++]=document.getElementById('strRequestedData').value;
   
   parameters[i++]='strStatus';
   parameters[i++]=document.getElementById('strStatus').value;

   parameters[i++]='strSearchHier';
   parameters[i++]=document.getElementById('strSearchHier').value;

   parameters[i++]='strCustomerName';
   parameters[i++]=document.getElementById('strCustomerName').value;

   parameters[i++]='procId';
   parameters[i++]=procId;  
  
  parameters[i++]='strCCOUserId';
   parameters[i++]=document.getElementById('strCCOUserId').value;  
  
   if(pageNo!="-1")
   {
      parameters[i++]='pageNo';
      parameters[i++]=pageNo;   
   }   
   
   if(sortId!="-1")
   {
      parameters[i++]='sortId';
      parameters[i++]=sortId;      
   }
   

   if(document.getElementById('strSelectType') != null)
   {
      parameters[i++]='strSelectType';
	  parameters[i++]=document.getElementById('strSelectType').value;
   }
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);

  // alert("Parameters : "+ parameters);

  //  alert('<< AJAX CALL >>');
    var response = XMLHttpRequestSender('./custSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3',divName, displayPopupResults);

   document.getElementById('dataGrid').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                  
  

}

function changeFilterPageData(sortId,procId, divName)
{
   var pageNum = document.getElementById('filterPageNumber').value;

   showFilterPageData(divName,pageNum, sortId,procId,'ASC','0');   
}
function displayPopupResults(req,idToChange) 
{
	//alert('In callback function');
   var result = req.responseText;  
   document.getElementById(idToChange).innerHTML=result;
   //alert("displayPopupResults::objs VALUES  :: " + objs);
   
   var customersList = document.custChildForm.selectLineItem;
  // alert("list is ::" + customersList);
   for(j=0;j<objs.length;j++)
   {
 if(customersList!=undefined){
      for(k=0;k<customersList.length;k++)
      {
         if(objs[j]==customersList[k].value)
            customersList[k].checked="true";
      }
      }
   }
   
}

function adjustCustArray()
{
   
   var customersList = document.custChildForm.selectLineItem;
   if(customersList != undefined && customersList.length == undefined){
     objs = addVal(objs, customersList.value);
   }
   else{
	   if(customersList != undefined ) {
		   for(j=0;j<customersList.length;j++)
		   {
				if (customersList[j].checked == true)
				{
					objs = addVal(objs,customersList[j].value);
				}
				else
				{
					objs = deleteVal(objs,customersList[j].value);
				}
		    }
		   }// end of if customer list undefined condition
	   }// end of else part
	//alert("adjustCustArray::objs VALUES  :: " + objs);
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
         //alert(url);
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




////// Front End Validations 

//Validate for blank value

function validateBlankName(value){

if(!trim(value) || trim(value).length<=0 )
			 return true;

return false;
}


//Validate for length < 3 and blank value
// calculating the length of i/p string excluding wildcard character by vpasunoo TD#20791
function validateLength(value){
var fld=value;
var a=new Array();
var b=new Array();
var c="";
a=fld.split("");
for(var i=0;i<a.length;i++){
	if(a[i] == '%' || a[i] == ' '){
		b[i] = a[i];	
	}else{	
		c = c+a[i];	
	}
}
if(!trim(c) || trim(c).length<3 )
			 return true;

return false;
}

//Validate for length > 40

function validateLen(value){

if(value.length>40 )
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
 var iChars = "!@$^*()+=[]\\\;,./{}|\":<>?"; // excluded % char from char validation for TD#20791 Q3FY12 by vpasunoo
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
//alert("---blaa-");
 if(!v.checked){        
        document.custChildForm.selectAll.checked = false ;
    }    
    else{
     document.custChildForm.selectAll.checked = checkSelecAll();
    }  
        
  }
  
function checkSelecAll(){
  var custSitesList = document.custChildForm.selectLineItem;
   
     for(var d=0;d<custSitesList.length;d++)
      {
        // alert('inside For loop adjustInstallSiteArray '+installSitesList[d].checked);        
         if(custSitesList[d].checked==false)
         {
             return false;            
         }
         
      }//end of for
      
  return true; 
}

