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


function populateSuperTheaters(varStrHName,varStrHStatus,varTrNodeStat)
{   
try{
   var strHName=varStrHName;//"CREV";
   var strHStatus=varStrHStatus;//"ACTIVE";
   var strNodeStat=varTrNodeStat;//"ACTIVE";
   var superTheater = document.getElementById('strSuperTheater');
   superTheater.options.length=0;        
   superTheater.options[0]= new Option('<fmt:message key="SalesRegionSelector.selectOne"/>','-1');
   jrecords=jsonrpc.handler.getSuperTheatersList(strHName,strHStatus,strNodeStat);   
  // alert('List : '+jrecords["list"]);
   if(jrecords != null ||jrecords["list"] != null){
      for(i=0; i<jrecords["list"].length; i++){
      //   alert('Adding '+ jrecords["list"][i].nodeName+' to dropdown : '+nodeToPopulate);
         superTheater.options[i+1]= new Option(jrecords["list"][i].structuredNodeName,jrecords["list"][i].nodeName);
      }
   }
   } 
    catch(e) {
      if(e.message){
      	var errorstr = '<font color="#9c0000">' + e.message + '</font>';
      	//alert(errorstr);
      	document.getElementById('errmessages_m').innerHTML=errorstr;
      }
      else{
      	var errorstr = '<font color="#9c0000">' + e + '</font>';
      	//alert(errorstr);
      	document.getElementById('errmessages_m').innerHTML=errorstr;
      	
      }
    }
}


//For Calling Nodes


function getChildrenOf(strHName,strHStatus,num) {
   
   var idArr = new Array(5);
   idArr[0] = 'strSuperTheater'; //javascript never populates this array, this comes from database by default
   idArr[1] = 'strTheater';
   idArr[2] = 'strConsolidation';
   idArr[3] = 'strArea';
   idArr[4] = 'strOperation';   
   
   var nodeSelected = idArr[num-2];
   var nodeToPopulate = idArr[num-1];
   
   //alert('Arr values - '+nodeSelected+' - '+nodeToPopulate);
   
   var heirarchyname = strHName;//'CREV';
   var strnodename = document.getElementById(nodeSelected).value;
   var heirStatus=strHStatus;
   var sourcenodeid =  num-1;
   var destnodeid = num;
   
   //alert('Getting children for '+nodeSelected+' : '+strnodename+' : '+sourcenodeid+' : '+destnodeid);

   //Clear off all the nodelists of the grandchildren and below
   for(k=num;k<5;k++)
   {
      var childElem = document.getElementById(idArr[k]);
      //alert(childElem.options.length);
      childElem.options.length=0;        
      childElem.options[0]= new Option('<fmt:message key="SalesRegionSelector.selectOne"/>','-1');
   }
   
   var node = document.getElementById(nodeToPopulate);
   //alert(theater.options.length);
   node.options.length=0;        
   node.options[0]= new Option('<fmt:message key="SalesRegionSelector.selectOne"/>','-1');

   jrecords=jsonrpc.handler.getNodeList(heirarchyname, heirStatus, strnodename, sourcenodeid, destnodeid);
   //alert('List : '+jrecords["list"]);
   if(jrecords != null ||jrecords["list"] != null){
      for(i=0; i<jrecords["list"].length; i++){
      //   alert('Adding '+ jrecords["list"][i].nodeName+' to dropdown : '+jrecords["list"][i].structuredNodeName);
         node.options[i+1]= new Option(jrecords["list"][i].structuredNodeName,jrecords["list"][i].nodeName);
      }
   }
   
   //return false;
}


//Search Results Page values...

function showSearchPageData(pageNo, sortId, procid,sortOrder,prevSortId)
{
 //  alert('inside showData'+' with sortId : '+sortId+'Page no::'+pageNo);

   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
      
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchList';
   parameters[i++]='searchStr';
   parameters[i++]=document.getElementById('salesRegSearchStr').value;
   parameters[i++]='strHName';
   parameters[i++]=document.getElementById('strHeirName').value;
   parameters[i++]='strNStatus';
   parameters[i++]=document.getElementById('strNodeStatus').value;
   parameters[i++]='strHStatus';
   parameters[i++]=document.getElementById('strHeirStatus').value;
   parameters[i++]='strSelectType';
   parameters[i++]=document.getElementById('strSelectType').value;
   parameters[i++]='strStatus';
   parameters[i++]=document.getElementById('strStatus').value;
   parameters[i++]='strProcId';
   parameters[i++]=procid;

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
   
   document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
  
   //alert('creating a request '+parameters);
   var response = XMLHttpRequestSender('./salesRegionSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);

                                   
   //alert('got response : '+response);
   //alert('Showing loading test ');
   
  // document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
}



function showSearchPageData(pageNo, sortId, procid,sortOrder,prevSortId,callingfrom)
{
 //  alert('inside showData'+' with sortId : '+sortId+'Page no::'+pageNo);

   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
      
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchList';
   parameters[i++]='searchStr';
   parameters[i++]=document.getElementById('salesRegSearchStr').value;
   parameters[i++]='strHName';
   parameters[i++]=document.getElementById('strHeirName').value;
   parameters[i++]='strNStatus';
   parameters[i++]=document.getElementById('strNodeStatus').value;
   parameters[i++]='strHStatus';
   parameters[i++]=document.getElementById('strHeirStatus').value;
   parameters[i++]='strSelectType';
   parameters[i++]=document.getElementById('strSelectType').value;
   parameters[i++]='strStatus';
   parameters[i++]=document.getElementById('strStatus').value;
   parameters[i++]='strProcId';
   parameters[i++]=procid;

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
   
   document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
  
   //alert('creating a request '+parameters);
   var response = XMLHttpRequestSender('./salesRegionSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);

                                   
   //alert('got response : '+response);
   //alert('Showing loading test ');
   
  // document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
}

function changeSearchPageData(sortId,procid)
{   
   //alert('Inside changeSearchPageData with sortId : '+ sortId);
   var pageNum = document.getElementById('searchPageNumber').value;   
   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
   showSearchPageData(pageNum, sortId, procid);
}

function changeFilterPageData(sortId,procid){
//alert('Inside changeSearchPageData with sortId : '+ sortId);
   var pageNum = document.getElementById('filterPageNumber').value;   
   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
   showFilterPageData(pageNum, sortId, procid);

}

function displayPopupResults(req,idToChange) 
{
   //alert('Inside displayPopupResults into '+idToChange);cc
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML='<font color="#9c0000">'+result+'</font>';
   
   //alert(objs);
   var lineItemsList = document.custChildForm.selectLineItem;
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

// For filter search
function showFilterPageData(pageNo, sortId, procid,sortOrder,prevSortId)
{
   //alert('inside showData');
   
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onGetFilterList';
   parameters[i++]='strProcId';
   parameters[i++]=procid;
   parameters[i++]='strHName';
   parameters[i++]=document.getElementById('strHeirName').value;
   parameters[i++]='strHStatus';
   parameters[i++]=document.getElementById('strHeirStatus').value;
   parameters[i++]='strNStatus';
   parameters[i++]=document.getElementById('strNodeStatus').value;
   parameters[i++]='strSuperTheater';
   parameters[i++]=document.getElementById('strSuperTheater').value;
   parameters[i++]='strTheater';
   parameters[i++]=document.getElementById('strTheater').value;
   parameters[i++]='strConsolidation';
   parameters[i++]=document.getElementById('strConsolidation').value;
   parameters[i++]='strArea';
   parameters[i++]=document.getElementById('strArea').value;
   parameters[i++]='strOperation';
   parameters[i++]=document.getElementById('strOperation').value;
   parameters[i++]='strSelectType';
   parameters[i++]=document.getElementById('strSelectType').value;
   parameters[i++]='strStatus';
   parameters[i++]=document.getElementById('strStatus').value;
   
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
   
document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
   //alert('creating a request');
   var response = XMLHttpRequestSender('./salesRegionSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);

                                   
   //alert('got response : '+response);
   
   
   //alert('Showing loading test ');
   
   //document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
}

function showFilterPageData(pageNo, sortId, procid,sortOrder,prevSortId,callingfrom)
{
   //alert('inside showData');
   
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onGetFilterList';
   parameters[i++]='strProcId';
   parameters[i++]=procid;
   parameters[i++]='strHName';
   parameters[i++]=document.getElementById('strHeirName').value;
   parameters[i++]='strHStatus';
   parameters[i++]=document.getElementById('strHeirStatus').value;
   parameters[i++]='strNStatus';
   parameters[i++]=document.getElementById('strNodeStatus').value;
   parameters[i++]='strSuperTheater';
   parameters[i++]=document.getElementById('strSuperTheater').value;
   parameters[i++]='strTheater';
   parameters[i++]=document.getElementById('strTheater').value;
   parameters[i++]='strConsolidation';
   parameters[i++]=document.getElementById('strConsolidation').value;
   parameters[i++]='strArea';
   parameters[i++]=document.getElementById('strArea').value;
   parameters[i++]='strOperation';
   parameters[i++]=document.getElementById('strOperation').value;
   parameters[i++]='strSelectType';
   parameters[i++]=document.getElementById('strSelectType').value;
   parameters[i++]='strStatus';
   parameters[i++]=document.getElementById('strStatus').value;
   
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
   
document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
   //alert('creating a request');
   var response = XMLHttpRequestSender('./salesRegionSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);

                                   
   //alert('got response : '+response);
   
   
   //alert('Showing loading test ');
   
   //document.getElementById('pickerSalesRegionsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
}

function adjustCustArray()
{

   var customersList = document.custChildForm.selectLineItem;
   //alert(objs.length);
   for(j=0;j<customersList.length;j++)
   {
 		if (customersList[j].checked == true)
 		{
 	//		alert("INside adjustcustarray");
 			objs = addVal(objs,customersList[j].value);
 	//		 alert(objs.length);
 		}
 		else
 		{
 			objs = deleteVal(objs,customersList[j].value);
 		}
   }
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
 var iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?";
  trimvalue = trim(value);
  for (var i = 0; i < trimvalue.length; i++) {
  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
//		trimvalue.focus();
  		
  	return false;
  	}
  }
	return true;
	}


