<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>  
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%@ include file="localeInfo.jsp" %>
<%@ page import="java.util.*"%>
	<%
	//String sortId = (String)request.getAttribute("sortId"); 
	String sortId = (String)session.getAttribute("BILLTO_SORTID");

	if(sortId==null || sortId.equals(""))
	  sortId = "-1";
	  
	String procId = (String)request.getAttribute("procId");
	if(procId==null || procId.equals(null))
	  procId = "-1";
	  
	String strBillToTabType=(String)request.getAttribute("strBillToTabType");

	String withinContext=(String)request.getAttribute("withinContext");

	String strAuthLevel =(String) request.getAttribute("strAuthLevel");
	
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
		if((request.getAttribute("prevSortId")!= null) && (request.getAttribute("prevSortId").equals("0"))){
			revSortOrder="ASC";
		}else {
			revSortOrder=(String)request.getAttribute("revSortOrder");
		}
	}  
	   
  	String userType = (String) request.getAttribute("userType");	
  	String pickerSelection = (String) request.getAttribute("pickerSelection");
	String sortTypeClassBillToName = "";
	String sortTypeClassBillToID = "";
	String sortTypeClassCountry = "";
	String sortTypeClassAddress1 = "";
	String sortTypeClassAddress2 = "";
	String sortTypeClassAddress3 = "";
	String sortTypeClassCity = "";
	String sortTypeClassState = "";
	String sortTypeClassPostalCode = "";   
	String sortTypeClassStatus = ""; 
	String sortTypeClassBusinessEntity = "";
	String sortTypeClassParentGU = "";
    String sortTypeClassDateAdded = "";

	if((sortId.equals("billtoName")) || (sortId.equals("partyName")) || sortId.equals("customerName")){
    	if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassBillToName= " class='active sort_a_1' ";
    	}else {sortTypeClassBillToName= " class='active sort_d_1' ";}
    }else if((sortId.equals("billtoId")) || (sortId.equals("location")) || (sortId.equals("billtoSiteId"))){
    	if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassBillToID= " class='active sort_a_1' ";
    	}else {sortTypeClassBillToID= " class='active sort_d_1' ";}
    }else if(sortId.equals("country")){
    	if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassCountry= " class='active sort_a_1' ";
    	}else {sortTypeClassCountry= " class='active sort_d_1' ";}
    }else if(sortId.equals("address1")){
    	if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassAddress1= " class='active sort_a_1' ";
    	}else {sortTypeClassAddress1= " class='active sort_d_1' ";}
    }else if(sortId.equals("address2")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassAddress2= " class='active sort_a_1' ";
    	}else {sortTypeClassAddress2= " class='active sort_d_1' ";}
    }else if(sortId.equals("address3")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassAddress3= " class='active sort_a_1' ";
    	}else {sortTypeClassAddress3= " class='active sort_d_1' ";}
    }else if(sortId.equals("city")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassCity= " class='active sort_a_1' ";
    	}else {sortTypeClassCity= " class='active sort_d_1' ";}
    }else if(sortId.equals("state")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassState= " class='active sort_a_1' ";
    	}else {sortTypeClassState= " class='active sort_d_1' ";}
    }else if(sortId.equals("postalCode")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassPostalCode= " class='active sort_a_1' ";
    	}else {sortTypeClassPostalCode= " class='active sort_d_1' ";}
    }else if(sortId.equals("status")){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassStatus= " class='active sort_a_1' ";
    	}else {sortTypeClassStatus= " class='active sort_d_1' ";}
    }else if((sortId.equals("businessEntity")) || (sortId.equals("attribute1"))){
	    if(sortOrder.equalsIgnoreCase("ASC")){
    	sortTypeClassBusinessEntity= " class='active sort_a_1' ";
    	}else {sortTypeClassBusinessEntity= " class='active sort_d_1' ";}
    }else if(sortId.equals("parentGu") || sortId.equals("companyName") || sortId.equals("parentCompany")){
		if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassParentGU	 = " class='active sort_a_1' ";
			} else {
			sortTypeClassParentGU = " class='active sort_d_1'  ";
			}
	}else if(sortId.equals("dateAdded")){
			if(sortOrder.equalsIgnoreCase("ASC")){
			sortTypeClassDateAdded	 = " class='active sort_a_1' ";
			} else {
			sortTypeClassDateAdded = " class='active sort_d_1'  ";
			}
	}else  sortTypeClassBillToID = " class='active sort_a_1' ";
    
	String errorMessageStr = (String)request.getAttribute("errorMessageStr");
	String newErrorMessageStr = (String)request.getAttribute("addBillToErrorMessageStr");
	List all=new ArrayList();
	if (null!=request.getAttribute("billToResults")){
	all=(ArrayList)request.getAttribute("billToResults");
	}
    %>
    <div id="addressMessage">

	</div>
	<% if((strBillToTabType!=null) && (strBillToTabType.equalsIgnoreCase("address"))) { 
		if(newErrorMessageStr !=null && newErrorMessageStr !="" && newErrorMessageStr.length() > 0) { %>
		<font color="black">
	          &nbsp;<%=newErrorMessageStr%><!--No data found for the given criteria -->
	     </font>
	<%		}
		 }
		// session.setAttribute("addBillToErrorMessageStr",null);		 
	 %>
    
    <%if((strBillToTabType!=null) && (strBillToTabType.equalsIgnoreCase("search"))) { 
		if(errorMessageStr != null && errorMessageStr != "" && errorMessageStr.length() > 0){ 
		%>		   
		<font color="red">
	          &nbsp; <%=errorMessageStr%><!--No data found for the given criteria -->
	    </font>
	<%//} else if(procId.equalsIgnoreCase("-1")) { %>
	
		
	 <%	}
		} %> 
    
	<div class="table_mod_header" align="right">
            
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>	
				<td></td>
              	<td align="right" valign="middle">
					<!-- When Serch results are displayed -->
					<c:if test='${strBillToTabType == "search"}'>
						|	<c:set var="lastPageNo" value="${numPages}"/>
								<c:choose> 
									<c:when test="${pageNo==0 && numPages==0}">
										<td><a >&lt;&lt;</a> | <a >&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">												
											</select>                     
										| <a>&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==0}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">											        
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==1}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<c:set var="curPage" value="${1}"/>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">
												<option selected value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>											        
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages > 1}">
										<td><a >&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
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
										<td><a href="javascript:showSearchPageData(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:showSearchPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | Page(s) <c:out value="${numPages}"/></td>
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
										<td><a href="javascript:showSearchPageData(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:showSearchPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | Page(s) <c:out value="${numPages}"/></td>
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
					</c:if>

					<!-- When Address Book tab results are displayed -->
					<c:if test='${strBillToTabType == "address"}'>
						<c:set var="lastPageNo" value="${numPages}"/>
								<c:choose> 
									<c:when test="${pageNo==0 && numPages==0}">
										<td><a >&lt;&lt;</a> | <a >&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">												
											</select>                     
										| <a>&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==0}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">											        
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages==1}">
										<td><a>&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<c:set var="curPage" value="${1}"/>
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="">
												<option selected value="<c:out value="${curPage}"/>"><c:out value="${curPage}"/></option>											        
											</select>                     
										| <a >&gt;</a> | <a >&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==1 && numPages > 1}">
										<td><a >&lt;&lt;</a> | <a>&lt;</a> | <fmt:message key='BillToSelector.pages'/> <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="javascript:changeAddressBookData('<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">
										
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
										| <a href="javascript:showAddressBookData(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&gt;</a> | <a href="javascript:showAddressBookData(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&gt;&gt;</a> |
									       </td>										
									</c:when>
									<c:when test="${pageNo==lastPageNo && numPages > 1}">
										<td><a href="javascript:showAddressBookData(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&lt;&lt;</a> | <a href="javascript:showAddressBookData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&lt;</a> | Page(s) <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="javascript:changeAddressBookData('<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">
										
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
										<td><a href="javascript:showAddressBookData(1, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&lt;&lt;</a> | <a href="javascript:showAddressBookData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&lt;</a> | Page(s) <c:out value="${numPages}"/></td>
										<td> 
											<select name="searchPageNumber" id="searchPageNumber" size="1" class="inputTextSM" onChange="javascript:changeAddressBookData('<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">
										
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
										| <a href="javascript:showAddressBookData(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&gt;</a> | <a href="javascript:showAddressBookData(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=sortOrder%>','0','pagination');">&gt;&gt;</a> |
									       </td>
									</c:otherwise>
								</c:choose>		
					</c:if>

                </td>
            </tr>
        </table>
	</div>     
			   <!-- grid header -->
          
	<div class="header_grey">
		<table  width="940" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><h3><fmt:message key='BillToSelector.billToAddress'/></h3></td>
				<td align="right">
						<!-- address book/search results tabs-->
				<div class="module_tabs" align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>							
							
							<%//if (((withinContext!=null) && (withinContext.equalsIgnoreCase("N"))) && ((userType!=null) && (userType.equalsIgnoreCase("INTERNAL"))))
								if ((withinContext!=null) && (withinContext.equalsIgnoreCase("N"))){ 
									if((strBillToTabType!=null) && (strBillToTabType.equalsIgnoreCase("address"))) {  %>
										 <td class="active">
												<a href="#" onclick="showAddressBook()" align="absmiddle" id="tab2"><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='BillToSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
										</td>
										<% } else { %>
										
											<td>
												<a href="#" onclick="showAddressBook()" align="absmiddle" id="tab2"><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='BillToSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
											</td>
										<% }  %>
								

										<% if((strBillToTabType!=null) && (strBillToTabType.equalsIgnoreCase("search"))) {  %>
										                                               					
											<td class="active">
												<a href="#" onclick="showSearchResults()" align="absmiddle" id="tab1"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='BillToSelector.searchResults'/></span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>
											</td>
										<% } else { %>
											<td>
												<a href="#" onclick="showSearchResults()" align="absmiddle" id="tab1"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='BillToSelector.searchResults'/></span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>
											</td>
										<% }  %>
								<% }  %>

							
								<% //if (((withinContext!=null) && (withinContext.equalsIgnoreCase("Y"))) || ((userType!=null) && (userType.equalsIgnoreCase("EXTERNAL")))) 
									if ((withinContext!=null) && (withinContext.equalsIgnoreCase("Y"))) { %>
											<td>
												<a align="absmiddle" id="tab2"><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='BillToSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
											</td>
											<td class="active">
												<a href="#" onclick="showSearchResults()" align="absmiddle" id="tab1"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='BillToSelector.searchResults'/></span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>
											</td>
								<% }  %>
								
						</tr>
					</table>
				</div>
				</td>
			</tr>
		</table>
	</div>           
           
      
	<!-- grid column header -->
	<div class="mod_head">
		<table width="940" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
			<colgroup>
			<c:if test='${strBillToTabType == "search"}'>		
				<col width="3%" />
				<col width="9%" />
				<col width="10%" />
				<col width="9%" />
				<col width="9%" />
				<col width="9%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="6%" />
				<col width="7%" />
				<col width="6%" />				
				<%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))){%>
				<col width="6%" />
				<%}%>		
			</c:if>

			<!-- When Address Book tab results are displayed -->
			<c:if test='${strBillToTabType == "address"}'>		  
				<col width="3%" />
				<col width="9%" />
				<col width="10%" />
				<col width="9%" />
				<col width="9%" />
				<col width="7%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="6%" />
				<col width="8%" />				
				<%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))){%>
				<col width="6%" />
				<%}%>
			</c:if>
			</colgroup>
			<thead>
				<tr>
					<!-- When Serch results are displayed -->
					<c:if test='${strBillToTabType == "search"}'>
						<%if(pickerSelection.equalsIgnoreCase("multiple")) { %>
						<th class="first" align="center"><input type="checkbox" name="selectLineItem" value="select1" class="checkbox" onClick="toggleCheckboxesInGroup(this, this.form, 'topGroup'); adjustContArray();" /></th>
						<%} else { %>
						<th class="first" align="center"></th>
						<%}%> 
						<c:choose>
							<c:when test="${billToResults != null}" >
								<% List billToResults1=(ArrayList)request.getAttribute("billToResults");
									if (billToResults1.size() > 0) { %>
											<th align="left" <%= sortTypeClassBillToID %> ><a href="javascript:showSearchPageData(1,'billtoId','<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>
											<th align="left" <%= sortTypeClassBillToName %> ><a href="javascript:showSearchPageData(1, 'billtoName', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>
											<th align="left" <%= sortTypeClassAddress1 %> ><a href="javascript:showSearchPageData(1, 'address1', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.address1'/></a></th>
											<th align="left" <%= sortTypeClassAddress2 %> ><a href="javascript:showSearchPageData(1, 'address2', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.address2'/></a></th>
											<th align="left" <%= sortTypeClassAddress3 %> ><a href="javascript:showSearchPageData(1, 'address3', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.address3'/></a></th>
											<th align="left" <%= sortTypeClassCity %> ><a href="javascript:showSearchPageData(1, 'city', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.City'/></a></th>
											<th align="left" <%= sortTypeClassState %> ><a href="javascript:showSearchPageData(1, 'state', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.state'/></a></th>
											<th align="left" <%= sortTypeClassPostalCode %> ><a href="javascript:showSearchPageData(1,'postalCode', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.postalCode'/></a></th>
											<th align="left" <%= sortTypeClassCountry %> ><a href="javascript:showSearchPageData(1, 'country', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Country'/></a></th>
											<th align="left" <%= sortTypeClassStatus %> ><a href="javascript:showSearchPageData(1, 'status', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.status'/></a></th>
											<th align="left" <%= sortTypeClassParentGU %> ><a href="javascript:showSearchPageData(1, 'parentGu', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.parentGu'/></a></th>
												<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
													<th align="left" <%= sortTypeClassBusinessEntity %> ><a href="javascript:showSearchPageData(1, 'businessEntity', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.businessEntity'/></a></th>
												<% } %>
										<% } else { %>
											<th align="left" <%= sortTypeClassBillToID %> ><a ><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>
											<th align="left" <%= sortTypeClassBillToName %> ><a ><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>
											<th align="left" <%= sortTypeClassAddress1 %> ><a ><fmt:message key='BillToSelector.address1'/></a></th>
											<th align="left" <%= sortTypeClassAddress2 %> ><a ><fmt:message key='BillToSelector.address2'/></a></th>
											<th align="left" <%= sortTypeClassAddress3 %> ><a ><fmt:message key='BillToSelector.address3'/></a></th>
											<th align="left" <%= sortTypeClassCity %> ><a ><fmt:message key='BillToSelector.City'/></a></th>
											<th align="left" <%= sortTypeClassState %> ><a ><fmt:message key='BillToSelector.state'/></a></th>
											<th align="left" <%= sortTypeClassPostalCode %> ><a ><fmt:message key='BillToSelector.postalCode'/></a></th>
											<th align="left" <%= sortTypeClassCountry %> ><a ><fmt:message key='BillToSelector.Country'/></a></th>
											<th align="left" <%= sortTypeClassStatus %> ><a ><fmt:message key='BillToSelector.status'/></a></th>
											<th align="left" <%= sortTypeClassParentGU %> ><a ><fmt:message key='BillToSelector.parentGu'/></a></th>
												<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
													<th align="left" <%= sortTypeClassBusinessEntity %> ><a ><fmt:message key='BillToSelector.businessEntity'/></a></th>
												<% } %>											
										<%}%>
							</c:when>
							<c:otherwise >											
											<th align="left" <%= sortTypeClassBillToID %> ><a ><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>
											<th align="left" <%= sortTypeClassBillToName %> ><a ><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>
											<th align="left" <%= sortTypeClassAddress1 %> ><a ><fmt:message key='BillToSelector.address1'/></a></th>
											<th align="left" <%= sortTypeClassAddress2 %> ><a ><fmt:message key='BillToSelector.address2'/></a></th>
											<th align="left" <%= sortTypeClassAddress3 %> ><a ><fmt:message key='BillToSelector.address3'/></a></th>
											<th align="left" <%= sortTypeClassCity %> ><a ><fmt:message key='BillToSelector.City'/></a></th>
											<th align="left" <%= sortTypeClassState %> ><a ><fmt:message key='BillToSelector.state'/></a></th>
											<th align="left" <%= sortTypeClassPostalCode %> ><a ><fmt:message key='BillToSelector.postalCode'/></a></th>
											<th align="left" <%= sortTypeClassCountry %> ><a ><fmt:message key='BillToSelector.Country'/></a></th>
											<th align="left" <%= sortTypeClassStatus %> ><a ><fmt:message key='BillToSelector.status'/></a></th>
											<th align="left" <%= sortTypeClassParentGU %> ><a ><fmt:message key='BillToSelector.parentGu'/></a></th>
												<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
													<th align="left" <%= sortTypeClassBusinessEntity %> ><a ><fmt:message key='BillToSelector.businessEntity'/></a></th>
												<% } %>		
									
							</c:otherwise>
						</c:choose>
					</c:if>

					<!-- When Address Book tab results are displayed -->
					<c:if test='${strBillToTabType == "address"}'>
						<%if(pickerSelection.equalsIgnoreCase("multiple")) { %>
						<th class="first" align="center"><input type="checkbox" name="selectLineItem" value="select1" class="checkbox" onClick="toggleCheckboxesInGroup(this, this.form, 'topGroup'); adjustContArray();" /></th>
						<%} else { %>
						<th class="first" align="center"></th>
						<%}%>  	
						<c:choose>
							<c:when test="${billToResults != null}" >
								<% List billToResults2=(ArrayList)request.getAttribute("billToResults");
									if (billToResults2.size() > 0) { %>
										<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
											<th align="left" <%= sortTypeClassBillToID %> ><a href="javascript:showAddressBookData(1,'location','<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>
										<%} else { %>
											 <th align="left" <%= sortTypeClassBillToID %> ><a href="javascript:showAddressBookData(1,'billtoSiteId','<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>
										<% } %>
										<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
											<th align="left" <%= sortTypeClassBillToName %> ><a href="javascript:showAddressBookData(1, 'partyName', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>
										<%} else { %>
											<th align="left" <%= sortTypeClassBillToName %> ><a href="javascript:showAddressBookData(1, 'customerName', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>
										<% } %>
										<th align="left" <%= sortTypeClassAddress1 %> ><a href="javascript:showAddressBookData(1, 'address1', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.address1'/></a></th>
										<th align="left" <%= sortTypeClassAddress2 %> ><a href="javascript:showAddressBookData(1, 'address2', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.address2'/></a></th>
										<th align="left" <%= sortTypeClassAddress3 %> ><a href="javascript:showAddressBookData(1, 'address3', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.address3'/></a></th>
										<th align="left" <%= sortTypeClassCity %> ><a href="javascript:showAddressBookData(1, 'city', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.City'/></a></th>
										<th align="left" <%= sortTypeClassState %> ><a href="javascript:showAddressBookData(1, 'state', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.state'/></a></th>
										<th align="left" <%= sortTypeClassPostalCode %> ><a href="javascript:showAddressBookData(1,'postalCode', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.postalCode'/></a></th>
										<th align="left" <%= sortTypeClassCountry %> ><a href="javascript:showAddressBookData(1, 'country', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.Country'/></a></th>
										<th align="left" <%= sortTypeClassStatus %> ><a href="javascript:showAddressBookData(1, 'status', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.status'/></a></th>
										<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
										<th align="left" <%= sortTypeClassParentGU %> ><a href="javascript:showAddressBookData(1, 'companyName', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.parentGu'/></a></th>	
										<%} else { %>
											<th align="left" <%= sortTypeClassParentGU %> ><a href="javascript:showAddressBookData(1, 'parentCompany', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.parentGu'/></a></th>	
										<% } %>
										<th align="left" <%= sortTypeClassDateAdded %> ><a href="javascript:showAddressBookData(1, 'dateAdded', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.dateAdded'/></a></th>
										<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
											<th align="left" <%= sortTypeClassBusinessEntity %> ><a href="javascript:showAddressBookData(1, 'attribute1', '<%= procId %>','<%=sortOrder%>','<%=prevSortId%>','pagination');"><fmt:message key='BillToSelector.businessEntity'/></a></th>
										<% } %>
									<% } else {%>										
										<th align="left" <%= sortTypeClassBillToID %> ><a ><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>										
										<th align="left" <%= sortTypeClassBillToName %> ><a ><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>										
										<th align="left" <%= sortTypeClassAddress1 %> ><a ><fmt:message key='BillToSelector.address1'/></a></th>
										<th align="left" <%= sortTypeClassAddress2 %> ><a ><fmt:message key='BillToSelector.address2'/></a></th>
										<th align="left" <%= sortTypeClassAddress3 %> ><a ><fmt:message key='BillToSelector.address3'/></a></th>
										<th align="left" <%= sortTypeClassCity %> ><a ><fmt:message key='BillToSelector.City'/></a></th>
										<th align="left" <%= sortTypeClassState %> ><a ><fmt:message key='BillToSelector.state'/></a></th>
										<th align="left" <%= sortTypeClassPostalCode %> ><a ><fmt:message key='BillToSelector.postalCode'/></a></th>
										<th align="left" <%= sortTypeClassCountry %> ><a ><fmt:message key='BillToSelector.Country'/></a></th>
										<th align="left" <%= sortTypeClassStatus %> ><a ><fmt:message key='BillToSelector.status'/></a></th>
										<th align="left" <%= sortTypeClassParentGU %> ><a ><fmt:message key='BillToSelector.parentGu'/></a></th>	
										<th align="left" <%= sortTypeClassDateAdded %> ><a ><fmt:message key='BillToSelector.dateAdded'/></a></th>
										<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
											<th align="left" <%= sortTypeClassBusinessEntity %> ><a ><fmt:message key='BillToSelector.businessEntity'/></a></th>
										<% } %>
										
									<%}%>
							</c:when>
							<c:otherwise >
										<th align="left" <%= sortTypeClassBillToID %> ><a ><fmt:message key='BillToSelector.Bill_To_ID'/></a></th>										
										<th align="left" <%= sortTypeClassBillToName %> ><a ><fmt:message key='BillToSelector.Bill_To_Name'/></a></th>										
										<th align="left" <%= sortTypeClassAddress1 %> ><a ><fmt:message key='BillToSelector.address1'/></a></th>
										<th align="left" <%= sortTypeClassAddress2 %> ><a ><fmt:message key='BillToSelector.address2'/></a></th>
										<th align="left" <%= sortTypeClassAddress3 %> ><a ><fmt:message key='BillToSelector.address3'/></a></th>
										<th align="left" <%= sortTypeClassCity %> ><a ><fmt:message key='BillToSelector.City'/></a></th>
										<th align="left" <%= sortTypeClassState %> ><a ><fmt:message key='BillToSelector.state'/></a></th>
										<th align="left" <%= sortTypeClassPostalCode %> ><a ><fmt:message key='BillToSelector.postalCode'/></a></th>
										<th align="left" <%= sortTypeClassCountry %> ><a ><fmt:message key='BillToSelector.Country'/></a></th>
										<th align="left" <%= sortTypeClassStatus %> ><a ><fmt:message key='BillToSelector.status'/></a></th>
										<th align="left" <%= sortTypeClassParentGU %> ><a ><fmt:message key='BillToSelector.parentGu'/></a></th>	
										<th align="left" <%= sortTypeClassDateAdded %> ><a ><fmt:message key='BillToSelector.dateAdded'/></a></th>
										<% if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
											<th align="left" <%= sortTypeClassBusinessEntity %> ><a ><fmt:message key='BillToSelector.businessEntity'/></a></th>
										<% } %>
							</c:otherwise>
						</c:choose>
					</c:if>


        		</tr>
			</thead> 
		</table>
	</div>
	<!-- grid body -->


	<div class="mod_grid_sm"  id="billtoresults1">
		<table width="940" border="0" class="mod_grid_head" cellspacing="1" cellpadding="1">
			<colgroup>
			<c:if test='${strBillToTabType == "search"}'>		
				<col width="3%" />
				<col width="9%" />
				<col width="10%" />
				<col width="9%" />
				<col width="9%" />
				<col width="9%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="6%" />
				<col width="7%" />
				<col width="6%" />				
				<%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))){%>
				<col width="6%" />
				<%}%>		
			</c:if>

			<!-- When Address Book tab results are displayed -->
			<c:if test='${strBillToTabType == "address"}'>		  
				<col width="3%" />
				<col width="9%" />
				<col width="10%" />
				<col width="9%" />
				<col width="9%" />
				<col width="7%" />
				<col width="8%" />
				<col width="8%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
				<col width="6%" />
				<col width="8%" />				
				<%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))){%>
				<col width="6%" />
				<%}%>
			</c:if>
			</colgroup>
			<tbody>
				<%
				if (all.size() > 0) {
					if(pickerSelection.equalsIgnoreCase("multiple")) { %>
   				<c:set var="counter" value="0"/> 
				<c:forEach var="entry" items="${billToResults}">              
					<c:choose>
						<c:when test="${not empty entry}" >
           					<c:set var="counter" value="${counter+1}"/> 
       						<c:choose>  
								<c:when test="${counter%2==1}">
									<tr>
										<td class="first" align="center" valign="middle"><input type="checkbox" class="checkbox topGroup" name="selectLineItem" id="selectLineItem" value="<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>" onChange='refreshArray("<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>", this);javascript:refreshChBoxAddressArray("<c:out value='${entry.billToIDStr}'/>");'/></td>
										
										<td><c:out value="${entry.billToIDStr}"/>
											<c:if test='${entry.latestAddedFlag == "Y"}'>
												<img src="images/bulb.gif" alt="" align="" border="0" />
											</c:if></td>
										<td><c:out value="${entry.billToNameStr}"/></td>
										<td><c:out value="${entry.address1Str}"/></td>
										<td><c:out value="${entry.address2Str}"/></td>
										<td><c:out value="${entry.address3Str}"/></td>
										<td><c:out value="${entry.cityStr}"/></td>
										<td><c:out value="${entry.stateStr}"/></td>
										<td><c:out value="${entry.postalCodeStr}"/></td>
										<td><c:out value="${entry.countryStr}"/></td>										  
										<td><c:out value="${entry.statusStr}"/></td>
										<td><c:out value="${entry.parentCompany}"/></td>
										<c:if test='${strBillToTabType == "address"}'>
										 <td><c:out value="${entry.dateAdded}"/></td>
										</c:if>
										<%	if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) { %>
										<td><c:out value="${entry.businessEntityStr}"/></td>
										<% } %>
									</tr>
								</c:when>
								<c:otherwise>
									<tr class="watermelon">
										<td class="first" align="center" valign="middle"><input type="checkbox" class="checkbox topGroup" name="selectLineItem" id="selectLineItem" value="<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>" onChange='refreshArray("<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>", this);javascript:refreshChBoxAddressArray("<c:out value='${entry.billToIDStr}'/>");'/></td>
										<td><c:out value="${entry.billToIDStr}"/>
											<c:if test='${entry.latestAddedFlag == "Y"}'>
												<img src="images/bulb.gif" alt="" align="" border="0" />
											</c:if> </td>
										<td><c:out value="${entry.billToNameStr}"/></td>
										<td><c:out value="${entry.address1Str}"/></td>
										<td><c:out value="${entry.address2Str}"/></td>
										<td><c:out value="${entry.address3Str}"/></td>
										<td><c:out value="${entry.cityStr}"/></td>
										<td><c:out value="${entry.stateStr}"/></td>
										<td><c:out value="${entry.postalCodeStr}"/></td>
										<td><c:out value="${entry.countryStr}"/></td>
										<td><c:out value="${entry.statusStr}"/></td>
										<td><c:out value="${entry.parentCompany}"/></td>
										<c:if test='${strBillToTabType == "address"}'>
										 <td><c:out value="${entry.dateAdded}"/></td>
										</c:if>
										  <%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
										<td><c:out value="${entry.businessEntityStr}"/></td>
										<% } %>										  
									</tr>
								</c:otherwise>           
							</c:choose>  
						</c:when>         
					</c:choose>  
				</c:forEach> 
				<% } else { %>
				<c:set var="counter" value="0"/> 
				<c:forEach var="entry" items="${billToResults}">              
					<c:choose>
						<c:when test="${not empty entry}" >
					    	<c:set var="counter" value="${counter+1}"/> 
					        <c:choose>  
						        <c:when test="${counter%2==1}">
						        	<tr>
						            	<td class="first" align="center" valign="top">
						                	<input type="radio" name="selectBillto" id="selectBillto" value="<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>" class="radio" onChange='refreshRadioArray("<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>");javascript:refreshRadioAddressArray("<c:out value='${entry.billToIDStr}'/>");'/>
				                        </td>
				                        <td><c:out value="${entry.billToIDStr}"/>
											<c:if test='${entry.latestAddedFlag == "Y"}'>
												<img src="images/bulb.gif" alt="" align="" border="0" />
											</c:if></td>
				                        <td><c:out value="${entry.billToNameStr}"/></td>
										<td><c:out value="${entry.address1Str}"/></td>
									    <td><c:out value="${entry.address2Str}"/></td>
									    <td><c:out value="${entry.address3Str}"/></td>
									    <td><c:out value="${entry.cityStr}"/></td>
									    <td><c:out value="${entry.stateStr}"/></td>
									    <td><c:out value="${entry.postalCodeStr}"/></td>          
										<td><c:out value="${entry.countryStr}"/></td>
									    <td><c:out value="${entry.statusStr}"/></td>
										<td><c:out value="${entry.parentCompany}"/></td>
										<c:if test='${strBillToTabType == "address"}'>
										 <td><c:out value="${entry.dateAdded}"/></td>
										</c:if>
										<%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))) {%>
										<td><c:out value="${entry.businessEntityStr}"/></td>
										<% } %>
									</tr>
								</c:when>
						        <c:otherwise>
						        	<tr class="watermelon">
						            	<td class="first" align="center" valign="top">
						            		<input type="radio" name="selectBillto" id="selectBillto" value="<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>" class="radio" onChange='refreshRadioArray("<c:out value='${entry.billToIDStr}'/>|<c:out value='${entry.billToNameStr}'/>|<c:out value='${entry.address1Str}'/>|<c:out value='${entry.address2Str}'/>|<c:out value='${entry.address3Str}'/>|<c:out value='${entry.cityStr}'/>|<c:out value='${entry.stateStr}'/>|<c:out value='${entry.postalCodeStr}'/>|<c:out value='${entry.countryStr}'/>|<c:out value='${entry.statusStr}'/>");javascript:refreshRadioAddressArray("<c:out value='${entry.billToIDStr}'/>");'/>
						                </td>
										<td><c:out value="${entry.billToIDStr}"/>
											<c:if test='${entry.latestAddedFlag == "Y"}'>
												<img src="images/bulb.gif" alt="" align="" border="0" />
											</c:if></td>
										<td><c:out value="${entry.billToNameStr}"/></td>
										<td><c:out value="${entry.address1Str}"/></td>
										<td><c:out value="${entry.address2Str}"/></td>
										<td><c:out value="${entry.address3Str}"/></td>
										<td><c:out value="${entry.cityStr}"/></td>
										<td><c:out value="${entry.stateStr}"/></td>
										<td><c:out value="${entry.postalCodeStr}"/></td>          
										<td><c:out value="${entry.countryStr}"/></td>
										<td><c:out value="${entry.statusStr}"/></td>
										<td><c:out value="${entry.parentCompany}"/></td>
										<c:if test='${strBillToTabType == "address"}'>
										 <td><c:out value="${entry.dateAdded}"/></td>
										</c:if>
										<%if ((strAuthLevel != null) && (strAuthLevel.equalsIgnoreCase("4"))){ %>
										<td><c:out value="${entry.businessEntityStr}"/></td>
										<%}%>									  										 
									</tr>
					            </c:otherwise>           
				        	</c:choose>  
						</c:when>         
					</c:choose>  
				</c:forEach> 
				<% }
				} else { %> 
				<br>
					<tr>
						<td>
						 <!-- No Data Found -->
						 </td>
					</tr>
				<% } %>
			</tbody> 
		</table>
	</div> 
	<%// } %>
    