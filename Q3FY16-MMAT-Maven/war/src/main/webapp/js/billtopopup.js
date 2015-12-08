				
		///////////////////////////////////////////
/// functions for the child popup jsp 
///////////////////////////////////////////
   

 // This Java script function is called when requst come from Search Results page for Pagination and sorting logic
 

	function showSearchPageData(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
		  if(callingfrom =='searchbutton')
			{
			  billToObjects = new Array();  
			  addtoAddressObjs = new Array();
			  deleteAddressObjs = new Array();
			}
		//alert('inside showData'+' with sortId : '+sortId);
//		//alert('test');
	
	  // alert('inside showData'+' with procId : '+procId);
	   /*if(pageNo=="-1"&&sortId=="-1"){
	   		selectedBilltoId = null;
	      billToObjects = new Array();
	      }
	      if(pageNo=="1"&&sortId!="-1")
	      {
	      selectedBilltoId = null;
	      billToObjects = new Array();   
	      }*/
	      
	   var parameters= new Array();
	   var i=0;
		 // alert('inside showData'+' with sortId : '+sortId);
	   parameters[i++]='methodName';
	   parameters[i++]='onGetSearchList';
	   parameters[i++]='billToName';
	   parameters[i++]=document.getElementById('billToName').value;
	   parameters[i++]='billToID';   
	   parameters[i++]=document.getElementById('billToID').value;
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
	 //  parameters[i++]=document.getElementById('billToID').value;
	   //parameters[i++]=document.getElementById('billToID').value;
	
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
	   
	   var response = XMLHttpRequestSender('./billtoselect.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','billtoresults', displayPopupResults);
	
	     document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                
	   //alert('got response : '+response);
		  // alert('Showing loading test ');
	    
	    // alert('after');
	   //document.getElementById('pickerSalesRegionsList').innerHTML='<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0"><tbody><tr><td valign="middle" colspan=9><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></tbody></table>';   
	
	}  /* Added By Team */

//  24-OCt-2007 - as per TD 2417 Synergy WOF - manas change starts 

    	function showSearchPageDataNum(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
		  if(callingfrom =='searchbutton')
			{
			  billToObjects = new Array();  
			  addtoAddressObjs = new Array();
			  deleteAddressObjs = new Array();
			}
		//alert('inside showData'+' with sortId : '+sortId);
//		//alert('test');
	
	  // alert('inside showData'+' with procId : '+procId);
	   /*if(pageNo=="-1"&&sortId=="-1"){
	   		selectedBilltoId = null;
	      billToObjects = new Array();
	      }
	      if(pageNo=="1"&&sortId!="-1")
	      {
	      selectedBilltoId = null;
	      billToObjects = new Array();   
	      }*/
	      
	   var parameters= new Array();
	   var i=0;
		 // alert('inside showData'+' with sortId : '+sortId);
	   parameters[i++]='methodName';
	   parameters[i++]='onGetSearchList';
	   parameters[i++]='billToName';
	   parameters[i++]=document.getElementById('billToName').value;
	   parameters[i++]='billToID';   
	   parameters[i++]=document.getElementById('billToID').value;
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
	 //  parameters[i++]=document.getElementById('billToID').value;
	   //parameters[i++]=document.getElementById('billToID').value;
	
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
	   
	   var response = XMLHttpRequestSender('./billtoselectNum.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','billtoresults', displayPopupResults);
	
	     document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                
	   //alert('got response : '+response);
		  // alert('Showing loading test ');
	    
	    // alert('after');
	   //document.getElementById('pickerSalesRegionsList').innerHTML='<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0"><tbody><tr><td valign="middle" colspan=9><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></tbody></table>';   
	
	}
	function deleteAddBookDataNum()
	{	
		//alert('deleteAddBookDataNum');	   	      
	   var parameters= new Array();
	   var i=0;	
	   parameters[i++]='methodName';
	   parameters[i++]='deleteBillToAddressBook';
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='billToObjectsList';   
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
	   parameters[i++]='strBillToTabType'; 
	   parameters[i++]=document.getElementById('strBillToTabType').value;
	  // alert('creating a request '+parameters);

	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);
       var ccoId = document.getElementById('strCCOUserId').value;
	   var response = XMLHttpRequestSender('./billtoselectNum.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','', dummy);
	                              
	                             
	showAddressBookData(1, -1, ccoId, -1,'0','pagination');
	
	}
	
	 function showAddressBookDataNum(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
	//	 alert("inside showAddressBookData");
	//	addtoAddressObjs = new Array();
	//	deleteAddressObjs = new Array();
	
	  // alert('inside showData'+' with procId : '+procId);
	   /*if(pageNo=="-1"&&sortId=="-1"){
	   		selectedBilltoId = null;
	      billToObjects = new Array();
	      }
	      if(pageNo=="1"&&sortId!="-1")
	      {
	      selectedBilltoId = null;
	      billToObjects = new Array();   
	      } */
	      
	   var parameters= new Array();
	   var i=0;
		 // alert('inside showData'+' with sortId : '+sortId);
	   parameters[i++]='methodName';
	   parameters[i++]='onGetAddressBookList';
	   parameters[i++]='billToName';
	   parameters[i++]=document.getElementById('billToName').value;
	   parameters[i++]='billToID';   
	   parameters[i++]=document.getElementById('billToID').value;
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
	   parameters[i++]='strBillToTabType'; 
	   parameters[i++]=document.getElementById('strBillToTabType').value;
	  
	   if (((document.getElementById('userType').value)=="Internal") || ((document.getElementById('userType').value)=="INTERNAL"))
	   {
	  		parameters[i++] = 'businessEntity';
	  		parameters[i++] = document.getElementById('businessEntity').value;	  		
	   }
	 //  parameters[i++]=document.getElementById('billToID').value;
	   //parameters[i++]=document.getElementById('billToID').value;
	
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
	   
	   var response = XMLHttpRequestSender('./billtoselectNum.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','billtoresults', addressMessageResult);
	
	     document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                
	   //alert('got response : '+response);
		  // alert('Showing loading test ');
	    
	    // alert('after');
	   //document.getElementById('pickerSalesRegionsList').innerHTML='<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0"><tbody><tr><td valign="middle" colspan=9><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></tbody></table>';   
	
	}
	
	function addToAddressBookNum()
	{
	  // alert('---in addToAddressBook');	
	   var parameters= new Array();
	   var i=0;
	
	   parameters[i++]='methodName';
	   parameters[i++]='addBillToAddressBook';
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='billToObjectsList';   
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
       
	   var response = XMLHttpRequestSender('./billtoselectNum.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','addressMessage', addToAddress_addressMessageResult);
	 
	}	 

// 24-OCt-2007 - as per TD 2417 Synergy WOF -  manas change ends 

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
	//	addtoAddressObjs = new Array();
	//	deleteAddressObjs = new Array();
	
	  // alert('inside showData'+' with procId : '+procId);
	   /*if(pageNo=="-1"&&sortId=="-1"){
	   		selectedBilltoId = null;
	      billToObjects = new Array();
	      }
	      if(pageNo=="1"&&sortId!="-1")
	      {
	      selectedBilltoId = null;
	      billToObjects = new Array();   
	      } */
	      
	   var parameters= new Array();
	   var i=0;
		 // alert('inside showData'+' with sortId : '+sortId);
	   parameters[i++]='methodName';
	   parameters[i++]='onGetAddressBookList';
	   parameters[i++]='billToName';
	   parameters[i++]=document.getElementById('billToName').value;
	   parameters[i++]='billToID';   
	   parameters[i++]=document.getElementById('billToID').value;
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
	   parameters[i++]='strBillToTabType'; 
	   parameters[i++]=document.getElementById('strBillToTabType').value;
	  
	   if (((document.getElementById('userType').value)=="Internal") || ((document.getElementById('userType').value)=="INTERNAL"))
	   {
	  		parameters[i++] = 'businessEntity';
	  		parameters[i++] = document.getElementById('businessEntity').value;	  		
	   }
	 //  parameters[i++]=document.getElementById('billToID').value;
	   //parameters[i++]=document.getElementById('billToID').value;
	
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
	   
	   var response = XMLHttpRequestSender('./billtoselect.do',
	                              parameters,
	                              'true',
	                              'GET',
	                              '1000000',
	                              '3','billtoresults', addressMessageResult);
	
	     document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';                                
	   //alert('got response : '+response);
		  // alert('Showing loading test ');
	    
	    // alert('after');
	   //document.getElementById('pickerSalesRegionsList').innerHTML='<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0"><tbody><tr><td valign="middle" colspan=9><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></tbody></table>';   
	
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

  //alert('Inside displayPopupResults into '+idToChange);
   var result = req.responseText;
   //alert(result);
   document.getElementById(idToChange).innerHTML=result;
//   document.getElementById('pickerSalesRegionsList').innerHTML=result;
//   alert('billToObjects' + billToObjects);
 //  alert('form: '+document.billtoFormName);
  // alert('checkbox elements : '+document.billtoFormName.selectLineItem);
  var selection = document.getElementById('pickerSelection').value;
  //alert(selection);
	if(selection=='MULTIPLE' || selection=='Multiple' || selection=='multiple'){
   var lineItemsList = document.billtoFormName.selectLineItem;
// alert('lineItemsList..............'+lineItemsList);
 // alert(billToObjects.length);
 // alert(document.billtoFormName);
   if(lineItemsList.length)
	{
		//alert('more than one checkbox found');
	//	alert(lineItemsList.length);
		for(j=0;j<billToObjects.length;j++)
	   {
	      for(k=0;k<lineItemsList.length;k++)
	      {
	         //alert('billToObjects[j] : '+billToObjects[j]);
	       //  alert('lineItemsList[k].value : '+lineItemsList[k].value);
	         if(billToObjects[j]==lineItemsList[k].value)
	            lineItemsList[k].checked="true";
	      }
	   }
		
	}
	else
	{
		//alert('only one checlbox found');
		for(j=0;j<billToObjects.length;j++)
	   {  
	         //alert('billToObjects[j] : '+billToObjects[j]);
	         //alert('lineItemsList[k].value : '+lineItemsList[k].value);
	         if(billToObjects[j]==lineItemsList.value)
	            lineItemsList.checked="true";
	     
	   }
	
	}
   
   }
   else
   {
   //do nothing
   }
   //alert("tab type selected:"+document.getElementById("strBillToTabType").value);
   var tabType=document.getElementById("strBillToTabType").value;
   var vUserType=document.getElementById('userType').value;
   //alert("User Type in displayPopupResults :" +vUserType);
   if(tabType!='undefined' && tabType!=null && tabType!=""){
   		if(tabType =="search"){
   		    // alert("search");
   			document.getElementById("button_selectBillTo").style.display='block';
   			document.getElementById("button_remove").style.display='none';
			/*if((vUserType!= 'undefine' && vUserType!=null && vUserType!='' )&& (vUserType == 'INTERNAL' || vUserType== 'Internal' || vUserType == 'internal')) {
   				document.getElementById("button_addBillToAdd").style.display='block';
			} */
			document.getElementById("button_addBillToAdd").style.display='block';
   		}
   		else{
   			document.getElementById("button_selectBillTo").style.display='block';
   			document.getElementById("button_remove").style.display='block';
   			document.getElementById("button_addBillToAdd").style.display='none';
   		}  		
   	}	
   
   }

   function jsonLoad(){
		try {
			//alert('Inside jsonLoad()...');
		  //jsonrpc = new JSONRpcClient(jsonurl);
		  //jsonrpc = new JSONRpcClient();
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
			 //stateProvinceObj.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
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
         XMLHttpReq.send(UrlParameters);
         }
      }
      
}


	//Check box
	
	function adjustContArray()
	{
		//alert('inside adjustContArray');
	   
	  // alert(billToObjects.length);
	   
	     var billToNameList = document.billtoFormName.selectLineItem;
    // alert("billToNameList  is :"+billToNameList);
	// alert("billToNameList.length :"+billToNameList.length);	 
     
	 var tabtype = (document.getElementById("button_remove").style.display=='block')?"address":"search";
	// alert("tabtype : "+tabtype);
   
   if(billToNameList != undefined && billToNameList.length == 2){   
		// alert('billToNameList is not undefined billToNameList.length is undefined IF 1111111 ---'+tabtype);
   		if(tabtype=='address'){
   			if(billToNameList[0].checked ==true) {
   				//alert("Address tab one record condition checked true");
				//alert(" address one record add :billToNameList[1].value in IF is ::"+ billToNameList[1].value);
				//alert(" address one record add : billToNameList[1].value in billToNameList[d].checked true is ::"+ billToNameList[1].value);
	  			billToObjects = addVal(billToObjects, billToNameList[1].value);			
				//alert('address one record add : billToObjects inbillToNameList[d].checked true is :'+billToObjects);
				
				var	billToIdArray=billToNameList[1].value.split("|");
				//alert(" address one record add : billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray);
				//alert(" address one record add : Bill To Id from billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray[0]);
	   			deleteAddressObjs = addVal(deleteAddressObjs, billToIdArray[0]);
				 //alert('address one record add : deleteAddressObjs in billToNameList[d].checked true is :'+deleteAddressObjs);
			}
			else {
				//alert("Serch tab one record condition checked false");
					if(billToObjects.length >0) {
						//alert(" address one record delete :billToNameList[1].value in billToNameList[d].checked false is ::"+ billToNameList[1].value);
			  			billToObjects = deleteVal(billToObjects, billToNameList[1].value);			
						//alert('address one record delete :billToObjects in billToNameList[d].checked false :'+billToObjects);
					}
					
					if(deleteAddressObjs.length > 0) {
						var	billToIdArray=billToNameList[1].value.split("|");
						//alert(" address one record delete : billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray);
						//alert(" address one record delete : Bill To Id from billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray[0]);
						deleteAddressObjs = deleteVal(deleteAddressObjs, billToIdArray[0]);
					}
				}
   		} // end  of address book tab
   		else if(tabtype=='search'){
   		         //alert("Serch tab one record condition");
   				if(billToNameList[0].checked ==true) {
   					//alert("Serch tab one record condition checked true");
					//alert(" search one record add:billToNameList[1].value in billToNameList[0].checked true is ::"+ billToNameList[1].value);
		  			billToObjects = addVal(billToObjects, billToNameList[1].value);			
					//alert('search one record add:billToObjects in billToNameList[0].checked  true is ---'+billToObjects);
					
					var	billToIdArray=billToNameList[1].value.split("|");
					//alert(" search one record add: billToIdArray in billToNameList[0].checked true ::"+ billToIdArray);
					//alert(" search one record add:Bill To Id from billToIdArray in billToNameList[0].checked true is ::"+ billToIdArray[0]);
					addtoAddressObjs = addVal(addtoAddressObjs, billToIdArray[0]);
					//alert('search one record add:addtoAddressObjs in billToNameList[0].checked true ::'+addtoAddressObjs);
			} else {
					//alert("Search tab one record condition checked false");
					if(billToObjects.length >0) {
					//alert(" search one record delete:billToNameList[1].value in billToNameList[0].checked false ::"+ billToNameList[1].value);
		  			billToObjects = deleteVal(billToObjects, billToNameList[1].value);			
					//alert('search one record delete :billToObjects in billToNameList[0].checked  is false :'+billToObjects);
				    }
				    if(addtoAddressObjs.length > 0) {
						var	billToIdArray=billToNameList[1].value.split("|");
						//alert(" search one record delete: billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray);
						//alert(" search one record delete: Bill To Id from billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray[0]);
						addtoAddressObjs = deleteVal(addtoAddressObjs, billToIdArray[0]);
					}				
				}
			} //end of search tab if   		  		
   } //when there are more than one record in check all box the following code will be executed
   else{
	   //alert("Start of ELSE ");
   	if(billToNameList != undefined ) {	

   		if(tabtype=='address'){
   		//alert('------in adjustContArray in address billToNameList is '+billToNameList);
   		//alert('------in adjustContArray in address deleteAddressObjs is '+deleteAddressObjs);
   			for(var d=0;d<billToNameList.length;d++)
   			{
				if(d == 0)
					continue;
    	 		 //alert('inside For loop adjustInstallSiteArray '+billToNameList[d].checked);
      			if(billToNameList[d].checked==true)
      			{
       				//alert(d+' - '+billToNameList[d].value);
					billToObjects = addVal(billToObjects, billToNameList[d].value);
					
					var	billToIdArray=billToNameList[d].value.split("|");
					//alert(" address add:billToIdArray in billToNameList[d].checked true  is ::"+ billToIdArray);
					//alert(" address add: Bill To Id from billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray[0]);
         			deleteAddressObjs = addVal(deleteAddressObjs, billToIdArray[0]);
      			}
      			else
     		 	{
        			//alert(" address add :billToNameList[0].checked ::"+ billToNameList[0].checked);
					//alert(d+' - '+billToNameList[d].value);
					if(billToObjects.length > 0) {
         				billToObjects = deleteVal(billToObjects, billToNameList[d].value);
					}
					if(deleteAddressObjs.length > 0) {
						var	billToIdArray=billToNameList[d].value.split("|");
						//alert(" address delete: billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray);
						//alert(" address delete: Bill To Id from billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray[0]);
						deleteAddressObjs = deleteVal(deleteAddressObjs, billToIdArray[0]);
					}
      			}
   			}//end of for
   			
   		}
   		else{
   			for(var d=0;d<billToNameList.length;d++)
   			{
				if(d == 0)
					continue;
    	 		// alert('inside For loop adjustContArray '+billToNameList[d].checked);
      			if(billToNameList[d].checked==true)
      			{
					//alert(d+' - '+billToNameList[d].value);
         			billToObjects = addVal(billToObjects, billToNameList[d].value);
					
					var	billToIdArray=billToNameList[d].value.split("|");
					//alert(" Search add: billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray);
					//alert(" Search add: Bill To Id from billToIdArray in billToNameList[d].checked true is ::"+ billToIdArray[0]);
					addtoAddressObjs = addVal(addtoAddressObjs, billToIdArray[0]);
					//alert('Search add: addtoAddressObjs billToNameList[d].checked is true ## ---'+addtoAddressObjs);
					
      			}
      			else
     		 	{
        			 //alert(" search delete :billToNameList[0].checked ::"+ billToNameList[0].checked);
					//alert(d+' - '+billToNameList[d].value);
					//alert("billToObjects.length is B4 Delete ::"+billToObjects.length);
					if(billToObjects.length > 0) {
         				billToObjects = deleteVal(billToObjects, billToNameList[d].value);
					}
					
					if(addtoAddressObjs.length >0 ) {
						var	billToIdArray=billToNameList[d].value.split("|");
						//alert(" Search delete: billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray);
						//alert(" Search delete: Bill To Id from billToIdArray in billToNameList[d].checked false is ::"+ billToIdArray[0]);
						addtoAddressObjs = deleteVal(addtoAddressObjs, billToIdArray[0]);
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


function transferData(billToObjects)
	{ 
	   //alert('inside transferData with objs : '+billToObjects);
	   
	    var str = "";
	  
	
	/*   var count = billToObjects.length;
	  // alert(count);
	   if(count == 0)
	   {
	      alert('Please select atleast one checkbox to continue');
	      return false;
	   }*/
	
	
	   var i=0;
	   
	   var v1='BilltoSelector';
		var v2='BilltoID';
		var v3='BilltoName';
		var v4='Address1';
		var v5='Address2';
		var v6='Address3';
		var v7='City';
		var v8='State';
		var v9='PostalCode';
		var v10='Country';
		var v11='Status';
		
		//alert('before');
		var xSTR=makeJSONStr(billToObjects,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11);
		//alert(xSTR);
		self.creator.xtrack_billtoselector(xSTR);
	
	
		
	   self.close();
	
	}
	
//  24-OCt-2007 - as per TD 2417 Synergy WOF - manas change starts 

function transferDataBilltoNum(billToObjects)
	{
	   //alert('inside transferData with objs : '+billToObjects);

	    var str = "";


	/*   var count = billToObjects.length;
	  // alert(count);
	   if(count == 0)
	   {
	      alert('Please select atleast one checkbox to continue');
	      return false;
	   }*/
	

	   var i=0;

	   var v1='BilltoSelector';
		var v2='BilltoID';
		var v3='BilltoName';
		var v4='Address1';
		var v5='Address2';
		var v6='Address3';
		var v7='City';
		var v8='State';
		var v9='PostalCode';
		var v10='Country';
		var v11='Status';
		
		//alert('before');
		var xSTR=makeJSONStr(billToObjects,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11);
		//alert('after'+xSTR);
		self.creator.xtrack_billtoNumselector(xSTR);
	
	self.close();
	   	
	
	}
	function showBillToAddressBookDataNum(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
  //alert('inside showData'+' with sortId : '+sortId+' and procId : '+procId);
  addtoAddressObjs = new Array();
  deleteAddressObjs = new Array();

   if(pageNo=="-1"&&sortId=="-1")
      billToObjects = new Array();    
   
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
   parameters[i++]='strBillToTabType'; 
   parameters[i++]=document.getElementById('strBillToTabType').value;
   
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
	   document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
//   alert('creating a request '+parameters);

   var response = XMLHttpRequestSender('./billtoselectNum.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','billtoresults', addressMessageResult);

}
function showSearchResultsNum(){
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

	//Added by Uday for Lucene
	   parameters[i++]='billToName';
	   parameters[i++]=document.getElementById('billToName').value;
	   parameters[i++]='billToID';   
	   parameters[i++]=document.getElementById('billToID').value;
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
		   
		   document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

	   	   var response = XMLHttpRequestSender('./billtoselectNum.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','billtoresults', displayPopupResults); 
			
	}
//  24-OCt-2007 - as per TD 2417 Synergy WOF - manas change end

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




function retainBilltoId(billtoID){
		selectedBilltoId = billtoID;
		//alert(selectedBilltoId);
}

//returns the selected values
function addRemove()
{
	
}


function showBillToAddressBookData(pageNo, sortId, procId,sortOrder,prevSortId,callingfrom)
	{
  //alert('inside showData'+' with sortId : '+sortId+' and procId : '+procId);
  addtoAddressObjs = new Array();
  deleteAddressObjs = new Array();

   if(pageNo=="-1"&&sortId=="-1")
      billToObjects = new Array();    
   
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
   parameters[i++]='strBillToTabType'; 
   parameters[i++]=document.getElementById('strBillToTabType').value;
   
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
	   document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
//   alert('creating a request '+parameters);

   var response = XMLHttpRequestSender('./billtoselect.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','billtoresults', addressMessageResult);

}



function addToAddressBook()
	{
	  // alert('---in addToAddressBook');	
	   var parameters= new Array();
	   var i=0;
	
	   parameters[i++]='methodName';
	   parameters[i++]='addBillToAddressBook';
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='billToObjectsList';   
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
       
	   var response = XMLHttpRequestSender('./billtoselect.do',
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
   			document.getElementById("button_selectBillTo").style.display='block';
   			document.getElementById("button_remove").style.display='none';
			/*if((vUserType!= 'undefine' && vUserType!=null && vUserType!='' )&& (vUserType == 'INTERNAL' || vUserType== 'Internal' || vUserType == 'internal')) {
   				document.getElementById("button_addBillToAdd").style.display='block';
			} */
			document.getElementById("button_addBillToAdd").style.display='block';
   		}
   		else{
   			document.getElementById("button_selectBillTo").style.display='block';
   			document.getElementById("button_remove").style.display='block';
   			document.getElementById("button_addBillToAdd").style.display='none';
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
   
   			document.getElementById("button_selectBillTo").style.display='block';
   			document.getElementById("button_remove").style.display='none';
   			document.getElementById("button_addBillToAdd").style.display='block';
   		
	}
	
	function deleteAddBookData()
	{	
		//alert('deleteAddBookData');	   	      
	   var parameters= new Array();
	   var i=0;	
	   parameters[i++]='methodName';
	   parameters[i++]='deleteBillToAddressBook';
	   parameters[i++]='withinContext'; 
	   parameters[i++]=document.getElementById('withinContext').value; 
	   parameters[i++]='billToObjectsList';   
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
	   parameters[i++]='strBillToTabType'; 
	   parameters[i++]=document.getElementById('strBillToTabType').value;
	  // alert('creating a request '+parameters);

	   parameters[i++]='rand';
	   parameters[i++]=Math.floor(Math.random()*1001);
       var ccoId = document.getElementById('strCCOUserId').value;
	   var response = XMLHttpRequestSender('./billtoselect.do',
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


	//Added by Uday for Lucene
	   parameters[i++]='billToName';
	   parameters[i++]=document.getElementById('billToName').value;
	   parameters[i++]='billToID';   
	   parameters[i++]=document.getElementById('billToID').value;
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
		   
		   document.getElementById('billtoresults1').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

	   	   var response = XMLHttpRequestSender('./billtoselect.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','billtoresults', displayPopupResults); 
			
	}
	
	/*  Start STC Impact Changes for Q1Fy10 -TD CA.SO_and_SCME_018_APPS_IMPACT_X-TRACK_FSD_STC2- sbhimire*/
	function swapBillTo(){



	    var strCCOUserId=document.getElementById("strCCOUserId").value;
   		var strSourceSystem=document.getElementById("strSourceSystem").value;
		var strAuthLevel=document.getElementById("strAuthLevel").value;
		var strQuoteID=document.getElementById("strQuoteID").value;
		var strWithincontext=document.getElementById("strWithincontext").value;
		var strStatus=document.getElementById("strStatus").value;
		var strContextValue=document.getElementById("strContextValue").value;
		//alert("Source system:: "+strSourceSystem+" status::  "+strStatus+" quote id::   "+strQuoteID+" 			withincontext::  "+ strWithincontext +" contextvalue::  "+ strContextValue );
		var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='billToSwap';

	    
	    if ((document.getElementById("strContext").value) == null) {
			var strContext="GENERIC";				
		}
		else {
			var strContext=document.getElementById("strContext").value;
		}
	
	    
	   parameters[i++]="context";
	   parameters[i++]=strContext;
	   parameters[i++]="withinContext";
	   parameters[i++]= strWithincontext;
	   parameters[i++]="contextValue";
        parameters[i++]=strContextValue;
	   parameters[i++]="status";
       parameters[i++]=strStatus;
	    
	    if (strAuthLevel == "4" ) {
	     parameters[i++]="userType";
	      parameters[i++]="INTERNAL";
	    } else {
	        parameters[i++]= "userType";
	        parameters[i++]="EXTERNAL";
	    }
parameters[i++]="billToID";
parameters[i++]=document.getElementById('billToName').value;
parameters[i++]="BillTOPickerValue";
parameters[i++]=document.getElementById('BillTOPickerValue').value;	
//	}
//alert(parameters);
document.getElementById('errmsg').innerHTML='';
document.getElementById('contractresults1').innerHTML=''
document.getElementById('pickerContractList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
var response = XMLHttpRequestSender('./billtoselect.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','contractresults', displayBill);

}

function displayBill(req,idToChange) 
{
 
  //alert('IN CALL BACK');
  var result = req.responseText;
  //alert(result);
  if(result)
  {
  var swapBillTo='';
  var displayMess='';
  
  
  var oldBillTo=document.getElementById('billToName').value;
 // if(trim(document.getElementById('billToName').value)!=trim(result))
 if(result.indexOf("/")>0)
  {
  		var popURL=result.split("/");
  		swapBillTo=popURL[0];
  		displayMess=popURL[1];
  		document.getElementById('billToName').value=trim(swapBillTo);
  		//alert('BILL TO ID CHANGED'+displayMess);
  		//document.getElementById('contractresults').innerHTML='';
  		document.getElementById('errmsg').innerHTML='';
  		//document.getElementById('contractresults1').innerHTML='Warning:Your Site-Id has been updated in alignment with selected Bill-To::' +displayMess;
  		document.getElementById('contractresults1').innerHTML=displayMess;
  		//'<table border="0" ><tr><td ><font color="red">Warning:Your Site-Id has been updated in alignment with selected Bill-To::' +displayMess'</font></td></tr></table>';
  		document.getElementById("BillTOPickerValue").value ="";
		document.getElementById("newBillTOID").value =trim(swapBillTo);
   }
   else
   {
   document.getElementById("newBillTOID").value=trim(result);
   }
   			var srvCntr=document.getElementById("servicelvlCnt").value;
			  for(var x=0;x<srvCntr;x++)
			  {
			  //	alert("Checked::  "+ eval("document.contactSearchForm.servLvl"+x+".checked"));
			  	if(eval("document.contactSearchForm.selectedServiceLevels"+x+".checked")){
			  		getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
			  		return true;
			  	}
			  }
			 
			//alert("Here"+document.getElementById("statusCnt").value);
			  var statCntr=document.getElementById("statusCnt").value;
			  for(var y=0;y<statCntr;y++)
			  {
			  	//alert("Checked::  "+ eval("document.contactSearchForm.StatusList_"+y+".checked"));
			  	if(eval("document.contactSearchForm.StatusList_"+y+".checked")){
			  		getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
			  		return true;
			  	}
			  }			  
			  
			  
		  	   if (document.getElementById("ContractName").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("from_date").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("from_date2").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("from_date3").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("to_date").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("to_date2").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("to_date3").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  
		  		/*if((document.getElementById("Contract#").value=="")&&(document.getElementById("billToName").value=="")){
		  		alert("Enter  either contract # or billto to search");
		  		return false;
		  		}*/
		  
		  		getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
  }
else
  {
  document.getElementById('errmsg').innerHTML='';
  document.getElementById('contractresults1').innerHTML=result;
 // alert('IN VALID BILL TO ID');
  }
}
/*  End STC Impact Changes for Q1Fy10 -TD CA.SO_and_SCME_018_APPS_IMPACT_X-TRACK_FSD_STC2- sbhimire*/