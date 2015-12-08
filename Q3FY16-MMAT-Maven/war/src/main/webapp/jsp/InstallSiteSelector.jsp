<%@ page language = "java" import ="org.json.*,com.metaparadigm.jsonrpc.JSONRPCBridge,java.util.*"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ include file="localeInfo.jsp" %>

<jsp:useBean id="JSONRPCBridge" scope="session"

     class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="handler" scope="request"

     class="com.cisco.crosstrack.selector.handlers.InstallSiteSelectorHandler" />

 <%@  page import="com.cisco.crosstrack.selector.data.dao.SelectorDAO, com.cisco.crosstrack.selector.data.genjava.XxcssCtCountryObjType, com.cisco.crosstrack.selector.data.genjava.XxcssCtBusiEntiObjType "%>





<% JSONRPCBridge.registerObject("handler", handler); %>



   <%

      String appContext = request.getContextPath();

		String withincontext = ((String)request.getAttribute("withincontext")).toUpperCase();		
  		String context = (String)request.getAttribute("context");
  		String contextvlaue = (String)request.getAttribute("contextvalue");
  		String quotenumber = (String)request.getAttribute("quotenumber");
  		String status = (String)request.getAttribute("status");
  		String pickerselectionvalue = (String)request.getAttribute("pickerselectionvalue");
  		String sourcesystem = (String)request.getAttribute("sourcesystem");
  		
  		java.util.ArrayList countryList= (java.util.ArrayList)request.getAttribute("countrylist");
  		java.util.ArrayList businessEntitiesList = (java.util.ArrayList)request.getAttribute("businessentitieslist");
  		
  		String ccouserid = (String)request.getAttribute("ccouserid");
  		String authlevel = (String)request.getAttribute("authlevel");
  		
  		//			Added-For QOT_CrossTrack
  		String onHold = (String)request.getAttribute("onHold");
  		
		//Begin Q1FY13 - 2TNG Changes - Resmi
		String installSiteCountry_userPref = null;
		if (null != request.getAttribute("installSiteCountry_userPref")) {
			installSiteCountry_userPref = (String)request.getAttribute("installSiteCountry_userPref");
		}
		//End Q1FY13 - 2TNG Changes - Resmi
  		//commented below block to have MLS values
  					
  		//String title = "";
		//	if ("y".equalsIgnoreCase(withincontext)) {
		//		if("CONTRACT".equalsIgnoreCase(context)){
		//			if (contextvlaue!=null && contextvlaue.length() < 1 ){
		//				title = " - Context to Contracts";
		//			}					
      	//		else {
      	//				title = " - " + context + " # " + contextvlaue;
      	//			}				
		//		}
		//		else if("QUOTE".equalsIgnoreCase(context)){
		//			if (quotenumber!=null && quotenumber.length() < 1 ){
		//				title = " - Quote #";
		//			}					
      	//			else if(quotenumber!=null && quotenumber.length() > 0){
      	//				title = " - " + context + " # " + quotenumber;
      	//			}
      	//			else if(quotenumber == null){
      	//				title = " - Quote #";
      	//			}				
		//		}
		//		else{
		//			title = " - " + context + " # " + contextvlaue;
		//		}				
		//	}
   %>



<html xmlns="http://www.w3.org/1999/xhtml">





<head>

		<title><fmt:message key='InstallSiteSelector.siteSelector'/> </title>

		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/crosstrack_styles.css" type="text/css" media="screen" />		
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts 
        <script type="text/javascript" src="js/jsonrpc.js"></script>
         <script type="text/javascript" src="js/datapersistence.js"></script>
         <script type="text/javascript" src="js/genJSON.js"></script>
         <script type="text/javascript" src="js/crosstrackselectors.js"></script>
	-->
        <script type="text/javascript" src="js/child.js"></script>

        <script type="text/javascript" src="js/installsiteselector.js"></script>
	
		<script type="text/javascript" src="js/popupAlerts.js"></script>
		
  <script>

        var installObjs = new Array();
        var addressObjs = new Array();
        var addtoAddressObjs = new Array();
        var deleteAddressObjs = new Array();

        //alert('Page loaded.. Just created a new array : '+objs.length);

        function refreshInstallArray(v)

        {
			
           //alert('inside refreshArray for '+v);
     		var tabtype = document.getElementById('tabtype').value;
     		if(tabtype=='address'){
     			addressObjs = modifyContent(addressObjs, v);
     		}
     		else{
     			installObjs = modifyContent(installObjs, v);
     		}           
						
           //printVal(objs);
           // alert('---------deleteAddressObjs is'+deleteAddressObjs);

        }
		
		function refreshRadioArray(v)

         {
         	
         	var tabtype = document.getElementById('tabtype').value;
     		if(tabtype=='address'){
     			for(var b=0;b<addressObjs.length;b++)
		      	{
		        	addressObjs.splice(b,1);
     	      	}
            	addressObjs = modifyRadioContent(addressObjs, v);
     		}
     		else{
     			for(var b=0;b<installObjs.length;b++)
		      	{
		        	installObjs.splice(b,1);
     	      	}
            	installObjs = modifyRadioContent(installObjs, v);
     		}    		
        	
		         // alert('---------deleteAddressObjs is'+deleteAddressObjs);
         }


        function printSelectedItems()

        {

           printVal(installObjs);

        }

        

        function resetInstallForm()

        {

        	alert("In reset form");

        	document.InstallSiteForm.reset();

        }

		
		
		
function makeInstallJSONStr(obj,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ '","'+v3+'" : "'+sl[1]+'" ,"'+v4+'" : "'+sl[2]+ '","'+v5+'" : "'+sl[3]+ '","'+v6+'" : "'+sl[4]+ '","'+v7+'" : "'+sl[5]+ '","'+v8+'" : "'+sl[6]+ '","'+v9+'" : "'+sl[7]+ '","'+v10+'" : "'+sl[8]+ '","'+v11+'" : "'+sl[9]+ '","'+v12+'" : "'+sl[10]+ '"  }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}

        function transferDataToMain()

        {
			var installSiteAlert = new InstallSiteAlerts();
		   //alert('------installObjs.length'+installObjs.length);
		   
		   var type= document.getElementById("tabtype").value;
		   var jsonstr;
		   //alert('--tabtype'+type+'----installobjs- length'+installObjs.length  +'--addressObjs.length'+addressObjs.length);
		   if(type == "search"){
		   		if(installObjs.length==0)
           		{
              		alert(installSiteAlert.XXCSS_CT_650019);
              		return false;
           		}
           		
     	   		jsonstr = makeInstallJSONStr(installObjs,'InstallSiteSelector', 'siteId', 'installedAtSiteName','customerID','address1','address2','address3','city','state','country','zip','status');	   					
		   }
		   else{
		   		if(addressObjs.length==0)
           		{
              		alert(installSiteAlert.XXCSS_CT_650088);
              		return false;
           		}
           		
     	   		jsonstr = makeInstallJSONStr(addressObjs,'InstallSiteSelector', 'siteId', 'installedAtSiteName','customerID','address1','address2','address3','city','state','country','zip','status');	   							   
		   }
		   
           
//		alert('json string :' + jsonstr);

			self.creator.fetchInstallSites(jsonstr);

			self.close();

        }

        

        function validateFormData()

		{

			 var valid = false;

		/*	if (validateCountry() && validateState()) {

				if(validateChar()) {

					valid = true;

				}

			} */
			
			if(validateChar()) {

					valid = true;

				}
			

		//	alert("valid is :" +valid);

			 if(valid == true) {
                      	//showSearchPageData(-1, -1, -1);
                     document.getElementById("tabtype").value='search';
                     showSearchPageData(-1, -1, -1,'ASC','0','searchbutton'); 

			}
			
			//alert("valid context value "+document.getElementById('subSearContextValue').value);
			//showSearchPageData(-1, -1, -1);

			

		}

		function validateChar()

		{
			var installSiteAlert = new InstallSiteAlerts();
			/*
			if(validateLength(document.getElementById('customerName').value))

			{

				if(validateLength(document.getElementById('siteID').value))

				{				

					alert('Please make sure that search string is at least 3 character long');

					return false;

				}

			}
			*/
			
			if ( (validateLength(document.getElementById('siteID').value)) &&
			   (validateLength(document.getElementById('customerName').value)) )

				{				

					alert(installSiteAlert.XXCSS_CT_650015);

					return false;

				}
			
			
		/*
			if(validateLength(document.getElementById('city').value))

			{				

				alert(installSiteAlert.XXCSS_CT_650018);

				return false;

			}
			*/

		  	if(!charValidations(document.getElementById('customerID').value,'customerID')){
				alert(installSiteAlert.customerIdHasSpecialChars);
		  		return false;
		  	}
		  	
		  	if(validateAscii(document.getElementById('customerID').value)){
		  	    alert(installSiteAlert.customerIdHasSpecialChars);
		  	    return false;
		  	}

			/* TD#218579 - jishaik start
				if(!charValidations(document.getElementById('customerName').value,'customerName')){
			 		alert(installSiteAlert.siteNameHasSpecialChars);
			 		return false;
			 	}
			 	
			 	if(validateAscii(document.getElementById('customerName').value)){
			  	    alert(installSiteAlert.siteNameHasSpecialChars);
			  	    return false;
			  	}

			TD#218579 - jishaik end */
			
		  	if(!charValidations(document.getElementById('siteID').value,'siteID')){
		  		alert(installSiteAlert.siteIdHasSpecialChars);
				return false;

		  	}
			
			if(validateAscii(document.getElementById('siteID').value)){
		  	    alert(installSiteAlert.siteIdHasSpecialChars);
		  	    return false;
		  	}
			
		  	if(!charValidations(document.getElementById('city').value,'city')){
		  		alert(installSiteAlert.cityHasSpecialChars);
		  		return false;

		  	}
		  	
		  	if(validateAscii(document.getElementById('city').value)){
		  	    alert(installSiteAlert.cityHasSpecialChars);
		  	    return false;
		  	}

			return true;

		 }



		function validateLength(value){

			

			if(!trim(value) || trim(value).length<3 )

				return true;

		

			return false;

		}



		function validateLen(value)

		{

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

		

		function charValidations(value,checkFeild)

		{

		 	
		 	// var iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?";
		 	var iChars ="";
		 	if(checkFeild=="customerName"){
		 	 iChars = "!@$%^*()+=[]\\\;,/{}|\":<>?";
		 	}else{
		 	   iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?";
		 	}
            

		  	trimvalue = trim(value);

		  	for (var i = 0; i < trimvalue.length; i++) {

		  		if (iChars.indexOf(trimvalue.charAt(i)) != -1) {

		//			trimvalue.focus();

		  			//alert ("Entry has special characters. \n Please remove them and try again.");

				

		  			return false;

		  		}

		  	}

			return true;

		}

	
	    function modifyInputFields(withincontext,authlevel){
	    	    	//alert('------in modifyInputFields()'+withincontext);
	    	var installSiteID= document.getElementById('siteID').value;
	        if(withincontext == 'N'){	        	
	        	if(installSiteID.length >0){
	        		//alert('---within context N siteid is '+installSiteID.length);
	        		document.getElementById('customerName').value ='';
	        		document.getElementById('country').value ='';
	        		document.getElementById('customerID').value ='';
	        		document.getElementById('city').value ='';
	        		document.getElementById('stateProvince').value ='';
	        		document.getElementById('customerName').disabled = true;
	        		document.getElementById('country').disabled = true;
	        		document.getElementById('customerID').disabled = true;
	        		document.getElementById('city').disabled = true;
	        		document.getElementById('stateProvince').disabled = true;
	        		if(authlevel=='4')
	        		{
	        		document.getElementById('businessEntity').options[0].selected = true; 
	        		}
	        		document.getElementById('businessEntity').disabled = true;
	        
	        	}else{
	        		document.getElementById('customerName').disabled = false;
	        		document.getElementById('country').disabled = false;
	        		document.getElementById('customerID').disabled = false;
	        		document.getElementById('city').disabled = false;
	        		document.getElementById('stateProvince').disabled = false;
	        		document.getElementById('businessEntity').disabled = false;
	        	}
	        
	        }
	    	//return true;
	    }		

		function validateCountry()

		{
			var installSiteAlert = new InstallSiteAlerts();
			var countryObj = document.getElementById('country');

			var index = countryObj.selectedIndex;

			

			if (index == 0) {

				alert(installSiteAlert.XXCSS_CT_650016);

				return false;

			}

			return true;

		}

		

		function validateState()

		{
			var installSiteAlert = new InstallSiteAlerts();
			var stateObj = document.getElementById('stateProvince');

			//alert("State length is :" + stateObj.length);

			// check if the country has states

			if (stateObj != null && stateObj.length > 1 && stateObj.selectedIndex == 0) {

				alert(installSiteAlert.XXCSS_CT_650017);
				return false;
			}
			return true;
		}
		

	function addSiteToAddressBook(){			
		var installSiteAlert = new InstallSiteAlerts();
		   //alert('------installObjs.length'+addtoAddressObjs.length);
           if(addtoAddressObjs.length==0)
           {           
              alert(installSiteAlert.XXCSS_CT_650086);
              return false;
           } 
                   
		addToAddressBook();
	}
	
	function deleteAddBook(){
	
		var installSiteAlert = new InstallSiteAlerts();
		   //alert('------installObjs.length'+installObjs.length);
           if(deleteAddressObjs.length==0)
           {
              alert(installSiteAlert.XXCSS_CT_650087);
              return false;
           }	         
        deleteAddBookData();
    }							

	function showAddressBook(){
//		alert('----in showAddressBook---');
		showInstallAddBookData(-1,-1,-1,'ASC','0');
	}
	
	
	
	function refreshChBoxAddressArray(v){		
		var type= document.getElementById("tabtype").value;
		//alert('-------v is'+v);
		if(type == "search"){
			addtoAddressObjs = modifyContent(addtoAddressObjs, v);
			//alert('-----chbx addtoAddressObjs'+addtoAddressObjs);
		}
		if(type == "address"){
			deleteAddressObjs = modifyContent(deleteAddressObjs, v);
			//alert('-----chbx deleteAddressObjs'+deleteAddressObjs);
		}	
		
	}
	
	function refreshRadioAddressArray(v){
	
	//	alert('----');		
		var tabtype= document.getElementById("tabtype").value;
		//alert('------tabtype is '+tabtype);
		if(tabtype == "search"){			
			for(var b=0;b<addtoAddressObjs.length;b++)

		      {
		           addtoAddressObjs.splice(b,1);
     	      }

		            addtoAddressObjs = modifyRadioContent(addtoAddressObjs, v);
		          //  alert('-------addtoAddressObjs is'+addtoAddressObjs);
		           //  alert('-------addtoAddressObjs.length is'+addtoAddressObjs.length);
		}
		if(tabtype == "address"){
		//	alert('----deleteAddressObjs length is before splice'+deleteAddressObjs.length);
			for(var b=0;b<deleteAddressObjs.length;b++)
		      {
		      	   
		           deleteAddressObjs.splice(b,1);
     	      }

		            deleteAddressObjs = modifyRadioContent(deleteAddressObjs, v);
		  //          alert('-------deleteAddressObjs is'+deleteAddressObjs);
		    //        alert('-------deleteAddressObjs.length is'+deleteAddressObjs.length);
		}
		
		//alert('----- radio addtoAddressObjs'+addtoAddressObjs);
		//alert('----- radio deleteAddressObjs'+deleteAddressObjs);
	
	
	}
	
	
		
</script>



    </head>

	<!--



	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.

	SMALL = 410px (width)

	MED = 620px   (width)

	LARGE = 997px (width)



	-->


	<!-- top banner -->

	<body marginheight="0" marginwidth="0" onload="javascript:initialize('<%=withincontext%>','<%=context%>','<%=contextvlaue%>','<%=status%>','<%=pickerselectionvalue%>','<%=sourcesystem%>','<%=ccouserid%>','<%=authlevel%>','<%=appContext%>','ASC','0','searchbutton');">
													
	<input type="hidden" name="withincontext" id="withincontext" value='<%=withincontext%>'/>
	<input type="hidden" name="context" id="context" value='<%=context%>'/>
	<input type="hidden" name="status" id="status" value='<%=status%>'/>
	<input type="hidden" name="subSearContextValue" id="subSearContextValue" value='<%=contextvlaue%>'/>
	<input type="hidden" name="pickerselectionvalue" id="pickerselectionvalue" value='<%=pickerselectionvalue%>'/>
	<input type="hidden" name="sourcesystem" id="sourcesystem" value='<%=sourcesystem%>'/>
	<input type="hidden" name="ccouserid" id="ccouserid" value='<%=ccouserid%>'/>
	<input type="hidden" name="authlevel" id="authlevel" value='<%=authlevel%>'/>
	<input type="hidden" name="onHold" id="onHold" value='<%=onHold%>'/>
		

		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">

			<tbody>

				<tr>

					<td align="center" valign="top"><img src="<%=combinedImagesLocation%>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>

					<td bgcolor="#ffffff" valign="top" width="100%">

						<table width="100%" border="0" cellspacing="0" cellpadding="0">

							<tbody>

								<tr>

									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="100" border="0" /></td>

									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="1" border="0" /></td>

								</tr>

								<tr>

									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='InstallSiteSelector.closeWindow'/></a></td>

									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>

								</tr>

							</tbody>

						</table>

					</td>

				</tr>

			</tbody>

		</table>



<form name="InstallSiteForm" id ="InstallSiteForm" action="#" method="get" class="inline">

		<!-- screen title -->
		
		<%	if ("y".equalsIgnoreCase(withincontext)) {
				if("CONTRACT".equalsIgnoreCase(context)){
					if (contextvlaue!=null && contextvlaue.length() < 1 ){
						//title = " - Context to Contracts";
		%>
						<h1>
							<fmt:message key='InstallSiteSelector.siteSelector'/> - <fmt:message key='InstallSiteSelector.context'/>
						</h1>		
		<%			}					
      				else {
      					//title = " - " + context + " # " + contextvlaue;
      	%>	
						<h1>
							<fmt:message key='InstallSiteSelector.siteSelector'/> - <fmt:message key='InstallSiteSelector.contextContract'/> # <%=contextvlaue%>
						</h1>	      	
      	<%			
      				}				
				}//inner if is closed
				else if("QUOTE".equalsIgnoreCase(context)){
					if (quotenumber!=null && quotenumber.length() < 1 ){
						//title = " - Quote #";
		%>
						<h1>
							<fmt:message key='InstallSiteSelector.siteSelector'/> - <fmt:message key='InstallSiteSelector.contextQuote'/> # 
						</h1>
		<%
					}					
      				else if(quotenumber!=null && quotenumber.length() > 0){
      	
      					//title = " - " + context + " # " + quotenumber;
      	%>
						<h1>
							<fmt:message key='InstallSiteSelector.siteSelector'/> - <fmt:message key='InstallSiteSelector.contextQuote'/> # <%=quotenumber%>
						</h1>      	
      	<%
      				}
      				else if(quotenumber == null){
      					//title = " - Quote #";
      	%>
						<h1>
							<fmt:message key='InstallSiteSelector.siteSelector'/> - <fmt:message key='InstallSiteSelector.contextQuote'/> # 
						</h1>      	
      	<%
      				}				
				}
				else{
					//title = " - " + context + " # " + contextvlaue;
		%>
					<h1>
						<fmt:message key='InstallSiteSelector.siteSelector'/> - <fmt:message key='InstallSiteSelector.contextQuote'/> # <%=contextvlaue%>
					</h1>  		
		<%
				}				
			}//outer if is closed
			else {
		%>
		<h1><fmt:message key='InstallSiteSelector.siteSelector'/></h1>
		<%
		}//outer else is closed
		%>


		<!-- modules start -->

		<div id="mod_1" class="mod_pop" style="width:962px">

		

			<div class="marque_grid">

			<div id="searchFilters" class="sub_block_hr">

			<h3><fmt:message key='InstallSiteSelector.searchFilters'/></h3>

				

				 <!-- input type="button" value="Selected Items" onClick="javascript:printSelectedItems();" -->

				



				

				<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">

				<colgroup>

				<col width="200" />

				<col width="200" />

				<col width="200" />

				</colgroup>

					<tbody>

						<tr>

							<td align="right"><label for="customerName"><font color=red>* </font><fmt:message key='InstallSiteSelector.installedAtSiteName'/></label></td>

							<td><input type="text" name="customerName" id="customerName" class="inputTextXLarge" /></td>

							<td align="right"><label for="country"><fmt:message key='InstallSiteSelector.country'/></label></td>

					 		<td><select name="country" id="country" class="inputTextXLarge" size="1"  onchange="javascript:getStates('<%=ccouserid%>','<%=sourcesystem%>');">
					<!--	<td><select name="country" id="country" class="inputTextXLarge" size="1"  onchange="javascript:getStates();"> -->
								<option value=""><fmt:message key='InstallSiteSelector.selectone'/></option>
								<%
									XxcssCtCountryObjType	country;
									//Begin Q1FY13 - 2TNG Changes - Resmi
									String select_installSiteCountry = "";
									//End Q1FY13 - 2TNG Changes - Resmi
									for(int i=0; i<countryList.size() ; i++){
									
									country=(XxcssCtCountryObjType)countryList.get(i);
									
									//Begin Q1FY13 - 2TNG Changes - Resmi
									if (null != installSiteCountry_userPref && country.getCountryCode().toString().equals(installSiteCountry_userPref)
										&& !("NONE").equals(installSiteCountry_userPref)) {
									    select_installSiteCountry = "selected"; 
									} else {
									    select_installSiteCountry = ""; 															 
									}
									//End Q1FY13 - 2TNG Changes - Resmi
									
									%>
									<%--Begin Q1FY13 - 2TNG Changes - Resmi--%>
									<!-- <option value=<%=country.getCountryCode() %> > <%=country.getCountryDescription() %></option>-->
									<option value=<%=country.getCountryCode() %>  <%=select_installSiteCountry%>> <%=country.getCountryDescription() %></option>
									<%--End Q1FY13 - 2TNG Changes - Resmi--%>
									<%}%>
									<!-- option value="-1">Select One</option -->

								</select></td>

						</tr>

						<tr>

							<td align="right"><label for="customerID"><fmt:message key='InstallSiteSelector.customerId'/></label></td>

							<td><input type="text" name="customerID" id="customerID" class="inputTextLarge" /></td>

							<%-- <td align="right"><label for="address1">Address 1</label></td>

							<td><input type="text" name="address1" id="address1" class="inputTextXLarge" disabled /></td>
							--%>
							
							
							<td align="right"><label for="city"><fmt:message key='InstallSiteSelector.city'/></label></td>

							<td><input type="text" name="city" id="city" class="inputTextXLarge" /></td>
							
							

						</tr>

						<tr>

							<td align="right"><label for="siteID"><font color=red>* </font><fmt:message key='InstallSiteSelector.installedAtSiteId'/></label></td>

							<td><input type="text" name="siteID" id="siteID" class="inputTextLarge" onBlur="javascript:modifyInputFields('<%=withincontext%>','<%=authlevel%>');" /></td>
							
							

							<td align="right"><label for="stateProvince"><fmt:message key='InstallSiteSelector.state'/></label></td>

							<td><select name="stateProvince" id="stateProvince" class="inputTextXLarge" size="1">

								<option value="" selected="selected"><fmt:message key='InstallSiteSelector.selectone'/></option>

								</select></td>
								
                            <%--
							<td align="right"><label for="address2">Address 2</label></td>

							<td><input type="text" name="address2" id="address2" class="inputTextXLarge" disabled /></td>
							--%>
							

						</tr>
						
						<%if(authlevel.equalsIgnoreCase("4")){%>

						<tr>

							<td align="right"><label for="siteID"><fmt:message key='InstallSiteSelector.businessEntity'/></label></td>
							
							<td><select name="businessEntity" id="businessEntity" class="inputTextXLarge" size="1">
								<option value="-1"><fmt:message key='InstallSiteSelector.selectone'/></option>
								<%
									XxcssCtBusiEntiObjType businessEntityObj;
									
									for(int i=0; i<businessEntitiesList.size() ; i++){
									businessEntityObj = (XxcssCtBusiEntiObjType)businessEntitiesList.get(i);

									
									%>
									<option value=<%=businessEntityObj.getBusinessEntity() %> > <%=businessEntityObj.getDescription() %></option>
									<%}%>
									<!-- option value="-1">Select One</option -->
                                    <!--<option value="JPN">JPN</option>
								--></select></td>
							
							</td>
                   
                            <%--
							<td align="right"><label for="address3">Address 3</label></td>

							<td><input type="text" name="address3" id="address3" class="inputTextXLarge" disabled /></td>
                             --%>
                          
						</tr>
						<%}else{%>
						<tr>

							<td align="right"></label></td>
							
									<input type="hidden" name="businessEntity" id="businessEntity" value="" />
							
							
							<td></td>

                             <%--
							<td align="right"><label for="address3">Address 3</label></td>

							<td><input type="text" name="address3" id="address3" class="inputTextXLarge" disabled /></td>
                               --%>
						</tr>
						<%}%>
						
						<%--
						<tr>
                    
							<td align="right"></td>

							<td></td>

							<td align="right"><label for="city"><font color=red>* </font> City</label></td>

							<td><input type="text" name="city" id="city" class="inputTextXLarge" /></td>

						</tr>

						<tr>

							<td align="right"></td>

							<td></td>

							<td align="right"><label for="stateProvince"><font color=red>* </font> State/Province</label></td>

							<td><select name="stateProvince" id="stateProvince" class="inputTextXLarge" size="1">

								<option value="" selected="selected">Select One</option>

								</select></td>

						</tr>

						<tr>

							<td align="right"></td>

							<td></td>

							
							<td align="right"><label for="postalCode">Postal Code</label></td>

							<td><input type="text" name="postalCode" id="postalCode" class="inputTextXLarge" disabled /></td>
                             
						</tr>
						 --%>

					</tbody>

				</table>
                
                
				<div class="inline_tertiary">

					<!-- button component -->

					<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">

						<tr>
							<td class="button_left" onclick="document.getElementById('searchforSite').click();"></td>
							<td style="padding:0"><input id="searchforSite" class="button" type="button" name="searchforSite" value="<fmt:message key='InstallSiteSelector.searchSite'/>" onclick="javascript:validateFormData()"/></td>
							<td class="button_right" onclick="document.getElementById('searchforSite').click();"></td>
						</tr>

					</table>

                    <a href="javascript:document.getElementById('InstallSiteForm').reset();javascript:modifyInputFields('<%=withincontext%>','<%=authlevel%>');" class="inline_buttonAlt float_right"><fmt:message key='InstallSiteSelector.clearFields'/><img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='InstallSiteSelector.clearFields'/>" align="absmiddle" height="13" width="13" border="0" name="ClearFields" id="ClearFields" /></a>
                    <font color=red><fmt:message key='InstallSiteSelector.mandatory'/></font>
					<br class="clear_all" />

				</div>

			</div>

	

	<!--  regionresults div start -->

	<div id="regionResults">

			

			<div class="header_grey">

			<table  width="958" border="0" cellspacing="0" cellpadding="0">

				<tr>

					<td><h3><fmt:message key='InstallSiteSelector.siteAddress'/></h3></td>

					<td align="right">

						<!-- address book/search results tabs-->

					<div class="module_tabs" align="right">

					<table border="0" cellspacing="0" cellpadding="0">

							<tr>

								<c:choose>
								<c:when test='${withincontext == "N"}'>	
									<td>
								    	<a id="tab1" href="#" onclick="javascript:showAddressBook()" ><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
									</td>
								</c:when>
								<c:otherwise>
									<td>
								    	<a id="tab1" onclick="" ><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
									</td>
								</c:otherwise>
								</c:choose>                               
                                
								<td class="active">

								<!-- a href="#" onclick="selectSubTab(this)" id="tab2"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span>Search Results</span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a -->
								<a id="tab2" href="#" ><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.searchResults'/></span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>

								</td>

							</tr>

					</table>

					</div>

					</td>

				</tr>

			</table>

			</div>

				<div class="sub_block" id="tab1_content">



	<!-- grid column header -->

	<div class="mod_head">

		<table width="940" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">

		<colgroup>
      
      	<%if(authlevel.equalsIgnoreCase("4")){%>
		  	<col width="3%" />
   			<col width="13%" />
   			<col width="7%" />
   			<col width="8%" />
   			<col width="5%" />
   			<col width="13%" />
   			<col width="8%" />
   			<col width="8%" />
   			<col width="5%" />
			<col width="4%" />
			<col width="5%" />
			<col width="4%" />
			<col width="6%" />
			<col width="6%" />
		
		<%} else {%>
		  
		    <col width="3%" />
   			<col width="13%" />
   			<col width="7%" />
   			<col width="8%" />
   			<col width="5%" />
   			<col width="13%" />
   			<col width="8%" />
   			<col width="8%" />
   			<col width="5%" />
			<col width="4%" />
			<col width="5%" />
			<col width="4%" />
			<col width="6%" />			
		<% } %>
	
      
		</colgroup>

		<thead>

			<tr>

							<th class="first" align="center"></th>

				<th class="active sort_d_1" align="left"><a href="#"><fmt:message key='InstallSiteSelector.installedAtSiteName'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.siteID'/></a></th>

				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.customerId'/></a></th>

				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.country'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.address1'/></a></th>

				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.address2'/></a></th>

				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.address3'/></a></th>

				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.city'/></a></th>

				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.state1'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.postalCode'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.status'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.parentGu'/></a></th>
				<%if(authlevel.equalsIgnoreCase("4")){%>
				
				<th align="left"><a href="#"><fmt:message key='InstallSiteSelector.businessEntity'/></a></th>
				<%}%>

			</tr>

		</thead>

		</table>

	</div>

<!-- grid body -->

	<div class="mod_grid_sm " id="resultsList">

	





	</div> <!-- body grid end -->



			</div> <!--end sub_block -->



</div> <!-- End regionresults div -->



</form>
			<div class="sub_block display_false" id="tab2_content" style="height:172px">

			</div>

			</div>

<!-- deleted the buttons form here and moved to results jsp-->

<div id="button_1" class="button_block_med">

				<!-- button component -->				
              	
              	
              	<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_selectSite" style="display:">
					<tr>
						<td class="button_left" onclick="document.getElementById('selectSite').click();"></td>
						<td><input id="selectSite" class="button" type="button" name="selectSite" value="<fmt:message key='InstallSiteSelector.selectSites'/>" onclick="javascript:transferDataToMain();" /></td>
						<td class="button_right" onclick="document.getElementById('selectSite').click();"></td>
					</tr>
				</table>
				
				<c:choose>
				<c:when test='${withincontext == "N"}'>	
						<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_addSiteToAdd" style="display:" >
              					<tr>
              						<td class="button_left" onclick="document.getElementById('addSiteToAdd').click();"></td>
              						<td><input id="addSiteToAdd" class="button" type="submit" name="addSiteToAdd" onClick="javascript:addSiteToAddressBook();" value="<fmt:message key='InstallSiteSelector.addtoAddressBook'/>" /></td>
              						<td class="button_right" onclick="document.getElementById('addSiteToAdd').click();"></td>
              					</tr>
              			</table>
				</c:when>
				<c:otherwise>
						<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_addSiteToAdd" style="display:none" >
              					<tr>
              						<td class="button_left" onclick="document.getElementById('addSiteToAdd').click();"></td>
              						<td><input id="addSiteToAdd" class="button" type="submit" name="addSiteToAdd" onClick="javascript:addSiteToAddressBook();" value="<fmt:message key='InstallSiteSelector.addtoAddressBook'/>" /></td>
              						<td class="button_right" onclick="document.getElementById('addSiteToAdd').click();"></td>
              					</tr>
              			</table>
				</c:otherwise>
				</c:choose>
				      	
              					
				
				
				<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_delete" style="display:none" >
              					<tr>
              						<td class="button_left" onclick="document.getElementById('selectDelete').click();"></td>
              						<td><input id="selectDelete" class="button" type="submit" name="selectDelete" onClick="javascript:deleteAddBook();" value="<fmt:message key='InstallSiteSelector.remove'/>" /></td>
              						<td class="button_right" onclick="document.getElementById('selectDelete').click();"></td>
              					</tr>
              	</table>
				
				
				<table class="new_secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">

					<tr>

						<td class="button_left" onclick="document.getElementById('cancel').click();"></td>

						<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='InstallSiteSelector.cancel'/>" /></td>

						<td class="button_right" onclick="document.getElementById('cancel').click();"></td>

					</tr>

				</table>
				
				

			</div>


		

		</div>







		<!-- modules end -->

		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->

<div id ="vvvvcalDiv"></div>



<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->

<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->



<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************ -->

<input type="hidden" name="tabtype" id="tabtype" value=''/>
	</body>



</html>

