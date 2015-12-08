jsonurl = null;
jsonrpc = null;
var jrecords = null;

function jsonLoad(contextPath){   
      contextPath = contextPath+'/JSON-RPC';      
      jsonurl = contextPath;
    try {
      jsonrpc = new JSONRpcClient(jsonurl);
//      alert('Page loaded completely');
    } 
    catch(e) {
//    alert('inside catch');
    }
}

function saveAsDefault(contextPath, userId)
{
  // alert("Inside saveAsDefault");
   jsonLoad(contextPath);	
   var functionStr = document.getElementById('functionStr').value;
   var requestTypeStr = document.getElementById('requestTypeStr').value;
   var statusStr = document.getElementById('statusStr').value;
   
   var requestIdStr = document.getElementById('requestIdStr').value;
   var requestorIdStr = document.getElementById('requestorIdStr').value;
   var requestDateFrom = document.getElementById('requestDateFrom').value;
   var requestDateTo = document.getElementById('requestDateTo').value;
   
   var referenceIdStr = document.getElementById('referenceIdStr').value;
      
  //	alert('---before save');			
   jRecords = jsonrpc.handler.saveAsDefault(functionStr,requestTypeStr,statusStr,userId,requestIdStr,requestorIdStr,requestDateFrom,requestDateTo,referenceIdStr);   
   // alert('----after save jRecords is '+jRecords);
   if(jRecords =='success') {
      alert('Filters have been successfully saved');
       showFilterPageData(-1,-1,'1','ASC','0','setfilters');
   } else
   alert(jRecords);
      //alert('An error occured while saving filters');
      
}

function restoreDefaults(contextPath,userId)
{
   //alert("Inside restoreDefault");
    jsonLoad(contextPath);
	var invoke = "APPLICATION";
	
   jrecords=jsonrpc.handler.restoreDefaults(invoke,userId);   

   var parentObj;
   if(jrecords != null ||jrecords["map"] != null)
   {
      for (key in jrecords["map"]) 
      {
         if(key == 'functionStr') 
         {
            parentObj = document.getElementById('functionStr');
            selectOptionValue(jrecords["map"][key]["list"][0], parentObj);
         }
         else if(key=='requestTypeStr') 
         {
            parentObj = document.getElementById('requestTypeStr');
            selectOptionValue(jrecords["map"][key]["list"][0], parentObj);
		 }
         else if(key=='statusStr') 
         {
            parentObj = document.getElementById('statusStr');
            selectOptionValue(jrecords["map"][key]["list"][0], parentObj);
		 } 
		 else if(key=='Error_retrieve_data') 
         { 
           // alert('Error occcured in restore defaults');
            //alert(jrecords["map"][key]["list"][0]);
            alert(jrecords["map"][key]);
		 } 
		 
		// alert(key);
		
		 
		 
		// else if(key=='requestIdStr') 
        // {
         //   document.getElementById('requestIdStr').value=jrecords["map"][key]["list"][0]; 
		 //}
		 //else if(key=='requestorIdStr') 
        // {
         //   document.getElementById('requestorIdStr').value=jrecords["map"][key]["list"][0];
		// }
		 //else if(key=='requestDateFrom') 
         //{
          //  document.getElementById('requestDateFrom').value=jrecords["map"][key]["list"][0];
		 //}
		 //else if(key=='requestDateTo') 
         //{
           // document.getElementById('requestDateTo').value=jrecords["map"][key]["list"][0];
           
		 //}
	  }
   }	
   
  
   document.getElementById('requestIdStr').value="";  
   document.getElementById('requestorIdStr').value="";
   document.getElementById('requestDateFrom').value="";
   document.getElementById('requestDateTo').value="";
   document.getElementById('referenceIdStr').value="";
   
   showFilterPageData(-1,-1,'1','ASC','0','setfilters'); 	 
}

function selectOptionValue(optionValue, selectObj)
{
   for(var i=0;i<selectObj.length;i++)
   {
      if(optionValue==selectObj.options[i].text)
         selectObj.options[i].selected = true;
   }
}

//Search Results Page values...

function showFilterPageData(pageNo, sortId, invokePage)
{
alert('showFilterPageData 3 params pageNo '+pageNo+ ' sortId '+ ' invokePage '+invokePage);
 //  alert("Inside Show filterpagedate");
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onRequestStatus';
   parameters[i++]='invokePage';
   if (invokePage =="0")
	   parameters[i++]='0';
   else {
   	   alert('inside else----pageno--sortid and invokepage');
   	   parameters[i++]='1';	   
	   parameters[i++]='functionStr';
	   parameters[i++]=document.getElementById('functionStr').value;
	   parameters[i++]='requestIdStr';
	   parameters[i++]=document.getElementById('requestIdStr').value;
	   parameters[i++]='requestorIdStr';
	   parameters[i++]=document.getElementById('requestorIdStr').value;
	   parameters[i++]='statusStr';
	   parameters[i++]=document.getElementById('statusStr').value;
	   parameters[i++]='requestTypeStr';
	   parameters[i++]=document.getElementById('requestTypeStr').value;
	   parameters[i++]='requestDateFrom';
	   parameters[i++]=document.getElementById('requestDateFrom').value;
	   parameters[i++]='requestDateTo';
	   parameters[i++]=document.getElementById('requestDateTo').value;
	   parameters[i++]='referenceIdStr';
	   parameters[i++]=document.getElementById('referenceIdStr').value;
	   alert('---referenceIdString '+document.getElementById('referenceIdStr').value);
	}
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
   document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
//	alert("Before Response");
    var response = XMLHttpRequestSender('./requestStatusDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','requestStatusResults', displayPopupResults);

                            
 //  alert("After Response"); 

}

function showFilterPageData(pageNo, sortId, invokePage,sortOrder,prevSortId)
{

  alert('showFilterPageData 5 params pageNo '+pageNo+ ' sortId '+ ' invokePage '+invokePage +' sortOrder '+sortOrder + 'prevSortId '+prevSortId)
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onRequestStatus';
   parameters[i++]='invokePage';
   if (invokePage =="0")
	   parameters[i++]='0';
   else {
 	  // alert('inside else------pageno sortid invokepage sortorder presortorder');
   	   parameters[i++]='1';	   
	   parameters[i++]='functionStr';
	   parameters[i++]=document.getElementById('functionStr').value;
	   parameters[i++]='requestIdStr';
	   parameters[i++]=document.getElementById('requestIdStr').value;
	   parameters[i++]='requestorIdStr';
	   parameters[i++]=document.getElementById('requestorIdStr').value;
	   parameters[i++]='statusStr';
	   parameters[i++]=document.getElementById('statusStr').value;
	   parameters[i++]='requestTypeStr';
	   parameters[i++]=document.getElementById('requestTypeStr').value;
	   parameters[i++]='requestDateFrom';
	   parameters[i++]=document.getElementById('requestDateFrom').value;
	   parameters[i++]='requestDateTo';
	   parameters[i++]=document.getElementById('requestDateTo').value;
	   parameters[i++]='referenceIdStr';
	   parameters[i++]=document.getElementById('referenceIdStr').value;
	   //alert('---referenceIdString '+document.getElementById('referenceIdStr').value);
	}
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
   
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   
   document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
	alert("Before Response");
    var response = XMLHttpRequestSender('./requestStatusDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','requestStatusResults', displayPopupResults);

                            
  alert("After Response"); 

}


function showFilterPageData(pageNo, sortId, invokePage,sortOrder,prevSortId, callingfrom)
{

 //  alert('showFilterPageData 6 params pageNo '+pageNo+ ' sortId '+ sortId +' invokePage '+invokePage +' sortOrder '+sortOrder + 'prevSortId '+prevSortId + ' callingfrom '+callingfrom)
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onRequestStatus';
   parameters[i++]='invokePage';
   if (invokePage =="0")
	   parameters[i++]='0';
   else {
 	   //alert('inside else------pageno sortid invokepage sortorder presortorder');
   	   parameters[i++]='1';	   
	   parameters[i++]='functionStr';
	   parameters[i++]=document.getElementById('functionStr').value;
	   parameters[i++]='requestIdStr';
	   parameters[i++]=document.getElementById('requestIdStr').value;
	   parameters[i++]='requestorIdStr';
	   parameters[i++]=document.getElementById('requestorIdStr').value;
	   parameters[i++]='statusStr';
	   parameters[i++]=document.getElementById('statusStr').value;
	   parameters[i++]='requestTypeStr';
	   parameters[i++]=document.getElementById('requestTypeStr').value;
	   parameters[i++]='requestDateFrom';
	   parameters[i++]=document.getElementById('requestDateFrom').value;
	   parameters[i++]='requestDateTo';
	   parameters[i++]=document.getElementById('requestDateTo').value;
	   parameters[i++]='referenceIdStr';
	   parameters[i++]=document.getElementById('referenceIdStr').value;
	   //alert('---referenceIdString '+document.getElementById('referenceIdStr').value);
	}
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
   
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='callingfrom';
   parameters[i++]=callingfrom;
   
   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);
   
  // document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
  
  document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
  // 
   
   //alert("Before Response sortId "+sortId);
  
    var response = XMLHttpRequestSender('./requestStatusDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','requestStatusResults', displayPopupResults);

                            
 //  alert("After Response"); 

}


function sortRequestStatus(pageNo, sortId, invokePage,sortOrder,prevSortId, callingfrom)
{

   //alert('sortRequestStatus 6 params pageNo '+pageNo+ ' sortId '+ sortId +' invokePage '+invokePage +' sortOrder '+sortOrder + 'prevSortId '+prevSortId + ' callingfrom '+callingfrom)
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onSortRequestStatusDashboard';
   parameters[i++]='invokePage';
   if (invokePage =="0")
	   parameters[i++]='0';
   else {
 	   //alert('inside else------pageno sortid invokepage sortorder presortorder');
   	   parameters[i++]='1';	   
	   
	   //alert('---referenceIdString '+document.getElementById('referenceIdStr').value);
	}
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
   
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='callingfrom';
   parameters[i++]=callingfrom;
   
   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);
   
  // document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
  
  document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif"><font size="3">Loading..</font></td></tr></table>';      
  // 
   
   //alert("Before Response sortId "+sortId);
  
    var response = XMLHttpRequestSender('./requestStatusDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','requestStatusResults', displayPopupResults);

                            
   //alert("After Response"); 

}

function changeFilterPageData(sortId)
{
   var pageNum = document.getElementById('filterPageNumber').value;

   //showFilterPageData(pageNum, sortId, '1');   
   showFilterPageData(pageNum, '-1', '1');   
}
function displayPopupResults(req,idToChange) 
{
	
   var result = req.responseText;

   document.getElementById(idToChange).innerHTML=result;

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

function validateLen(){
//alert('----------invalidateLen----');
/*	var value = document.getElementById('requestorIdStr').value;
	//alert('----------invalidateLen---value is -'+value);
	if(value.length>40 ){
		alert ("Entry has greater than 40 characters. \nThis is not allowed.");
		document.getElementById('requestorIdStr').value="";
	}	
	else */
	var fromdate = document.getElementById('requestDateFrom').value;
	var todate = document.getElementById('requestDateTo').value;
	/*if(fromdate.length>0 && todate.length>0 && fromdate>todate){
		alert('XXCSS_CT-650074: To Date greater than From Date. please modify and resubmit your search');
		//return false;
	}
	*/
	
	
	
	if (fromdate.length>0 && todate.length>0 && (validate2Dates('requestDateFrom','requestDateTo') == 'false')){ 
	 // alert('XXCSS_CT-650074: From Date greater than To Date. please modify and resubmit your search');
	}else if (validateAscii(document.getElementById('requestIdStr').value)){
		alert('Entry has special characters that are not allowed.\nPlease remove them and try again.');
	}else if (validateAscii(document.getElementById('referenceIdStr').value)){
		alert('Entry has special characters that are not allowed.\nPlease remove them and try again.');
	}else{
		//alert('---fromdate less than todate');
		showFilterPageData(-1,-1,'1','ASC','0','setfilters');
	}
}

// Checking ASCII characters if not, displaying the alert message - MLS
function validateAscii(str) {
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {			
			//alert("special character found");
			return true;
		}
	}
	return false;
}

function openReferenceWindow(referenceURL,refid) {
      		
		if (referenceURL.length != 0) {
		   var summaryURL=referenceURL+refid
    		  window.open(summaryURL);
		 }  else  {
		   alert('XXCSS_CT:650078 - There is no URL associated to this Reference ID');
		   
		 }
   }
   
 
            

function checkDestinationURL(contextPath,reqId,status){
//alert('--in test-- reqId is '+reqId);
 var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onOnlineDownload';
   
   parameters[i++]='reqId';
   parameters[i++]=reqId;  
   
   jsonLoad(contextPath);	
   var result = false;    
   result = jsonrpc.handler.checkDestinationUrl(reqId,'');
   
   //alert('--result is'+result);
   
   if(result){
   		//	var response = XMLHttpRequestSender('./requestStatusDispatch.do',parameters,'true','GET','1000000','3','requestStatusResults', continuejs);   		
   	   downloadform.action= "requestStatusDispatch.do?methodName=onOnlineDownload";
   	   document.downloadform.reqId.value =reqId;
   	   downloadform.submit();
   }
   else{
   		if(status=='COMPLETED'){
   			alert("XXCSS_CT-650046: There is no Output Report generated for this report.");
   		}
   		else{
   			alert("XXCSS_CT-650047: There is no Error Report generated for this request.");
   		}
   		
	}
			
}

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//////////////////////////// DATE VALIDATIONS /////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

 
/**
 *  Compare two date strings to see which is greater.
 *
 * @return 1 if date1 is greater than date2,  0 if date2 is greater than date1 of if they are the same and -1 if either of the dates is in an invalid format
 */
function compareDates(date1,dateformat1,date2,dateformat2) {
 var d1=getDateFromFormat(date1,dateformat1);
 var d2=getDateFromFormat(date2,dateformat2);
 if (d1==0 || d2==0) {
  return -1;
  }
 else if (d1 > d2) {
  return 1;
  }
 return 0;
}

 
function validate2Dates(startDate,endDate){
 
 var sDate=document.getElementById(startDate).value;
 var eDate=document.getElementById(endDate).value;
 
 // alert(sDate + ":" + eDate);
       
 if((sDate != null && sDate != "") || (eDate != null && eDate != "") ){
   var dateFlag = verify2Dates("Date " + startDate, "Date " + endDate + "'",sDate.trim(),eDate.trim());
   if( dateFlag == 'false'){
    return 'false';
   }
 } 
   
}
 
function verify2Dates(fromDate,toDate,fromValue,toValue){
  var format = 'd-MMM-yyyy';
  var toDay = new Date();
  var todaydate=formatDate(toDay,format);
  
 //alert(todaydate); 
 var mFromDate=fromValue;
 //alert(mFromDate);
    var mToDate=toValue;  
  
  if( mFromDate != null && mFromDate != "" ){
  //alert(isDate(mFromDate,format));
   if(!isDate(mFromDate,format)){
    alert("Invalid '" + fromDate + "' format. Please enter the date in 'd-MMM-yyyy' format.");
    return 'false';
   }
  }
  if( mToDate != null && mToDate != "" ){
  //alert(isDate(mFromDate,format));
   if(!isDate(mToDate,format)){
    alert("Invalid '" + toDate + "' format. Please enter the date in 'd-MMM-yyyy' format.");
    return 'false';
   }
  }

  if( ( mFromDate != null && mFromDate != "" ) && ( mToDate != null && mToDate != "" ) ){
  var compareValue = compareDates(mFromDate,format,mToDate,format);
  
  if(compareValue == 1) {
   //alert("'" + fromDate + "' field cannot be greater than '" + toDate+"' field.");
   alert('XXCSS_CT-650074 : From Date is greater than To Date.Please modify and resubmit your search');
   return 'false';
  }
  
  }
  
  return 'true';
}


function formatDate(date,format,Months,Days) {
	// if no month/day names were passed use default values
	if (Months == null) {Months = MONTH_NAMES}
	if (Days == null) {Days = DAY_NAMES}

	format=format+"";
	var result="";
	var i_format=0;
	var c="";
	var token="";

	// calculate initial values
	var y=date.getYear()+"";
	var M=date.getMonth()+1;
	var d=date.getDate();
	var E=date.getDay();
	var H=date.getHours();
	var m=date.getMinutes();
	var s=date.getSeconds();

	var yyyy,yy,MMM,MM,dd,hh,h,mm,ss,ampm,HH,H,KK,K,kk,k;
	// Convert real date parts into formatted versions

	var value=new Object();
	if (y.length < 4) {y=""+(y-0+1900);}

	// create all token values
	value["y"]=""+y;
	value["yyyy"]=y;
	value["yy"]=y.substring(2,4);
	value["M"]=M;
	value["MM"]=LZ(M);
	value["MMM"]=Months[M-1];
	value["NNN"]=Months[M+11];
	value["d"]=d;
	value["dd"]=LZ(d);
	value["E"]=Days[E+7];
	value["EE"]=Days[E];
	value["H"]=H;
	value["HH"]=LZ(H);

	if (H==0){value["h"]=12;}
	else if (H>12){value["h"]=H-12;}
	else {value["h"]=H;}

	value["hh"]=LZ(value["h"]);

	if (H>11){value["K"]=H-12;} else {value["K"]=H;}

	value["k"]=H+1;
	value["KK"]=LZ(value["K"]);
	value["kk"]=LZ(value["k"]);

	if (H > 11) { value["a"]="PM"; }
	else { value["a"]="AM"; }

	value["m"]=m;
	value["mm"]=LZ(m);
	value["s"]=s;
	value["ss"]=LZ(s);

	// create formatted string using the tokens
	while (i_format < format.length) {
		c=format.charAt(i_format);
		token="";

		// create each token
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}

		// use token to build string
		if (value[token] != null) { result=result + value[token]; } // if its a valid token use its value
		else { result=result + token; } // else treat is as part of the formatting string and simply insert
		}

	// return formatted string
	return result;
	}


function getDateFromFormat(val,format,Months,Days) {
	// if no month/day names were passed use default values
	if (Months == null) {Months = MONTH_NAMES}
	if (Days == null) {Days = DAY_NAMES}

	val=val+"";
	format=format+"";

	var i_val=0;
	var i_format=0;
	var c="";
	var token="";
	var token2="";
	var x,y;

	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth()+1;

	var date=1;

	var hh=now.getHours();
	var mm=now.getMinutes();
	var ss=now.getSeconds();

	var ampm="";

	while (i_format < format.length) {
		// Get next token from format string
		c=format.charAt(i_format);
		token="";
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}
		// Extract contents of value based on format token
		if (token=="yyyy" || token=="yy" || token=="y") {
			if (token=="yyyy") { x=4;y=4; }
			if (token=="yy")   { x=2;y=2; }
			if (token=="y")    { x=2;y=4; }
			year=_getInt(val,i_val,x,y);
			if (year==null) { return 0; }
			i_val += year.length;
			if (year.length==2) {
				if (year > 70) { year=1900+(year-0); }
				else { year=2000+(year-0); }
				}
			}
		else if (token=="MMM"||token=="NNN"){
			month=0;
			for (var i=0; i<Months.length; i++) {
				var month_name=Months[i];
				if (val.substring(i_val,i_val+month_name.length).toLowerCase()==month_name.toLowerCase()) {
					if (token=="MMM"||(token=="NNN"&&i>11)) {
						month=i+1;
						if (month>12) { month -= 12; }
						i_val += month_name.length;
						break;
						}
					}
				}
			if ((month < 1)||(month>12)){return 0;}
			}
		else if (token=="EE"||token=="E"){
			for (var i=0; i<Days.length; i++) {
				var day_name=Days[i];
				if (val.substring(i_val,i_val+day_name.length).toLowerCase()==day_name.toLowerCase()) {
					i_val += day_name.length;
					break;
					}
				}
			}
		else if (token=="MM"||token=="M") {
			month=_getInt(val,i_val,token.length,2);
			if(month==null||(month<1)||(month>12)){return 0;}
			i_val+=month.length;}
		else if (token=="dd"||token=="d") {
			date=_getInt(val,i_val,token.length,2);
			if(date==null||(date<1)||(date>31)){return 0;}
			i_val+=date.length;}
		else if (token=="hh"||token=="h") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>12)){return 0;}
			i_val+=hh.length;}
		else if (token=="HH"||token=="H") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>23)){return 0;}
			i_val+=hh.length;}
		else if (token=="KK"||token=="K") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>11)){return 0;}
			i_val+=hh.length;}
		else if (token=="kk"||token=="k") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>24)){return 0;}
			i_val+=hh.length;hh--;}
		else if (token=="mm"||token=="m") {
			mm=_getInt(val,i_val,token.length,2);
			if(mm==null||(mm<0)||(mm>59)){return 0;}
			i_val+=mm.length;}
		else if (token=="ss"||token=="s") {
			ss=_getInt(val,i_val,token.length,2);
			if(ss==null||(ss<0)||(ss>59)){return 0;}
			i_val+=ss.length;}
		else if (token=="a") {
			if (val.substring(i_val,i_val+2).toLowerCase()=="am") {ampm="AM";}
			else if (val.substring(i_val,i_val+2).toLowerCase()=="pm") {ampm="PM";}
			else {return 0;}
			i_val+=2;}
		else {
			if (val.substring(i_val,i_val+token.length)!=token) {return 0;}
			else {i_val+=token.length;}
			}
		}
	// If there are any trailing characters left in the value, it doesn't match
	if (i_val != val.length) { return 0; }
	// Is date valid for month?
	if (month==2) {
		// Check for leap year
		if ( ( (year%4==0)&&(year%100 != 0) ) || (year%400==0) ) { // leap year
			if (date > 29){ return 0; }
			}
		else { if (date > 28) { return 0; } }
		}
	if ((month==4)||(month==6)||(month==9)||(month==11)) {
		if (date > 30) { return 0; }
		}
	// Correct hours value
	if (hh<12 && ampm=="PM") { hh=hh-0+12; }
	else if (hh>11 && ampm=="AM") { hh-=12; }
	var newdate=new Date(year,month-1,date,hh,mm,ss);
	return newdate.getTime();
	}
	



