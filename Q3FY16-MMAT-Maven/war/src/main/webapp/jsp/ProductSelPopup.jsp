<%@ page import="java.math.BigDecimal,java.util.*"%>
<%@ include file="localeInfo.jsp" %>

<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge" />
<jsp:useBean id="handler" scope="request" class="com.cisco.crosstrack.selector.handlers.ProductSelectorHandler" />
<%JSONRPCBridge.registerObject("handler", handler);
			String contextPath = request.getContextPath();
%>

<html>

	<head>
		<title><fmt:message key='ProductSelector.productSelector'/></title>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts
		<script type="text/javascript" src="js/compjs/jsonrpc.js"></script>
		<script type="text/javascript" src="js/genJSON.js"></script>
		<script language="Javascript" src="js/datapersistence.js"></script>
	-->
	<script language="javascript" src="js/productSelector.js"></script>
	<script language="javaScript" src="js/main_lib.js"></script>
	<script type="text/javascript" src="js/popupAlerts.js"></script>
		<script language="Javascript"><!--
      function  initilaize(ctxPath)
      {      
      jsonLoad(ctxPath);

      }      
         var objs = new Array();         
         function refreshArray(v)
         {           
            objs = modifyContent(objs, v);           
         }

         function refreshRadioArray(v)
         {         
            for(var b=0;b<objs.length;b++)
		      {
		           objs.splice(b,1);	         
		      }

		            objs = modifyRadioContent(objs, v);           
         }



         function printSelectedItems()
         {
            printVal(objs);
         }

         function transferDataToMain()
         {
         	var ps1 = new ProductSelectorAlerts();
            if(objs.length==0)
            {
               //alert('XXCSS_CT : 650037 - Please select Product(s) from the results section and \nthen click on the Select Product(s) button');
               alert(ps1.XXCSS_CT_650037);
               return false;
            }

            var xStr = makeJSONStr(objs,'ProductSelector','ProductNumber','ProductDescription');

     		//alert(xStr);
     		window.opener.xtrack_productselector(xStr);
			self.close();
         }        

         function validateChar(obj)
         {
			str = validateInput(document.productSelForm.productNumSearchStr.value, 
					document.productSelForm.productCategory.value, 
					document.productSelForm.productFamily.value);
			if(str != null){
				alert(str);
			}		
			else{	
				if(obj.id=="search")
					showSearchPageData(-1,-1,-1,'ASC','0','searchbutton');
				else if(obj.id=="selectAllProducts")
					getAllDataAndPassToParent(-1,-1,-1,'ASC','0','searchAllButton');
					
			}
			
         }
    
    function noenter() {
    	return !(window.event && window.event.keyCode == 13);
    }     
      --></script>
	</head>

	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->

			<%String strCCOUserId = (String) request.getAttribute("strCCOUserId");

			String strSourceSystem = (String) request.getAttribute("strSourceSystem");
			String strSelectType = (String) request.getAttribute("strSelectType");
			String strWithincontext = (String) request.getAttribute("strWithincontext");
			String strContext = (String) request.getAttribute("strContext");
			String strContextValue = (String) request.getAttribute("strContextValue");
			String strQuoteNumber = (String)request.getAttribute("strQuoteNumber");

			if (strQuoteNumber == null) strQuoteNumber = "";
			
			String strStatus = (String) request.getAttribute("strStatus");
			
			//commented below block to have MLS values
						
			//String title = "";
			//if ("y".equalsIgnoreCase(strWithincontext)) {
			  //if("CONTRACT".equalsIgnoreCase(strContext)){
				//if (strContextValue.length() == 0)
					//title = " - Context to Contracts";
				//else 
					//title = " - " + strContext + " # " + strContextValue;
			  //}
			  //else if ("QUOTE".equalsIgnoreCase(strContext))
			  		//title = " - " + strContext + " # " + strQuoteNumber;
			  //else 
					//title = " - " + strContext + " # " + strContextValue;
			//}
			
			String erMsg = "";

			if (null != request.getAttribute("ERRORMSG")) {
				//erMsg = (String) request.getAttribute("ERRORMSG");
			}
			%>
		<%= erMsg%>

	<body marginheight="0" marginwidth="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" style="width:975px">
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
										<a class="cisco" href="javascript:self.close();"><fmt:message key='ProductSelector.closeWindow'/></a>
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
		<%
			if ("y".equalsIgnoreCase(strWithincontext)) {
				  if("CONTRACT".equalsIgnoreCase(strContext)){
						if (strContextValue.length() == 0){
						//title = " - Context to Contracts";
		%>		
							<h1 style="width:975px">
								<fmt:message key='ProductSelector.productSelector'/> - <fmt:message key='ProductSelector.context'/>
							</h1>
		<%				
					 	}	
					 	else { 
					 	//title = " - " + strContext + " # " + strContextValue;
		%>
							<h1 style="width:975px">
								<fmt:message key='ProductSelector.productSelector'/> - <fmt:message key='ProductSelector.contextContract'/> # <%=strContextValue%>
							</h1>
		<% 				}
					 } //inner if is closed
					else if ("QUOTE".equalsIgnoreCase(strContext)) {
					//title = " - " + strContext + " # " + strQuoteNumber;
		%>
						<h1 style="width:975px">
							<fmt:message key='ProductSelector.productSelector'/> - <fmt:message key='ProductSelector.contextQuote'/> # <%=strQuoteNumber%>
						</h1>		
		<% 		
					}
					else {
					//title = " - " + strContext + " # " + strContextValue;					
		%>
						<h1 style="width:975px">
							<fmt:message key='ProductSelector.productSelector'/> - <fmt:message key='ProductSelector.contextQuote'/> # <%=strContextValue%>
						</h1>					
		<%
				}//inner else is closed
			}//outer if is closed
			else {
		%>
				<h1 style="width:975px">
					<fmt:message key='ProductSelector.productSelector'/>
				</h1>
		<%
			} //outer else is closed
		%>
		
		<!-- modules start -->
		<div id="mod_1" class="mod_pop" style="width:962px">
			<form id="productSelForm" method="get" name="productSelForm" class="inline">

				<!--Hidden Values Set here -->
				<input type="hidden" name="strCCOUserId" id="strCCOUserId" value="<%=strCCOUserId%>" />
				<input type="hidden" name="strSelectType" id="strSelectType" value="<%=strSelectType%>" />
				<input type="hidden" name="strWithincontext" id="strWithincontext" value="<%=strWithincontext%>" />
				<input type="hidden" name="strContext" id="strContext" value="<%=strContext%>" />
				<input type="hidden" name="strContextValue" id="strContextValue" value="<%=strContextValue%>" />
				<input type="hidden" name="strStatus" id="strStatus" value="<%=strStatus%>" />
				<input type="hidden" name="strSourceSystem" id="strSourceSystem" value="<%=strSourceSystem%>" />
				
				
				<!--Hidden Values Set here -->
				<div class="marque_grid">
					<div id="searchFilters" class="sub_block_hr">
						<h3>
							<fmt:message key='ProductSelector.productSearchFilters'/>
						</h3>
						<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
							<colgroup>
								<col width="200" />
								<col width="200" />
								<col width="200" />
							</colgroup>
							<tbody>
								<tr>
									<td align="right">
										<label for="productNum">
											<font color="#9c0000">* </font><fmt:message key='ProductSelector.fullOrPartialProductNumber'/>
										</label>
									</td>
									<td>
										<input type="text" name="productNumSearchStr" id="productNumSearchStr" class="inputTextXLarge" onkeypress="return noenter()"/>
									</td>
									<td align="right">
										<label for="productCategory">
											<font color="#9c0000">* </font><fmt:message key='ProductSelector.productCategory'/>
										</label>
									</td>
									<td align="right">
										<select name="productCategory" id="productCategory" size="1" class="inputTextVLarge" onChange="">
										    <option value='-1'><fmt:message key='ProductSelector.selectOne'/></option>
											<c:forEach var="productCat" items="${alProductCategories}">
												<option value='<c:out value="${productCat}"/>' <c:if test="${productCat eq selProductCat}"> selected </c:if>>
													<c:out value="${productCat}" />
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td align="right"></td>
									<td></td>
									<td align="right">
										<label for="ProductFamily">
											<font color="#9c0000">* </font><fmt:message key='ProductSelector.productFamily'/>
										</label>
									</td>
									<td align="right">
										<select name="productFamily" id="productFamily" size="1" class="inputTextVLarge" onChange="">
											<option value='-1'><fmt:message key='ProductSelector.selectOne'/></option>
											<c:forEach var="productFam" items="${alProductFamilies}">
												<option value='<c:out value="${productFam}"/>' <c:if test="${productFam eq selProductFam}"> selected </c:if>>
													<c:out value="${productFam}" />
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="inline_tertiary">
							<!-- button component -->
							<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="button_left" onclick="document.getElementById('search').click();"></td>
									
									<td style="padding:0">
										<input id="search" onClick="javascript:validateChar(this);" class="button" type="button" name="search" value="<fmt:message key='ProductSelector.searchProducts'/>" />
									</td>

									<td class="button_right" onclick="document.getElementById('search').click();"></td>
								</tr>
							</table>
							<!-- button component -->
							<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="button_left" onclick="document.getElementById('selectAllProducts').click();"></td>
									
									<td style="padding:0">
										<input id="selectAllProducts" onClick="javascript:validateChar(this);" class="button" type="button" name="selectAllProducts" value="Select All Products" />
									</td>

									<td class="button_right" onclick="document.getElementById('selectAllProducts').click();"></td>
								</tr>
							</table>				
							
							
						<a href="javascript:document.getElementById('productSelForm').reset();" class="inline_buttonAlt float_right"><fmt:message key='ProductSelector.clearAllField'/> <img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='ProductSelector.clearFieldsAlt'/>" align="absmiddle" height="13" width="13" border="0" name="ClearFields" id="ClearFields" /></a>							
						<br class="clear_all" />
						</div>
						<table>
							<tr>
								<td style="padding:0">
									<font color="#9c0000">
									<fmt:message key='ProductSelector.oneFieldMandatory'/>
									</font>
								</td>
							</tr>
						</table>
					</div>
					<div id="productResults">
						<jsp:include page="/jsp/ProductSelResults.jsp" />

					</div>

				</div>
				
				<!-- buttons start -->
				<div id="button_1" class="button_block_med">
			
					<!-- button component -->
					<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="button_left" onclick="document.getElementById('selectProducts').click();"></td>
							<td>
								<input id="selectProducts" class="button" type="button" name="selectProducts" value="<fmt:message key='ProductSelector.selectProducts'/>" onClick= "return transferDataToMain();"/>
							</td>
							<td class="button_right" onclick="document.getElementById('selectProducts').click();"></td>
						</tr>
					</table>

					<!-- button component -->
					<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="button_left" onclick="document.getElementById('selectAllProducts').click();"></td>
							<td>
								<input id="selectAllProducts" class="button" type="button" name="selectAllProducts" value="Select All Products" onClick="javascript:validateChar(this);" />
							</td>
							<td class="button_right" onclick="document.getElementById('selectAllProducts').click();"></td>
						</tr>
					</table>
										
					<!-- button component -->
					<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
						<tr>
							<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
							<td>
								<input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='ProductSelector.cancel'/>" />
							</td>
							<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

	</body>
</html>
