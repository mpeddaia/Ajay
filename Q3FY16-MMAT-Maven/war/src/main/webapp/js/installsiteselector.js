jsonurl = "/JSON-RPC";
jsonrpc = null;
var jrecords = null;
 
var selectedArray = new Array();
var unSelectedArray = new Array();

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

function initialize(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx,sortOrder,prevSortId,callingfrom)
{
jsonLoad(appctx);
//alert('--------insideinitialize in js'+ authlevel);
if (new String(withincontext.toLowerCase()) == 'y'){
//alert('------yes');
//populateCountriesAndProcid(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx);
 //alert(' ctx '+ctx+' ctxval '+ctxval+ ' ctxval length '+ctxval.length);
 if (trim(ctxval).length != 0) {
    // alert('calling searchWithContext ctx' +ctx+ ' ctxval '+ctxval);
     searchWithContext(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx,sortOrder,prevSortId,callingfrom);
    }
}
else{
//alert('--------inside initialize in installsiteselector.js');
//populateCountries();

}

}

/*function initialize(ctx, ctxval, ccouser, authlevel, sourcesytem,appctx)
{
alert('------inold initialize');
populateCountries(appctx);
if (ctx == 'CONTRACT')
	searchWithContext(ctx, ctxval, ccouser, authlevel, sourcesytem);

}*/

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

function getStates(ccouserid, sourcesystem) {
   
   //alert("---inside getstates----");
   //clear the states dropdown
   var stateProvinceObj = document.getElementById('stateProvince');    
   stateProvinceObj.options.length=0;        
   stateProvinceObj.options[0]= new Option('Select One','');
      
   var strcountrycode = document.getElementById('country').value;

   //alert("Selected country code is : " + strcountrycode);
   
  // alert('country code '+strcountrycode);
  // alert('ccouserid  '+ccouserid);
   jrecords=jsonrpc.handler.getStateList(strcountrycode,ccouserid,sourcesystem);
   if(jrecords != null) {
      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++){
         //alert('Adding '+ jrecords["list"][i]+' to dropdown : '+stateProvinceObj);
         stateProvinceObj.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
      }
   }
      
}

function getStates() {
   
   //alert("---inside getstates----");
   //clear the states dropdown
   var stateProvinceObj = document.getElementById('stateProvince');    
   stateProvinceObj.options.length=0;        
   stateProvinceObj.options[0]= new Option('Select One','');
      
   var strcountrycode = document.getElementById('country').value;

   //alert("Selected country code is : " + strcountrycode);
   
   //alert('country code '+strcountrycode);
   //alert('ccouserid  '+ccouserid);
   jrecords=jsonrpc.handler.getStateList(strcountrycode);
   if(jrecords != null) {
      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++){
         //alert('Adding '+ jrecords["list"][i]+' to dropdown : '+stateProvinceObj);
         if(jrecords["list"][i]!= null){
         	stateProvinceObj.options[j]= new Option(jrecords["list"][i] +" - "+ jrecords["list"][i+1], jrecords["list"][i]);
         }
         else{
         	stateProvinceObj.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i+1]);
         }
        // stateProvinceObj.options[j]= new Option(jrecords["list"][i] +" - "+ jrecords["list"][i+1], jrecords["list"][i]);
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
  //       alert('url : '+url);
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


function displayPopupResults(req,idToChange) 
{
//   alert('Inside displayPopupResults into '+idToChange);
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML=result;

  
   //alert(installObjs);
   var installSitesList = document.InstallSiteForm.selectedInstallSites;
//   alert(installObjs.length);

   //alert('installObjs.length display' +installObjs.length+ 'installSitesList '+installSitesList.length);
   
   for(j=0;j<installObjs.length;j++)
   {
      for(k=0;k<installSitesList.length;k++)
      {
         //alert('installObjs[j] : '+installObjs[j]);
         //alert('installSitesList[k].value : '+installSitesList[k].value);
         if(installObjs[j]==installSitesList[k].value)
            installSitesList[k].checked="true";
      }
   }
   
                             
    document.getElementById("button_selectSite").style.display='';
    //document.getElementById("button_addSiteToAdd").style.display='';
    document.getElementById("button_delete").style.display='none';
    document.getElementById("tabtype").value='search';
    
    //alert('111---document.getElementByIdvalue--'+document.getElementById('withincontext').value);
    if(document.getElementById('withincontext').value == "Y"){
		document.getElementById("button_addSiteToAdd").style.display='none';
	}
	else{
		document.getElementById("button_addSiteToAdd").style.display='';
	} 
   
}



function displayPopupResults_AddBookData(req,idToChange) 
{
   var result = req.responseText; 
   document.getElementById(idToChange).innerHTML=result;

   var installSitesList = document.InstallSiteForm.selectedInstallSites;

//   alert('deleteAddressObjs.length display' +deleteAddressObjs.length+ 'installSitesList '+installSitesList.length);
   
   for(j=0;j<deleteAddressObjs.length;j++)
   {
      for(k=0;k<installSitesList.length;k++)
      {
        // alert('deleteAddressObjs[j] : '+deleteAddressObjs[j]);
         var idString=installSitesList[k].value
         //alert('-------------id is '+id);
         var idStringIndex=idString.indexOf("|");
         //alert('----idStringIndex is '+idStringIndex);
         var id = idString.substring(0,idStringIndex);
         //alert('---id is '+id);
        // alert('installSitesList[k].value : '+installSitesList[k].value);
         if(deleteAddressObjs[j]== id)
            installSitesList[k].checked="true";
      }
   }

    
    document.getElementById("button_selectSite").style.display='';
    document.getElementById("button_addSiteToAdd").style.display='none';
    document.getElementById("button_delete").style.display='';
    document.getElementById("tabtype").value='address'; 
   
}




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

function containsRegion(obj, newvalue)
{
   for(k=0;k<obj.options.length;k++)
   {
      if(obj.options[k].value==newvalue)  
         return true;
   }
   return false;
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

function populateCountriesAndProcid(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx)
{
	jsonLoad(appctx);
   
   var country = document.getElementById('country');
   country.options.length=0;
   country.options[0]= new Option('Select One','');
   
//   alert("In getting country list");
   
   jrecords=jsonrpc.handler.getCountryListandProcid(ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel);   
   //alert('List : '+jrecords["list"]);
   //alert ('List length :' +jrecords["list"].length);
   if(jrecords != null){
      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++) {
//        alert('Adding '+ jrecords["list"][i]+' to dropdown : ');
//          var temStr = jrecords["list"][2*i];
         country.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
//         i++;
      }
   }
}

function populateCountries(appctx)
{
   jsonLoad(appctx);
   
   var country = document.getElementById('country');
   country.options.length=0;
   country.options[0]= new Option('Select One','');
   
//   alert("In getting country list");
   
   jrecords=jsonrpc.handler.getCountryList();   
   //alert('List : '+jrecords["list"]);
   //alert ('List length :' +jrecords["list"].length);
   if(jrecords != null){
      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++) {
//        alert('Adding '+ jrecords["list"][i]+' to dropdown : ');
//          var temStr = jrecords["list"][2*i];
         country.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
//         i++;
      }
   }
}

/*
	This function gets called onload if the context sensitive data is available 
*/
function searchWithContext(withincontext, ctx, ctxval, status, pickerselectionvalue, sourcesytem, ccouser, authlevel, appctx,sortOrder,prevSortId,callingfrom) {

	
	//alert ("values from context are : "+authlevel);

   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onGetSearchListNew';
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
   
   //Added-For QOT_CrossTrack 
		   parameters[i++]='onHold';
		   parameters[i++]=document.getElementById('onHold').value;
  
	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

		   var response = XMLHttpRequestSender('./installSiteSelector.do',
		                              parameters,
		                              'true',
		                              'GET',
		                              '1000000',
		                              '3','regionResults', displayPopupResults);
		
	
}


function saveUnselectedCheckboxes(v) {
/*
alert('saveUnselectedCheckboxes '+v.checked+'v value '+v.value);
 if(!v.checked)
    unSelectedArray[unSelectedArray.length]=v.value;
    */
}


function changeSearchPageData(sortId)
{   
   //alert('Inside changeSearchPageData with sortId : '+ sortId);
   var pageNum = document.getElementById('searchPageNumber').value;   
   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
   showSearchPageData(pageNum, sortId);
}


//param "callingfrom" checks whether the request is coming from "search for site" button or not.(not for" Search Results" tab).
//param "callingTab" checks whether the request is coming from "Search Results" tab or not, 
//and if it is coming from "Search Results" tab then we don't need remaining parameters ie function call will be showSearchPageData('','','','','','','search');
function showSearchPageData(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom) 
{
//alert('AP inside showSearchPageData'+' with sortId : '+sortId+' and procId : '+procId+' prevSortId '+prevSortId+'sortOrder' +sortOrder+' callingfrom '+callingfrom);
      
      if (callingfrom=='searchbutton') {
       installObjs = new Array(); 
       addtoAddressObjs = new Array();
     //  deleteAddressObjs = new Array();
      }
   
 //  alert('installObjs  length after '+installObjs.length); 
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='uname';
   parameters[i++]='Girish';

   var ctxValue=document.getElementById('subSearContextValue').value;
   
   var tabtype = document.getElementById('tabtype').value;
 //  alert('tabtye is ---'+tabtype);
  
//  alert(' subSearContextValue '+ctxValue);
   
   
   parameters[i++]='methodName';
   if(tabtype=='address'){
   		parameters[i++]='onViewAddressBook';
   		//alert('---------in addres for onViewAddressBook---');
   		   parameters[i++]='pickerselectionvalue';
		   parameters[i++]=document.getElementById('pickerselectionvalue').value;
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
		   
		//   alert(' before loading the image pageno is'+pageNo +'--sortId is '+sortId+'-----sortOrder is'+sortOrder+'---prevSortId is'+prevSortId);
	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
//   alert('creating a request '+parameters);

   var response = XMLHttpRequestSender('./installSiteSelector.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults_AddBookData);
		   
		   
		   ///
   }
   else{
   
   		if (trim(ctxValue).length != 0) {
       		parameters[i++]='onGetSearchListNew'; 
     	}
     	else {
       		parameters[i++]='onSubsequentSearch';
     	}
     	
     	   parameters[i++]='customerName';
	   	   //parameters[i++]=document.getElementById('customerName').value;
	   	   //TD#218579 - jishaik start
	   	   var customerName=trim(document.getElementById('customerName').value);	   	   
	   	   if(customerName != null){
   			 if(customerName.indexOf('+') != -1){
   				 customerName=replaceAll(customerName,'+','PLUSULP');
   			 }
   		   }   		   
	   	   parameters[i++]=customerName;
	   	   //TD#218579 - jishaik end
	   	   parameters[i++]='country';
		   parameters[i++]=document.getElementById('country').value;
		   parameters[i++]='customerID';
		   parameters[i++]=document.getElementById('customerID').value;  
   
		   parameters[i++]='city';
		   parameters[i++]=document.getElementById('city').value;
		   parameters[i++]='stateProvince';
		  
		   var stateCode="";
		   if(document.getElementById('country').value=="US"){
		     stateCode=document.getElementById('stateProvince').value;
           }else{
               var state = document.getElementById("stateProvince");
		       stateCodeValue = state.options[state.selectedIndex].text;
	           if((document.getElementById('stateProvince').value != "") && (stateCodeValue.indexOf("-")>0)){
	               var stateCodeArray=stateCodeValue.split("-");
		           stateCode=stateCodeArray[1].trim();
	           }else{
	               stateCode=document.getElementById('stateProvince').value;
	           }
           }
		   // parameters[i++]=document.getElementById('stateProvince').value;
		   parameters[i++]=stateCode;
		   
		   parameters[i++]='siteID';
		   parameters[i++]=document.getElementById('siteID').value;
   
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
		   parameters[i++]='businessEntity';
		   parameters[i++]=document.getElementById('businessEntity').value;
   
		   parameters[i++]='subSearContextValue';
		   parameters[i++]=document.getElementById('subSearContextValue').value;
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
		   
		   //Added-For QOT_CrossTrack 
		   parameters[i++]='onHold';
		   parameters[i++]=document.getElementById('onHold').value;
   
		   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

	   	   var response = XMLHttpRequestSender('./installSiteSelector.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults);  
	   } //end of else    
 
    

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
      //alert('Reading obj at location '+bb+' : '+curObj);
      
      var array = customerObjects[bb].split('|');
     // alert('Size of array after split : '+array.length);
      
      var arrData = '';
      for(var cc=0;cc<array.length;cc++)
      {
         arrData += array[cc]+'\n';   
      }
      //alert(arrData);
   }
}

function changeInstallsitePageData(sortId, procId,sortOrder,prevSortId,callingfrom)
{	
	var pageNum = document.getElementById('installSitePageNumber').value;
	//alert("Caling changeInstallsitepageData for page: " +pageNum +'and sortId : '+ 'and procId : ' +procId );
	//showSearchPageData(pageNum, sortId, procId);
	showSearchPageData(pageNum, sortId, procId,sortOrder,prevSortId,callingfrom);
}

function adjustInstallSiteArray()
{
  // alert('------in adjustInstallSiteArray--');
   
   var installSitesList = document.InstallSiteForm.selectedInstallSites;
    var tabtype = document.getElementById('tabtype').value;
 //  alert('tabtye is ---'+tabtype);
   
   var idString;
   var idStringIndex;
   var id;
   
   if(installSitesList != undefined && installSitesList.length == undefined){   		
   		if(tabtype=='address'){   			
   			idString=installSitesList.value
         	idStringIndex=idString.indexOf("|");         			
         	id = idString.substring(0,idStringIndex);
         	
         	if(installSitesList.checked==true){
         		addressObjs = addVal(addressObjs,idString);
         		
         		deleteAddressObjs = addVal(deleteAddressObjs, id);
         	}
         	else{
         		addressObjs = deleteVal(addressObjs,idString);
         		
         		deleteAddressObjs = deleteVal(deleteAddressObjs, id); 
         	}
   			
   		}
   		else{
   			
   			if(installSitesList.checked==true){
   				installObjs = addVal(installObjs, installSitesList.value);
  			
  				//added to refresh addtoAddressObjs object
  				idString=installSitesList.value
         		idStringIndex=idString.indexOf("|");         			
         		id = idString.substring(0,idStringIndex);
         		//alert('--id is--'+id);
   				addtoAddressObjs = addVal(addtoAddressObjs, id); 
   			}
   			else{
   			  	installObjs = deleteVal(installObjs, installSitesList.value);
  			
  				//added to refresh addtoAddressObjs object
  				idString=installSitesList.value
         		idStringIndex=idString.indexOf("|");         			
         		id = idString.substring(0,idStringIndex);
         		//alert('--id is--'+id);
   				addtoAddressObjs = deleteVal(addtoAddressObjs, id); 
   			
   			}
   			
  						
   		}   		
   }
   else{
   		
   		if(tabtype=='address'){
   		//alert('------in adjustinstallarray in address installSitesList is '+installSitesList);
   		//alert('------in adjustinstallarray in address deleteAddressObjs is '+deleteAddressObjs);
   			for(var d=0;d<installSitesList.length;d++)
   			{
    	 		// alert('inside For loop adjustInstallSiteArray '+installSitesList[d].checked);    	 		
         			idString=installSitesList[d].value
         			idStringIndex=idString.indexOf("|");         			
         			id = idString.substring(0,idStringIndex);
      			if(installSitesList[d].checked==true)
      			{
       				//  alert(d+' - '+installSitesList[d].value);
       				addressObjs = addVal(addressObjs,idString);       				
         			
         			deleteAddressObjs = addVal(deleteAddressObjs, id);
      			}
      			else
     		 	{
        			// alert(d+' - '+installSitesList[d].value);
        			addressObjs = deleteVal(addressObjs,idString);
        			
         			deleteAddressObjs = deleteVal(deleteAddressObjs, id);
      			}
   			}//end of for
   			
   		}
   		else{
   			for(var d=0;d<installSitesList.length;d++)
   			{
    	 		// alert('inside For loop adjustInstallSiteArray '+installSitesList[d].checked);
      			if(installSitesList[d].checked==true)
      			{
       				//  alert(d+' - '+installSitesList[d].value);
         			installObjs = addVal(installObjs, installSitesList[d].value);
         			
         			
         			//added to refresh addtoAddressObjs object
         			idString=installSitesList[d].value
         			idStringIndex=idString.indexOf("|");         			
         			id = idString.substring(0,idStringIndex);
         			addtoAddressObjs = addVal(addtoAddressObjs, id);			
         			
      			}
      			else
     		 	{
        			// alert(d+' - '+installSitesList[d].value);
         			installObjs = deleteVal(installObjs, installSitesList[d].value);
         			
         			//added to refresh addtoAddressObjs object
         			idString=installSitesList[d].value
         			idStringIndex=idString.indexOf("|");         			
         			id = idString.substring(0,idStringIndex);
         			addtoAddressObjs = deleteVal(addtoAddressObjs, id);
      			}
   			}//end of for
   			
   		}//end of tabtype else   		
   }
   
   
 //  alert('After for loop');
}


function addToAddressBook()
	{
	//alert('---in js');	
	   var parameters= new Array();
	   var i=0;
	
	   parameters[i++]='methodName';
	   parameters[i++]='addToAddressBook';
	   parameters[i++]='objectsList';   
	   parameters[i++]= addtoAddressObjs;
	   //alert('------addtoAddressObjs------'+addtoAddressObjs);
	   var a1= document.getElementById('ccouserid').value;
	   parameters[i++]='ccouserid';
   	   parameters[i++]=document.getElementById('ccouserid').value;   
   	   parameters[i++]='authlevel';
       parameters[i++]=document.getElementById('authlevel').value; 
       parameters[i++]='pickerselectionvalue';
	   parameters[i++]=document.getElementById('pickerselectionvalue').value;       
	   
	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);
       
	   var response = XMLHttpRequestSender('./installSiteSelector.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','addressMessage', addressMessageResult);
	 
	}
	
	function addressMessageResult(req,idToChange){
	  	var result = req.responseText;
   		//alert(result);
   		document.getElementById(idToChange).innerHTML=result; 
	
	}
	
	function deleteAddBookData()
	{	
//		alert('test');	   	      
	   var parameters= new Array();
	   var i=0;	
	   parameters[i++]='methodName';
	   parameters[i++]='onDeleteAddressBook';
	   parameters[i++]='objectsList';   
	   parameters[i++]= deleteAddressObjs;
//	   alert('------deleteAddressObjs------'+deleteAddressObjs);
	   var a1= document.getElementById('ccouserid').value;
//	   alert(a1);
	   parameters[i++]='ccouserid';
   	   parameters[i++]=document.getElementById('ccouserid').value;   
   	   parameters[i++]='authlevel';
       parameters[i++]=document.getElementById('authlevel').value; 
       parameters[i++]='pickerselectionvalue';
	   parameters[i++]=document.getElementById('pickerselectionvalue').value;	   
	   //alert('creating a request '+parameters);
	   
	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);
	   parameters[i++]='callingfrom';
  	   parameters[i++]='';
	
	   var response = XMLHttpRequestSender('./installSiteSelector.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','regionResults', addressMessageResult);
	     
	    //since deleteAddressObjs and addressObjs contains data even afer deleting so we need to nullify the objects                     
	    deleteAddressObjs = new Array();
	    addressObjs = new Array();
	
	}
	
	


function showInstallAddBookData(pageNo, sortId, procId,sortOrder,prevSortId,callingTab) 
	{
//  alert('inside showData'+' with sortId : '+sortId+' and procId : '+procId);
/*
   if(pageNo=="-1"&&sortId=="-1")
      deleteAddressObjs = new Array();
   
   if(pageNo=="1"&&sortId!="-1")
      deleteAddressObjs = new Array(); 
  */ 
   var parameters= new Array();
   var i=0;

   parameters[i++]='methodName';
   parameters[i++]='onViewAddressBook';   
   parameters[i++]='pickerselectionvalue';
   parameters[i++]=document.getElementById('pickerselectionvalue').value;   
   parameters[i++]='procId';
   parameters[i++]=procId;

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
   parameters[i++]='callingTab';
   parameters[i++]=callingTab;
   
   parameters[i++]='callingfrom';
   parameters[i++]='';
   
//   alert('loading the image');
	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
//   alert('creating a request '+parameters);

   parameters[i++]='rand';
   parameters[i++]=Math.floor(Math.random()*1001);

   var response = XMLHttpRequestSender('./installSiteSelector.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults_AddBookData);    

}


function showSearchResults(){
		var parameters= new Array();
		var i=0;
   		   parameters[i++]='methodName';
   		   parameters[i++]='onSearchResultsTab';    		   
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
		   parameters[i++]='subSearContextValue';
		   parameters[i++]=document.getElementById('subSearContextValue').value;

		//	Added by Uday for Lucene implementation
		parameters[i++]='customerName';
		var customerName=trim(document.getElementById('customerName').value);	   	   
		if(customerName != null){
		 if(customerName.indexOf('+') != -1){
			 customerName=replaceAll(customerName,'+','PLUSULP');
		 }
		}   		   
		parameters[i++]=customerName;
		parameters[i++]='country';
		parameters[i++]=document.getElementById('country').value;
		parameters[i++]='customerID';
		parameters[i++]=document.getElementById('customerID').value;  
		parameters[i++]='city';
		parameters[i++]=document.getElementById('city').value;
		parameters[i++]='stateProvince';
		var stateCode="";
		if(document.getElementById('country').value=="US"){
		  stateCode=document.getElementById('stateProvince').value;
		  }else{
				var state = document.getElementById("stateProvince");
			 stateCodeValue = state.options[state.selectedIndex].text;
			  if((document.getElementById('stateProvince').value != "") && (stateCodeValue.indexOf("-")>0)){
					var stateCodeArray=stateCodeValue.split("-");
				  stateCode=stateCodeArray[1].trim();
			  }else{
					stateCode=document.getElementById('stateProvince').value;
			  }
		  }
		parameters[i++]=stateCode;
		parameters[i++]='siteID';
		parameters[i++]=document.getElementById('siteID').value;
		parameters[i++]='businessEntity';
		parameters[i++]=document.getElementById('businessEntity').value;


		   
		   parameters[i++]='rand';
		   parameters[i++]=Math.floor(Math.random()*1001);
		   
		   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

	   	   var response = XMLHttpRequestSender('./installSiteSelector.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','regionResults', displayPopupResults); 
			
	}
	
	
function refreshSelectedAll(v){
        
    //alert('------'+v.checked);    
    if(!v.checked){        
        document.InstallSiteForm.selectAllInstallSites.checked = false ;
    }    
    else{
    	document.InstallSiteForm.selectAllInstallSites.checked = checkSelecAll();
    }  
        
  }
  //TD#218579 - jishaik start
function replaceAll(text, strA, strB)
{
    while ( text.indexOf(strA) != -1)
    {
        text = text.replace(strA,strB);
    }
    return text;
}
//TD#218579 - jishaik end
function checkSelecAll(){
		var installSitesList = document.InstallSiteForm.selectedInstallSites;
   
   		for(var d=0;d<installSitesList.length;d++)
   			{
    	 		// alert('inside For loop adjustInstallSiteArray '+installSitesList[d].checked);    	 		
      			if(installSitesList[d].checked==false)
      			{
      			    return false;         			
      			}
      			
   			}//end of for
   			
		return true; 
}