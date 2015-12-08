var xmlHttp = null;
var requestType="";
var selectedUserId=null;
var parentElementId = null;

function setParentElement(element){
	parentElementId = element;
	//alert('Parent element id set to : '+parentElementId);
}

function searchUsersPagDD(divname, sortid){	
	var pageNum =  document.getElementById('userIdPageNumber').value;
	searchItems(divname, pageNum, sortid,'ASC','0');
}


function searchUsers(divname){	
	//Hasthi
	var searchStr =	document.getElementById('userIdSearchStr').value;
	var sortid =	document.getElementById('sortId').value;
	if(validateMinLength(document.getElementById('userIdSearchStr').value,1)){
		alert ("XXCSS_CT-650038 : Please enter User ID or User Name.");
		return;
	}
 	else if(validateMinLength(document.getElementById('userIdSearchStr').value,3)){
		alert ("XXCSS_CT-650040 : Minimum 3 characters are required for searching the User ID/User Name. Please modify and resubmit your search.");
		return;
		
	}else if (validateMaxLength(document.getElementById('userIdSearchStr').value,100)){
     	alert ("XXCSS_CT-650041 : Maximum of 100 characters allowed for searching User ID/User Name . Please modify and resubmit your search.");
		return;     	
    }
    else if (validateAscii(document.getElementById('userIdSearchStr').value)) {
	    alert("Entry has special characters that are not allowed.\nPlease remove them and try again.");
	    return;
	}
    else if(document.getElementById('userType').value != null 
     			&& document.getElementById('userType').value != "INTERNAL"){
    	if(document.getElementById('compNameSearchStr') !=null) {
		 	if(validateMinLength(document.getElementById('compNameSearchStr').value,3)){
				alert ("XXCSS_CT-650042 : Minimum 3 characters are required for searching the CompanyName. Please modify and resubmit your search.");
				return;
			}
		 	else if (validateMaxLength(document.getElementById('compNameSearchStr').value,40)){
		     	alert ("XXCSS_CT-650043 : Maximum of 40 characters allowed for searching Company Name. Please modify and resubmit your search.");
		     	return;
	     	}
	    	else
		    	searchItems(divname, -1, sortid,'ASC','0');
    	}
	} 
	else{
		searchItems(divname, -1, sortid,'ASC','0');
	}
}

function searchItems(divname, pageNo, sortId,sortOrder,prevSortId){


	if(pageNo=="-1"&&sortId=="-1")
     selectedUserId=null;

   if(pageNo=="1"&&sortId!="-1")
     selectedUserId=null;
      
   var parameters= new Array();
   var i=0;
     
     parameters[i++] = 'methodName';
     parameters[i++] = 'getUserIdSearchFilterList';
     
     parameters[i++]='userIdSearchStr';
	 parameters[i++]=document.getElementById('userIdSearchStr').value;

	if(document.getElementById('compNameSearchStr') != null){
	
	    parameters[i++]='compNameSearchStr';
	 	parameters[i++]=document.getElementById('compNameSearchStr').value;
	 	
	 	/*
     	parameters[i++]='userName';
	 	parameters[i++]=document.getElementById('userName').value;
	 	*/
	 }
	 parameters[i++]='ccouser';
     parameters[i++]=document.getElementById('ccouser').value;
     
     parameters[i++]='context';
     parameters[i++]=document.getElementById('context').value;
     
     parameters[i++]='sourcesystem';
     parameters[i++]=document.getElementById('sourcesystem').value;	

     parameters[i++]='userType';
     parameters[i++]=document.getElementById('userType').value;	
	
     parameters[i++]='selectionType';
     parameters[i++]=document.getElementById('selectionType').value;
	 parameters[i++]='sortOrder';
	 parameters[i++]=sortOrder;
	 parameters[i++]='prevSortId';
	 parameters[i++]=prevSortId;

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
	
	actionurl = "./userIdSelector.do";
	
	var response = XMLHttpRequestSender(actionurl, parameters, 'true', 'GET',  
									'1000000', '3', divname, displayResults);
									
	document.getElementById('dataGrid').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   									
}

function displayResults(req, divToChange) 
{
   //alert('Inside displayResults into '+divToChange);
   var result = req.responseText;
   //alert(result);
   //alert('divToChange :' + divToChange);
   document.getElementById(divToChange).innerHTML=result;
}

function XMLHttpRequestSender()
{
	//alert('in XMLHttpRequestSender');
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
            
            if (XMLHttpReq.readyState == 4) 
            {
            	//alert('Status : '+XMLHttpReq.status);
               clearTimeout(timer);               
               if (XMLHttpReq.status == 200) 
               {
                   callBackFunction(XMLHttpReq,idToChange);             
               }
               else{
              	// alert('in else alert');
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


function retainUserId(userId){
	selectedUserId = userId;
}

function transferUserIdToParent(){
	
	//Hasthi
	//alert('parentElementId : '+ parentElementId);	
	//alert('selectedUserId : '+ selectedUserId);
	var temp="";
	var seletedUsrsstr="";
	if(selectedUserId == null){
		alert('No user selected');
	} else{
		for(var i=0; i<document.getElementById('FormName').elements.length; i++){
			var elem = document.FormName.elements[i];
		    if(elem.type=='checkbox'){
		      if (elem.checked==true) {
		      	temp= elem.value;
		      	temp=temp+",";
		      	seletedUsrsstr=seletedUsrsstr+temp;
			  }
		    } else if(elem.type=='radio'){
		       if (elem.checked==true) {
			      	seletedUsrsstr=elem.value;
			  }
		    } 
		  }		
		  alert('Selected list of users: '+seletedUsrsstr);
			//alert('parentElementId current value : '+ self.creator.document.getElementById(parentElementId).value);		
			self.creator.document.getElementById(parentElementId).value = seletedUsrsstr;
			self.close();		
	}
}

function printUser(){
	var alertMessage = '';
	if(selectedUserId == null){
		alertMessage = 'No user selected';
	}
	else {
		alertMessage = 'Selected USer is : '+selectedUserId;
	}		
	//alert(alertMessage);	
}


function adjustCustArray()
{

   var customersList = document.FormName.selectLineItem;

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

}
//Validation for minimum length
function validateMinLength(value,pLenght){
		if(!trim(value) || trim(value).length<pLenght )
				 return true;
	
	return false;
}

//Validataion maximum for length > 40

function validateMaxLength(value,pLenght){

	if(value.length>pLenght )
		 return true;
	
	return false;
}

//Special characters validations

function charValidations(value){
	 var iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?";
	  trimvalue = trim(value);
	  for (var i = 0; i < trimvalue.length; i++) {
	  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
		  	return false;
	  	}
	  }
	return true;
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


function commaValidation(value){
		 var iChars = ",";
		  trimvalue = trim(value);
		  for (var i = 0; i < trimvalue.length; i++) {
		  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
			  	return false;
		  	}
		  }
		return true;
		}
		
		function extCharValidations(value){
		 var iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?&#";
		  trimvalue = trim(value);
		 if (trimvalue.indexOf(" ") != -1) {
		  		return false;
	  	 }
		  for (var i = 0; i < trimvalue.length; i++) {
		  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
			  	return false;
		  	}		  	
		  }
		  
		return true;
	}

// Checking ASCII characters if not, displaying the alert message ---MLS Changes by kgudipat
function validateAscii(str) {
	//var str = obj.value;
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {			
			return true;
		}
	}
	return false;
}
	