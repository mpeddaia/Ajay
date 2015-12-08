jsonurl = "/JSON-RPC";
jsonrpc = null;
var jrecords = null;

function jsonLoad(appctx){
    try {
      jsonrpc = new JSONRpcClient(appctx+jsonurl);
      //alert('jsonrprc : '+ jsonrpc);
      //alert('Page loaded completely');
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}

function testsss(){
alert('-----in js');
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
         //alert('Msxml');
            return new ActiveXObject("Msxml2.XMLHTTP");
         }catch (e) {
                  //alert('Msxml excep');
         }
         try { 
                  //alert('Microsoft');
            return new ActiveXObject("Microsoft.XMLHTTP");
         }catch (e) {
                  //alert('Microsoft exce');
                  }
         try {
                  //alert('default');
            return new XMLHttpRequest();
         }catch (e) {
                  //alert('default exec');
         }  
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
//         alert('url : '+url);
         XMLHttpReq.open("GET",url,true);
         timer = setTimeout( function() {
               XMLHttpReq.abort();
                },timeOut);      
         XMLHttpReq.onreadystatechange = function()
         {
  //          alert('readyState : '+XMLHttpReq.readyState);
            
            if (XMLHttpReq.readyState == 4) 
            {
    //        alert('Request object : '+XMLHttpReq);
            //alert('Status : '+XMLHttpReq.status);
      //      alert('after printing request obj');
               clearTimeout(timer);
        //       alert('cleared the timeout');  
               //callBackFunction(XMLHttpReq,idToChange);   
               //alert(XMLHttpReq.status);           
               
               if (XMLHttpReq.status == 200) 
               {
          //     	alert('Status is 200 : '+XMLHttpReq.status);
                   callBackFunction(XMLHttpReq,idToChange);             
               }
               else
               {
//               alert('Status is not 200 : ');
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
  //                alert(MLHttpReq.status);
                  if (XMLHttpReq.status == 200) 
                  {
                         callBackFunction(XMLHttpReq,idToChange);             
                   }
               }
         XMLHttpReq.send(UrlParameters);
         }
      }
      
}


function initialize(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx,sortOrder,prevSortId,callingfrom)
{
jsonLoad(appctx);
//alert('--------insideinitialize in js'+ authlevel);
if (new String(withincontext.toLowerCase()) == 'y'){
//alert('------yes');
searchWithContext(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx,sortOrder,prevSortId,callingfrom);
}
else{
//alert('--------inside initialize in installsiteselector.js');
//populateCountries();

}

}

//function initialize(quoteid, sourcesytem, appctx)
//{
	//alert("In Intialize method");
//	populateServicePrograms(appctx);
	//if (ctx == 'CONTRACT')
	//	searchWithContext(ctx, ctxval, ccouser, authlevel, sourcesytem);

//}

function displayPopupResults(req,idToChange) 
{
   //alert('Inside displayPopupResults into '+idToChange);
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML=result;

  
   //alert(serviceLevelObjs);
   var serviceLevelList = document.ServiceLevelForm.selectedServiceLevels;
//   alert(serviceLevelObjs.length);
//   alert(serviceLevelList.length);
   
   for(j=0;j<serviceLevelObjs.length;j++)
   {
      for(k=0;k<serviceLevelList.length;k++)
      {
         //alert('serviceLevelObjs[j] : '+serviceLevelObjs[j]);
         //alert('serviceLevelList[k].value : '+serviceLevelList[k].value);
         if(serviceLevelObjs[j]==serviceLevelList[k].value)
            serviceLevelList[k].checked="true";
      }
   }
   
   
}

/*
function displayResults(req,idToChange) 
{
   //alert('Inside displayResults into '+idToChange);
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML=result;
   

   // Retain the checkbox status
   var selectedCustomers = document.custDataForm.selectedCustomers;
   var custNameArr = document.custDataForm.custNameArr;
   var custIdArr = document.custDataForm.custIdArr;
   var btTypeArr = document.custDataForm.btTypeArr;
   var amountArr = document.custDataForm.amountArr;
   var salesRegionArr = document.custDataForm.salesRegionArr;
   var renTypeArr = document.custDataForm.renTypeArr;
   
   //alert(customerObjects.length);
   //alert(selectedCustomers.length);

   for(j=0;j<customerObjects.length;j++)
   {
      for(k=0;k<selectedCustomers.length;k++)
      {
         //alert('customerObjects[j] : '+customerObjects[j]);
         //alert('lineItemsList[k].value : '+lineItemsList[k].value);
         var constructStr = custNameArr[k].value+'|'+custIdArr[k].value+'|'+btTypeArr[k].value+'|'+amountArr[k].value+'|'+salesRegionArr[k].value+'|'+renTypeArr[k].value;
         //alert(k+' constructStr :'+constructStr);                  
         if(customerObjects[j]==constructStr)
            selectedCustomers[k].checked="true";
      }
   }
}
*/
///////////////////////////////////////////
/// functions for the child jsp 
///////////////////////////////////////////
function transferData(objs)
{ 
   //alert('inside transferData with objs : '+objs);
   var parentSalesRegionObject = self.creator.document.getElementById("strSelectedSalesRegion");

   //var regions = custChildForm.selectLineItem;

   var count = objs.length;

   if(count == 0)
   {
      alert('Please select atleast one checkbox to continue');
      return false;
   }


   var i=0;
   if(parentSalesRegionObject.options.length == 1)
   {
      parentSalesRegionObject.options.length = 0;
      parentSalesRegionObject.options[0]= new Option('Select One','');
      i=0;
   }
   else
   {
      i=parentSalesRegionObject.options.length-1;
   }

   for(a=0;a<objs.length;a++)
   {
      if(!containsRegion(parentSalesRegionObject, objs[a]))
      {     
         parentSalesRegionObject.options[i+1]= new Option(objs[a], objs[a]);
         i++;
      }             
   }

   self.close();
}

function getNumberOfSelecteCheckboxes(obj)
{
   var count=0;
   if(!(obj))
   {
      //alert('No data available');
      return false;
   }

   if(!(obj.length))
   {
      if(obj.checked) 
      {
         count++;       
      }
   }
   else
   {
      for(var c=0;c<obj.length;c++)
      {
         if(obj[c].checked) 
         {
            count++;         
         }
      }
   }
   
   return count;
}
/*
function populateServicePrograms(appctx)
{
   jsonLoad(appctx);
   
   var program = document.getElementById('serviceprogram');
   program.options.length=0;
   program.options[0]= new Option('Select One','');
   
//   alert("In getting service program list");
   
   jrecords=jsonrpc.handler.getServicePrograms();   
//   alert('List : '+jrecords["list"]);
//   alert ('List length :' +jrecords["list"].length);
   if(jrecords != null ||jrecords["list"] != null){
      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++) {
//        alert('Adding '+ jrecords["list"][i]+' to dropdown : ');
//          var temStr = jrecords["list"][2*i];
         program.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
//         i++;
      }
   }
}
*/
/*
	This function gets called onload if the context sensitive data is available 
*/
function searchWithContext(context,contextvalue,ccouserid,authlevel,sourcesystem,sortOrder,prevSortId,callingfrom) {

	//alert ("values from context are : "+ context+contextvalue+ccouserid+authlevel+sourcesystem);

   var parameters= new Array();
   var i=0;
   parameters[i++]='uname';
   parameters[i++]='Girish';
  
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchList';
   parameters[i++]='quoteid';
   parameters[i++]=quoteid;
   parameters[i++]='ccouserid';
   parameters[i++]=ccouserid;
   parameters[i++]='authlevel';
   parameters[i++]=authlevel;
   parameters[i++]='sourcesystem';
   parameters[i++]=sourcesystem;

   parameters[i++]='procId';
   parameters[i++]="-1";
 
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='callingfrom';
   parameters[i++]=callingfrom;
   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);

	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

		   var response = XMLHttpRequestSender('./serviceLevelSelector.do',
		                              parameters,
		                              'true',
		                              'GET',
		                              '1000000',
		                              '3','regionResults', displayPopupResults);
			
}

/*
	This function gets called onload if the context sensitive data is available 
*/
function searchWithContext(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx,sortOrder,prevSortId,callingfrom) {

	//alert ("values from context are : "+ context+contextvalue+ccouserid+authlevel+sourcesystem);
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchList';
   parameters[i++]='withincontext';
   parameters[i++]=withincontext;
   parameters[i++]='context';
   parameters[i++]=ctx;
   parameters[i++]='contextvalue';
   parameters[i++]=ctxval;
   parameters[i++]='status';
   parameters[i++]=status;
   parameters[i++]='pickerselectionvalue';
   parameters[i++]=pickerselectionvalue;
   parameters[i++]='sourcesystem';
   parameters[i++]=sourcesystem;
   parameters[i++]='ccouserid';
   parameters[i++]=ccouser;
   parameters[i++]='authlevel';
   parameters[i++]=authlevel;
//alert("---ccouser"+ccouser);

   parameters[i++]='procId';
   parameters[i++]="-1";
   
    
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='callingfrom';
   parameters[i++]=callingfrom;
   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);
	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

		   var response = XMLHttpRequestSender('./serviceLevelSelector.do',
		                              parameters,
		                              'true',
		                              'GET',
		                              '1000000',
		                              '3','regionResults', displayPopupResults);
			
}

function showSearchPageData(pageNo, sortId, procId,sortOrder,prevSortId)
{
// alert('inside showData'+' with sortId : '+sortId+' and procId : '+procId);
//alert(serviceLevelObjs);
/*
   if(pageNo=="-1"&&sortId=="-1")
      serviceLevelObjs = new Array();
   
   if(pageNo=="1"&&sortId!="-1")
      serviceLevelObjs = new Array(); 
  */ 
   var parameters= new Array();
   var i=0;
   parameters[i++]='uname';
   parameters[i++]='Girish';

  
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchList';
   parameters[i++]='servicelevelcode';
   parameters[i++]=document.getElementById('servicelevelcode').value;
   parameters[i++]='serviceleveldesc';
   parameters[i++]=document.getElementById('serviceleveldesc').value;
   parameters[i++]='serviceprogram';
   parameters[i++]=document.getElementById('serviceprogram').value;
   parameters[i++]='servicelevelgroup';
   parameters[i++]=document.getElementById('servicelevelgroup').value;
   
   parameters[i++]='withincontext';
   parameters[i++]=document.getElementById('withincontext').value;   
   parameters[i++]='context';
   parameters[i++]=document.getElementById('context').value;
   parameters[i++]='status';
   parameters[i++]=document.getElementById('status').value;
   parameters[i++]='pickerselectionvalue';
   parameters[i++]=document.getElementById('pickerselectionvalue').value;
   parameters[i++]='sourcesystem';
   parameters[i++]=document.getElementById('sourcesystem').value;
   parameters[i++]='ccouserid';
   parameters[i++]=document.getElementById('ccouserid').value;   
   parameters[i++]='authlevel';
   parameters[i++]=document.getElementById('authlevel').value; 

   parameters[i++]='procId';
   parameters[i++]=procId;

   if(pageNo!="-1")
   {   
      parameters[i++]='pageNo';
      parameters[i++]=pageNo;
   }
   
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
   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);
   //alert('creating a request '+parameters);

	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

   var response = XMLHttpRequestSender('./serviceLevelSelector.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);

}


function showSearchPageDataPagination(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
{
// alert('inside showData'+' with sortId : '+sortId+' and procId : '+procId);
//alert("----sortOrder "+sortOrder);
//alert("----callingfrom "+callingfrom);
   /*
   if(pageNo=="-1"&&sortId=="-1")
      serviceLevelObjs = new Array();
   
   if(pageNo=="1"&&sortId!="-1")
      serviceLevelObjs = new Array(); 
   */
   if(callingfrom == 'searchbutton'){
   		serviceLevelObjs = new Array();
   }
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='uname';
   parameters[i++]='Girish';

  
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchList';
   parameters[i++]='servicelevelcode';
   parameters[i++]=document.getElementById('servicelevelcode').value;
   parameters[i++]='serviceleveldesc';
   parameters[i++]=document.getElementById('serviceleveldesc').value;
   parameters[i++]='serviceprogram';
   parameters[i++]=document.getElementById('serviceprogram').value;
   parameters[i++]='servicelevelgroup';
   parameters[i++]=document.getElementById('servicelevelgroup').value;
   
   parameters[i++]='withincontext';
   parameters[i++]=document.getElementById('withincontext').value;   
   parameters[i++]='context';
   parameters[i++]=document.getElementById('context').value;
   parameters[i++]='status';
   parameters[i++]=document.getElementById('status').value;
   parameters[i++]='pickerselectionvalue';
   parameters[i++]=document.getElementById('pickerselectionvalue').value;
   parameters[i++]='sourcesystem';
   parameters[i++]=document.getElementById('sourcesystem').value;
   parameters[i++]='ccouserid';
   parameters[i++]=document.getElementById('ccouserid').value;   
   parameters[i++]='authlevel';
   parameters[i++]=document.getElementById('authlevel').value; 

   parameters[i++]='procId';
   parameters[i++]=procId;

   if(pageNo!="-1")
   {   
      parameters[i++]='pageNo';
      parameters[i++]=pageNo;
   }
   
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
   //alert('callingfrom is '+callingfrom);

	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

   var response = XMLHttpRequestSender('./serviceLevelSelector.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);

}
function changeSearchPageData(sortId)
{   
   //alert('Inside changeSearchPageData with sortId : '+ sortId);
   var pageNum = document.getElementById('searchPageNumber').value;   
   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
   showSearchPageData(pageNum, sortId);
}


function displayResultsOnUpdate(req,idToChange) 
{
   //alert('Inside displayResultsOnUpdate into '+idToChange);
   var result = req.responseText;
   //alert(result);
   self.creator.document.getElementById(idToChange).innerHTML=result;
   
   var uploadId = self.creator.document.getElementById('uploadIdDiv').innerHTML;
   
   //alert(uploadId);
   //alert(uploadId=="Error");
   
   if(uploadId == "Error")
      document.getElementById('mod_1').innerHTML="An error occured while processing your request. Please try again later.";      
   else
      document.getElementById('mod_1').innerHTML="Your request has been processed succesfully. The Request ID generated is "+ uploadId +". The new results have been loaded in the parent window. Please close this window..";
 
   self.close();
}

function displayResultsOnDefaultUpdate(req,idToChange) 
{
   //alert('Inside displayResultsOnDefaultUpdate into '+idToChange);
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML=result;   
}

function showSplitData()
{
   //alert(customerObjects.length);
   
   for(var bb=0;bb<customerObjects.length;bb++)
   {
      var curObj = customerObjects[bb];
      alert('Reading obj at location '+bb+' : '+curObj);
      
      var array = customerObjects[bb].split('|');
      alert('Size of array after split : '+array.length);
      
      var arrData = '';
      for(var cc=0;cc<array.length;cc++)
      {
         arrData += array[cc]+'\n';   
      }
      alert(arrData);
   }
}
/*
function changeServiceLevelPageData(sortId, procId)
{
	var pageNum = document.getElementById('serviceLevelPageNumber').value;
	//alert("Caling changeServiceLevelPageData for page: " +pageNum +'and sortId : '+ 'and procId : ' +procId );
	showSearchPageData(pageNum, sortId, procId);
}
*/

function changeServiceLevelPageData(sortId, procId,sortOrder,prevSortId,callingfrom)
{
	var pageNum = document.getElementById('serviceLevelPageNumber').value;
	//alert("Caling changeServiceLevelPageData for page: " +pageNum +'and sortId : '+ 'and procId : ' +procId );
	//showSearchPageData(pageNum, sortId, procId);
	showSearchPageDataPagination(pageNum, sortId, procId,sortOrder,prevSortId,callingfrom);
}

function adjustServiceLevelArray()
{
   //alert('inside adjustServiceLevelArray');
   
   //alert(serviceLevelObjs.length);
   
   var serviceLevelList = document.ServiceLevelForm.selectedServiceLevels;
   //alert('----------serviceLevelList'+serviceLevelList);
   //alert('----------serviceLevelList.length'+serviceLevelList.length);
   //alert('----------serviceLevelList.value'+serviceLevelList.value);
   
   if(serviceLevelList != undefined && serviceLevelList.length == undefined){   		
   		serviceLevelObjs = addVal(serviceLevelObjs, serviceLevelList.value);  		  		
   }
   else{
   		for(var d=0;d<serviceLevelList.length;d++)
	    {
      		if(serviceLevelList[d].checked==true)
      		{
         		//alert(d+' - '+selCustomers[d].value);
         		serviceLevelObjs = addVal(serviceLevelObjs, serviceLevelList[d].value);
      		}
      		else
      		{
         		//alert(d+' - '+selCustomers[d].value);
         		serviceLevelObjs = deleteVal(serviceLevelObjs, serviceLevelList[d].value);
      		}
   		}//end of for   
   }

}

function refreshSelectedAll(v){
        
    //alert('------'+v.checked);    
    if(!v.checked){        
        document.ServiceLevelForm.selectAllServiceLevels.checked = false ;
    }    
    else{
    	document.ServiceLevelForm.selectAllServiceLevels.checked = checkSelecAll();
    }  
        
  }
  
function checkSelecAll(){
		var serviceLevelList = document.ServiceLevelForm.selectedServiceLevels;
   
   		for(var d=0;d<serviceLevelList.length;d++)
   			{
    	 		// alert('inside For loop adjustInstallSiteArray '+installSitesList[d].checked);    	 		
      			if(serviceLevelList[d].checked==false)
      			{
      			    return false;         			
      			}
      			
   			}//end of for
   			
		return true; 
}
