
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%> 
<%@ page import="java.math.BigDecimal,java.util.*" %>  
<%@ include file="localeInfo.jsp" %>  

<%
   String sortId = (String)request.getAttribute("sortId");
   
   if(sortId==null || "".equals(sortId))
      sortId = "-1";
      
   String selectType = (String)request.getAttribute("selectType");
   if("SINGLE".equalsIgnoreCase(selectType)){
      selectType = "0";}
	else{
	selectType="1";  }    
	
      
   String procId = (String)request.getAttribute("PROCID");
   if(procId==null || "".equals(procId)){
      procId = "0";}

	  String prevSortId="-1";
	  String sortOrder="ASC";
	  String revSortOrder="DESC";
		
		if(request.getAttribute("prevSortId")!=null){
			if("0".equals(request.getAttribute("prevSortId"))){
				prevSortId="-1";
				}else{
				prevSortId=(String)request.getAttribute("prevSortId");
			}
		}
		if(request.getAttribute("sortOrder")!=null){
			sortOrder=(String)request.getAttribute("sortOrder");
		}   
		if(request.getAttribute("revSortOrder")!=null){
			if((request.getAttribute("prevSortId")!= null) && ("0".equals(request.getAttribute("prevSortId")))){
				revSortOrder="ASC";
			}else {
				revSortOrder=(String)request.getAttribute("revSortOrder");
			}
		}  
      
      String erMsg="";
	
	if(null!=request.getAttribute("ERRORMSG")){
	erMsg=(String)request.getAttribute("ERRORMSG");
	}
		String sortTypeClassContractNumber = "";
		String sortTypeClassServiceLevel = "";
		String sortTypeClassBillToName = "";
		String sortTypeClassContractName = "";
		String sortTypeClassEndDate = "";
		String sortTypeClassTotalLineListPrice = "";

		if(sortId.equals("contractNumber")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassContractNumber = " class='active sort_a_1' ";
			}else {sortTypeClassContractNumber =" class='active sort_d_1' ";}
		}else if(sortId.equals("serviceLevel")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassServiceLevel =" class='active sort_a_1' ";
			}else {sortTypeClassServiceLevel =" class='active sort_d_1' ";}
		} else if(sortId.equals("billToName")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassBillToName =" class='active sort_a_1' ";
			}else {sortTypeClassBillToName =" class='active sort_d_1' ";}
		} else if(sortId.equals("contractLabel")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassContractName =" class='active sort_a_1' ";
			}else {sortTypeClassContractName =" class='active sort_d_1' ";}
		}else if(sortId.equals("endDate")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassEndDate =" class='active sort_a_1' ";
			}else {sortTypeClassEndDate =" class='active sort_d_1' ";}
		}
		else if(sortId.equals("totalLineListPrice")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassTotalLineListPrice =" class='active sort_a_1' ";
			}else {sortTypeClassTotalLineListPrice =" class='active sort_d_1' ";}
		} else  sortTypeClassContractNumber = " class='active sort_a_1' ";
      
   
   if(request.getAttribute("numPages")!=null)
%>
<input type="hidden" name="emessage" id="emessage" value="<%=erMsg%>"/>
<DIV id="errmsg">
<font color="red">
<%=erMsg%>
</font>
</DIV>

         <!-- grid header -->
       				<!-- green header -->
				<div class="table_mod_header">
					<h2 class="mh_title"><fmt:message key='ContractSelector.title'/></h2>
					<!-- module header pagination -->
						<table  border="0" cellspacing="0" cellpadding="0" class="mh_page">														
							<tr>								
								<c:set var="lastPageNo" value="${numPages}"/>
								<c:choose> 
									<c:when test="${pageNo==0 && numPages==0}">
										<td><a >&lt;&lt;</a> | <a >&lt;</a> | <fmt:message key='ContractSelector.pages'/> <c:out value="${numPages}"/></td>
										<td>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">												
											</select>                     
										| <a>&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==0}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='ContractSelector.pages'/> <c:out value="${numPages}"/></td>
										<td>											
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">												
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==1}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='ContractSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<c:set var="curPage" value="${1}"/>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">
												<option selected value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>											        
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages > 1}">
										<td><a >&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='ContractSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="javascript:changeSearchPageData('<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">
										
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
										| <a href="javascript:getContractSearchValues(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;</a> | <a href="javascript:getContractSearchValues(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==lastPageNo && numPages > 1}">
										<td><a href="javascript:getContractSearchValues(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:getContractSearchValues(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | <fmt:message key='ContractSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="javascript:changeSearchPageData('<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">
										
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
										     | <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>
									</c:when>
									<c:otherwise>
										<td><a href="javascript:getContractSearchValues(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:getContractSearchValues(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | <fmt:message key='ContractSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="javascript:changeSearchPageData('<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">
										
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
										| <a href="javascript:getContractSearchValues(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;</a> | <a href="javascript:getContractSearchValues(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;&gt;</a> |
									       </td>
									</c:otherwise>
								</c:choose>								
							</tr>
						</table>
				</div>
<!-- grid column header -->

<div class="mod_head">
	<table width="940" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="3%" />
			<col width="8%" />
			<col width="22%" />
			<col width="13%" />
			<col width="10%" />
			<col width="10%" />
		 
			<col width="8%" />
		</colgroup>
		<thead>
			<tr>
				<th class="first" align="center">
					<%
			      ArrayList al=new ArrayList();
			      if (null!=request.getAttribute("contractSearchResults")){
					al=(ArrayList)request.getAttribute("contractSearchResults");
			      }
			      if(al.size()>=1 && "1".equals(selectType)){
			      %>	
					<input type="checkbox" name="selectAll" id="selectAll" value="selectAll" class="checkbox" onclick="javascript:toggleCheckboxesInGroup(this,this.form,'topGroup');javascript:adjustCustArray();"/>
					<%}%>
					</th>
				<c:choose>
					<c:when test="${contractSearchResults != null}" >
					<% List contractSearchResults1=(ArrayList)request.getAttribute("contractSearchResults");
						if (contractSearchResults1.size() > 0) { %>
							<th align="left" <%= sortTypeClassContractNumber %> >
								<a href="javascript:getContractSearchValues(1, 'contractNumber','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.contract'/></a>
							</th>
							<th align="left" <%= sortTypeClassServiceLevel %> >
								<a href="javascript:getContractSearchValues(1, 'serviceLevel','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.serviceLevel'/></a>
							</th>
							<%-- 
							<th align="left" <%= sortTypeClassBillToName %> >
								<a href="javascript:getContractSearchValues(1, 'billToName','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.billToName'/></a>
							</th>
							--%>
							<c:choose>
								<c:when test="${userType == 'External'}">
								<th align="left" <%= sortTypeClassBillToName %> >
									<a href="javascript:getContractSearchValues(1, 'billToName','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.primaryInstallSite'/></a>
								</th>
									
								</c:when>
								<c:otherwise>
									<th align="left" <%= sortTypeClassBillToName %> >
										<a href="javascript:getContractSearchValues(1, 'billToName','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.billToName'/></a>
									</th>
								</c:otherwise>
							</c:choose>
							<th align="left" <%= sortTypeClassContractName %> >
								<a href="javascript:getContractSearchValues(1, 'contractLabel','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.contractName'/></a>
							</th>
							<th align="left" <%= sortTypeClassEndDate %> >
								<a href="javascript:getContractSearchValues(1, 'endDate','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.earliestEndDate'/></a></th>
							<th align="left" <%= sortTypeClassTotalLineListPrice %> >
								<a href="javascript:getContractSearchValues(1, 'totalLineListPrice','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ContractSelector.amount'/></a>
							</th>
							<% } else {%>
							<th align="left" <%= sortTypeClassContractNumber %> >
								<a ><fmt:message key='ContractSelector.contract'/></a>
							</th>
							<th align="left" <%= sortTypeClassServiceLevel %> >
								<a ><fmt:message key='ContractSelector.serviceLevel'/></a>
							</th>
						<%-- 
							<th align="left" <%= sortTypeClassBillToName %> >
								<a ><fmt:message key='ContractSelector.billToName'/></a>
							</th>
						--%>
						<c:choose>
								<c:when test="${userType == 'External'}">
								<th align="left" <%= sortTypeClassBillToName %> >
									<a><fmt:message key='ContractSelector.primaryInstallSite'/></a>
								</th>
									
								</c:when>
								<c:otherwise>
									<th align="left" <%= sortTypeClassBillToName %> >
										<a><fmt:message key='ContractSelector.billToName'/></a>
									</th>
								</c:otherwise>
						</c:choose>
								
							<th align="left" <%= sortTypeClassContractName %> >
								<a ><fmt:message key='ContractSelector.contractName'/></a>
							</th>
							<th align="left" <%= sortTypeClassEndDate %> >
								<a ><fmt:message key='ContractSelector.earliestEndDate'/></a></th>
							<th align="left" <%= sortTypeClassTotalLineListPrice %> >
								<a ><fmt:message key='ContractSelector.amount'/></a>
							</th>
							<%}%>
					</c:when>
					<c:otherwise >
							<th align="left" <%= sortTypeClassContractNumber %> >
								<a ><fmt:message key='ContractSelector.contract'/></a>
							</th>
							<th align="left" <%= sortTypeClassServiceLevel %> >
								<a ><fmt:message key='ContractSelector.serviceLevel'/></a>
							</th>
						<%--	
							<th align="left" <%= sortTypeClassBillToName %> >
								<a ><fmt:message key='ContractSelector.billToName'/></a>
							</th>
						--%>
							<c:choose>
								<c:when test="${userType == 'External'}">
								<th align="left" <%= sortTypeClassBillToName %> >
									<a><fmt:message key='ContractSelector.primaryInstallSite'/></a>
								</th>
									
								</c:when>
								<c:otherwise>
									<th align="left" <%= sortTypeClassBillToName %> >
										<a><fmt:message key='ContractSelector.billToName'/></a>
									</th>
								</c:otherwise>
							</c:choose>
							
							<th align="left" <%= sortTypeClassContractName %> >
								<a ><fmt:message key='ContractSelector.contractName'/></a>
							</th>
							<th align="left" <%= sortTypeClassEndDate %> >
								<a ><fmt:message key='ContractSelector.earliestEndDate'/></a></th>
							<th align="left" <%= sortTypeClassTotalLineListPrice %> >
								<a ><fmt:message key='ContractSelector.amount'/></a>
							</th>
					</c:otherwise>
				</c:choose>

			</tr>
		</thead>	
	</table>
</div>
<!-- grid body -->

<!--  Data Grid Starts -->
<div class="mod_grid_sm " id="pickerContractList">
<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="3%" />
	<col width="8%" />
	<col width="22%" />
	<col width="13%" />
	<col width="10%" />
	<col width="10%" /> 
	<col width="8%" />
</colgroup>
<tbody>

</tbody>	
  <c:set var="counter" value="0"/> 
   <c:if test="${contractSearchResults != null}">
   <% List contractSearchResults=(ArrayList)request.getAttribute("contractSearchResults");
	if (contractSearchResults.size() > 0) { %>
		   <c:forEach var="entry" items="${contractSearchResults}">              
		      <c:choose>
		           <c:when test="${not empty entry}" >
		           
		           <c:set var="counter" value="${counter+1}"/> 
		           
		           <c:choose>  
		              <c:when test="${counter%2==1}">
		                  <tr>
		                      <td class="first" align="center" valign="top">
		                      <% if ("1".equals(selectType)){%>
		                      <input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value="${entry.contractNumber}"/>|<c:out value="${entry.billToName}"/>" class="checkbox topGroup" onClick="javascript:refreshSelectedAll(this);" onChange='refreshArray("<c:out value='${entry.contractNumber}'/>|<c:out value='${entry.billToName}'/>");'/>
		                      <%} else {%>
		                     <input type="radio" name="selectLineItem" id="selectLineItem" value="<c:out value="${entry.contractNumber}"/>|<c:out value="${entry.billToName}"/>" class="checkbox topGroup" onChange='refreshRadioArray("<c:out value='${entry.contractNumber}'/>|<c:out value='${entry.billToName}'/>");'/>
		                     
		                     <%}%>
		                      
		                      </td>
		                     <td><c:out value="${entry.contractNumber}"/></td>
		                     <td><c:out value="${entry.serviceLevel}"/></td>
		                   <!--   <td><c:out value="${entry.billToName}"/></td> -->
		                  <!--   <c:choose>
								<c:when test="${userType == 'External' && entry.isMoreInstl > 1 }">
								  	<td><a title="<c:out value="${entry.installSiteId}"/>- <c:out value="${entry.billToName}"/>"><font color="black"><c:out value="${entry.billToName}"/></font><img src="images/global/buttons_and_icons/icons/icn_picker.gif"  /> </a></td>
								</c:when>
								<c:otherwise>
									<td><a title="<c:out value="${entry.installSiteId}"/>- <c:out value="${entry.billToName}"/>"><font color="black"><c:out value="${entry.billToName}"/></font></a></td>
								</c:otherwise>
							</c:choose>
						-->
						<!--  bkagidal TD fix 32068 -->
						<c:choose>
								<c:when test="${userType == 'External'}">
								  	<td>
								  		<table style="table-layout:fixed;">
										<colgroup>
											<col width="80%" />
											<col width="20%" />
										</colgroup>
										<tbody>
											<tr style="">
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;border:0px ">
													<span style='' title='<c:out value="${entry.installSiteId}"/>-<c:out value="${entry.billToName}"/>'>
														<c:out value="${entry.billToName}"/> &nbsp;
													</span>
												</td>

												<td style="border:0px;">
													<c:if test="${entry.isMoreInstl > 1}" >
														<span style='' title='There is more than one Site on this Contract'>
														(+)
														</span>
													</c:if>
												</td>
											</tr>
										</tbody>
									</table>

								  <!-- 	<a title="<c:out value="${entry.installSiteId}"/>- <c:out value="${entry.billToName}"/>"><font color="black"><c:out value="${entry.billToName}"/></font><img src="images/global/buttons_and_icons/icons/icn_picker.gif"  /> </a> -->

								  	</td>
								</c:when>
								<c:otherwise>
								<td><c:out value="${entry.billToName}"/></td>
								</c:otherwise>
							</c:choose>
							
								
		                     <td><c:out value="${entry.contractName}"/></td>
		                     <td><c:out value="${entry.endDate}"/></td>
		                     <td><c:out value="${entry.totalLineListPrice}"/></td>
		                  </tr>
		              </c:when>
		              <c:otherwise>
		                  <tr class="watermelon">
		                     <td class="first" align="center" valign="top">
		                     
		                     <% if ("1".equals(selectType)){%>
		                      <input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value="${entry.contractNumber}"/>|<c:out value="${entry.billToName}"/>" class="checkbox topGroup" onClick="javascript:refreshSelectedAll(this);" onChange='refreshArray("<c:out value='${entry.contractNumber}'/>|<c:out value='${entry.billToName}'/>");'/>
		                      <%} else {%>
		                     <input type="radio" name="selectLineItem" id="selectLineItem" value="<c:out value="${entry.contractNumber}"/>|<c:out value="${entry.billToName}"/>" class="checkbox topGroup" onChange='refreshRadioArray("<c:out value='${entry.contractNumber}'/>|<c:out value='${entry.billToName}'/>");'/>
		                     
		                     <%}%>
		                     
		                     </td>
		                     <td><c:out value="${entry.contractNumber}"/></td>
		                     <td><c:out value="${entry.serviceLevel}"/></td>
		                    <!--  <td><c:out value="${entry.billToName}"/></td> -->
		                     
		               <!--       <c:choose>
								<c:when test="${userType == 'External' && entry.isMoreInstl > 1 }">
								   	<td><a title="<c:out value="${entry.installSiteId}"/>- <c:out value="${entry.billToName}"/>"><font color="black"><c:out value="${entry.billToName}"/></font><img src="images/global/buttons_and_icons/icons/icn_picker.gif"  /> </a></td>
								</c:when>
								<c:otherwise>
									<td><a title="<c:out value="${entry.installSiteId}"/>- <c:out value="${entry.billToName}"/>"><font color="black"><c:out value="${entry.billToName}"/></font></a></td>
								</c:otherwise>
							</c:choose>
						-->
						<!--  bkagidal TD fix 32068 -->
						<c:choose>
								<c:when test="${userType == 'External'}">
								  	<td>
								  		<table style="table-layout:fixed;">
										<colgroup>
											<col width="80%" />
											<col width="20%" />
										</colgroup>
										<tbody>
											<tr style="">
												<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap;border:0px ">
													<span style='' title='<c:out value="${entry.installSiteId}"/>-<c:out value="${entry.billToName}"/>'>
														<c:out value="${entry.billToName}"/> &nbsp;
													</span>
												</td>

												<td style="border:0px;">
													<c:if test="${entry.isMoreInstl > 1}" >
														<span style='' title='There is more than one Site on this Contract'>
														(+)
														</span>
													</c:if>
												</td>
											</tr>
										</tbody>
									</table>

								  <!-- 	<a title="<c:out value="${entry.installSiteId}"/>- <c:out value="${entry.billToName}"/>"><font color="black"><c:out value="${entry.billToName}"/></font><img src="images/global/buttons_and_icons/icons/icn_picker.gif"  /> </a> -->

								  	</td>
								</c:when>
								<c:otherwise>
								<td><c:out value="${entry.billToName}"/></td>
								</c:otherwise>
							</c:choose>
							
								
							
		                     <td><c:out value="${entry.contractName}"/></td>
		                     <td><c:out value="${entry.endDate}"/></td>
		                     <td><c:out value="${entry.totalLineListPrice}"/></td>
		                     
		                  </tr>
		              </c:otherwise>           
		           </c:choose>  
		             
		           </c:when>         
		        </c:choose>  
		   </c:forEach>  		
		<%}%>
	</c:if>
</table>
</div> <!-- body grid end -->
