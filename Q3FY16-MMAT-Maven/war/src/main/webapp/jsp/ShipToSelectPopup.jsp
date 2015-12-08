<!-- JSP = ShipToSelectPopup.jsp -->
<!--
Project Name : Synergy for TD2417
--------------------------------------------------------------------
Date               Author			Comments
--------------------------------------------------------------------
24-OCt-2007			msahoo 			Intial Draft
-->

                                        <!--    THIS JSP STARTS  -->
<%@ page language="java" import="org.json.*,com.metaparadigm.jsonrpc.JSONRPCBridge , java.util.*"%>
<%@ include file="localeInfo.jsp" %>

<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="handler" scope="request" class="com.cisco.crosstrack.selector.handlers.ShipToSelectorHandler" />
<%
	JSONRPCBridge.registerObject("handler", handler);
	String contextpath = request.getContextPath();	
%>
<%@  page import="com.cisco.crosstrack.selector.data.genjava.XxcssCtCountryObjType,com.cisco.crosstrack.selector.data.genjava.XxcssCtBusiEntiObjType" %>
<html>
  <head>
    <title><fmt:message key='ShipToSelector.shipToSearchPage'/></title>
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
	
	
		<script type="text/javascript" src="js/Crosstrack.js"></script>
		<script type="text/javascript" src="js/popupAlerts.js"></script>		
		<script language="JavaScript" type="text/javascript" src="js/shiptopopup.js"></script>

		<script language="JavaScript">		
		
				
				 function validateChar()
			     {
			     	var bs = new ShipToAlerts();  // Start for2417 
			     	if(document.getElementById('shipToName').value =='' && document.getElementById('shipToID').value =='')
			     	{
			     		//alert('XXCSS_CT-650006: Please enter Bill-To Name or Bill-To ID.');
			     		alert(bs.XXCSS_CT_650006);
			     		return false;
			     	}
			     	else if(document.getElementById('shipToName').value !='' && document.getElementById('shipToID').value =='')
			     	{
				     	if(validateLength(document.getElementById('shipToName').value)) // Done for2417
						{						
							//alert('XXCSS_CT-650007: Minimum 3 characters are required for searching the Bill-To Name. Please modify and resubmit your search.');
							alert(bs.XXCSS_CT_650007);
							document.getElementById('shipToName').value ='';
							return false;						
					 	}
					 	else if(validateLen(document.getElementById('shipToName').value)) {
					 		//alert('XXCSS_CT-650008: Maximum characters allowed for searching Bill-To Name is limited to 40 characters. Please modify and resubmit your search.');
					 		alert(bs.XXCSS_CT_650008);
					 		document.getElementById('shipToName').value ='';
					 		return false;
					 	}
					 	else if (validateAscii(document.getElementById('shipToName').value)){
			         		alert(bs.XXCSS_CT_650077);
			         		return false;
			         	}
			         					 	
				 	}     
				 	else if(document.getElementById('shipToName').value =='' && document.getElementById('shipToID').value !='')
				 	{
					 	if(validateLength(document.getElementById('shipToID').value)) 
						{						
							//alert('XXCSS_CT-650069: Minimum 3 characters are required for searching the Bill-To ID. Please modify and resubmit your search.');
							alert(bs.XXCSS_CT_650069);
							document.getElementById('shipToID').value ='';
							return false;						
					 	}
				 																																 
			  		if(!charValidations(document.getElementById('shipToID').value)){
			  			//alert ("XXCSS_CT-650070: Special characters not allowed. Please remove them and resubmit your search.");return false;
			  			alert (bs.XXCSS_CT_650077);
						return false;
			  		}
			  		else if (validateAscii(document.getElementById('shipToID').value)){
			         	alert(bs.XXCSS_CT_650077);
			         	return false;
			         }
					else if(enforceNumbersOnly(document.getElementById('shipToID').value)){						
						//alert("XXCSS_CT-651024:This is a numeric field. Please enter a number.");
						alert (bs.XXCSS_CT_651024);
						return false;
					}
					
				  }
				  if (validateAscii(document.getElementById('city').value)){
			         	alert(bs.XXCSS_CT_650077);
			         	return false;
			      }
		        	showSearchPageData(-1,-1,-1,'ASC','0','searchbutton');
		      }  // 2417 End

				var addtoAddressObjs = new Array();
				var deleteAddressObjs = new Array();
	         
				var shipToObjects = new Array(); //2417
				var selectedShiptoId = null; // 2417
			   //alert('Page loaded.. Just created a new array : '+shipToObjects.length);
			   
				function printSelectedItems()
				{
				  printVal(shipToObjects);
				}
				

				function refreshChBoxAddressArray(v){
				    // alert('refreshChBoxAddressArray');
					//alert('v :'+v);
				   var type = (document.getElementById("button_remove").style.display=='block')?"address":"search";
				  	//alert("Type : "+type);
					if(type == "search"){
						 addtoAddressObjs = modifyContent(addtoAddressObjs, v);
					 }else if(type == "address"){						 
						  deleteAddressObjs = modifyContent(deleteAddressObjs, v);						
					  }
					  //alert("addtoAddressObjs ::"+addtoAddressObjs);
					  //alert("deleteAddressObjs ::"+deleteAddressObjs);
				}
				
				function refreshArray(v, obj)
				{
				  //alert('inside refreshArray for '+v);      
				  //alert('BEFORE adding shipToObjects :'+shipToObjects);
				  if(obj.checked) {
				     shipToObjects = addVal(shipToObjects, v);
				  }
				  else
				     shipToObjects = deleteVal(shipToObjects, v);
				   //alert('aftrer adding shipToObjects :'+shipToObjects); 
				}
			    
			     function transferDataToMain(pickerSelection)
	         	{
			        var bs = new ShipToAlerts();
		            if(pickerSelection=='single'){
		               if(selectedShiptoId==null){
		               alert(bs.XXCSS_CT_650009);
//		               alert('XXCSS_CT-650009: Please select Bill-To(s) from the results section and then click on Select Bill To(s) button.');
		               return false;
		               }
			            shipToObjects = addVal(shipToObjects, selectedShiptoId);
			            transferData(shipToObjects);              
	            	} else {
			            if(shipToObjects.length==0)
			            {
			               //alert('XXCSS_CT-650009: Please select Bill-To(s) from the results section and then click on Select Bill To(s) button.');
			               alert(bs.XXCSS_CT_650009);
			               return false;
			            }                
			            transferData(shipToObjects);
			      	}
		         }	         
		        
		         
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
				  	//alert ("Special characters not allowed.Please remove them and resubmit your search.");				
				  	return false;
				  	}
		  		  }
				return true;
			}

		
			function enforceNumbersOnly(value){
			 var iChars = "0123456789";
			  trimvalue = trim(value);
			  for (var i = 0; i < trimvalue.length; i++) {
			  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
			//		trimvalue.focus();
			//  		alert("ship to id is 111= " +value);
			  	return false;
			  	}
			  }
				return true;
				}

		function modifyInputFields(withinContext, userType){
	    	    	//alert('------in modifyInputFields()'+withinContext);
	    	var shipToID= document.getElementById('shipToID').value;
	        if(withinContext == 'N' ){	        	
	        	if(shipToID.length >0){
	        		//alert('---within context N siteid is '+shipToID.length);
	        		document.getElementById('shipToName').value ='';
	        		document.getElementById('country').options[0].selected = true;
	        		document.getElementById('stateProvince').options[0].selected = true;
	        		document.getElementById('city').value ='';	 
	        		if(userType == 'INTERNAL'){
	        			document.getElementById('businessEntity').options[0].selected = true;       		
	        		}
	        		document.getElementById('shipToName').disabled = true;
	        		document.getElementById('country').disabled = true;
	        		document.getElementById('city').disabled = true;
	        		document.getElementById('stateProvince').disabled = true;
	        		document.getElementById('businessEntity').disabled = true;
	        	}else{
	        	//alert('---within context N siteid is '+shipToID.length);
	        		document.getElementById('shipToName').disabled = false;
	        		document.getElementById('country').disabled = false;
	        		document.getElementById('city').disabled = false;
	        		document.getElementById('stateProvince').disabled = false;
	        		document.getElementById('businessEntity').disabled = false;
	        	}
	        
	        }
	    	//return true;
	    }		

			function addShipToAddressBook(){	
				//	alert('------');
				var type = (document.getElementById("button_remove").style.display=='block')? "address":"search";
				//alert("type in addShipToAddressBook :"+type);
				if(type == 'search') {
					if(addtoAddressObjs.length == 0) {
						alert("XXCSS_CT-650079 : Please select Ship-To(s) from the results section and then click on Add to Address Book button.");
						return false;
					}
				}
				addToAddressBook();
			}
			
			function deleteShipToAddressBook(){  
				var type = (document.getElementById("button_remove").style.display=='block')? "address":"search";
				//alert("type in deleteShipToAddressBook :"+type);
				if(type == 'address') {
					if(deleteAddressObjs.length == 0)
					{
						alert("XXCSS_CT-650080 : Please select Ship-To(s) from the results section and then click on Remove from Address Book button.");
						return false;
					}
				}
				deleteAddBookData();
			}							

			function showAddressBook(){
				showShipToAddressBookData(-1,-1,-1,'ASC','0','addressBook');
			}							
				          			
	         
				function dropDown()
				{							
					var index  = document.getElementById('country').selectedIndex;
					if(index>0)
					{							
						document.getElementById('stateProvince').selectedIndex = 0
						document.getElementById('stateProvince').disabled = false;							
					}
					else
					{
						document.getElementById('stateProvince').disabled = true;							
						document.getElementById('stateProvince').selectedIndex = 0;
					}
				}
				
			function refreshRadioArray(v)
	         {
	        // alert('-----inside refresh radio array  shipToObjects.length is '+shipToObjects.length);
	        	for(var b=0;b<shipToObjects.length;b++)
			      {
			           shipToObjects.splice(b,1);
	     	      }
			            shipToObjects = modifyRadioContent(shipToObjects, v);
			           // alert('---------'+shipToObjects);
	         }  
			 
			 function refreshRadioAddressArray(v){	
			//	alert('----');		
				var tabtype = (document.getElementById("button_remove").style.display=='block')? "address":"search";
				//alert('------tabtype is '+tabtype);
				if(tabtype == "search"){			
					for(var b=0;b<addtoAddressObjs.length;b++)

					  {
						   addtoAddressObjs.splice(b,1);
					  }

							addtoAddressObjs = modifyRadioContent(addtoAddressObjs, v);
						   // alert('-------addtoAddressObjs is'+addtoAddressObjs);
						   //  alert('-------addtoAddressObjs.length is'+addtoAddressObjs.length);
				}
				if(tabtype == "address"){
				//	alert('----deleteAddressObjs length is before splice'+deleteAddressObjs.length);
					for(var b=0;b<deleteAddressObjs.length;b++)
					  {
						   
						   deleteAddressObjs.splice(b,1);
					  }

							deleteAddressObjs = modifyRadioContent(deleteAddressObjs, v);
				     //         alert('-------deleteAddressObjs is'+deleteAddressObjs);
					//        alert('-------deleteAddressObjs.length is'+deleteAddressObjs.length);
				}
				
				//alert('----- radio addtoAddressObjs'+addtoAddressObjs);
				//alert('----- radio deleteAddressObjs'+deleteAddressObjs);	
		}
	   </script>
	</head>
		 <%
		    String context="" ;
		    String contextValue=""; 
		 
			List countryList = new ArrayList();	
			List genCountryList=new ArrayList();		
			String withinContext 	= (String) request.getAttribute("withinContext");
			if(request.getAttribute("context")!=null){
			 context 			= (String) request.getAttribute("context");
			}
			if(request.getAttribute("contextValue")!=null){
			 contextValue 	= (String) request.getAttribute("contextValue");
			}
			String status 			= (String) request.getAttribute("status");
			String pickerSelection 	= (String) request.getAttribute("pickerSelection");
			String strSourceSystem 	= (String) request.getAttribute("strSourceSystem");
			
			 //ShipToSelector changes			
			 if ((withinContext != null) && (withinContext.equalsIgnoreCase("Y"))) { 
				countryList 			= (ArrayList)request.getAttribute("countryList");
				} else {
				genCountryList 			= (ArrayList)request.getAttribute("genCountryList");
				}
			ArrayList bEntityList 	= (ArrayList) request.getAttribute("bEntityList");
			ArrayList stateList 	= (ArrayList)request.getAttribute("stateList");			
			
			String strCCOUserId 	= (String) request.getAttribute("strCCOUserId");
			String userType 		= (String) request.getAttribute("userType");
			String strAuthLevel 	= (String) request.getAttribute("strAuthLevel");
			String strShipToTabType	= (String) request.getAttribute("strShipToTabType");
			
				
			ArrayList all = new ArrayList();
			if (null != request.getAttribute("shipToResults")) {
				all = (ArrayList) request.getAttribute("shipToResults");
			}		
			
		
 		
				%>
			
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->
  
   	<%//if ((withinContext != null) && (withinContext.equalsIgnoreCase("N"))) {%>
		<!-- <body marginheight="0" marginwidth="0" onLoad="javascript:populateCountries();">-->
	<%//}else if ((withinContext != null) && (withinContext.equalsIgnoreCase("Y"))) {%>
		<body marginheight="0" marginwidth="0" >
	<%//}%>
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" style="width:975px">
				<tbody>
					<tr>
						<td align="center" valign="top">
							<img src="https://www.cisco.com/swa/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" />
						</td>
						<td bgcolor="#ffffff" valign="top" width="100%">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100">
											<img src="https://www.cisco.com/swa/i/s.gif" alt="" height="8" width="100" border="0" />
										</td>
										<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%">
											<img src="https://www.cisco.com/swa/i/s.gif" alt="" height="8" width="1" border="0" />
										</td>
									</tr>
									<tr>
										<td valign="top" nowrap="nowrap" width="100">
											<a class="cisco" href="javascript:self.close();"><fmt:message key='ShipToSelector.closeWindow'/></a>
										</td>
										<td align="left" valign="top" width="100%" background="https://www.cisco.com/swa/i/grn_vertlines_top.gif">
											<img src="https://www.cisco.com/swa/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" />
										</td>
										</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- screen title -->
			
				<%
				if ("y".equalsIgnoreCase(withinContext)) {
					if (contextValue.length() == 0){
				%>
						<h1 style="width:975px">
							<fmt:message key='ShipToSelector.Ship_To_Selector'/> - <fmt:message key='ShipToSelector.context'/> <!--  RAJ -->
						</h1>
				<%
					} 
					else {
						if (context.equalsIgnoreCase("CONTRACT")){
							//title = " - " + context + " # " + contextValue;
				%>
							<h1 style="width:975px">
								<fmt:message key='ShipToSelector.Ship_To_Selector'/> - <fmt:message key='ShipToSelector.contextContract'/> # <%=contextValue%>
							</h1>
				<%
						}
						else {
				%>
							<h1 style="width:975px">
								<fmt:message key='ShipToSelector.Ship_To_Selector'/> - <fmt:message key='ShipToSelector.contextQuote'/> # <%=contextValue%>
							</h1>
				<%
						}//inner else closed
					}//outer else closed
				}//outer if closed
				else{
				%>
				<h1 style="width:975px">
					<fmt:message key='ShipToSelector.Ship_To_Selector'/>  <!--  RAJ-->
				</h1> 
				<%
				}//outer else is closed
				%>

			<!-- modules start -->
			<div id="mod_1" class="mod_pop" style="width:962px">
				<form id="shiptoFormName" action="#" method="get" name="shiptoFormName" class="inline">
				<!--Hidden Values Set here -->
				<input type="hidden" name="withinContext" id="withinContext" value='<%=withinContext%>' />
				<input type="hidden" name="context" id="context" value='<%=context%>' />
				<input type="hidden" name="contextValue" id="contextValue" value='<%=contextValue%>' />
				<input type="hidden" name="status" id="status" value='<%=status%>' />
				<input type="hidden" name="pickerSelection" id="pickerSelection" value='<%=pickerSelection%>' />
				<input type="hidden" name="strSourceSystem" id="strSourceSystem" value='<%=strSourceSystem%>' />				
				
				<input type="hidden" name="strCCOUserId" id="strCCOUserId" value='<%=strCCOUserId%>' />
				<input type="hidden" name="userType" id="userType" value='<%=userType%>' />
				<input type="hidden" name="strAuthLevel" id="strAuthLevel" value='<%=strAuthLevel%>' />
				<input type="hidden" name="strShipToTabType" id="strShipToTabType" value='<%=strShipToTabType%>'/>
				<!--Hidden Values Set here -->
			<div class="marque_grid">
					<div id="searchFilters" class="sub_block_hr">
						<h3>
							<fmt:message key='ShipToSelector.Search_Filters'/>
						</h3>
						<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
							<colgroup>
								<col width="200" />
								<col width="505" />
								<col width="130" />
							</colgroup>
							<tbody>
								<tr>
									<td align="right">
										<label for="shipToName">
											<font color= "red"> * </font><fmt:message key='ShipToSelector.Ship_To_Name'/>
										</label>
									</td>
									<td>
										<input type="text" name="shipToName" id="shipToName" class="inputTextXLarge" />
									</td>
									<td align="right"></td>
									<td></td>
								</tr>
								<tr>
									<td align="right">
										<label for="shipToID">
											<font color= "red"> * </font><fmt:message key='ShipToSelector.Ship_To_ID'/>  <!--  RAJ-->
										</label>
									</td>
									<td>
										<input type="text" name="shipToID" id="shipToID" class="inputTextXLarge" onBlur="javascript:modifyInputFields('<%=withinContext%>', '<%=userType%>');"/>
									</td>
									<td align="right"></td>
									<td></td>
								</tr>

								<tr>
									<td align="right">
										<label for="country">
											<fmt:message key='ShipToSelector.Country'/>
										</label>
									</td>
									<td>
									<!--	<select name="country" class="inputTextLarge" size="1" onchange="javascript:getStates();" id="country"> -->
									<select name="country" class="inputTextLarge" size="1" onchange="javascript:getStates('<%=strCCOUserId%>','<%=strSourceSystem%>');" id="country">
												 <%if ((withinContext != null) && (withinContext.equalsIgnoreCase("Y"))) { 
													 XxcssCtCountryObjType	country;%>
													<option value='-1'><fmt:message key='ShipToSelector.selectone'/></option>
													<%
														if(countryList !=null && countryList.size() >0) {
														for (int i = 0; i < countryList.size(); i = i + 1) {
															country=(XxcssCtCountryObjType)countryList.get(i); 
															if(country.getCountryCode() != null) {%>
															<option value="<%=country.getCountryCode()%>"><%=country.getCountryDescription()%></option>
												<% 			}
														}
												  	  }
													}  else if ((withinContext != null) && (withinContext.equalsIgnoreCase("N"))) {  
													XxcssCtCountryObjType	country;%>													
													<option value='-1'><fmt:message key='ShipToSelector.selectone'/></option>
													<%
													if(genCountryList !=null && genCountryList.size() >0) {
														for (int i = 0; i < genCountryList.size(); i = i + 1) {
															country=(XxcssCtCountryObjType)genCountryList.get(i); 
															if(country.getCountryCode() != null) {%>
															<option value="<%=country.getCountryCode()%>"><%=country.getCountryDescription()%></option>																										
												
												<% 			}
														}
												  	  }
												  	 }
												  %>
										</select>							
										<!-- <input type="text" name="country" id="country" class="inputTextLarge" /> -->
									</td>
									<td align="right"></td>
									<td></td>
								</tr>
								
								<tr>
									<td align="right">
										<label for="state">
											<fmt:message key='ShipToSelector.State_Province'/>
										</label>
									</td>
									<td>
										<select class="inputTextLarge" size="1" name="stateProvince" id="stateProvince">
											<!-- option id="" selected="selected" value=""-->
											<option value="-1" selected="selected"><fmt:message key='ShipToSelector.selectone'/></option>
										</select>
									</td>
									<td align="right"></td>
									<td></td>
								</tr>

								<!--***************Start Changes for ShipToSelector Enhancement******************-->
								<%if ((userType !=null) && (!userType.equalsIgnoreCase("Internal")) ){%>
								<!--***************End Changes for ShipToSelector Enhancement******************-->
								<tr>
									<td align="right">
										<label for="city">
											<fmt:message key='ShipToSelector.City'/>
										</label>
									</td>
									<td>
										<input type="text" name="city" id="city" class="inputTextLarge" />
									</td>
									<td>									  
										<a href="javascript:document.getElementById('shiptoFormName').reset(); javascript:modifyInputFields('<%=withinContext%>', '<%=userType%>');" class="inline_buttonAlt float_right"><fmt:message key='ShipToSelector.Clear_Fields'/><img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="Clear Fields" align="absmiddle" height="13" width="13" border="0"name="ClearFields" id="ClearFields" /></a>
									</td>
									<td>
										<!-- button component -->
										<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="button_left" onclick="document.getElementById('searchShipTo').click();"></td>
												<td style="padding:0">
													<input id="searchShipTo" class="button" type="button" onClick="javascript:validateChar();" name="searchShipTo" value="<fmt:message key='ShipToSelector.Search_for_Ship_To'/>" />
												</td>
												<td class="button_right" onclick="document.getElementById('searchShipTo').click();"></td>
											</tr>
										</table>
									</td>
								</tr>
											<input type="hidden" name="businessEntity" id="businessEntity" value="" />
								<!--***************Start Changes for ShipToSelector Enhancement******************-->
								<%} else if ((userType !=null) && (userType.equalsIgnoreCase("Internal")) ) {%>								
								<tr>
									<td align="right">
										<label for="city">
											<fmt:message key='ShipToSelector.City'/>
										</label>
									</td>
									<td>
										<input type="text" name="city" id="city" class="inputTextLarge" />
									</td>
								</tr>
								<tr>


									<td align="right">
										<label for="businessEntity">
											<fmt:message key='ShipToSelector.Business_Entity'/>
										</label>
									</td>
									<td>
										<select name="businessEntity" id="businessEntity" class="inputTextLarge" />
													
											<%  if ((withinContext != null) && (withinContext.equalsIgnoreCase("Y"))) { 
												XxcssCtBusiEntiObjType bEntity;%>
												<option value='-1'><fmt:message key='ShipToSelector.selectone'/></option>
												<%
												if(bEntityList !=null && bEntityList.size() >0) {
												for(int i=0;i<bEntityList.size(); i++) {
													bEntity=(XxcssCtBusiEntiObjType)bEntityList.get(i); 
													if(bEntity.getBusinessEntity() != null) {%> 														
                          							   <option value="<%=bEntity.getBusinessEntity()%>"><%=bEntity.getBusinessEntity()%></option>                           		 						
                          							<%		}
														 } 
                          							  }
                          							} else if ((withinContext != null) && (withinContext.equalsIgnoreCase("N"))) {
                          							XxcssCtBusiEntiObjType bEntity;%>													
													<option value='-1'><fmt:message key='ShipToSelector.selectone'/></option>
													<%
                          								if(bEntityList !=null && bEntityList.size() >0) {
														for(int i=0;i<bEntityList.size(); i++) {
														bEntity=(XxcssCtBusiEntiObjType)bEntityList.get(i); 
														if(bEntity.getBusinessEntity() != null) {%> 														
														   <option value="<%=bEntity.getBusinessEntity()%>"><%=bEntity.getBusinessEntity()%></option>                           		 						
                          							<% 	
                          									}
                          								}
													  }
                          							}
                          							%>
										</select>										
									</td>
									<td width="15%">
										<a href="javascript:document.getElementById('shiptoFormName').reset(); javascript:modifyInputFields('<%=withinContext%>', '<%=userType%>');" class="inline_buttonAlt float_right"><fmt:message key='ShipToSelector.Clear_Fields'/> <img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="Clear Fields" align="absmiddle" height="13" width="13" border="0" name="ClearFields" id="ClearFields" /></a>
									</td>
									<td>
										<!-- button component -->
										<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="button_left" onclick="document.getElementById('searchShipTo').click();"></td>
												<td style="padding:0">
													<input id="searchShipTo" class="button" type="button" onClick="javascript:validateChar();" name="searchShipTo" value="<fmt:message key='ShipToSelector.Search_for_Ship_To'/>" />
												</td>
												<td class="button_right" onclick="document.getElementById('searchShipTo').click();"></td>
											</tr>
										</table>
									</td>
								</tr>
								<%}%>
								<!--***************End Changes for ShipToSelector Enhancement******************-->
							</tbody>
						</table>
						<font color= "red">&nbsp;&nbsp; <fmt:message key='ShipToSelector.NOTE_Field_Mandatory'/> </font>
					</div>
					<!--  Rsults Section For Both Context and Generic Starts Here-->
					
					<div id="shiptoresults">
					<jsp:include page="/jsp/ShipToPopupFilterResults.jsp"/>
					</div>
			</div>
		<!-- buttons start -->
		<div id="button_1" class="button_block_med">
			<!-- button component -->
			<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_selectShipTo" style="display:block">
				<tr>
					<td class="button_left" onclick="document.getElementById('selectShipTo').click();"></td>
					<td>
						<input id="selectShipTo" class="button" type="button" name="selectShipTo" onClick="transferDataToMain('<%=pickerSelection%>');" value="<fmt:message key='ShipToSelector.Select_Ship_To'/>" />
					</td>
					<td class="button_right" onclick="document.getElementById('selectShipTo').click();"></td>
				</tr>
			</table>
			<!-- ---------commented for the Address & Search tab.Changing the button -------------->
			<!-- button component -->
					<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_remove" style="display:none">
              					<tr>
              						<td class="button_left" onclick="document.getElementById('remove').click();"></td>
              						<td><input id="remove" class="button" type="button" name="remove"  onclick="javascript:deleteShipToAddressBook();" value="<fmt:message key='ShipToSelector.removeFromAddBK'/>"/></td>
              						<td class="button_right" onclick="document.getElementById('remove').click();"></td>
              					</tr>
					</table>
					
					<table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0" id="button_addShipToAdd" style="display:block">			
								<tr>
              						<td class="button_left" onclick="document.getElementById('addShipToAdd').click();"></td>
              						<td><input id="addShipToAdd" class="button" type="button" name="addShipToAdd" onClick="javascript:addShipToAddressBook();" value="<fmt:message key='ShipToSelector.Add_to_Address_Book'/>" /></td>
              						<td class="button_right" onclick="document.getElementById('addShipToAdd').click();"></td>
              					</tr>
              				</table>
					
			<!-- button component -->
			<table class="new_secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
				<tr>
					<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
					<td>
						<input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='ShipToSelector.cancel'/>" />
					</td>
					<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
				</tr>
			</table>
		</div>
		
		</form>
		</div>
						
  </body>
</html>