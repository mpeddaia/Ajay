<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>  
<%@ include file="localeInfo.jsp" %>

<%
	String contextPath = request.getContextPath();
   //String sortId = (String)request.getAttribute("sortId");
   String sortId = (String)session.getAttribute("Request_status_sortId");
   //System.out.println("AP# >>>>> sortID...From Session object RequeststatusResults.jsp......"+sortId);
   
   
   if(sortId==null || sortId.equalsIgnoreCase(""))
      sortId = "-1";
      
   //System.out.println("AP# >>>>> sortID after condtions Requeststatusresults.jsp sortId ="+ sortId);   
   
  // System.out.println("Request status results  invokePageStr="+invokePageStr);
  
 //  String errorMessageStr = (String)request.getAttribute("errorMessageStr");
 
   String errorMessageStr = (String)session.getAttribute("Request_status_errorMessageStr");
   
   if (errorMessageStr == null) errorMessageStr = "";
   
   String authlevel = (String)request.getAttribute("authlevel");
   
   
   
   String prevSortId="-1";
			String sortOrder="ASC";
			String revSortOrder="ASC";
			
			
			if(session.getAttribute("Request_status_sortOrder")!=null){
				sortOrder=(String)session.getAttribute("Request_status_sortOrder");
				//System.out.println("########## in Session SORT ORDER Check ------not null sortOrder is "+sortOrder);
			}
				
			//System.out.println("AP# >>>>> sortID...in RequeststatusResults.jsp......"+sortId);
			
			//System.out.println("AP# >>>>> sortOrder....in RequeststatusResults.jsp....."+sortOrder);
			//System.out.println("AP# >>>>> prev sortId....in RequeststatusResults.jsp....."+prevSortId);
			//System.out.println("AP# >>>>> revSortOrder....in RequeststatusResults.jsp...."+revSortOrder);
			
			
   
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


<!-- grid column header -->
			<%-- <% if (invokePageStr.equalsIgnoreCase("1")) { %>	 --%>
            <div class="table_mod_header">
  
	            <table border=0 cellpadding=0 cellspacing=0 width="100%">

				 <%--  <%if((errorMessageStr.equals("null")) == false){%>		   --%>
				 <%  if (!("".equalsIgnoreCase(errorMessageStr))) { %>
				    <tr valign="middle">
				         <td valign="middle" align="left">
				              <%=errorMessageStr%><!--No data found for the given criteria -->
				         </td>
		            </tr>
					<%} else {%>
		         
		            <tr valign="middle">
					   <td align="left" valign="middle">
						   <h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px;
						   white-space: nowrap; padding: 0; float: left;"></h2>
					   </td>
					   <td>&nbsp;&nbsp;</td>
   					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   <td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					   
		               <td align="right" valign="middle">
		                <c:choose> 
		                  <c:when test="${(numPages==1) || 
		                                   (pageNo==1) }">
		                   | <a>&lt;&lt;</a> | 
		                   <a>&lt; </a> | <fmt:message key='Common.pages'/> <c:out value="${numPages}"/>
		                  </c:when>
		                    <c:otherwise> 
			                  | <a href="javascript:showFilterPageData(1, '-1','1','-1','0');">&lt;&lt;</a> | 
			              	   <a href="javascript:showFilterPageData(<c:out value="${pageNo-1}"/>, '-1','1','-1','0');">&lt; 
			               	  </a> | <fmt:message key='Common.pages'/> <c:out value="${numPages}"/>
			               	</c:otherwise> 
			            </c:choose>    	
		               </td>
		               <td>
		                  
		                   <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="javascript:changeFilterPageData('-1');">   
		                   
		                        <c:forEach var="curPage" begin="1" end="${numPages}">
		                             <c:choose>  
		                                <c:when test="${curPage==pageNo}">
		                                    <option selected value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>
		                                </c:when>
		                                <c:otherwise>
		                                    <option value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>
		                                </c:otherwise>           
		                             </c:choose>                                
		                        </c:forEach>           
		                     </select> 
			             <c:choose> 
			             
			              <c:when test="${(numPages==1) || 
			                              (numPages==pageNo)}">
		                   | <a >&gt;</a> | <a>&gt;&gt;</a> |  
		                  </c:when>
			              <c:otherwise> 
			               | <a href="javascript:showFilterPageData(<c:out value="${pageNo+1}"/>, '-1','1','-1','0');">&gt;</a> | <a href="javascript:showFilterPageData(<c:out value="${numPages}"/>, '-1','1','-1','0');">&gt;&gt;</a> |  
			              </c:otherwise> 
			            </c:choose>
		               </td>
		            </tr>
            	<% } %>  
	            </table>

            </div>       
         <%--   <% } %>   --%>
<!-- End of tab_mod_header -->                			
			<div class="mod_head">
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
						<th <%= sortTypeClassRequestDate %> align="left">
							<a href="javascript:showFilterPageData(1, 'requestDate','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.requestedDateTime'/></a></th>
						<th <%= sortTypeClassRequestId %> align="left">
							<a href="javascript:showFilterPageData(1, 'requestId','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.requestNo'/></a></th>
						<th <%= sortTypeClassFunctionType %> align="left">
							<a href="javascript:showFilterPageData(1, 'functionType','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.function'/></a></th>
						<th <%= sortTypeClassRequestType %> align="left">
							<a href="javascript:showFilterPageData(1, 'requestType','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.requestType'/></a></th>
						<th <%= sortTypeClassRequestName %> align="left">
							<a href="javascript:showFilterPageData(1, 'requestName','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.requestName'/></a></th>		
						<th <%= sortTypeClassReferenceId %> align="left">
							<a href="javascript:showFilterPageData(1, 'referenceId','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.referenceID'/></a></th>		
						<th <%= sortTypeClassStatus %> align="left">
							<a href="javascript:showFilterPageData(1, 'status','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.status'/></a></th>
						<%if(authlevel.equalsIgnoreCase("4")){%>
						<th <%= sortTypeClassRequestorID %> align="left">
							<a href="javascript:showFilterPageData(1, 'requestorId','-1','<%=revSortOrder%>','<%=prevSortId%>');">
								<fmt:message key='RequestStatus.requestorId'/></a></th>
						<%}%>
					</tr>
				</thead>	
				</table>
			</div>
<!-- grid body -->
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
										
					</tbody>	
					</table>
			</div> 

		