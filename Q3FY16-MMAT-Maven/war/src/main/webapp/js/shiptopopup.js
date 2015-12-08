/*<!-- JS = shiptopopup.js -->
<!--
Project Name : Synergy for TD2417
--------------------------------------------------------------------
Date               Author			Comments
--------------------------------------------------------------------
24-OCt-2007			msahoo 			Intial Draft
-->
*/

 

    	
	function showSearchPageData(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
		  if(callingfrom =='searchbutton')
			{
			  shipToObjects = new Array();  
			  addtoAddressObjs = new Array();
			  deleteAddressObjs = new Array();
			}
	//	alert('inside showData'+' with sortId : '+sortId);
//		//alert('test');
	
	  // alert('inside showData'+' with procId : '+procId);
	      
	   var parameters= new Array();
	   var i=0;
		 // alert('inside showData'+' with sortId : '+sortId);
	   parameters[i++]='methodName';
	   parameters[i++]='onGetSearchList';
	   parameters[i++]='shipToName';
	   parameters[i++]=document.getElementById('shipToName').value;
	   parameters[i++]='shipToID';   
	   parameters[i++]=document.getElementById('shipToID').value;
	   parameters[i++]='procId';
	   parameters[i++]=procId;
	   parameters[i++]='sortOrder';
	   parameters[i++]=sortOrder;
	   parameters[i++]='prevSortId';
	   parameters[i++]=prevSortId;
	   parameters[i++]='callingfrom';
	   parameters[i++]=callingfrom;
	   parameters[i++]='country';   
	   parameters[i++]=document.getElementById('country').value;
	   parameters[i++]='stateProvince';   
	   parameters[i++]=document.getElementById('stateProvince').value;
	   parameters[i++]='city';   
	   parameters[i++]=document.getElementById('city').value;
	   parameters[i++]='context';   
	   parameters[i++]=document.getElementById('context').value;
	   parameters[i++]='contextValue';   
	   parameters[i++]=document.getElementById('contextValue').value;
	   parameters[i++]='status';   
	   parameters[i++]=document.getElementById('status').value;
	   parameters[i++]='pickerSelection'; 
	   parameters[i++]=document.getElementById('pickerSelection').value; 
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='userType'; 
	   parameters[i++]=document.getElementById('userType').value;
	   parameters[i++]='strCCOUserId'; 
	   parameters[i++]=document.getElementById('strCCOUserId').value;
	   parameters[i++]='strAuthLevel'; 
	   parameters[i++]=document.getElementById('strAuthLevel').value;
	   parameters[i++]='strSourceSystem'; 
	   parameters[i++]=document.getElementById('strSourceSystem').value;
   
       
	  
	   if (((document.getElementById('userType').value)=="Internal") || ((document.getElementById('userType').value)=="INTERNAL"))
	   {
	  		parameters[i++] = 'businessEntity';
	  		parameters[i++] = document.getElementById('businessEntity').value;	  		
	   }
	 
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

   	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);

	  //alert('creating a request '+parameters);
	   
	   var response = XMLHttpRequestSender('./shiptoselect.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','shiptoresults', displayPopupResults);
	
	     document.getElementById('shiptoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                
	   //alert('got response : '+response);
		  //alert('Showing loading test ');
	    
	    //alert('after');
	 
	}
	/*  End Of Team Modification  */
	function changeSearchPageData(sortId,procId,sortOrder,prevSortId,callingfrom)
	{   
	   //alert('Inside changeSearchPageData with sortId : '+ sortId);
	   var pageNum = document.getElementById('searchPageNumber').value;   
	   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
	   showSearchPageData(pageNum,sortId,procId,sortOrder,prevSortId,callingfrom);
	}

	 // This Java script function is called when requst come from Address Book Tab for Pagination and sorting logic

	 function showAddressBookData(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
	//	 alert("inside showAddressBookData");
	
	  // alert('inside showData'+' with procId : '+procId);
	      
	   var parameters= new Array();
	   var i=0;
		 // alert('inside showData'+' with sortId : '+sortId);
	   parameters[i++]='methodName';
	   parameters[i++]='onGetAddressBookList';
	   parameters[i++]='shipToName';
	   parameters[i++]=document.getElementById('shipToName').value;
	   parameters[i++]='shipToID';   
	   parameters[i++]=document.getElementById('shipToID').value;
	   parameters[i++]='procId';
	   parameters[i++]=procId;
	   parameters[i++]='sortOrder';
	   parameters[i++]=sortOrder;
	   parameters[i++]='prevSortId';
	   parameters[i++]=prevSortId;
	   parameters[i++]='callingfrom';
	   parameters[i++]=callingfrom;
	   parameters[i++]='country';   
	   parameters[i++]=document.getElementById('country').value;
	   parameters[i++]='stateProvince';   
	   parameters[i++]=document.getElementById('stateProvince').value;
	   parameters[i++]='city';   
	   parameters[i++]=document.getElementById('city').value;
	   parameters[i++]='context';   
	   parameters[i++]=document.getElementById('context').value;
	   parameters[i++]='contextValue';   
	   parameters[i++]=document.getElementById('contextValue').value;
	   parameters[i++]='status';   
	   parameters[i++]=document.getElementById('status').value;
	   parameters[i++]='pickerSelection'; 
	   parameters[i++]=document.getElementById('pickerSelection').value; 
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='userType'; 
	   parameters[i++]=document.getElementById('userType').value;
	   parameters[i++]='strCCOUserId'; 
	   parameters[i++]=document.getElementById('strCCOUserId').value;
	   parameters[i++]='strAuthLevel'; 
	   parameters[i++]=document.getElementById('strAuthLevel').value;
	   parameters[i++]='strSourceSystem'; 
	   parameters[i++]=document.getElementById('strSourceSystem').value;
	   parameters[i++]='strShipToTabType'; 
	   parameters[i++]=document.getElementById('strShipToTabType').value;
	  
	   if (((document.getElementById('userType').value)=="Internal") || ((document.getElementById('userType').value)=="INTERNAL"))
	   {
	  		parameters[i++] = 'businessEntity';
	  		parameters[i++] = document.getElementById('businessEntity').value;	  		
	   }
	
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

   	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);

	   //alert('creating a request '+parameters);
	   
	   var response = XMLHttpRequestSender('./shiptoselect.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','shiptoresults', addressMessageResult);
	
	     document.getElementById('shiptoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                
	   //alert('got response : '+response);
		  // alert('Showing loading test ');
	    
	    // alert('after');
	}
	
    
	function changeAddressBookData(sortId,procId,sortOrder,prevSortId,callingfrom)
	{   
	   //alert('Inside changeAddressBookData with sortId : '+ sortId);
	   var pageNum = document.getElementById('searchPageNumber').value;   
	   //alert('Calling page data for searchPageNumber : '+pageNum+' and sortId : '+sortId);
	   showAddressBookData(pageNum,sortId,procId,sortOrder,prevSortId,callingfrom);
	}
	
   	//for callback
	function CallBackState(req,idToChange)
	{
		var result = req.responseText;	
		//document.getElementById(idToChange).innerHTML=result;
	}

function displayPopupResults(req,idToChange) 
{

 // alert('Inside displayPopupResults into '+idToChange);
   var result = req.responseText;
  // alert(result);
   document.getElementById(idToChange).innerHTML=result;
//   alert('shipToObjects' + shipToObjects);
 //  alert('form: '+document.shiptoFormName);
  // alert('checkbox elements : '+document.shiptoFormName.selectLineItem);
  var selection = document.getElementById('pickerSelection').value;
  //alert(selection);
	if(selection=='MULTIPLE' || selection=='Multiple' || selection=='multiple'){
   var lineItemsList = document.shiptoFormName.selectLineItem;
// alert('lineItemsList..............'+lineItemsList);
 // alert(shipToObjects.length);
 // alert(document.shiptoFormName);
   if(lineItemsList.length)
	{
		//alert('more than one checkbox found');
	//	alert(lineItemsList.length);
		for(j=0;j<shipToObjects.length;j++)
	   {
	      for(k=0;k<lineItemsList.length;k++)
	      {
	         //alert('shipToObjects[j] : '+shipToObjects[j]);
	       //  alert('lineItemsList[k].value : '+lineItemsList[k].value);
	         if(shipToObjects[j]==lineItemsList[k].value)
	            lineItemsList[k].checked="true";
	      }
	   }
		
	}
	else
	{
		//alert('only one checlbox found');
		for(j=0;j<shipToObjects.length;j++)
	   {  
	         //alert('shipToObjects[j] : '+shipToObjects[j]);
	         //alert('lineItemsList[k].value : '+lineItemsList[k].value);
	         if(shipToObjects[j]==lineItemsList.value)
	            lineItemsList.checked="true";
	     
	   }
	
	}
   
   }
   else
   {
   //do nothing
   }
   //alert("tab type selected:"+document.getElementById("strShipToTabType").value);
   var tabType=document.getElementById("strShipToTabType").value;
   var vUserType=document.getElementById('userType').value;
   //alert("User Type in displayPopupResults :" +vUserType);
   if(tabType!='undefined' && tabType!=null && tabType!=""){
   		if(tabType =="search"){
   		    // alert("search");
   			document.getElementById("button_selectShipTo").style.display='block';
   			document.getElementById("button_remove").style.display='none';
			document.getElementById("button_addShipToAdd").style.display='block';
   		}
   		else{
   			document.getElementById("button_selectShipTo").style.display='block';
   			document.getElementById("button_remove").style.display='block';
   			document.getElementById("button_addShipToAdd").style.display='none';
   		}  		
   	}	
   
   }

   function jsonLoad(){
		try {
			//alert('Inside jsonLoad()...');
		   jsonrpc = new JSONRpcClient('JSON-RPC');
		  //alert('jsonrprc : '+ jsonrpc);
		  //alert('Page loaded completely');
		} 
		catch(e) {
		  if(e.message) alert(e.message);
		  else alert(e);
		}
	}

	function getStates(strCCOUserId, strSourceSystem) {
	    jsonLoad();

	   //alert("---inside getstates----");
	   //clear the states dropdown
	   var stateProvinceObj = document.getElementById('stateProvince');    
	   stateProvinceObj.options.length=0;        
	   stateProvinceObj.options[0]= new Option('Select One','');
		  
	   var strcountrycode = document.getElementById('country').value;

	   //alert("Selected country code is : " + strcountrycode);
	   
	  // alert('country code '+strcountrycode);
	  // alert('strCCOUserId  '+strCCOUserId);
	   jrecords=jsonrpc.handler.getStateList(strcountrycode,strCCOUserId,strSourceSystem);
	   if(jrecords != null) {
		  for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++){
			 //alert('Adding '+ jrecords["list"][i]+' to dropdown : '+stateProvinceObj);
			 if(jrecords["list"][i]!= null){
         	stateProvinceObj.options[j]= new Option(jrecords["list"][i] +" - "+ jrecords["list"][i+1], jrecords["list"][i]);
         	//alert("in IF =" + jrecords["list"][i]);
         }
         else{
         	stateProvinceObj.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i+1]);
         	//alert("in else =" + jrecords["list"][i]);
         }
	    }
	   }  else {
    		alert('No states available for this country..');
		}    
	}


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
           // window.status="Method Get - XMLHttpReq.readyState = "+XMLHttpReq.readyState+"XMLHttpReq.status = "+XMLHttpReq.status;     
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
         		//alert("state" +XMLHttpReq.readyState);	
               if (XMLHttpReq.readyState == 4) 
               {
               		//alert("status" +XMLHttpReq.status);	
                  clearTimeout(timer);
                  if (XMLHttpReq.status == 200) 
                  {
                         callBackFunction(XMLHttpReq,idToChange);             
                   }
               }
           // window.status="Method Get - XMLHttpReq.readyState = "+XMLHttpReq.readyState+"XMLHttpReq.status = "+XMLHttpReq.status;     
         XMLHttpReq.send(UrlParameters);
         }
      }
      
}


	//Check box
	
	function adjustContArray()
	{
		//alert('inside adjustContArray');
	   
	  // alert(shipToObjects.length);
	   
	     var shipToNameList = document.shiptoFormName.selectLineItem;
    // alert("shipToNameList  is :"+shipToNameList);
	// alert("shipToNameList.length :"+shipToNameList.length);	 
     
	 var tabtype = (document.getElementById("button_remove").style.display=='block')?"address":"search";
	// alert("tabtype : "+tabtype);
   
   if(shipToNameList != undefined && shipToNameList.length == 2){   
		// alert('shipToNameList is not undefined shipToNameList.length is undefined IF 1111111 ---'+tabtype);
   		if(tabtype=='address'){
   			if(shipToNameList[0].checked ==true) {
   				//alert("Address tab one record condition checked true");
				//alert(" address one record add :billToNameList[1].value in IF is ::"+ billToNameList[1].value);
				//alert(" address one record add : billToNameList[1].value in billToNameList[d].checked true is ::"+ billToNameList[1].value);
	  			shipToObjects = addVal(shipToObjects, shiplToNameList[1].value);			
				//alert('address one record add : shipToObjects inshipToNameList[d].checked true is :'+shipToObjects);
				
				var	shipToIdArray=shipToNameList[1].value.split("|");
				//alert(" address one record add : shipToIdArray in shipToNameList[d].checked true is ::"+ shipToIdArray);
				//alert(" address one record add : Bill To Id from shipToIdArray in shipToNameList[d].checked true is ::"+ shipToIdArray[0]);
	   			deleteAddressObjs = addVal(deleteAddressObjs, shipToIdArray[0]);
				 //alert('address one record add : deleteAddressObjs in shipToNameList[d].checked true is :'+deleteAddressObjs);
			}
			else {
				//alert("Serch tab one record condition checked false");
					if(shipToObjects.length >0) {
						//alert(" address one record delete :shipToNameList[1].value in shipToNameList[d].checked false is ::"+ shipToNameList[1].value);
			  			shipToObjects = deleteVal(shipToObjects, shipToNameList[1].value);			
						//alert('address one record delete :shipToObjects in shipToNameList[d].checked false :'+shipToObjects);
					}
					
					if(deleteAddressObjs.length > 0) {
						var	shipToIdArray=shipToNameList[1].value.split("|");
						//alert(" address one record delete : shipToIdArray in shipToNameList[d].checked false is ::"+ shipToIdArray);
						//alert(" address one record delete : Ship To Id from shipToIdArray in shipToNameList[d].checked false is ::"+ shipToIdArray[0]);
						deleteAddressObjs = deleteVal(deleteAddressObjs, shipToIdArray[0]);
					}
				}
   		} // end  of address book tab
   		else if(tabtype=='search'){
   		         //alert("Serch tab one record condition");
   				if(shipToNameList[0].checked ==true) {
   					//alert("Serch tab one record condition checked true");
					//alert(" search one record add:shipToNameList[1].value in shipToNameList[0].checked true is ::"+ shipToNameList[1].value);
		  			shipToObjects = addVal(shipToObjects, shipToNameList[1].value);			
					//alert('search one record add:shipToObjects in shipToNameList[0].checked  true is ---'+shipToObjects);
					
					var	shipToIdArray=shipToNameList[1].value.split("|");
					//alert(" search one record add: shipToIdArray in shipToNameList[0].checked true ::"+ shipToIdArray);
					//alert(" search one record add:Ship To Id from shipToIdArray in shipToNameList[0].checked true is ::"+ shipToIdArray[0]);
					addtoAddressObjs = addVal(addtoAddressObjs, shipToIdArray[0]);
					//alert('search one record add:addtoAddressObjs in shipToNameList[0].checked true ::'+addtoAddressObjs);
			} else {
					//alert("Search tab one record condition checked false");
					if(shipToObjects.length >0) {
					//alert(" search one record delete:shipToNameList[1].value in shipToNameList[0].checked false ::"+ shipToNameList[1].value);
		  			shipToObjects = deleteVal(shipToObjects, shipToNameList[1].value);			
					//alert('search one record delete :shipToObjects in shipToNameList[0].checked  is false :'+shipToObjects);
				    }
				    if(addtoAddressObjs.length > 0) {
						var	shipToIdArray=shipToNameList[1].value.split("|");
						//alert(" search one record delete: shipToIdArray in shipToNameList[d].checked false is ::"+ shipToIdArray);
						//alert(" search one record delete: Ship To Id from shipToIdArray in shipToNameList[d].checked false is ::"+ shipToIdArray[0]);
						addtoAddressObjs = deleteVal(addtoAddressObjs, shipToIdArray[0]);
					}				
				}
			} //end of search tab if   		  		
   } //when there are more than one record in check all box the following code will be executed
   else{
	   //alert("Start of ELSE ");
   	if(shipToNameList != undefined ) {	

   		if(tabtype=='address'){
   		//alert('------in adjustContArray in address shipToNameList is '+shipoNameList);
   		//alert('------in adjustContArray in address deleteAddressObjs is '+deleteAddressObjs);
   			for(var d=0;d<shipToNameList.length;d++)
   			{
				if(d == 0)
					continue;
    	 		 //alert('inside For loop adjustInstallSiteArray '+shipToNameList[d].checked);
      			if(shipToNameList[d].checked==true)
      			{
       				//alert(d+' - '+shipToNameList[d].value);
					shipToObjects = addVal(shipToObjects, shipToNameList[d].value);
					
					var	shipToIdArray=shipToNameList[d].value.split("|");
					//alert(" address add:shipToIdArray in shipToNameList[d].checked true  is ::"+ shipToIdArray);
					//alert(" address add: Ship To Id from shipToIdArray in shipToNameList[d].checked true is ::"+ shipToIdArray[0]);
         			deleteAddressObjs = addVal(deleteAddressObjs, shipToIdArray[0]);
      			}
      			else
     		 	{
        			//alert(" address add :shipToNameList[0].checked ::"+ shipToNameList[0].checked);
					//alert(d+' - '+shipToNameList[d].value);
					if(shipToObjects.length > 0) {
         				shipToObjects = deleteVal(shipToObjects, shipToNameList[d].value);
					}
					if(deleteAddressObjs.length > 0) {
						var	shipToIdArray=shipToNameList[d].value.split("|");
						//alert(" address delete: shipToIdArray in shipToNameList[d].checked false is ::"+ shipToIdArray);
						//alert(" address delete: Ship To Id from shipToIdArray in shipToNameList[d].checked false is ::"+ shipToIdArray[0]);
						deleteAddressObjs = deleteVal(deleteAddressObjs, shipToIdArray[0]);
					}
      			}
   			}//end of for
   			
   		}
   		else{
   			for(var d=0;d<shipToNameList.length;d++)
   			{
				if(d == 0)
					continue;
    	 		// alert('inside For loop adjustContArray '+billToNameList[d].checked);
      			if(shipToNameList[d].checked==true)
      			{
					//alert(d+' - '+billToNameList[d].value);
         			shipToObjects = addVal(shipToObjects, shipToNameList[d].value);
					
					var	shipToIdArray=shipToNameList[d].value.split("|");
					//alert(" Search add: billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray);
					//alert(" Search add: Bill To Id from billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray[0]);
					addtoAddressObjs = addVal(addtoAddressObjs, shipToIdArray[0]);
					//alert('Search add: addtoAddressObjs billToNameList[d].checked is true ## ---'+addtoAddressObjs);
					
      			}
      			else
     		 	{
        			 //alert(" search delete :billToNameList[0].checked ::"+ billToNameList[0].checked);
					//alert(d+' - '+billToNameList[d].value);
					//alert("billToObjects.length is B4 Delete ::"+billToObjects.length);
					if(shipToObjects.length > 0) {
         				shipToObjects = deleteVal(shipToObjects, shipToNameList[d].value);
					}
					
					if(addtoAddressObjs.length >0 ) {
						var	shipToIdArray=shipToNameList[d].value.split("|");
						//alert(" Search delete: billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray);
						//alert(" Search delete: Bill To Id from billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray[0]);
						addtoAddressObjs = deleteVal(addtoAddressObjs, shipToIdArray[0]);
						//alert('Search delete: addtoAddressObjs billToNameList[d].checked is false ## ---'+addtoAddressObjs);
					}
					
      			}
   			}//end of for
   			
   		}//end of tabtype else 
	} // end of billToNameList != undefined
   }   
	   //alert("LAST : addtoAddressObjs ::"+addtoAddressObjs);
	   //alert("LAST : deleteAddressObjs ::"+deleteAddressObjs);
	   //alert("LAST : billToObjects ::"+billToObjects);     
	}


function transferData(shipToObjects)
	{ 
	   //alert('inside transferData with objs : '+billToObjects);
	   
	    var str = "";
	  
	
	
	   var i=0;
	   
	   var v1='ShiptoSelector';
		var v2='ShiptoID';
		var v3='ShiptoName';
		var v4='Address1';
		var v5='Address2';
		var v6='Address3';
		var v7='City';
		var v8='State';
		var v9='PostalCode';
		var v10='Country';
		var v11='Status';
		
		//alert('before');
		var xSTR=makeJSONStr(shipToObjects,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11);
		//alert(xSTR);
		self.creator.xtrack_shiptoselector(xSTR);
	
	
		
	   self.close();
	
	}



 
   // This function take 4 parameters
// obj- array object  having the result set in the string format as  "id|value" ex: 123|nicholas
//		"123" is id and "nicholas" is the value.. relating to customer selector 
//		  "123" would be the customer ID and "nicholas" would be the customer name
// v1- is the String for type of selector ex:"CustomerSelector"
// v2- is the String for name of the first field ex:"CustomerID"
// v3- is the String for name of the second field ex:"CustomerName"
// returns JSON String
// valid only for selectors having to pass name-value pairs to the parent form
// ex: billto and customer selector


function makeJSONStr(obj,v1,v2,v3)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ '","'+v3+'" : "'+sl[1]+'" }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}

function makeJSONStr(obj,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ '","'+v3+'" : "'+sl[1]+'","'+v4+'" : "'+sl[2]+'","'+v5+'" : "'+sl[3]+'","'+v6+'" : "'+sl[4]+'","'+v7+'" : "'+sl[5]+'","'+v8+'" : "'+sl[6]+'","'+v9+'" : "'+sl[7]+'","'+v10+'" : "'+sl[8]+'","'+v11+'" : "'+sl[9]+'" }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}




function retainShiptoId(shiptoID){
		selectedShiptoId = shiptoID;
		//alert(selectedBilltoId);
}

//returns the selected values
function addRemove()
{
	
}


function showShipToAddressBookData(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
  //alert('inside showData'+' with sortId : '+sortId+' and procId : '+procId);
  addtoAddressObjs = new Array();
  deleteAddressObjs = new Array();

   if(pageNo=="-1"&&sortId=="-1")
      shipToObjects = new Array();    
   
   var parameters= new Array();
   var i=0;

   parameters[i++]='methodName';
   parameters[i++]='onViewAddressBook';
   parameters[i++]='withinContext'; 
   parameters[i++]=document.getElementById('withinContext').value;
   parameters[i++]='context';   
   parameters[i++]=document.getElementById('context').value;
   parameters[i++]='contextValue';   
   parameters[i++]=document.getElementById('contextValue').value;
   parameters[i++]='status';   
   parameters[i++]=document.getElementById('status').value;
   parameters[i++]='strCCOUserId';
   parameters[i++]=document.getElementById('strCCOUserId').value;   
   parameters[i++]='strAuthLevel';
   parameters[i++]=document.getElementById('strAuthLevel').value; 
   parameters[i++]='pickerSelection';
   parameters[i++]=document.getElementById('pickerSelection').value;
   parameters[i++]='userType'; 
   parameters[i++]=document.getElementById('userType').value;
   parameters[i++]='strSourceSystem';
   parameters[i++]=document.getElementById('strSourceSystem').value;
   parameters[i++]='strShipToTabType'; 
   parameters[i++]=document.getElementById('strShipToTabType').value;
   
   parameters[i++]='procId';
   parameters[i++]=procId;
   parameters[i++]='sortOrder';
   parameters[i++]=sortOrder;
   parameters[i++]='prevSortId';
   parameters[i++]=prevSortId;
   parameters[i++]='callingfrom';
   parameters[i++]=callingfrom;

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

    parameters[i++]='rand';
    parameters[i++]=Math.floor(Math.random()*1001);
   
//   alert('loading the image');
	   document.getElementById('shiptoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
//   alert('creating a request '+parameters);

   var response = XMLHttpRequestSender('./shiptoselect.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','shiptoresults', addressMessageResult);

}



function addToAddressBook()
	{
	  // alert('---in addToAddressBook');	
	   var parameters= new Array();
	   var i=0;
	
	   parameters[i++]='methodName';
	   parameters[i++]='addShipToAddressBook';
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='shipToObjectsList';   
	   parameters[i++]= addtoAddressObjs;
	   //alert('------addtoAddressObjs------'+addtoAddressObjs);
	   var a1= document.getElementById('strCCOUserId').value;
//	   alert(a1);
	   parameters[i++]='strCCOUserId';
   	   parameters[i++]=document.getElementById('strCCOUserId').value;   
   	   parameters[i++]='strAuthLevel';
       parameters[i++]=document.getElementById('strAuthLevel').value; 
       parameters[i++]='pickerSelection';
	   parameters[i++]=document.getElementById('pickerSelection').value;
	   parameters[i++]='userType'; 
	   parameters[i++]=document.getElementById('userType').value; 
	   parameters[i++]='strSourceSystem';
	   parameters[i++]=document.getElementById('strSourceSystem').value;

       parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);
       
	   var response = XMLHttpRequestSender('./shiptoselect.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','addressMessage', addToAddress_addressMessageResult);
	 
	}
	
	function addressMessageResult(req,idToChange){
	//var result= req.responseText;	
	//alert('----'+result);   
    var result = req.responseText;
	//alert("result is:"+result);
	if(document.getElementById(idToChange)!=null){
		document.getElementById(idToChange).innerHTML="<left>&nbsp;"+result+"</left>";
	}
	var tabType='address';
	// alert(" TAB TYPE : "+tabType);
	var vUserType=document.getElementById('userType').value;
	//alert("User Type in addressMessageResult :" +vUserType);
	if(tabType!='undefined' && tabType!=null && tabType!=""){
   		if(tabType =="search"){
   		    // alert("search");
   			document.getElementById("button_selectShipTo").style.display='block';
   			document.getElementById("button_remove").style.display='none';
			/*if((vUserType!= 'undefine' && vUserType!=null && vUserType!='' )&& (vUserType == 'INTERNAL' || vUserType== 'Internal' || vUserType == 'internal')) {
   				document.getElementById("button_addBillToAdd").style.display='block';
			} */
			document.getElementById("button_addShipToAdd").style.display='block';
   		}
   		else{
   			document.getElementById("button_selectShipTo").style.display='block';
   			document.getElementById("button_remove").style.display='block';
   			document.getElementById("button_addShipToAdd").style.display='none';
   		} 
	  }
	}
	
	function addToAddress_addressMessageResult(req,idToChange){
	//var result= req.responseText;	
	//alert('----'+result);   
    var result = req.responseText;
   //alert("result is:"+result);
   document.getElementById(idToChange).innerHTML="<left>&nbsp;"+result+"</left>";
   
    // alert(" TAB TYPE : "+tabType);
   
   			document.getElementById("button_selectShipTo").style.display='block';
   			document.getElementById("button_remove").style.display='none';
   			document.getElementById("button_addShipToAdd").style.display='block';
   		
	}
	
	function deleteAddBookData()
	{	
		//alert('deleteAddBookData');	   	      
	   var parameters= new Array();
	   var i=0;	
	   parameters[i++]='methodName';
	   parameters[i++]='deleteShipToAddressBook';
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='shipToObjectsList';   
	   parameters[i++]= deleteAddressObjs;
	  // alert('------deleteAddressObjs------'+deleteAddressObjs);
	   var a1= document.getElementById('strCCOUserId').value;
	  //  alert(a1);
	   parameters[i++]='strCCOUserId';
   	   parameters[i++]=document.getElementById('strCCOUserId').value;   
   	   parameters[i++]='strAuthLevel';
       parameters[i++]=document.getElementById('strAuthLevel').value; 
       parameters[i++]='pickerSelection';
	   parameters[i++]=document.getElementById('pickerSelection').value;
	   parameters[i++]='userType'; 
	   parameters[i++]=document.getElementById('userType').value;
	   parameters[i++]='strSourceSystem';
	   parameters[i++]=document.getElementById('strSourceSystem').value;
	   parameters[i++]='strShipToTabType'; 
	   parameters[i++]=document.getElementById('strShipToTabType').value;
	  // alert('creating a request '+parameters);

	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);
       var ccoId = document.getElementById('strCCOUserId').value;
	   var response = XMLHttpRequestSender('./shiptoselect.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','', dummy);
	                              
	                             
	showAddressBookData(1, -1, ccoId, -1,'0','pagination');
	
	
	}
	
	function dummy(){
	}
	

	function showSearchResults(){
		var parameters= new Array();
		var i=0;
   		   parameters[i++]='methodName';
   		   parameters[i++]='onSearchResultsTab';    		   
     	   parameters[i++]='withinContext';
		   parameters[i++]=document.getElementById('withinContext').value;   
		   parameters[i++]='context';
		   parameters[i++]=document.getElementById('context').value;
		   parameters[i++]='contextValue';   
	       parameters[i++]=document.getElementById('contextValue').value;
		   parameters[i++]='status';
		   parameters[i++]=document.getElementById('status').value;
		   parameters[i++]='pickerSelection';		   
		   parameters[i++]=document.getElementById('pickerSelection').value;
		   parameters[i++]='strSourceSystem';
		   parameters[i++]=document.getElementById('strSourceSystem').value;
		   parameters[i++]='strCCOUserId';
		   parameters[i++]=document.getElementById('strCCOUserId').value;  
		   parameters[i++]='strAuthLevel';
		   parameters[i++]=document.getElementById('strAuthLevel').value;
		   parameters[i++]='userType'; 
		   parameters[i++]=document.getElementById('userType').value;

		//	Added by Uday for Lucene implementation
	   parameters[i++]='shipToName';
	   parameters[i++]=document.getElementById('shipToName').value;
	   parameters[i++]='shipToID';   
	   parameters[i++]=document.getElementById('shipToID').value;
	   parameters[i++]='country';   
	   parameters[i++]=document.getElementById('country').value;
	   parameters[i++]='stateProvince';   
	   parameters[i++]=document.getElementById('stateProvince').value;
	   parameters[i++]='city';   
	   parameters[i++]=document.getElementById('city').value;	  
	   if (((document.getElementById('userType').value)=="Internal") || ((document.getElementById('userType').value)=="INTERNAL"))
	   {
	  		parameters[i++] = 'businessEntity';
	  		parameters[i++] = document.getElementById('businessEntity').value;	  		
	   }



		   parameters[i++]='rand';
		   parameters[i++]=Math.floor(Math.random()*1001);
		   
		   document.getElementById('shiptoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

	   	   var response = XMLHttpRequestSender('./shiptoselect.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','shiptoresults', displayPopupResults); 
			
	}
	
	
	