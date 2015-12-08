<%@ include file="localeInfo.jsp" %>

<%
   String errorMsg = "";
   if(null!=(String)session.getAttribute("ServiceLevelErrorMsg")){
   errorMsg=(String)session.getAttribute("ServiceLevelErrorMsg");
   }

   String sortId = (String)request.getAttribute("sortId");
   if(sortId==null || sortId.equals(""))
      sortId = "-1";
   
   String uploadId = (String)request.getAttribute("uploadId");
   if(uploadId==null || uploadId.equals(""))
      uploadId = "Error";   
   
   String pageNo = (String)request.getAttribute("pageNo");
   if(pageNo==null || pageNo.equals(""))
      pageNo = "1"; 

   String numPages = (String)request.getAttribute("numPages");
   if(numPages==null || numPages.equals(""))
      numPages = "1"; 

   String procId = (String)request.getAttribute("procId");
   if(procId==null || procId.equals(""))
      procId = "-1"; 
   
   String selectedType = (String)request.getAttribute("pickerselectionvalue");
   
   String authlevel = (String)request.getAttribute("authlevel");
   
   
   if("SINGLE".equalsIgnoreCase(selectedType)){
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
   
   String sortTypeClassServiceLevelCode = "";
   String sortTypeClassServiceLevelDesc = "";
   String sortTypeClassServiceProgram = "";
   String sortTypeClassServiceCategory = "";
   
   String sortTypeClassServiceLevelGroup = "";
   String sortTypeClassServiceStatus = "";
   String sortTypeClassServiceBrandCode = "";
   String sortTypeHardwareOrSoftware = "";

if(sortId.equals("svclvlCode")){
	if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceLevelCode = " class='active sort_a_1' ";
				}else {sortTypeClassServiceLevelCode = " class='active sort_d_1'  ";}
}
else if(sortId.equals("svclvlDesc")){         
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceLevelDesc = " class='active sort_a_1' ";
				}else {sortTypeClassServiceLevelDesc = " class='active sort_d_1' ";}
}
else if(sortId.equals("serviceProgram")) {      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceProgram = " class='active sort_a_1' ";
				}else {sortTypeClassServiceProgram = " class='active sort_d_1' ";}
}
else if(sortId.equals("serviceCategory")){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceCategory = " class='active sort_a_1' "; 
				}else {sortTypeClassServiceCategory = " class='active sort_d_1' "; }     
}
else if(sortId.equals("svclvlGroup")){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceLevelGroup = " class='active sort_a_1' ";
				}else {sortTypeClassServiceLevelGroup = " class='active sort_d_1' "; }
}
else if(sortId.equals("status")){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceStatus = " class='active sort_a_1' "; 
				}else {sortTypeClassServiceStatus = " class='active sort_d_1' "; }
}
else if(sortId.equals("brandCode")){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeClassServiceBrandCode = " class='active sort_a_1' ";
				}else {sortTypeClassServiceBrandCode = " class='active sort_d_1' "; }
}
else if(sortId.equals("hardwareOrSoftware")){      
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeHardwareOrSoftware = " class='active sort_a_1' ";
				}else {sortTypeHardwareOrSoftware = " class='active sort_d_1' "; }
}
%>

<% if (errorMsg != null && errorMsg.length() > 0) { %>
<font color="red" size="2">&nbsp;<%=errorMsg %> </font>
<% } %>
            <div class="table_mod_header">
            <% if (! procId.equals("0") && ! procId.equals("-1")){  

%>

            <table border=0 cellpadding=0 cellspacing=0 width="100%">
            <tr valign="middle">
               <td align="left" valign="middle" width="75%">
               <h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px; white-space: nowrap; padding: 0; float: left;"><fmt:message key='ServiceLevelSelector.serviceLevelCodes'/></h2>  
               </td>
 		<td align="right" valign="middle" width="25%">
               | <a href="javascript:showSearchPageDataPagination(1, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&lt;&lt;</a> | <a href="javascript:showSearchPageDataPagination(<c:out value="${pageNo-1}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&lt;</a> | <fmt:message key='ServiceLevelSelector.pages'/> <c:out value="${numPages}"/></td><td>
               
                     <select name="serviceLevelPageNumber" id="serviceLevelPageNumber" size="1" class="inputTextSM" onChange="javascript:changeServiceLevelPageData('<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">
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
                     
                | <a href="javascript:showSearchPageDataPagination(<c:out value="${pageNo+1}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&gt;</a> | <a href="javascript:showSearchPageDataPagination(<c:out value="${numPages}"/>, '<%= sortId %>', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>','pagination');">&gt;&gt;</a> |
               </td>               
              
            </tr>
            </table>
   <%}%>         
            </div>     
          
<div class="mod_head">
<table width="760" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
			<%if("4".equalsIgnoreCase(authlevel)){%>
		    <col width="3%" />
   			<col width="20%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="17%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<%}else{%>
   			<col width="3%" />
   			<col width="20%" />
   			<col width="20%" />
   			<col width="20%" />
   			<col width="17%" />
   			<col width="10%" />
   			<col width="10%" />   			
   			<%}%>
</colgroup>
<thead>

   <tr>
   	<th class="first" align="center">
   	<% if ("1".equalsIgnoreCase(selectedType)){%>
   	<input type="checkbox" class="checkbox" name="selectAllServiceLevels" value="selectAll" onClick="toggleCheckboxesInGroup(this, this.form, 'topGroup'); adjustServiceLevelArray();" />
   	<%} else {%>
   		<%}%>
   	</th>
   	<th align="left" <%= sortTypeClassServiceLevelCode %> ><a href="javascript:showSearchPageData(1, 'svclvlCode', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.serviceLevelCode'/></a></th>
	<th align="left" <%= sortTypeClassServiceLevelDesc %> ><a href="javascript:showSearchPageData(1, 'svclvlDesc', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.serviceLevelDesc'/></a></th>
	<th align="left" <%= sortTypeClassServiceLevelGroup %> ><a href="javascript:showSearchPageData(1, 'svclvlGroup', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.serviceLevelGroup'/></a></th>
	<th align="left" <%= sortTypeClassServiceProgram %> ><a href="javascript:showSearchPageData(1, 'serviceProgram', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.serviceProgram'/></a></th>
	<th align="left" <%= sortTypeHardwareOrSoftware %> ><a href="javascript:showSearchPageData(1, 'hardwareOrSoftware', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.hardwareOrSoftware'/></a></th>
	<%if("4".equalsIgnoreCase(authlevel)){%>
	<th align="left" <%= sortTypeClassServiceCategory %> ><a href="javascript:showSearchPageData(1, 'serviceCategory', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.serviceCategory'/></a></th>
	<th align="left" <%= sortTypeClassServiceBrandCode %> ><a href="javascript:showSearchPageData(1, 'brandCode', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.brandCode'/></a></th>
	<%}%>
		<th align="left" <%= sortTypeClassServiceStatus %> ><a href="javascript:showSearchPageData(1, 'status', '<%= procId %>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='ServiceLevelSelector.status'/></a></th>
   </tr>
</thead>
</table>
</div>

<div class="mod_grid_sm"  id="resultsList">
	<table width="760" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
	<colgroup>
		<%if("4".equalsIgnoreCase(authlevel)){%>
		    <col width="3%" />
   			<col width="20%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="17%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<%}else{%>
   			<col width="3%" />
   			<col width="20%" />
   			<col width="20%" />
   			<col width="20%" />
   			<col width="17%" />
   			<col width="10%" />
   			<col width="10%" />   			
   			<%}%>
	</colgroup>


<tbody>

   <c:set var="counter" value="0"/> 

   <c:forEach var="entry" items="${serviceLevelResults}">
      <c:choose>
           <c:when test="${not empty entry}" >



           <c:set var="counter" value="${counter+1}"/> 
           
           <c:choose>  
              <c:when test="${counter%2==1}">

                  <tr>
                     <td class="first" align="center">
                     <% if ("1".equalsIgnoreCase(selectedType)){%>
                     <input type="checkbox" class="checkbox topGroup" name="selectedServiceLevels" value='<c:out value="${entry.serviceLevelCode}"/>|<c:out value="${entry.serviceLevelDesc}"/>' onChange="refreshServiceLevelArray('<c:out value='${entry.serviceLevelCode}'/>|<c:out value="${entry.serviceLevelDesc}"/>'); "    onClick="javascript:refreshSelectedAll(this)"/>
                     <%} else {%>
                     <input type="radio" name="selectedServiceLevels" value="<c:out value="${entry.serviceLevelCode}"/>|<c:out value='${entry.serviceLevelDesc}'/>" onChange="refreshRadioArray('<c:out value='${entry.serviceLevelCode}'/>|<c:out value='${entry.serviceLevelDesc}'/>');">
                     <%}%>
                     </td>
                     <td><c:out value="${entry.serviceLevelCode}"/></td>
                     <td><c:out value="${entry.serviceLevelDesc}"/></td>
                     <td><c:out value="${entry.serviceLevelGroup}"/></td>
                     <td><c:out value="${entry.serviceProgramDesc}"/></td>
                     <td><c:out value="${entry.hardwareSoftware}"/></td>                    
             		 <%if(authlevel.equalsIgnoreCase("4")){%>  
             		 <td><c:out value="${entry.serviceCategory}"/></td>      
                     <td><c:out value="${entry.brandCode}"/></td>                     
                     <%}%>
                     <td><c:out value="${entry.status}"/></td>
                     
                     
                  </tr>
              </c:when>
              <c:otherwise>

                  <tr class="watermelon" >
                     <td class="first" align="center">
                     <% if ("1".equalsIgnoreCase(selectedType)){%>
                     <input type="checkbox" class="checkbox topGroup" name="selectedServiceLevels" value='<c:out value='${entry.serviceLevelCode}'/>|<c:out value="${entry.serviceLevelDesc}"/>' onChange="refreshServiceLevelArray('<c:out value='${entry.serviceLevelCode}'/>|<c:out value="${entry.serviceLevelDesc}"/>'); "  onClick="javascript:refreshSelectedAll(this)" />
                     <%} else {%>
                     <input type="radio" name="selectedServiceLevels" value="<c:out value="${entry.serviceLevelCode}"/>|<c:out value='${entry.serviceLevelDesc}'/>" onChange="refreshRadioArray('<c:out value='${entry.serviceLevelCode}'/>|<c:out value='${entry.serviceLevelDesc}'/>');">
                     <%}%>
                     </td>
                     <td><c:out value="${entry.serviceLevelCode}"/></td>
                     <td><c:out value="${entry.serviceLevelDesc}"/></td>
                     <td><c:out value="${entry.serviceLevelGroup}"/></td>
                     <td><c:out value="${entry.serviceProgramDesc}"/></td>
                     <td><c:out value="${entry.hardwareSoftware}"/></td>                    
             		 <%if(authlevel.equalsIgnoreCase("4")){%>  
             		 <td><c:out value="${entry.serviceCategory}"/></td>      
                     <td><c:out value="${entry.brandCode}"/></td>                     
                     <%}%>
                     <td><c:out value="${entry.status}"/></td>
                  </tr>

              </c:otherwise>                         
           </c:choose>  
           
                     <!-- Hidden fields to pass for update action -->
                     <input type="hidden" name="objToPassBack" value=''/>

           </c:when>         
        </c:choose>  
   </c:forEach> 
   <c:if test="${counter==0}">
      <tr>
         <td  class="first" valign="top" colspan=2 valign="middle" align="center">
            
         </td>
      </tr>
   </c:if>


</tbody>


</table>

   
   <div id="uploadIdDiv" style="display:none"><%= uploadId %></div>
   <div id="sortIdDiv" style="display:none"><%= sortId %></div>
   <div id="pageNoDiv" style="display:none"><%= pageNo %></div>

</div>
