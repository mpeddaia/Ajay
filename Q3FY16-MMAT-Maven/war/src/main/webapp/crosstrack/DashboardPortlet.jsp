<%@ page language = "java" %>
<%@ page import="com.cisco.cts.util.oa.OracleApplicationSession" %>

<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%> 
<%@ include file="localeInfo.jsp" %>  

<jsp:useBean id="JSONRPCBridge" scope="session"
     class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="RequestStatushandler" scope="request"
     class="com.cisco.crosstrack.handlers.RequestStatusHandler" />

<% 
		
		JSONRPCBridge.registerObject("handler", RequestStatushandler);
		String  requestStatusSortDashboard =  (String)request.getAttribute("requestStatusSortDashboard");
		
       String contextPath = request.getContextPath();
       String sortId = (String)session.getAttribute("Dashboard_Request_status_sortId");
       //System.out.println("AP# >>>>> sortID...From Session object Dashboardportlet.jsp......"+sortId);
   
   
   if(sortId==null || sortId.equalsIgnoreCase(""))
      sortId = "-1";
      
   //System.out.println("AP# >>>>> sortID after condtions Dashboardportlet.jsp sortId ="+ sortId);   
   String authlevel = (String)request.getAttribute("authlevel");
   
   
   
   String prevSortId="-1";
			String sortOrder="ASC";
			String revSortOrder="ASC";
			
			
			if(session.getAttribute("Dashboard_Request_status_sortOrder")!=null){
				sortOrder=(String)session.getAttribute("Dashboard_Request_status_sortOrder");
				//System.out.println("########## in Session SORT ORDER Check ------not null sortOrder is "+sortOrder);
			}
				
			//System.out.println("AP# >>>>> sortID...in Dashboardportlet.jsp......"+sortId);
			
			//System.out.println("AP# >>>>> sortOrder....in Dashboardportlet.jsp....."+sortOrder);
			//System.out.println("AP# >>>>> prev sortId....in Dashboardportlet.jsp....."+prevSortId);
			//System.out.println("AP# >>>>> revSortOrder....in Dashboardportlet.jsp...."+revSortOrder);
			
			
   
   String sortTypeClassRequestDate = "";
   String sortTypeClassRequestId = "";
   String sortTypeClassFunctionType = "";
   String sortTypeClassRequestType = "";
   String sortTypeClassRequestName = "";
   String sortTypeClassReferenceId = "";
   String sortTypeClassStatus = "";
   String sortTypeClassRequestorID = "";
   
 
      
//System.out.println("AP# >>>>>>>>>>>> -sortOrder in JSP is -----"+sortOrder + "sortId "+sortId);
// sortId sortOrder

if("requestDate".equalsIgnoreCase(sortId)){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassRequestDate = " class='active sort_a_1' ";
				}else {sortTypeClassRequestDate = " class='active sort_d_1'  ";}
}
else if("requestId".equalsIgnoreCase(sortId)){         
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassRequestId = " class='active sort_a_1' ";
				}else {sortTypeClassRequestId = " class='active sort_d_1' ";}
}
else if("functionType".equalsIgnoreCase(sortId)) {      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassFunctionType = " class='active sort_a_1' ";
				}else {sortTypeClassFunctionType = " class='active sort_d_1' ";}
}
else if("requestType".equalsIgnoreCase(sortId)){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassRequestType = " class='active sort_a_1' "; 
				}else {sortTypeClassRequestType = " class='active sort_d_1' "; }     
}
else if("requestName".equalsIgnoreCase(sortId)){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassRequestName = " class='active sort_a_1' ";
				}else {sortTypeClassRequestName = " class='active sort_d_1' "; }
}
else if("referenceId".equalsIgnoreCase(sortId)){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassReferenceId = " class='active sort_a_1' "; 
				}else {sortTypeClassReferenceId = " class='active sort_d_1' "; }
}
else if("status".equalsIgnoreCase(sortId)){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassStatus = " class='active sort_a_1' ";
				}else {sortTypeClassStatus = " class='active sort_d_1' "; }
}
else if("requestorId".equalsIgnoreCase(sortId)){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassRequestorID = " class='active sort_a_1' ";
				}else {sortTypeClassRequestorID = " class='active sort_d_1' "; }
}
		

 
%>


		<!-- ********************* APPLICATION AREA START *********************************************** -->
		<!-- linked resources added by Tristream Start -->
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
		<link rel="stylesheet" href="css/menu_styles.css" type="text/css" media="screen" />
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		
		
		<!-- component linked resources -->
		<!--  Commented for Defect 7774 - Combining All common JS scripts 
		<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>
      	<script type="text/javascript" src="js/jsonrpc.js"></script>
      	<script language="javascript" src="js/datapersistence.js"></script>		
		<script type="text/javascript" src="js/genJSON.js"></script>	
      	-->

     	<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>
	
      	<script language="javascript" src="js/requeststatus.js"></script>
		
		<script language="javascript"> 
		
		function resizeParentFrame(parentID)  
		{
		 var portletState;
         portletState = getElementStyle(parentID, "display", "display");
       	 window.parent.toggleIFrms('<%=request.getParameter("dashboardFrameID")%>',portletState,'XTRACK');
		}
		
		function showReqDetailswindow(winurl, winname)
		{
			 childwindow = window.open(winurl,winname,'width=997,height=500,scrollbars,resizable=yes');
			 childwindow.creator=self;
	  		 childwindow.focus();	  		 
		 	 return;
		}
		</script>
		<!-- *********************** APPLICATION MODULES START ********************** -->
	
	
	<% 
	  if( requestStatusSortDashboard == null) { 
	  //System.out.println("requestStatusSortDashboard is null");
	 %> 
		<br clear="all" />
		<br clear="all" />
		
		<!-- BEGIN NEW MODULE **************** -->	
		<div id="mod_4" class="mod_header">
		<!-- module header twist -->
		<img id="moduleIdExpand7" class="mh_expand" onClick="resizeParentFrame(this.parentNode.id + 'block');setImageState(this);return toggleElementDisplay(this.parentNode.id + 'block');" src="images/global/buttons_and_icons/icons/green/icn_twirldown_lg_o.gif" alt="Expand/Collapse" height="17" width="17" border="0" />
		<!-- module header title -->
		<h2 class="mh_title"><fmt:message key='DashboardPortlet.title'/></h2>
		</div>
        
    <% } else { 
     //System.out.println("requestStatusSortDashboard is NOT null");
    }%>    
		<!-- colasp/expand block -->
		
	<% 
	  if( requestStatusSortDashboard == null) { 
	  
	 %> 
		<div id="mod_4block" class="moduleDisplayBlock" >
			<!-- 4th marque block -->
			<div id="marque_4" class="marque">
	 <% } %>		
			<!-- START SUB MODULE BLOCKS **************** -->
			<div id="requestStatusResults">		
			
<!-- grid column header -->
<div class="mod_head">


		<table width="948" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
		<colgroup>
					<%-- <col width="20%" />
					<col width="10%" />
					<col width="10%" />
					<col width="23%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					--%>
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
						<%-- <th  align="left">
							<a class="first active sort_d_1" href="javascript:showFilterPageData(1, 'requestDate','0');">
								Requested Date &amp; Time</a></th>
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'requestId','0');">
								Request #</a></th>
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'functionType','0');">
								Function</a></th>
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'requestType','0');">
								Request Type</a></th>
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'requestName','0');">
								Request Name</a></th>		
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'referenceId','0');">
								Reference ID</a></th>		
						<th  align="left">
							<a href="javascript:showFilterPageData(1, 'status','0');">
								Status</a></th>
								--%>
						<th <%= sortTypeClassRequestDate %> align="left">
							<a href="javascript:sortRequestStatus(1, 'requestDate','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.requestedDateTime'/></a></th>
						<th <%= sortTypeClassRequestId %> align="left">
							<a href="javascript:sortRequestStatus(1, 'requestId','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.requestNumber'/> #</a></th>
						<th <%= sortTypeClassFunctionType %> align="left">
							<a href="javascript:sortRequestStatus(1, 'functionType','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.function'/></a></th>
						<th <%= sortTypeClassRequestType %> align="left">
							<a href="javascript:sortRequestStatus(1, 'requestType','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.requestType'/></a></th>
						<th <%= sortTypeClassRequestName %> align="left">
							<a href="javascript:sortRequestStatus(1, 'requestName','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.requestName'/></a></th>		
						<th <%= sortTypeClassReferenceId %> align="left">
							<a href="javascript:sortRequestStatus(1, 'referenceId','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.referenceID'/></a></th>		
						<th <%= sortTypeClassStatus %> align="left">
							<a href="javascript:sortRequestStatus(1, 'status','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.status'/></a></th>
						<%if(authlevel.equalsIgnoreCase("4")){%>
						<th <%= sortTypeClassRequestorID %> align="left">
							<a href="javascript:sortRequestStatus(1, 'requestorId','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='DashboardPortlet.requestorID'/></a></th>
						<%}%>
								
					</tr>
		</thead>	
		</table>
		
		 
</div>
<!-- grid body -->
<!-- <div class="mod_grid_sm" id="grid_1">  -->
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
					   
					   <c:forEach var="entry" items="${requestStatusResults}">              
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
											
											
											<%--<td><c:out value="${entry.referenceIdStr}"/></td>  --%>
										 <td>
											<%-- <c:choose> 
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
											 --%>  
											 
									       <c:choose> 
												<c:when test='${entry.referenceIdStr != "Multiple" && entry.referenceIdStr != "N/A"}'>
														<a href="javascript:openReferenceWindow('<c:out value="${entry.referenceURL}"/>','<c:out value="${entry.referenceIdStr}"/>');">
											 	        <c:out value="${entry.referenceIdStr}"/></a> 	
												</c:when>
																					 	
											  <c:otherwise>
													 <c:out value="${entry.referenceIdStr}"/>
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
											<td><a href="javascript:showReqDetailswindow('requestDetailsDispatch.do?methodName=onShowDemoRequestDetails&reqId=<c:out value="${entry.requestIdi}"/>','Request_Details')"><c:out value="${entry.requestIdi}"/><a></td>
											<td><c:out value="${entry.functionTypeStr}"/></td>		
											<td><c:out value="${entry.requestTypeStr}"/></td>
											<td><c:out value="${entry.requestNameStr}"/></td>
											<td>
											<%-- <c:out value="${entry.referenceIdStr}"/> --%>
											     <c:choose> 
												<c:when test='${entry.referenceIdStr != "Multiple" && entry.referenceIdStr != "N/A"}'>
														<a href="javascript:openReferenceWindow('<c:out value="${entry.referenceURL}"/>','<c:out value="${entry.referenceIdStr}"/>');">
											 	        <c:out value="${entry.referenceIdStr}"/></a> 	
												</c:when>
																					 	
											  <c:otherwise>
													 <c:out value="${entry.referenceIdStr}"/>
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
					  <form name="downloadform" action="" method="post" >
						<input type="hidden" name="reqId" value="" >
					 </form>					
											
		</tbody>	
	
	
	
	</table>
</div>

</div>
<% 
	  if( requestStatusSortDashboard == null) { 
	  
	 %> 
</div>						
		</div>
		
		 <% } %>	

		<!-- END SUB MODULE BLOCKS ****************** -->

		
	
