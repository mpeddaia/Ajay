<%@ page language = "java" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>

<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%> 
<%@ include file="localeInfo.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 	
  	String statusString="Select One";
  	String functionString="Select One";
   String requestTypeString="Select One";
   String requestIdString="";
   String requestorIdString="";
   String requestDateFromString="";
   String requestDateToString="";
   String referenceIdString="";
%>

<script language="JavaScript">
  
   
    function showChild() {
    		// alert("showChild");
    		// var url = "./userIdSelector.do?methodName=onshowPopup";
    		var url = "<%=request.getContextPath()%>/userIdSelector.do?methodName=onshowPopup";
			url += "&strCCOUserId=";//+document.getElementById("strCCOUserId").value;
			url += "&strSourceSystem=XXCSS_CT";
			url += "&context=CCO_USER";
			//url += "&userType="+document.getElementById("userType").value;
			// url += "&userType=INTERNAL"
			url += "&strAuthLevel=RW";
			url += "&selectionType=SINGLE";
			//alert("URL : " + url);
			var childwindow=window.open(url,"UserIdSelector","width=992,height=625, scrollbars, resizable=yes ");
			
			childwindow.creator=self;
			return false;
    	    	
    }
    
    
		 function xtrackuseridselector(JSONStr) {
			//alert('json string parent page is ' + JSONStr);			
			var mJSONObj=eval('(' + JSONStr + ')');			
			var str="";
			str = mJSONObj.USerIdSelector[0].userId;			 
		 	//alert(""+str);
			document.getElementById("requestorIdStr").value = str;
		}
  </script>
   
<% 
  String ErrorMsg = (String)request.getAttribute("ErrorMsg");  
%>
<jsp:useBean id="JSONRPCBridge" scope="session"
     class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="handler" scope="request"
     class="com.cisco.crosstrack.handlers.RequestStatusHandler" />

<% 
try{
JSONRPCBridge.registerObject("handler", handler);
   String contextPath = request.getContextPath();
   
   List functionList = (List)request.getAttribute("functionList");
   List statusList = (List)request.getAttribute("statusList");
   List requestTypeList = (List)request.getAttribute("requestTypeList");
   
   HashMap listHM = (HashMap)request.getAttribute("defaultList");
 
   
  	if(null!=listHM.get("statusStr"))
  		{
  			ArrayList statusStringAL = (ArrayList)listHM.get("statusStr");
	  		statusString=(statusStringAL.get(0)).toString();
  		}
   
   
   if(null!=listHM.get("functionStr"))
  		{
   ArrayList functionStringAL = (ArrayList)listHM.get("functionStr");
   functionString=(functionStringAL.get(0)).toString();
   }
   
   if(null!=listHM.get("requestTypeStr"))
  		{
   ArrayList requestTypeStringAL = (ArrayList)listHM.get("requestTypeStr");
   requestTypeString=(requestTypeStringAL.get(0)).toString();
   }
   if(null!=listHM.get("requestIdStr"))
  		{
   ArrayList requestIdStringAL = (ArrayList)listHM.get("requestIdStr");
   requestIdString=(requestIdStringAL.get(0)).toString();
   }
   if(null!=listHM.get("requestorIdStr"))
  		{
   ArrayList requestorIdStringAL = (ArrayList)listHM.get("requestorIdStr");
   requestorIdString=(requestorIdStringAL.get(0)).toString();
   }
   if(null!=listHM.get("requestDateFrom"))
  		{
   ArrayList requestDateFromStringAL = (ArrayList)listHM.get("requestDateFrom");
   requestDateFromString=(requestDateFromStringAL.get(0)).toString();
   }
   if(null!=listHM.get("requestDateTo"))
  		{
    ArrayList requestDateToStringAL = (ArrayList)listHM.get("requestDateTo");
   requestDateToString=(requestDateToStringAL.get(0)).toString();
   
   }
   
   if(null!=listHM.get("referenceIdStr")) {
      ArrayList referenceIdAL = (ArrayList)listHM.get("referenceIdStr");
      referenceIdString=(referenceIdAL.get(0)).toString();
   }
      
   //String functionString = list.get(1).toString();
   //String requestTypeString = list.get(2).toString();
   String userId = request.getRemoteUser();
   //System.out.println("userId="+userId);
   String authlevel = (String)request.getAttribute("authlevel");
     
%>
<script language="javascript">


function changePortletSize(filter,parentID) {
var parentStyle = "block";

var elem = getRawObject(parentID);
parentStyle = getElementStyle(parentID, "display", "display");
    
//alert("displayStyle "+parentStyle);
    if (parentStyle == "block") {
		 window.parent.resizePortlet('<%=request.getParameter("reqStatFrmID")%>',document.getElementById(filter).innerHTML);
	 }	 
}
		


function filterStatus(filter) {
    if (document.getElementById(filter).innerHTML == 'OFF') {//ON
        document.getElementById(filter).innerHTML='ON';//OFF
    } else {
        document.getElementById(filter).innerHTML='OFF';//ON
    }
 
}
</script>


		<!-- ********************* APPLICATION AREA START *********************************************** -->
		
		<!-- component linked resources -->
		<!--  Commented for Defect 7774 - Combining All common JS scripts 
		<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>				
		<script type="text/javascript" src="js/genJSON.js"></script>		
		<script type="text/javascript" src="js/jsonrpc.js"></script>
      	<script language="javascript" src="js/datapersistence.js"></script>
      	-->

      	<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>
      	
      	<!-- linked resources added by Tristream Start -->
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
		<link rel="stylesheet" href="css/menu_styles.css" type="text/css" media="screen" />
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
      	
      	<script language="javascript" src="js/requeststatus.js"></script>
		<script language="javascript"> 
		function changeIFrames()
		{
		// alert("<%=request.getParameter("reqStatFrmID")%>");
		window.parent.toggleIFrms('<%=request.getParameter("reqStatFrmID")%>');
		}
		
		
		function showReqDetailswindow(winurl, winname)
		{
			 childwindow = window.open(winurl,winname,'width=997,height=500,scrollbars,resizable=yes');
			 childwindow.creator=self;
	  		 childwindow.focus();	  		 
		 	 return;
		}
		</script>
		<!-- linked resources added by Tristream End -->
		
		<!-- APPLICATION BANNER -->
	

	
		<!-- *********************** APPLICATION MODULES START ********************** -->
		<!-- module header -->
	<div id="mod_1" class="mod_header">
		<!-- module header twist -->
		<img id="moduleIdExpand2" class="mh_expand" onClick="changeIFrames();setImageState(this);
		return toggleElementDisplay(this.parentNode.id + 'block');" 
		src="images/global/buttons_and_icons/icons/green/icn_twirldown_lg_o.gif" 
		alt="<fmt:message key='RequestStatus.twirldownImgAlt'/>" height="17" width="17" border="0" />
		<!-- module header title -->
		<h2 class="mh_title"><fmt:message key='RequestStatus.requestStatus'/></h2>
		<!-- module header filter -->
		<table border="0" cellspacing="0" cellpadding="0" class="mh_filter">
			<tr>
				<%-- <td><img src="images/global/buttons_and_icons/icons/green/icn_twirldown_sm_o.gif" --%>
				
				<td><img src="images/global/buttons_and_icons/icons/green/icn_twirldown_sm.gif" 
				alt="<fmt:message key='RequestStatus.twirldownImgAlt'/>" height="14" width="14" align="middle" border="0" 
				onClick="setImageState(this);changePortletSize('filterStat_1','mod_1block');toggleElementDisplay('filter_1');filterStatus('filterStat_1');" />
				</td>
				<td><strong><fmt:message key='RequestStatus.filters'/></strong> <span id="filterStat_1">OFF</span></td>
			</tr>	
		</table>			
	</div>
	
<!--  start of Request Status -->	
	<form id="RequestStatusForm" class="inline" action="#" method="get" name="RequestStatusForm">

		<!-- colasp/expand block -->
	<div id="mod_1block" class="moduleDisplayBlock">
			<!-- marque block -->
	<div id="marque_1" class="marque">
			<!-- START SUB MODULE BLOCKS **************** -->				
		<!-- filters2 block -->
		<div class="sub_block_hr" id="filter_1" style="display:none">
				<h3><fmt:message key='RequestStatus.filters'/></h3>
				<table width="908" border="0" class="vert_pad" cellspacing="0" cellpadding="0">
					
					<tbody>
						<tr>
							<td nowrap width="82" align="right"><label for="file_type">&nbsp;<fmt:message key='RequestStatus.function'/></label></td>
							<td align="left">
								<select name="functionStr" id="functionStr" class="inputTextVLarge" size="1">
									<% if (functionString.equalsIgnoreCase("Select One")) {%>
									<option value="Select One" selected><fmt:message key='Common.selectOne'/></option>
									<%} else { %>
										<option value="Select One"><fmt:message key='Common.selectOne'/></option>
									<%}    String functionStr = "";
										   for(int i=0; i<functionList.size();i++) {
									       functionStr= functionList.get(i).toString();
									       if (functionStr.equalsIgnoreCase(functionString)){
   									%>
									<option value="<%=functionStr%>" selected><%=functionStr%></option>
									<% } else { %>
									<option value="<%=functionStr%>" ><%=functionStr%></option>

										<% }
									} %>
								</select>						  
						    </td>
						    <td width="250" align="left" colspan="5">
						 	<table>
						 	<tr>
						 	<td nowrap align="right"><label for="request_id"><fmt:message key='RequestStatus.requestNo'/></label></td>
	 				 		<td align="left">
								<input name="requestIdStr" id="requestIdStr" class="inputText" size="1"
								type="text" value="<%=requestIdString%>"/>
						 	</td>
						 	<td width="5">&nbsp;</td>
		 				 	<td nowrap align="right"><label for="status"><fmt:message key='RequestStatus.jobStatusLabel'/></label></td>
							<td align="left">
								<select name="statusStr" id="statusStr" class="inputTextLarge" size="1">
									<% if (statusString.equalsIgnoreCase("Select One")) {%>
									<option value="Select One" selected><fmt:message key='Common.selectOne'/></option>
									<%} else { %>
										<option value="Select One"><fmt:message key='Common.selectOne'/></option>
									<%}    String statusStr = "";
										   for(int i=0; i<statusList.size();i++) {
									       statusStr= statusList.get(i).toString();
									       if (statusStr.equalsIgnoreCase(statusString)){
   									%>
									<option value="<%=statusStr%>" selected><%=statusStr%></option>
									<% } else { %>
									<option value="<%=statusStr%>" ><%=statusStr%></option>

										<% }
									} %>
								</select>
							</td>
						  
					 		</tr>
						 	</table>
						 </td>
						 						  
							<%if(authlevel.equalsIgnoreCase("4")){%>
							<td nowrap align="right"><label for="requestor_id"><fmt:message key='RequestStatus.requestorId'/></label>
							</td>
							<td align="left">
											<input name="requestorIdStr" id="requestorIdStr" class="inputText" size="1"
											type="text" value="<%=requestorIdString%>"/>&nbsp;&nbsp;
							</td>
						 	<td align="left">  					
  										 <img src="<%=basePath%>/images/global/buttons_and_icons/icons/icn_picker.gif" alt="<fmt:message key='RequestStatus.pickerImgAlt'/>" height="13" width="13" align="middle" border="0" onclick="javascript:showChild();" /> 
  							</td>							
							<%}else{%>
							<td width="100" align="right">
							</td>
							<td width="100" align="left">
							<input type="hidden" name="requestorIdStr" id="requestorIdStr" size="1"
											type="text" value=""/>
							</td>
							<td>&nbsp;</td>
							<%}%>
			
						</tr>
						<tr>
							<td nowrap width="82" align="right"><label for="request_type"> <fmt:message key='RequestStatus.requestType'/></label>
							</td>
						 	<td align="left">	
						  		  			<select name="requestTypeStr" id="requestTypeStr" class="inputTextVLarge" size="1">
											<% if (requestTypeString.equalsIgnoreCase("Select One")) {%>
											<option value="Select One" selected><fmt:message key='Common.selectOne'/></option>
											<%} else { %>
												<option value="Select One"><fmt:message key='Common.selectOne'/></option>
											<%}    String requestTypeStr = "";
												   for(int i=0; i<requestTypeList.size();i++) {
												   if (null!=requestTypeList.get(i)){
											       requestTypeStr= requestTypeList.get(i).toString();
											       if (requestTypeStr.equalsIgnoreCase(requestTypeString)){
		   									%>
											<option value="<%=requestTypeStr%>" selected><%=requestTypeStr%></option>
											<% } else { %>
											<option value="<%=requestTypeStr%>" ><%=requestTypeStr%></option>
		
												<% }
											} }%>
										</select>
							</td>
							<td width="250" colspan="5">
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							<td nowrap align="right">&nbsp;<label for="from_date"><fmt:message key='RequestStatus.requestDatesLabel'/></label></td>
							<td align="left"><input id="requestDateFrom" class="inputTextMedium" type="text" 
											name="requestDateFrom" autocomplete="0" value="<%=requestDateFromString%>" /></td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td align="right">&nbsp;</td>
							<td nowrap align="right"><label for="to_date"><fmt:message key='RequestStatus.toLabel'/></label></td>
							<td align="right"><input id="requestDateTo" class="inputTextMedium" type="text"
											name="requestDateTo" autocomplete="0" value="<%=requestDateToString%>"/></td>
								<!--	</tr>-->
								<!--</table>-->
							<!--</td>-->
								</tr>
						 		</table>
						 	</td>
							<td nowrap align="right"><label for="request_id">&nbsp;&nbsp;<fmt:message key='RequestStatus.referenceID'/> #</label>
							</td>
							<td align="left">
								<input name="referenceIdStr" id="referenceIdStr" class="inputText" size="1"
								type="text" value="<%=referenceIdString%>"/>
						 	</td>
						 	<td width="100">&nbsp;</td>
						</tr>
					</tbody>

			</table>
				
				<br />
				<!-- button block -->	
			<div class="sub_button_block" id="buttons_1">
				<a href="javascript:saveAsDefault('<%=contextPath%>', '<%=userId%>');" class="inline_button"><fmt:message key='RequestStatus.saveAsDefaultButton'/>
					<img src="images/global/buttons_and_icons/icons/icn_action.gif" 
					alt="<fmt:message key='RequestStatus.setFiltersButton'/>" align="absmiddle" height="13" width="13" border="0" 
					name="SaveAsDefault" id="SaveAsDefault"/>
				</a>
				
				<a href="javascript:restoreDefaults('<%=contextPath%>','<%=userId%>');" class="inline_button"><fmt:message key='RequestStatus.restoreDefaultsButton'/> 
					<img src="images/global/buttons_and_icons/icons/icn_action.gif" 
					alt="<fmt:message key='RequestStatus.setFiltersButton'/>" align="absmiddle" height="13" width="13" border="0" 
					name="RestoreDefaults" id="RestoreDefaults" />
				</a>

				<a href="javascript:validateLen();" class="inline_button"><fmt:message key='RequestStatus.setFiltersButton'/> 
					<img src="images/global/buttons_and_icons/icons/icn_action.gif" 
					alt="<fmt:message key='RequestStatus.setFiltersButton'/>" align="absmiddle" height="13" width="13" border="0" 
					name="setFilters" id="setFilters" />
				</a>
			</div>
		</div>		
		<!-- sub_block_hr -->
		<div id="requestStatusResults">		
				<div class="table_mod_header">
					<table border=0 cellpadding=0 cellspacing=0 width="100%">
						<tr valign="middle">
						   <td align="left" valign="middle">
						   <h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px;
						   white-space: nowrap; padding: 0; float: left;"></h2>
						   </td>
						   <td align="right" valign="middle">
						   &nbsp;
						   </td>
						</tr>
					</table>			
				</div>
		
<!-- grid column header -->
			<div class="mod_head">
	<!-- 		 <p><html:errors/><br> -->
			 <% if(ErrorMsg!=null){%>
			 <c:out value="${ErrorMsg}"></c:out>
			 <%} %>
			
			<table width="948" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
				<colgroup>
					<col width="15%" /> <!-- was  20-->
					<col width="7%" />  <!-- was  10-->
					<col width="13%" /> <!-- was  10--> 
					<col width="18%" /> <!-- was  13--> 
					<col width="22%" /> <!-- was  15-->
					<col width="8%" />  <!-- was  10-->
					<col width="9%" /> <!-- was  10-->

					<%if(authlevel.equalsIgnoreCase("4")){%>
					<col width="8%" />  <!-- was  10-->
					<%}%>
				</colgroup>
				<thead>
					<tr>
						<th class='active sort_a_1' align="left">
							<a href="javascript:showFilterPageData(1, 'requestDate','1','DESC','0');">
								<fmt:message key='RequestStatus.requestedDateTime'/></a></th>
						<th align="left">
							<a href="javascript:showFilterPageData(1, 'requestId','1','ASC','0');">
								<fmt:message key='RequestStatus.requestNo'/></a></th>
						<th align="left">
							<a href="javascript:showFilterPageData(1, 'functionType','1','ASC','0');">
								<fmt:message key='RequestStatus.function'/></a></th>
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'requestType','1','ASC','0');">
								<fmt:message key='RequestStatus.requestType'/></a></th>
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'requestName','1','ASC','0');">
								<fmt:message key='RequestStatus.requestName'/></a></th>		
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'referenceId','1','ASC','0');">
								<fmt:message key='RequestStatus.referenceID'/></a></th>		
						<th align="left">
							<a href="javascript:showFilterPageData(1, 'status','1','ASC','0');">
								<fmt:message key='RequestStatus.status'/></a></th>
						<%if(authlevel.equalsIgnoreCase("4")){%>
						<th align="left">
							<a href="javascript:showFilterPageData(1, 'requestorId','1','ASC','0');">
								<fmt:message key='RequestStatus.requestorId'/></a></th>
						<%}%>
					</tr>
				</thead>	
			</table>
		
			</div>
<!-- grid body -->
<!--   Results Grid -->
			<div class="mod_grid_sm " id="pickerRequestStatusList">
				<table width="948" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
				<colgroup>
					<col width="15%" /> <!-- was  20-->
					<col width="7%" />  <!-- was  10-->
					<col width="13%" /> <!-- was  10--> 
					<col width="18%" /> <!-- was  13--> 
					<col width="22%" /> <!-- was  15-->
					<col width="8%" />  <!-- was  10-->
					<col width="9%" /> <!-- was  10-->
					
					<%if(authlevel.equalsIgnoreCase("4")){%>
					<col width="8%" />  <!-- was  10-->
					<%}%>
				</colgroup>
				<tbody>
					   <c:set var="counter" value="0"/> 
					   
					   <c:forEach var="entry" items="${resultList}">              
					      <c:choose>
					           <c:when test="${not empty entry}" >
					           
						           <c:set var="counter" value="${counter+1}"/> 
						           
						           <c:choose>  
						              <c:when test="${counter%2==1}">
				
										<tr>
											<td class="first"><c:out value="${entry.requestDate}"/></td>
											<td><a href="javascript:showReqDetailswindow('requestDetailsDispatch.do?methodName=onShowDemoRequestDetails&reqId=<c:out value="${entry.requestIdi}"/>','Request_Details')"><c:out value="${entry.requestIdi}"/><a></td>
											<td><c:out value="${entry.functionTypeStr}"/></td>		
											<td><c:out value="${entry.requestTypeStr}"/></td>
											<td><c:out value="${entry.requestNameStr}"/></td>
											<%-- <td><c:out value="${entry.referenceIdStr}"/></td> --%>
											<td>
									 		 <%-- <a href="javascript:openReferenceWindow('<c:out value="${entry.referenceURL}"/>');">
											 	<c:out value="${entry.referenceIdStr}"/></a> 
											 	--%>
											 <c:choose> 
												<c:when test='${entry.referenceIdStr == "Multiple"}'>
														<c:out value="${entry.referenceIdStr}"/>
												</c:when>											 	
											    <c:when test='${entry.referenceIdStr == "N/A"}'>
														<c:out value="${entry.referenceIdStr}"/>
												</c:when>
										    	<c:otherwise>
													<a href="javascript:openReferenceWindow('<c:out value="${entry.referenceURL}"/>','<c:out value="${entry.referenceIdStr}"/>');">
											 	        <c:out value="${entry.referenceIdStr}"/></a> 	
												</c:otherwise>	
											 </c:choose>
											 	
											</td>
											<td>
											<c:choose>
													<c:when test='${entry.statusStr == "COMPLETED"}'>
														<a href="javascript:checkDestinationURL('<%=contextPath%>','<c:out value="${entry.requestIdi}"/>','COMPLETED');">	<c:out value="${entry.statusStr}"/></a>
													</c:when>
													<c:when test='${entry.statusStr == "FAILED"}'>
														<a href="javascript:checkDestinationURL('<%=contextPath%>','<c:out value="${entry.requestIdi}"/>','FAILED');">	<c:out value="${entry.statusStr}"/></a>
													</c:when>
													<c:when test='${entry.statusStr == "COMPLETED WITH ERRORS"}'>
														<a href="javascript:checkDestinationURL('<%=contextPath%>','<c:out value="${entry.requestIdi}"/>','ERRORS');">	<c:out value="${entry.statusStr}"/></a>
													</c:when>
													<c:otherwise>
														<c:out value="${entry.statusStr}"/>
													</c:otherwise>
												
												</c:choose>
											</td>
											<%if(authlevel.equalsIgnoreCase("4")){%>
											<td><c:out value="${entry.requestorID}"/></td> 
											<%}%>
										</tr>
						              </c:when>
						              <c:otherwise>
										<tr class="watermelon">
											<td class="first"><c:out value="${entry.requestDate}"/></td>
											<td><a href="javascript:showReqDetailswindow('requestDetailsDispatch.do?methodName=onShowDemoRequestDetails&reqId=<c:out value="${entry.requestIdi}"/>','Request_Details')"><c:out value="${entry.requestIdi}"/></a></td>
											<td><c:out value="${entry.functionTypeStr}"/></td>		
											<td><c:out value="${entry.requestTypeStr}"/></td>
											<td><c:out value="${entry.requestNameStr}"/></td>
											
											<%-- <td><c:out value="${entry.referenceIdStr}"/></td> --%>
											<td>
									 		 
									    	 <c:choose> 
												<c:when test='${entry.referenceIdStr == "Multiple"}'>
														<c:out value="${entry.referenceIdStr}"/>
												</c:when>											 	
											    <c:when test='${entry.referenceIdStr == "N/A"}'>
														<c:out value="${entry.referenceIdStr}"/>
												</c:when>
										    	<c:otherwise>
													<a href="javascript:openReferenceWindow('<c:out value="${entry.referenceURL}"/>','<c:out value="${entry.referenceIdStr}"/>');">
											 	        <c:out value="${entry.referenceIdStr}"/></a> 	
												</c:otherwise>	
											 </c:choose>
											 	
											</td>
									
											
											<td>
										<c:choose>
													<c:when test='${entry.statusStr == "COMPLETED"}'>
														<a href="javascript:checkDestinationURL('<%=contextPath%>','<c:out value="${entry.requestIdi}"/>','COMPLETED');">	<c:out value="${entry.statusStr}"/></a>
													</c:when>
													<c:when test='${entry.statusStr == "FAILED"}'>
														<a href="javascript:checkDestinationURL('<%=contextPath%>','<c:out value="${entry.requestIdi}"/>','FAILED');">	<c:out value="${entry.statusStr}"/></a>
													</c:when>
													<c:when test='${entry.statusStr == "COMPLETED WITH ERRORS"}'>
														<a href="javascript:checkDestinationURL('<%=contextPath%>','<c:out value="${entry.requestIdi}"/>','ERRORS');">	<c:out value="${entry.statusStr}"/></a>
													</c:when>
													<c:otherwise>
														<c:out value="${entry.statusStr}"/>
													</c:otherwise>
												
												</c:choose>
											</td>
											<%if(authlevel.equalsIgnoreCase("4")){%>
											<td><c:out value="${entry.requestorID}"/></td> 
											<%}%>
										</tr>
						              </c:otherwise>           
						           </c:choose>  
					             
					           </c:when>         
					        </c:choose>  
					   </c:forEach> 
										
					</tbody>	
					</table>

			</div> 
		</div><!-- grid block end -->
				
			<!-- END SUB MODULE BLOCKS ****************** -->
	</div><!-- marque block -->
				

	</div><!-- module display container -->
</form>
		
		
	<!-- ********************* APPLICATION MODULE END *********************************************** -->

		
		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->
		<div id ="vvvvcalDiv"></div>

<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->
		<script language="javascript" type="text/javascript">
		/** calendar */
		var cxCalObj = new cxCal('cxCalObj', 'requestDateFrom', '');
		cxCalObj.initialize();
		cxCalObj.onClose = function() {
		}
		var cxCalObj1 = new cxCal('cxCalObj1', 'requestDateTo', '');
		cxCalObj1.initialize();
		cxCalObj1.onClose = function() {
		}
		
		 window.onload = displayErrors;
    
    function displayErrors() {
     //alert('Display errors');
      <%
           String errorReport = (String)request.getAttribute("Request_status_error_message");
           
          if (errorReport != null ) { 
          %>
              alert('<%=errorReport%>');
         <% } %>
         
         //
         
         var filterSaved=checkFilterValues('<%=statusString%>','<%=functionString%>','<%=requestTypeString%>',
           '<%=requestIdString%>','<%=requestorIdString%>', '<%=requestDateFromString%>',
            '<%=requestDateToString%>','<%=referenceIdString%>');
        
        if (filterSaved=="true")  {
            // alert('Filters are Saved') ;
               showFilterPageData(-1,-1,'1','ASC','0','setfilters');
               // getRequestDefaults(-1,-1,'1','ASC','0','setfilters');
           }  
          else 
                { 
               // alert('Filters are NOT Saved') ;
                getRequestDefaults(-1,-1,'1','ASC','0','setfilters');

           }     
    }
    
 function getRequestDefaults(pageNo, sortId, invokePage,sortOrder,prevSortId, callingfrom)  {
  //alert("Inside getRequestDefaults");
   if(pageNo=="-1"&&sortId=="-1")
      objs = new Array();
   
   var parameters= new Array();
   var i=0;
   parameters[i++]='methodName';
   parameters[i++]='onRequestStatusDefaults';
   parameters[i++]='invokePage';
   if (invokePage =="0")
	   parameters[i++]='0';
   else {
 	   //alert('inside else------pageno sortid invokepage sortorder presortorder');
   	   parameters[i++]='1';	   
	   parameters[i++]='requestorIdStr';
	  // parameters[i++]=document.getElementById('requestorIdStr').value;
	  //alert('<%=request.getRemoteUser()%>');
	   parameters[i++]='<%=request.getRemoteUser()%>';
	   parameters[i++]='requestDateFrom';
	   parameters[i++]=document.getElementById('requestDateFrom').value;
	   parameters[i++]='requestDateTo';
	   parameters[i++]=document.getElementById('requestDateTo').value;
	 
	}
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
   
  // document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/buttons_and_icons/icons/busy.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';      
   document.getElementById('pickerRequestStatusList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3"><fmt:message key='Common.loadingImg'/>..</font></td></tr></table>';      
   
   

    var response = XMLHttpRequestSender('./requestStatusDispatch.do',
                              parameters,
                              'true',
                              'GET',
                              '1000000',
                              '3','requestStatusResults', displayPopupResults);


}
    
    
 function checkFilterValues(status,functionType,requestType,requestId, requestorId, requestDateFrom,
            requestDateTo,referenceId) {
     
     // alert(status+functionType+requestType+requestId+requestorId+requestDateFrom+ requestDateTo+referenceId);
     
     if ((status =="Select One") &&  (functionType=="Select One") && (requestType=="Select One") && 
       (requestId=="") && (requestorId=="") && (requestDateFrom=="") && (requestDateTo=="") && (referenceId=="")) {
       return "false";
     }  
     return "true";
     
     
 }


		</script>
		
<script language="JavaScript1.2">

//Scrollable content III- By http://www.dynamicdrive.com

var speed, currentpos=curpos1=0,alt=1,curpos2=-1

function initialize(){
	if (window.parent.scrollspeed!=0){
		speed=window.parent.scrollspeed
		scrollwindow()
	}
}

function scrollwindow(){
	temp=(document.all)? document.body.scrollTop : window.pageYOffset
	alt=(alt==0)? 1 : 0
	if (alt==0)
		curpos1=temp
	else
		curpos2=temp

	window.scrollBy(0,speed)
}

setInterval("initialize()",10)

</script>	
		<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************** -->
		
	<!-- ********************* APPLICATION AREA END *********************************************** -->
	
<!-- DO NOT TOUCH BELOW ******************************************************************************** -->	
<!-- End Main Content Table Cells -->
<!-- BEGIN FOOTER TABLE -->
<%}catch(Exception e){
	e.printStackTrace();
	//System.out.println(e);
}
%>

<form name="downloadform" action="" method="post" >
<input type="hidden" name="reqId" value="" >
</form>