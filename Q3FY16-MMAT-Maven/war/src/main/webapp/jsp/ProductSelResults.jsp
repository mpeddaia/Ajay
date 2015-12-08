<%@ include file="localeInfo.jsp" %>
<%@ page import="java.math.BigDecimal,java.util.*"%>

<%
			String sortId = (String) request.getAttribute("sortId");

			if (sortId == null || sortId.equals(""))
				sortId = "-1";

			String selectType = (String) request.getAttribute("selectType");
			
			if ("SINGLE".equals(selectType)) {
				selectType = "0";
			} else {
				selectType = "1";
			}

			String procId = (String) request.getAttribute("procId");
			if (procId == null || procId.equals("")) {
				procId = "0";
			}
			String prevSortId="-1";
			String sortOrder="ASC";
			String revSortOrder="DESC";
			
			if(request.getAttribute("prevSortId")!=null){
				if(request.getAttribute("prevSortId").equals("0")){
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
			

			String erMsg = "";

			if (null != request.getAttribute("ERRORMSG")) {
				erMsg = (String) request.getAttribute("ERRORMSG");
			}
			

			String sortTypeClassProductNumber = "";
			String sortTypeClassProductDesc = "";
			String sortTypeClassProductFamily = "";
			String sortTypeClassProductCategory = "";

			if(sortId.equals("productNumber")){
				if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassProductNumber = " class='active sort_a_1' ";
				}else {sortTypeClassProductNumber =" class='active sort_d_1' ";}
			}else if(sortId.equals("productDesc")){
				if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassProductDesc =" class='active sort_a_1' ";
				}else {sortTypeClassProductDesc =" class='active sort_d_1' ";}
			} else if(sortId.equals("productFamily")){
				if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassProductFamily =" class='active sort_a_1' ";
				}else {sortTypeClassProductFamily =" class='active sort_d_1' ";}
			} else if(sortId.equals("productCategory")){
				if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassProductCategory =" class='active sort_a_1' ";
				}else {sortTypeClassProductCategory =" class='active sort_d_1' ";}
			}else  sortTypeClassProductNumber = " class='active sort_a_1' ";

			%>
<font color="red">&nbsp;&nbsp;
<%= erMsg%>
</font>
<!-- grid header -->
<div class="table_mod_header">
	<h2 class="mh_title">
		<fmt:message key='ProductSelector.title'/>
	</h2>
					<!-- module header pagination -->
						<table  border="0" cellspacing="0" cellpadding="0" class="mh_page">														
							<tr>								
								<c:set var="lastPageNo" value="${numPages}"/>
								<c:choose> 
									<c:when test="${pageNo==0 && numPages==0}">
										<td><a >&lt;&lt;</a> | <a >&lt;</a> | <fmt:message key='ProductSelector.pages'/> <c:out value="${numPages}"/></td>
										<td>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">												
											</select>                     
										| <a>&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==0}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='ProductSelector.pages'/> <c:out value="${numPages}"/></td>
										<td>											
 											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">												
 											</select>                     
 										| <a >&gt;</a> | <a >&gt;&gt;</a> |
 									     </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==1}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='ProductSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<c:set var="curPage" value="${1}"/>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">
												<option selected value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>											        
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages > 1}">
										<td><a >&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='ProductSelector.pages'/> <c:out value="${numPages}"/></td>
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
										| <a href="javascript:showSearchPageData(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;</a> | <a href="javascript:showSearchPageData(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==lastPageNo && numPages > 1}">
										<td><a href="javascript:showSearchPageData(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:showSearchPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | <fmt:message key='ProductSelector.pages'/> <c:out value="${numPages}"/></td>
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
										<td><a href="javascript:showSearchPageData(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:showSearchPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | <fmt:message key='ProductSelector.pages'/> <c:out value="${numPages}"/></td>
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
										| <a href="javascript:showSearchPageData(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;</a> | <a href="javascript:showSearchPageData(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&gt;&gt;</a> |
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

			<col width="15%" />
			<col width="40%" />
			<col width="22%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th class="first" align="center">
					<%
			ArrayList al = new ArrayList();

			if (null != request.getAttribute("productSearchResults")) {
				al = (ArrayList) request.getAttribute("productSearchResults");
			}

			if (al.size() >= 1 && selectType.equals("1")) {

			%>
					<input type="checkbox" name="selectAllLineItem" class="checkbox" onclick="toggleCheckboxesInGroup(this, this.form, 'topGroup');adjustProdArray();" />
					<%}%>
				</th>
				<th align="left" <%= sortTypeClassProductNumber %> >
					<a href="javascript:showSearchPageData(1, 'productNumber','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ProductSelector.productNumber'/></a>
 				</th>
 				<th align="left" <%= sortTypeClassProductDesc %> >
 					<a href="javascript:showSearchPageData(1, 'productDesc','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ProductSelector.productDesc'/></a>
 				</th>
 				<th align="left" <%= sortTypeClassProductFamily %> >
 					<a href="javascript:showSearchPageData(1, 'productFamily','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ProductSelector.productFamily'/></a>
 				</th>
 				<th align="left" <%= sortTypeClassProductCategory %> >
 					<a href="javascript:showSearchPageData(1, 'productCategory','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','sorting');"><fmt:message key='ProductSelector.productCategory'/></a>
				</th>
			</tr>
		</thead>
	</table>
</div>
<!-- grid body -->
<div class="mod_grid_med" id="grid_1">
	<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="3%" />

			<col width="15%" />
			<col width="40%" />
			<col width="22%" />
			<col width="20%" />

		</colgroup>
		<tbody>

		</tbody>
		<c:set var="counter" value="${0}" />
		<c:set var="flag" value="true" scope="page" />		
		<c:if test="${productSearchResults != null}">
			<% List productSearchResults=(ArrayList)request.getAttribute("productSearchResults");
			if (productSearchResults.size() > 0) { %>
			<c:forEach var="entry" items="${productSearchResults}">
				<c:choose>
					<c:when test='${flag == "true"}'>
						<c:set var="flag" value="false" scope="page" />
						<tr>
					</c:when>
					<c:otherwise>
						<c:set var="flag" value="true" scope="page" />
						<tr class="watermelon">
					</c:otherwise>
				</c:choose>

				<c:set var="counter" value="${counter+1}" />
				<%if (selectType.equals("1")) {%>

				<td>
					<input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value='${entry.productNumber}'/>|<c:out value='${entry.productDesc}'/>|<c:out value='${entry.productFamily}'/>|<c:out value='${entry.productCategory}'/>" class="checkbox topGroup"
										onChange="refreshArray('<c:out value='${entry.productNumber}'/>|<c:out value='${entry.productDesc}'/>|<c:out value='${entry.productFamily}'/>|<c:out value='${entry.productCategory}'/>');" onClick="javascript:refreshSelectedAll(this)"/>
				</td>

				<%} else {%>

				<td>
					<input type="radio" name="selectLineItem" value="<c:out value='${entry.productNumber}'/>|<c:out value='${entry.productDesc}'/>|<c:out value='${entry.productFamily}'/>|<c:out value='${entry.productCategory}'/>" onChange="refreshRadioArray('<c:out value='${entry.productNumber}'/>|<c:out value='${entry.productDesc}'/>|<c:out value='${entry.productFamily}'/>|<c:out value='${entry.productCategory}'/>');">
				</td>
				<%}%>
				<td>
					<c:out value="${entry.productNumber}" />
				</td>

				<td>
					<c:out value="${entry.productDesc}" />
				</td>

				<td>
					<c:out value="${entry.productFamily}" />
				</td>

				<td>
					<c:out value="${entry.productCategory}" />
				</td>

				</tr>
			</c:forEach>
			<% } %>
		</c:if>
		<c:if test="${counter==0}">
			<tr>
				<td class="first" valign="top" colspan=3 valign="middle" align="center">
					<!-- No data found for the search criteria.. -->
				</td>
			</tr>
		</c:if>
	</table>
</div>
<!-- body grid end -->

