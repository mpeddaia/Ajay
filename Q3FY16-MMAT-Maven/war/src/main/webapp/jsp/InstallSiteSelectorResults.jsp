<%@ include file="localeInfo.jsp" %>

<%
try
  { String errorMsg = (String)session.getAttribute("InstallErrorMsg");
  
    String errorMessage = (String) request.getAttribute("errorMsg");

   String sortId = (String)session.getAttribute("sortId");
  

    if( (sortId==null) || 
    (("").equalsIgnoreCase(sortId)) || 
    (("-1").equalsIgnoreCase(sortId)) ) {
      
   sortId = "installSiteName";

   }
  
      
	
   
   String uploadId = (String)request.getAttribute("uploadId");
   if(uploadId==null || uploadId.equals(""))
      uploadId = "Error";   

   
   String pageNo = (String)request.getAttribute("pageNo");
   if(pageNo==null || pageNo.equals(""))
      pageNo = "-1"; 


   String numPages = (String)request.getAttribute("numPages");
   if(numPages==null || numPages.equals(""))
      numPages = "1"; 


   String procId = (String)request.getAttribute("procId");
   if(procId==null || procId.equals(""))
      procId = "-1"; 

   
   String selectedType = (String)request.getAttribute("pickerselectionvalue");

   
   String authlevel = (String)request.getAttribute("authlevel");
   

   
   if(selectedType.equalsIgnoreCase("SINGLE")){
      selectedType = "0";}
	else{
	selectedType="1";  } 
   
			String prevSortId="-1";
			String sortOrder="ASC";
			String revSortOrder="ASC";
			
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
				if(request.getAttribute("prevSortId").equals("0")){
					revSortOrder="ASC";
				}else {
					revSortOrder=(String)request.getAttribute("revSortOrder");
				}
			}  
			
   String sortTypeClassInstallSiteName = "";
   String sortTypeClassCustomerId = "";
   String sortTypeClassSiteLoc = "";
   String sortTypeClassAddress1 = "";
   String sortTypeClassAddress2 = "";
   String sortTypeClassAddress3 = "";
   String sortTypeClassCountry = "";
   String sortTypeClassCity = "";     
   String sortTypeClassState = "";
  
   String sortTypeClassBusinessEntity = "";
   
   String sortTypeClassStatus = "";
   String sortTypeClassPostalCode = "";
   String sortTypeClassParentGU = "";
   String sortTypeClassDateAdded = "";
        

 if(sortId.equals("installSiteName") || sortId.equals("partyName") ){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassInstallSiteName = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassInstallSiteName = " class='active sort_d_1'  ";
				}
} else if(sortId.equals("customerId") || sortId.equals("accountNumber") ){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassCustomerId = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassCustomerId = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("siteLoc") || sortId.equals("location") ){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassSiteLoc = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassSiteLoc = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("address1")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassAddress1 = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassAddress1 = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("address2")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassAddress2 = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassAddress2 = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("address3")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassAddress3 = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassAddress3 = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("country") || sortId.equals("installSiteName") ){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassCountry = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassCountry = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("city")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassCity = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassCity = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("state")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassState = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassState = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("businessEntity") || sortId.equals("attribute1") ){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassBusinessEntity = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassBusinessEntity = " class='active sort_d_1'  ";
				}

}else if(sortId.equals("zipPostalCode") || sortId.equals("postalCode") ){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassPostalCode = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassPostalCode = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("status")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassStatus	 = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassStatus = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("parentGu") || sortId.equals("companyName")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassParentGU	 = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassParentGU = " class='active sort_d_1'  ";
				}
}else if(sortId.equals("dateAdded")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassDateAdded	 = " class='active sort_a_1' ";
				}
				else {
				sortTypeClassDateAdded = " class='active sort_d_1'  ";
				}
}

String tabtype = (String)request.getAttribute("tabtype");

String withincontext = (String)session.getAttribute("withincontext");  
%>
<div id="addressMessage">

</div>
<% if (errorMsg != null && errorMsg.length() > 0) { %>
<font color="red" size="2">&nbsp;<%=errorMsg %> </font>
<% } %><br>
<% if (errorMessage != null && errorMessage.length() > 0) { %>
<font color="black" size="2">&nbsp;<%=errorMessage %> </font>
<% } %>
<div class="module_tabs" align="right">

					<table border="0" cellspacing="0" cellpadding="0">

							<tr>
								<c:choose>
								<c:when test='${withincontext == "N"}'>								
								
								<c:choose>
									<c:when test='${tabtype == "address"}'>
										<td class="active">
									</c:when>
									<c:otherwise>
										<td>
									</c:otherwise>
								</c:choose>
								

								<!-- a href="#" onclick="selectSubTab(this)" id="tab1"><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span>Address Book</span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a -->
							<!-- when switching tabs pass the currents tab's info like pageno,sortid and procid. and it will be stored in the session and will be used when switches to that tab-->
								<a href="#" id="tab1" onclick="javascript:showAddressBook()"><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>

								</td>									
								</c:when>
								<c:otherwise>
									<td>
										<a id="tab1" onclick=""><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.addressBook'/></span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
									</td>
								</c:otherwise>
								</c:choose>
								
								<c:choose>
									<c:when test='${tabtype == "search"}'>
										<td class="active">
									</c:when>
									<c:otherwise>
										<td>
									</c:otherwise>
								</c:choose>
								
								
								<c:choose>
									<c:when test='${searchResults == "Y"}'>
										<!-- a href="#" onclick="selectSubTab(this)" id="tab2"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span>Search Results</span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a -->
										<a href="#" id="tab2" onclick="javascript:showSearchResults()"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.searchResults'/></span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>										
									</c:when>
									<c:otherwise>
										<!-- a href="#" onclick="selectSubTab(this)" id="tab2"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span>Search Results</span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a -->
										<a href="#" id="tab2" onclick=""><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><fmt:message key='InstallSiteSelector.searchResults'/></span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>
										
									</c:otherwise>
								</c:choose>								
								</td>

							</tr>

					</table>

					</div>
            <div class="table_mod_header">
<% 

if (! procId.equals("0") && ! procId.equals("-1")){  

%>

            <table border=0 cellpadding=0 cellspacing=0 width="100%">
            <tr valign="middle">
               <td align="left" valign="middle" width="75%">
               <h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px; white-space: nowrap; padding: 0; float: left;"><fmt:message key='InstallSiteSelector.siteAddresses'/></h2>  
               </td>
 		<td align="right" valign="middle" width="25%">
              <%-- | <a href="javascript:showSearchPageData(1, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','0');">&lt;&lt;</a> | <a href="javascript:showSearchPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','0');">&lt;</a> | Page(s) <c:out value="${numPages}"/></td><td> --%>
               | <a href="javascript:showSearchPageData(1, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:showSearchPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | <fmt:message key='InstallSiteSelector.Pages'/> <c:out value="${numPages}"/></td><td>
               
                    <%-- <select name="installSitePageNumber" id="installSitePageNumber" size="1" class="inputTextSM" onChange="javascript:changeInstallsitePageData('<%= sortId %>', '<%= procId %>');"> --%>
                    <select name="installSitePageNumber" id="installSitePageNumber" size="1" class="inputTextSM" onChange="javascript:changeInstallsitePageData('<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">
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
                     
             <%--   | <a href="javascript:showSearchPageData(<c:out value="${pageNo+1}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','0');">&gt;</a> | <a href="javascript:showSearchPageData(<c:out value="${numPages}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','0');">&gt;&gt;</a> | --%>
               | <a href="javascript:showSearchPageData(<c:out value="${pageNo+1}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&gt;</a> | <a href="javascript:showSearchPageData(<c:out value="${numPages}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&gt;&gt;</a> |
               </td>               
              
            </tr>
            </table>
        <%}%>   
            </div>     
          

<div class="mod_head">
<table width="940" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
        
        <% if (tabtype.equals("search")){%> 		
		  	<col width="3%" />
   			<col width="13%" />
   			<col width="7%" />
   			<col width="7%" />
   			<col width="5%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="5%" />
			<col width="4%" />
			<col width="5%" />
			<col width="4%" />
			<col width="6%" />
			<%if(authlevel.equalsIgnoreCase("4")){%>
			<col width="5%" />
			<%}%>		
		<%} else {%>		  
		    <col width="3%" />
   			<col width="13%" />
   			<col width="7%" />
   			<col width="7%" />
   			<col width="5%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="5%" />
			<col width="4%" />
			<col width="5%" />
			<col width="4%" />
			<col width="6%" />
			<col width="6%" />
			<%if(authlevel.equalsIgnoreCase("4")){%>
			<col width="5%" />
			<%}%>
		<% } %>
		
</colgroup>
<thead>

   <tr>
   	<th class="first" align="center">
   	<% if (selectedType.equals("1")){%>
   	<input type="checkbox" class="checkbox" name="selectAllInstallSites"  value="selectAll" onClick="toggleCheckboxesInGroup(this, this.form, 'topGroup'); adjustInstallSiteArray();" />
   	<%} else {%>
   		<%}%>
   	</th>
   	
   	
   	<% if (tabtype.equals("search")){%>
   	<th align="left" <%= sortTypeClassInstallSiteName %> ><a href="javascript:showSearchPageData(1, 'installSiteName', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.installedAtSiteName'/></a></th>
	<th align="left" <%= sortTypeClassSiteLoc %> ><a href="javascript:showSearchPageData(1, 'siteLoc', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.siteID'/></a></th>
	<th align="left" <%= sortTypeClassCustomerId %> ><a href="javascript:showSearchPageData(1, 'customerId', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.customerId'/></a></th>
	<th align="left" <%= sortTypeClassCountry %> ><a href="javascript:showSearchPageData(1, 'country', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.country'/></a></th>
	<th align="left" <%= sortTypeClassAddress1 %> ><a href="javascript:showSearchPageData(1, 'address1', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.address1'/></a></th>
	<th align="left" <%= sortTypeClassAddress2 %> ><a href="javascript:showSearchPageData(1, 'address2', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.address2'/></a></th>
	<th align="left" <%= sortTypeClassAddress3 %> ><a href="javascript:showSearchPageData(1, 'address3', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.address3'/></a></th>
	<th align="left" <%= sortTypeClassCity %> ><a href="javascript:showSearchPageData(1, 'city', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.city'/></a></th>
	<th align="left" <%= sortTypeClassState %> ><a href="javascript:showSearchPageData(1, 'state', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.state1'/></a></th>

    <th align="left" <%= sortTypeClassPostalCode %> ><a href="javascript:showSearchPageData(1, 'zipPostalCode', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.postalCode'/></a></th>
	
	<th align="left" <%= sortTypeClassStatus %> ><a href="javascript:showSearchPageData(1, 'status', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.status'/></a></th>

	<th align="left" <%= sortTypeClassParentGU %> ><a href="javascript:showSearchPageData(1, 'parentGu', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.parentGu'/></a></th>
	
	<%if(authlevel.equalsIgnoreCase("4")){%>
	<th align="left" <%= sortTypeClassBusinessEntity %> ><a href="javascript:showSearchPageData(1, 'businessEntity', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.businessEntity'/></a></th>
	<%}%>
	
	<%} else {%>
	
	<th align="left" <%= sortTypeClassInstallSiteName %> ><a href="javascript:showSearchPageData(1, 'partyName', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.installedAtSiteName'/></a></th>
	<th align="left" <%= sortTypeClassSiteLoc %> ><a href="javascript:showSearchPageData(1, 'location', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.siteID'/></a></th>
	<th align="left" <%= sortTypeClassCustomerId %> ><a href="javascript:showSearchPageData(1, 'accountNumber', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.customerId'/></a></th>
	<th align="left" <%= sortTypeClassCountry %> ><a href="javascript:showSearchPageData(1, 'country', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.country'/></a></th>
	<th align="left" <%= sortTypeClassAddress1 %> ><a href="javascript:showSearchPageData(1, 'address1', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.address1'/></a></th>
	<th align="left" <%= sortTypeClassAddress2 %> ><a href="javascript:showSearchPageData(1, 'address2', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.address2'/></a></th>
	<th align="left" <%= sortTypeClassAddress3 %> ><a href="javascript:showSearchPageData(1, 'address3', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.address3'/></a></th>
	<th align="left" <%= sortTypeClassCity %> ><a href="javascript:showSearchPageData(1, 'city', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.city'/></a></th>
	<th align="left" <%= sortTypeClassState %> ><a href="javascript:showSearchPageData(1, 'state', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.state1'/></a></th>

    <th align="left" <%= sortTypeClassPostalCode %> ><a href="javascript:showSearchPageData(1, 'postalCode', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.postalCode'/></a></th>
	<th align="left" <%= sortTypeClassStatus %> ><a href="javascript:showSearchPageData(1, 'status', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.status'/></a></th>
	<th align="left" <%= sortTypeClassParentGU %> ><a href="javascript:showSearchPageData(1, 'companyName', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.parentGu'/></a></th>	
	<th align="left" <%= sortTypeClassDateAdded %> ><a href="javascript:showSearchPageData(1, 'dateAdded', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.dateAdded'/></a></th>
	<%if(authlevel.equalsIgnoreCase("4")){%>
	<th align="left" <%= sortTypeClassBusinessEntity %> ><a href="javascript:showSearchPageData(1, 'attribute1', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='InstallSiteSelector.businessEntity'/></a></th>
	<%}%>

	<%}%>
	
   </tr>
</thead>
</table>
</div>






<div class="mod_grid_sm" id="resultsList">
	<table width="940" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0" nowrasdfasd="no" style="word-wrap:break-word;" >
	<colgroup>
		
		<% if (tabtype.equals("search")){%> 		
		  	<col width="3%" />
   			<col width="13%" />
   			<col width="7%" />
   			<col width="7%" />
   			<col width="5%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="5%" />
			<col width="4%" />
			<col width="5%" />
			<col width="4%" />
			<col width="6%" />
			<%if(authlevel.equalsIgnoreCase("4")){%>
			<col width="5%" />
			<%}%>		
		<%} else {%>		  
		    <col width="3%" />
   			<col width="13%" />
   			<col width="7%" />
   			<col width="7%" />
   			<col width="5%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="5%" />
			<col width="4%" />
			<col width="5%" />
			<col width="4%" />
			<col width="6%" />
			<col width="6%" />
			<%if(authlevel.equalsIgnoreCase("4")){%>
			<col width="5%" />
			<%}%>
		<% } %>
		
		
	</colgroup>


<tbody>

   <c:set var="counter" value="0"/> 
<%
      
      java.util.ArrayList  installSiteResults = (java.util.ArrayList)request.getAttribute("installSiteResults");
%>
      
   <c:forEach var="entry" items="${installSiteResults}">              
      <c:choose>
           <c:when test="${not empty entry}" >



           <c:set var="counter" value="${counter+1}"/> 
           
           <c:choose>  
              <c:when test="${counter%2==1}">

                  <tr>
                     <td class="first" align="center">
                                         
                     <% if (selectedType.equals("1")){%>
                     <input type="checkbox" class="checkbox topGroup" name="selectedInstallSites"   value="<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>" onChange='refreshInstallArray("<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>"); javascript:refreshChBoxAddressArray(<c:out value="${entry.siteID}"/>);' onClick="javascript:refreshSelectedAll(this)" onblur="javascript:saveUnselectedCheckboxes(this);"/>
                     <%} else {%>
                     <input type="radio" name="selectedInstallSites" value="<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>" onChange='refreshRadioArray("<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>"); javascript:refreshRadioAddressArray(<c:out value="${entry.siteID}"/>);'>
                     <%}%>
                     
                     </td>
                     <td><c:out value="${entry.customerName}"/></td>
                     <td><c:out value="${entry.siteID}"/>
                     			<c:if test='${entry.latestAddedFlag == "Y"}'>
									<img src="images/bulb.gif" alt="" align="" border="0" />
								</c:if>
					 </td>
                     <td><c:out value="${entry.customerID}"/></td>
                     <td><c:out value="${entry.country}"/></td>
                     <td><c:out value="${entry.address1}"/></td>
                     <td><c:out value="${entry.address2}"/></td>
                     <td><c:out value="${entry.address3}"/></td>
                     <td><c:out value="${entry.city}"/></td>
					 <td><c:out value="${entry.state}"/></td>
					 <td><c:out value="${entry.zip}"/></td>
                     <td><c:out value="${entry.status}"/></td>
                     <td><c:out value="${entry.parentGu}"/></td>
                     <% if (tabtype.equals("address")){%>
                     <td><c:out value="${entry.dateAdded}"/></td>
                     <%}%>
                     <%if(authlevel.equalsIgnoreCase("4")){%>
                     <td><c:out value="${entry.businessEntity}"/></td>
                     <%}%>
                  </tr>
              </c:when>
              <c:otherwise>

                  <tr class="watermelon" >
                     <td class="first" align="center">
                     <% if (selectedType.equals("1")){%>
                     <input type="checkbox" class="checkbox topGroup" name="selectedInstallSites"   value="<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>" onChange='refreshInstallArray("<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>"); javascript:refreshChBoxAddressArray(<c:out value="${entry.siteID}"/>);' onClick="javascript:refreshSelectedAll(this)" onblur="javascript:saveUnselectedCheckboxes(this);"/>
                     <%} else {%>
                     <input type="radio" name="selectedInstallSites" value="<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>" onChange='refreshRadioArray("<c:out value='${entry.siteID}'/>|<c:out value='${entry.customerName}'/>|<c:out value='${entry.customerID}'/>|<c:out value='${entry.address1}'/>|<c:out value='${entry.address2}'/>|<c:out value='${entry.address3}'/>|<c:out value='${entry.city}'/>|<c:out value='${entry.state}'/>|<c:out value='${entry.country}'/>|<c:out value='${entry.zip}'/>|<c:out value='${entry.status}'/>"); javascript:refreshRadioAddressArray(<c:out value="${entry.siteID}"/>);'>
                     <%}%>
                     </td>
                     <td><c:out value="${entry.customerName}"/></td>
                     <td><c:out value="${entry.siteID}"/>
                     			<c:if test='${entry.latestAddedFlag == "Y"}'>
									<img src="images/bulb.gif" alt="" align="" border="0" />
								</c:if>
					 </td>
                     <td><c:out value="${entry.customerID}"/></td>
                     <td><c:out value="${entry.country}"/></td>                     
                     <td><c:out value="${entry.address1}"/></td>
                     <td><c:out value="${entry.address2}"/></td>
                     <td><c:out value="${entry.address3}"/></td>
                     <td><c:out value="${entry.city}"/></td>
                     <td><c:out value="${entry.state}"/></td>  
                     <td><c:out value="${entry.zip}"/></td>                   
                     <td><c:out value="${entry.status}"/></td>
                     <td><c:out value="${entry.parentGu}"/></td>
                     <% if (tabtype.equals("address")){%>
                     <td><c:out value="${entry.dateAdded}"/></td>
                     <%}%>
                     <%if(authlevel.equalsIgnoreCase("4")){%>
                     <td><c:out value="${entry.businessEntity}"/></td>
                     <%}%>
                  </tr>

              </c:otherwise>                         
           </c:choose>  
           
                     <!-- Hidden fields to pass for update action -->
                     <input type="hidden" name="objToPassBack" value=''/>

           </c:when>         
        </c:choose>  
   </c:forEach> 
   <%-- <c:if test="${counter==0}">
      <tr>
         <td  class="first" valign="top" colspan=2 valign="middle" align="center">
            No data found for the search criteria..
         </td>
      </tr>
   </c:if>
   --%>


</tbody>


</table>

   
   <div id="uploadIdDiv" style="display:none"><%= uploadId %></div>
   <div id="sortIdDiv" style="display:none"><%= sortId %></div>
   <div id="pageNoDiv" style="display:none"><%= pageNo %></div>

</div>
<%
}catch (Exception e)
{
out.println(e);
e.printStackTrace();
}
%>
