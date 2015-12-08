<%@ page language = "java" %>

<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ include file="localeInfo.jsp" %>



<jsp:useBean id="JSONRPCBridge" scope="session"
     class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="handler" scope="request"
     class="com.cisco.crosstrack.selector.handlers.CustomerSelectorHandler" />
<% JSONRPCBridge.registerObject("handler", handler);
   String contextPath = request.getContextPath();

	String strContextValue = (String)request.getAttribute("strContextValue");
	String strContext = (String)request.getAttribute("strContext");
	String strWithinContext = (String)request.getAttribute("strWithinContext");
	String sortId =(String)request.getAttribute("sordId");
	
   if(sortId==null ||sortId.equals("") )
   sortId="-1";

	String title = "";
	if ("y".equalsIgnoreCase(strWithinContext)) {
		if (strContextValue.length() == 0)
			title = " - Context to " + strContext;
		else 
			title = " - " + strContext + " #" + strContextValue;
	}
   
	%>
<html >

	<head>
		<title><fmt:message key='CustomerSelector.customerSelector'/><%=title%></title>
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		
<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts 			
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/genJSON.js"></script>
		<script type="text/javascript" src="js/jsonrpc.js"></script>
		<script language="javascript" src="js/datapersistence.js"></script>
	-->	
      	<script language="javascript" src="js/customerSelector.js"></script>      	
		<script type="text/javascript" src="js/popupAlerts.js"></script>
		<!-- Added for TD20791 Q2FY13 by nvelaga -->
		<script language="JavaScript" src="js/help.js" type="text/javascript"></script>
		
      <script language="Javascript">
         var objs = new Array();

         function refreshArray(v)
         {
            objs = modifyContent(objs, v);
			//alert("refreshArray :: objs "+objs);
         }

         function printSelectedItems()
         {
            printVal(objs);
         }

         function transferDataToMain()
         {
         	var customerAlerts = new CustomerAlerts();
         	
            if(objs.length==0)
            {
               //alert('XXCSS_CT-650023: Please select Customer(s) from the results section and then click on Select Customer(s) button');
               alert(customerAlerts.XXCSS_CT_650023);
               return false;
            }
       		var xStr = makeJSONStr(objs,'CustomerSelector','CustomerNumber','CustomerName');
     		//alert(xStr);
     		self.creator.xtrack_customerselector(xStr);

			self.close();
         }

         function validateChar(divname)
         {
         	var customerAlerts = new CustomerAlerts();
         	
         	if(validateBlankName(document.custChildForm.strRequestedData1.value))
				//alert ("XXCSS_CT-650020 : Please enter Customer Name.");
				alert(customerAlerts.XXCSS_CT_650020);
			//Added for TD20791 Q2FY13 by nvelaga
			else if (validateWildCards(document.custChildForm.strRequestedData1.value))
				//alert ("Maximum 3 wildcards can be used for searching the Customer Name. Please modify and resubmit your search.");
				alert(customerAlerts.entryHasMoreWildCards);
         	else if (validateLength(document.custChildForm.strRequestedData1.value))
				//alert ("XXCSS_CT-650007: Minimum 3 characters are required for searching the Customer Name. Please modify and resubmit your search");
				alert(customerAlerts.XXCSS_CT_650007);
         	else if (validateLen(document.custChildForm.strRequestedData1.value))
	         	//alert ("XXCSS_CT-650022: Maximum characters allowed for searching Customer Name is limited to 40 characters. Please modify and resubmit your search.");
	         	alert(customerAlerts.XXCSS_CT_650022);
         	else if (charValidations(document.custChildForm.strRequestedData1.value) == false)
	         	//alert ("Entry has special characters. \nThese are not allowed.\n Please remove them and try again.");
	         	alert(customerAlerts.entryHasSpecialChars);
	        else if (validateAscii(document.custChildForm.strRequestedData1.value))
	         	alert(customerAlerts.entryHasSpecialChars);
	        else
	        	showFilterPageData(divname,-1,-1,-1,'ASC','0');
         }

         function disableEnterKey(e)
         {
			var key;
			if (window.event)
				key = window.event.keyCode;
			else
				key = e.which;
			if (key==13)
				return false;		
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
         
      </script>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->
	<!-- top banner -->

		
	<body marginheight="0" marginwidth="0" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top">
						<img src="<%=combinedImagesLocation%>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" />
					</td>
					<td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100">
										<img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="100" border="0" />
									</td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%">
										<img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="1" border="0" />
									</td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100">
										<a class="cisco" href="javascript:self.close();"><fmt:message key='CustomerSelector.closeWindow'/></a>
									</td>
									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif">
										<img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" />
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- screen title -->
		<h1>
			<fmt:message key='CustomerSelector.customerSelector'/>
		</h1>
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
			<form id="custChildForm" action="#" method="get" name="custChildForm" class="inline">
			<!--Hidden Values Set here -->	
			<input type="hidden" name="strSourceSystem" id="strSourceSystem" value= '<%=request.getAttribute("strSourceSystem")%>'/>
			<input type="hidden" name="strContextValue" id="strContextValue" value='<%=request.getAttribute("strContextValue")%>'/>
			<input type="hidden" name="strRequestedData" id="strRequestedData" value='<%=request.getAttribute("strRequestedDataData")%>'/>		
			
			<input type="hidden" name="strWithinContext" id="strWithinContext" value='<%=request.getAttribute("strWithinContext")%>'/>		
			<input type="hidden" name="strContext" id="strContext" value='<%=request.getAttribute("strContext")%>'/>		
			<input type="hidden" name="strStatus" id="strStatus" value='<%=request.getAttribute("strStatus")%>'/>		
			<input type="hidden" name="strSelectType" id="strSelectType" value='<%=request.getAttribute("strSelectType")%>'/>		
			<input type="hidden" name="strSearchHier" id="strSearchHier" value='<%=request.getAttribute("strSearchHier")%>'/>		
			<input type="hidden" name="strCustomerName" id="strCustomerName" value='<%=request.getAttribute("strCustomerName")%>'/>			

			<input type="hidden" name="strCCOUserId" id="strCCOUserId" value='<%=request.getAttribute("strCCOUserId")%>' />			
			<input type="hidden" name="strAuthLevel" id="strAuthLevel" value='<%=request.getAttribute("strAuthLevel")%>' />
					
			<!--Hidden Values Set here -->
			<div class="marque_grid" style="width:100%">
				<div id="searchFilters" class="sub_block_hr">
					<h3>
						<fmt:message key='CustomerSelector.searchFilters'/>
					</h3>

					<table border="0" cellspacing="0" cellpadding="0">
							<colgroup>
								<col width="7%" />
								<col width="25%" />
								<col width="68%" />
							</colgroup>
						<tbody>
							
							<tr>
								<td align="right" nowrap>
									<label for="lookup">
									<!-- Added Helpfield for TD20791 wildcard search Q2FY13..nvelaga-->
										<font color="#9c0000">&nbsp;&nbsp;&nbsp;&nbsp;* </font>
										<c:if test="${applicationScope.helpFields['CS_Customer_Name'] == 'Customer_Selector'}">
										<input class="help" readonly onClick="getHelp('CS_Customer_Name','<c:out value="${applicationScope.helpFields['CS_Customer_Name']}" />','MMAT');"></input>
										</c:if>
										<fmt:message key='CustomerSelector.customerName'/>
									</label>
								</td>
								<td>
									<input type="text" name="strRequestedData1" id="strRequestedData1" class="inputTextXLarge" onKeyPress="return disableEnterKey(event)"/>
								</td>
								<!-- Go button changed to  -->
								
								<td align="right">				
									<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="button_left" onclick="document.getElementById('searchforCustomer').click();"></td>
											<td><input id="searchforCustomer" class="button" type="button" name="searchforCustomer" value="<fmt:message key='CustomerSelector.searchCustomers'/>" onClick= "javascript:validateChar('tablediv');" /></td>
											<td class="button_right" onclick="document.getElementById('searchforCustomer').click();"></td>
										</tr>
									</table>
									&nbsp;&nbsp;&nbsp;					
								</td>					

							</tr>
							
						</tbody>
					</table>
				</div>

						<div id="tablediv">
								<jsp:include page ="/jsp/CustomerSelectorPopupResults.jsp" />
						
					</div>				

				<div class="sub_block display_false" id="tab2_content" style="height:150px">
					<br />
				</div>
			</div>

			<div style="width:100%">
				<!-- buttons start -->
				<div id="button_1" class="button_block_sm">
					<!-- button component -->
					<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="button_left" onclick="document.getElementById('selectCustomer').click();"></td>
							<td><input id="selectCustomer" class="button" type="button"
							name="selectCustomer" value="<fmt:message key='CustomerSelector.selectCustomers'/>" onClick= "return transferDataToMain();"/></td>
							<td class="button_right" onclick="document.getElementById('selectCustomer').click();"></td>
						</tr>
					</table>
					<!-- button component -->
					<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
						<tr>
							<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
							<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='CustomerSelector.cancel'/>" /></td>
							<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<!-- modules end -->
		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->
		<!-- div id="vvvvcalDiv">
		 
		</div-->

		<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->
		<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->

		<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************ -->
		</form>
		</div>
	</body>

</html>
