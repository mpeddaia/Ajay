jsonurl = null;  //"/Product/JSON-RPC";// context has to be passed
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

function charValidations(value){
	//var iChars = "!@$%^*()+=[]\\\;./{}|\":<>?";
	var iChars = "!@#$%^&*_";
	trimvalue = trim(value);
	for (var i = 0; i < trimvalue.length; i++) {
  		if ((iChars.indexOf(trimvalue.charAt(i)) != -1) || (trimvalue.charCodeAt(i) > 127)) {
			//trimvalue.focus();
  			return false;
  		}
  	}
	return true;
}


function escapeTxt(os){
	var ns='';
	var t;
	var chr='';
	var cc='';
	var tn='';
	for(i=0;i<256;i++){
		tn=i.toString(16);
		if(tn.length<2)tn="0"+tn;
		cc+=tn;
		chr+=unescape('%'+tn);
	}
	cc=cc.toUpperCase();
	os.replace(String.fromCharCode(13)+'',"%13");
	for(q=0;q<os.length;q++){
		t=os.substr(q,1);
		for(i=0;i<chr.length;i++){
			if(t==chr.substr(i,1)){
				t=t.replace(chr.substr(i,1),"%"+cc.substr(i*2,2));
				i=chr.length;
			}
		}
		ns+=t;
	}
	return ns;
}

//Search Results Page values...

function showSearchPageData(pageNo, sortId, procid,sortOrder,prevSortId,callingfrom)
{
 // alert('inside showData'+' with sortId : '+sortId+'Page no::'+pageNo);

   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
     
//  alert("Product Number Search :"+ document.getElementById('productNumSearchStr').value); 
  //alert("strWithincontext ::"+ document.getElementById('strWithincontext').value);
 // alert("Proc Id ::"+procid);
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='getProductSearchList';
   
   if(document.getElementById('productNumSearchStr').value !=null)
   {
   		parameters[i++]='productNumSearchStr';
   		parameters[i++]=escapeTxt(trim(document.getElementById('productNumSearchStr').value));   		
   }
   if(document.getElementById('productCategory').value!=null)
   {
		parameters[i++]='productCategory';
		parameters[i++]=document.getElementById('productCategory').value;
   		
   	}   
   if(document.getElementById('productFamily').value !=null)
   {
   		parameters[i++]='productFamily';
   		parameters[i++]=document.getElementById('productFamily').value;
   	}
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
  if(document.getElementById('strCCOUserId').value !=null)
  {
   		parameters[i++]='strCCOUserId';
   		parameters[i++]=document.getElementById('strCCOUserId').value;
  }
  if(document.getElementById('strSourceSystem').value !=null)
  {
   		parameters[i++]='strSourceSystem';
   		parameters[i++]=document.getElementById('strSourceSystem').value;
  }
  if(document.getElementById('strStatus').value !=null)
  {
   		parameters[i++]='strStatus';
   		parameters[i++]=document.getElementById('strStatus').value;   
  }
   parameters[i++]='strSelectType';
   parameters[i++]=document.getElementById('strSelectType').value;
   parameters[i++]='strProcId';
   parameters[i++]=procid;
   //alert("Proc ID:"+procid);

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
   
   document.getElementById('grid_1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
  
  // alert('creating a request '+parameters);
   var response = XMLHttpRequestSender('productSelectorDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','productResults', displayPopupResults);

                                   
  // alert('got response : '+response);
  // alert('Showing loading test ');
   
  // document.getElementById('pickerProductsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
}

function changeSearchPageData(sortId,procid,sortOrder,prevSortId,callingfrom)
{   
   //alert('Inside changeSearchPageData with sortId : '+ sortId);
   var pageNum = document.getElementById('searchPageNumber').value;   
   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
   showSearchPageData(pageNum, sortId, procid,sortOrder,prevSortId,callingfrom);
}


function displayPopupResults(req,idToChange) 
{
   //alert('Inside displayPopupResults into '+idToChange);cc
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML=result;
   
   //alert(objs);
   var lineItemsList = document.productSelForm.selectLineItem;
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

////// Front End Validations 
function validateInput(productNum, productCat, productFamily){
	
	var ps = new ProductSelectorAlerts();
	
	if(trim(productCat)==-1 && trim(productFamily)==-1){
		if(trim(productNum).length<=0){
			//return "XXCSS_CT - 650036 : Please enter Product Number or Product Category or Product Family";
			return ps.XXCSS_CT_650036;
		}
		else if(trim(productNum).length<3){
//			return "XXCSS_CT - 650071 : Minimum 3 characters are required for searching the Product Number \nPlease modify and resubmit your search";
			return  ps.XXCSS_CT_650071;
		}
		else if(!charValidations(productNum)) {
			return  ps.XXCSS_CT_650077;
		}
		else return null;
	}
	else if(trim(productCat)==-1 || trim(productFamily)==-1){
		if(trim(productNum).length>0 && trim(productNum).length<3){
			//return "XXCSS_CT - 650071 : Minimum 3 characters are required for searching the Product Number \nPlease modify and resubmit your search";
			return ps.XXCSS_CT_650071;
		}
		else if(!charValidations(productNum)) {
			return  ps.XXCSS_CT_650077;
		}
		else return null;
	}
	else if(trim(productCat)!=-1 && trim(productFamily)!=-1){
		if(trim(productNum).length>0 && trim(productNum).length<3){
			//return "XXCSS_CT - 650071 : Minimum 3 characters are required for searching the Product Number \nPlease modify and resubmit your search";
			return ps.XXCSS_CT_650071;
		}
		else if(!charValidations(productNum)) {
			return  ps.XXCSS_CT_650077;
		}
		else return null;
	}
	else return null;
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

function adjustProdArray()
{
   var productsList = document.productSelForm.selectLineItem;
   if(productsList != undefined && productsList.length == undefined){
     objs = addVal(objs, productsList.value);
   }
   else{
		if(productsList != undefined ) {
		   for(j=0;j<productsList.length;j++)
		   {
				if (productsList[j].checked == true)
				{
					objs = addVal(objs,productsList[j].value);
				}
				else
				{
					objs = deleteVal(objs,productsList[j].value);
				}
		   } // END OF for
		} // end of if productsList undefined condition
   } // end of else
   //alert(objs.length);
}

function refreshSelectedAll(v)
{
    //alert('------'+v.checked);
    if(!v.checked){
        document.productSelForm.selectAllLineItem.checked = false ;
    }
    else{
    	document.productSelForm.selectAllLineItem.checked = checkSelectAll();
    }
}
  
function checkSelectAll()
{
	var productsList = document.productSelForm.selectLineItem;
   
   	for(var d=0;d<productsList.length;d++) {
   		// alert('inside For loop '+productsList[d].checked);    	 		
   		if(productsList[d].checked==false) {
		    return false;
		}
	}//end of for
	
	return true;
}

