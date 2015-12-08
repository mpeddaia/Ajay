<%@ include file="localeInfo.jsp" %>
<%@ page import="java.util.List,java.util.ArrayList" %>

 
<%
   String sortId = (String)request.getAttribute("sortId");
   String errorMessageStr = (String)request.getAttribute("ERRORMSG");
   
   String procId = (String)request.getAttribute("procId");
  
	if(procId==null || procId.equals(null))
	  procId = "-1";
   
   String pageNo = (String) request.getAttribute("pageNo");
			if (pageNo == null || pageNo.equals("")) {
				pageNo = "1";
			}
   
   
   if(sortId==null || sortId.equals(""))
      sortId = "-1";
	
	String prevSortId="-1";
	String sortOrder="DESC";
	String revSortOrder="ASC";
	
	if(request.getAttribute("prevSortId")==null){
		sortId="-1";
	}
	if(request.getAttribute("prevSortId")!=null){
		if(request.getAttribute("prevSortId").equals("0")){
			prevSortId="-1";
			}else{
			prevSortId=(String)request.getAttribute("prevSortId");
		}
	}else{
		request.setAttribute("prevSortId","customerName");
	}
	
	if(request.getAttribute("sortOrder")!=null){
		sortOrder=(String)request.getAttribute("sortOrder");
	}   
	if(request.getAttribute("revSortOrder")!=null){
		if(request.getAttribute("prevSortId").equals("0")){
			revSortOrder="ASC";
		}else {
			revSortOrder=(String)request.getAttribute("revSortOrder");
		}
	}  
      
   String strSelectType = (String)request.getAttribute("strSelectType");
   
  if("SINGLE".equalsIgnoreCase(strSelectType)) {
    	strSelectType = "0";
    }
	else{
		strSelectType="1";  
	}   

	String sortTypeClassCustomerNumber = "";
	String sortTypeClassCustomerName = "";

	if(sortId.equals("customerNumber")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassCustomerNumber= " class='active sort_a_1' ";
    	}else {sortTypeClassCustomerNumber= " class='active sort_d_1' ";}
    }else if(sortId.equals("customerName")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassCustomerName= " class='active sort_a_1' ";
    	}else {sortTypeClassCustomerName= " class='active sort_d_1' ";}
    }else  sortTypeClassCustomerName = " class='active sort_a_1' ";

%>



				 <!--   //if(!errorMessageStr.equals("null")){%>		   
				    <tr valign="middle">
				         <td valign="middle" align="left"> -->
				             <!--No data found for the given criteria -->
				      <!--    </td>
				         
		            </tr> -->


         <!-- grid header --><!-- PAGINATION HEADER-->

<% if (errorMessageStr != null && errorMessageStr.length() > 0) { %>
<font color="red" size="2"><%=errorMessageStr %> </font>
<% } 
if(request.getAttribute("numPages")!=null)
%>

<div class="table_mod_header">

	<table border="0" cellspacing="0" cellpadding="0" width="100%" >
		<tr valign="middle">
			<td align="left" valign="middle">
				<!-- h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px; white-space: nowrap; padding: 0; float: left;"-->
				<h2 class="mh_title">
					<fmt:message key='CustomerSelector.customers'/>
				</h2>
			</td>
			<c:set var="lastPageNo" value="${numPages}"/>
        <c:choose> 
         <c:when test="${pageNo==0 && numPages==0}">
          <td><a >&lt;&lt;</a> | <a >&lt;</a> | <fmt:message key='CustomerSelector.pages'/> <c:out value="${numPages}"/></td>
          <td>
           <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="">            
           </select>                     
          | <a>&gt;</a> | <a >&gt;&gt;</a> |
                </td>          
         </c:when> 
         <c:when test="${pageNo==1 && numPages==0}">
          <td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='CustomerSelector.pages'/> <c:out value="${numPages}"/></td>
          <td>           
           <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="">            
           </select>                     
          | <a >&gt;</a> | <a >&gt;&gt;</a> |
                </td>          
         </c:when>
         <c:when test="${pageNo==1 && numPages==1}">
          <td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='CustomerSelector.pages'/> <c:out value="${numPages}"/></td>
          <td> 
           <c:set var="curPage" value="${1}"/>
           <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="">
            <option selected value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>                   
           </select>                     
          | <a >&gt;</a> | <a >&gt;&gt;</a> |
                </td>          
         </c:when>
         <c:when test="${pageNo==1 && numPages > 1}">
          <td><a >&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='CustomerSelector.pages'/> <c:out value="${numPages}"/></td>
          <td> 
           <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="javascript:changeFilterPageData('<%= sortId %>','<%=procId%>', 'tablediv');">
          
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
          | <a href="javascript:showFilterPageData('tablediv',<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&gt;</a> | <a href="javascript:showFilterPageData('tablediv',<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&gt;&gt;</a> |
                </td>          
         </c:when>
         <c:when test="${pageNo==lastPageNo && numPages > 1}">
          <td><a href="javascript:showFilterPageData('tablediv',1, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&lt;&lt;</a> | <a href="javascript:showFilterPageData('tablediv',<c:out value="${pageNo-1}"/>,'<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&lt;</a> | <fmt:message key='CustomerSelector.pages'/> <c:out value="${numPages}"/></td>
          <td> 
           <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="javascript:changeFilterPageData('<%= sortId %>','<%=procId%>', 'tablediv');">
          
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
          <td><a href="javascript:showFilterPageData('tablediv',1, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&lt;&lt;</a> | <a href="javascript:showFilterPageData('tablediv',<c:out value="${pageNo-1}"/>,'<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&lt;</a> | <fmt:message key='CustomerSelector.pages'/> <c:out value="${numPages}"/></td>
          <td> 
           <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="javascript:changeFilterPageData('<%= sortId %>','<%=procId%>', 'tablediv');">
          
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
          | <a href="javascript:showFilterPageData('tablediv',<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&gt;</a> | <a href="javascript:showFilterPageData('tablediv',<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&gt;&gt;</a> |
                </td>
         </c:otherwise>
        </c:choose>

		</tr>
	</table>
</div>


<!--Table Meta Data-->
<div class="mod_head">
	<table width="100%" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="7%" />
		    <col width="25%" />
			<col width="68%" />
		</colgroup>
		<thead>
			<tr>
				<% 
				//String strelectTypeobj = (String)request.getAttribute(strSelectType);
				if ("1".equalsIgnoreCase(strSelectType)) {
				%>
				<th align="center">
				<input type="checkbox" name="selectAll" value="selectAll" class="checkbox topGroup"
				onclick="toggleCheckboxesInGroup(this,this.form,'topGroup');javascript:adjustCustArray();">
				</th>
				<% } else {%>
				<th align="left">
				 &nbsp;
				</th>
				<% } %>
				<c:choose>
				<c:when test="${customerSearchResults != null}" >
				<%
					List customerSearchResults1 = (ArrayList) request.getAttribute("customerSearchResults");
					if(customerSearchResults1.size() >0 ) {
				%>
					<th  align="left" <%=sortTypeClassCustomerNumber %>>
						<a href="javascript:showFilterPageData('tablediv',1, 'customerNumber','<%=procId%>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='CustomerSelector.customerNumber'/></a>
					</th>
					<th  align="left" <%=sortTypeClassCustomerName%>>
						<a href="javascript:showFilterPageData('tablediv', 1,'customerName','<%=procId%>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='CustomerSelector.customerName'/></a>
					</th>
					<% } else {%>
					<th  align="left" <%=sortTypeClassCustomerNumber %>>
					
						<a href="#"><fmt:message key='CustomerSelector.customerNumber'/></a>
					</th>
					<th  align="left" <%=sortTypeClassCustomerName%>>
						<a href="#"><fmt:message key='CustomerSelector.customerName'/></a>
					</th><%}%>
				</c:when>
				<c:otherwise >
					<th  align="left" <%=sortTypeClassCustomerNumber %>>
					
						<a href="#"><fmt:message key='CustomerSelector.customerNumber'/></a>
					</th>
					<th  align="left" <%=sortTypeClassCustomerName%>>
						<a href="#"><fmt:message key='CustomerSelector.customerName'/></a>
					</th>
				</c:otherwise>
				</c:choose>
			</tr>
		</thead>
	</table>
</div>

<!-- End of tab_mod_header -->                     
<!-- grid column header --><!-- TABLE METADATA-->

<!-- End of mod_head -->

<div class="mod_grid_sm" id="dataGrid">

	<table width="100%" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="7%" />
		    <col width="25%" />
			<col width="68%" />
		</colgroup>
		<tbody>
			<c:set var="counter" value="0" />
			<c:if test="${customerSearchResults != null}" >
			<%
				List customerSearchResults=(ArrayList) request.getAttribute("customerSearchResults");
				if(customerSearchResults.size() >0 ) {
			%>
			<c:forEach var="customerDto" items="${customerSearchResults}">
			
				<c:choose>
					<c:when test="${not empty customerDto}">
						<c:set var="counter" value="${counter+1}" />
						
						<c:choose>
							<c:when test="${counter%2==1}">
								<tr>
									<td class="first" align="center" valign="top">
									<c:choose>
										<c:when test="${strSelectType != null && strSelectType eq 'MULTIPLE' }">
											<input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>" class="checkbox topGroup" 
											onClick="javascript:refreshSelectedAll(this);"
											onChange='refreshArray("<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>");' />
										</c:when>
										<c:otherwise>
											<input type="radio" name="selectLineItem" id="selectLineItem" value="<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>" class="radio" 
														onChange='refreshArray("<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>");' />
										</c:otherwise>
									</c:choose>
									</td>
									<td>
										<c:out value="${customerDto.customerIdStr}" />
									</td>
									<td>
										<c:out value="${customerDto.customerNameStr}" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="watermelon">
									<td class="first" align="center" valign="top">
									<c:choose>
										<c:when test="${strSelectType != null && strSelectType eq 'MULTIPLE' }">
											<input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>" class="checkbox topGroup" 
											onClick="javascript:refreshSelectedAll(this);" onChange='refreshArray("<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>");' />
										</c:when>
										<c:otherwise>
											<input type="radio" name="selectLineItem" id="selectLineItem" value="<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>" class="radio" 
													onChange='refreshArray("<c:out value='${customerDto.customerIdStr}'/>|<c:out value='${customerDto.customerNameStr}'/>");' />
										</c:otherwise>
									</c:choose>
									</td>
									<td>
										<c:out value="${customerDto.customerIdStr}" />
									</td>
									<td>
										<c:out value="${customerDto.customerNameStr}" />
									</td>

								</tr>
							</c:otherwise>
						</c:choose>

					</c:when>
				</c:choose>
			</c:forEach>
			<% } %>
			</c:if>
			<c:if test="${counter==0}">
				<c:choose>
				  <c:when test="${onShowpopUp != null}">
					  <tr>
						<td class="first" valign="top" colspan=3 valign="middle" align="center">
	       			           &nbsp;
						</td>
				     </tr>
				   </c:when>
				  <c:otherwise>
					  <tr>
						<td class="first" valign="top" colspan=3 valign="middle" align="center">
	       			           <!-- fmt:message key='CustomerSelector.noDataFound'/-->
						</td>
					  </tr>
					</c:otherwise>
				</c:choose>
				
			</c:if>
		</tbody>
	</table>

</div>


<!-- End of mod_grid_sm-->

 
