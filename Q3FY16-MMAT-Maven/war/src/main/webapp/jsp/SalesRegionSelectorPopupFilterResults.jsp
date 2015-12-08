<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>  
<%@ taglib uri="/tags/jstl-fmt" prefix="fmt" %>
<%@ page import="java.math.BigDecimal,java.util.*" %>  


<%
   String sortId = (String)request.getAttribute("sortId");
   if(sortId==null || sortId.equals(""))
      sortId = "-1";
      
      String selectType = (String)request.getAttribute("selectType");
   if(selectType.equals("SINGLE")){
      selectType = "0";}
	else{
	selectType="1";  }    
      
       String procId = (String)request.getAttribute("PROCID");
   if(procId==null || procId.equals(""))
      procId = "0";
    String erMsg="";
	
	if(null!=request.getAttribute("ERRORMSG")){
	erMsg=(String)request.getAttribute("ERRORMSG");
	}
    
    
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
			
			
   String sortTypeSalesRegionCode = "";
   String sortTypeSalesRegionName = "";
   
   if(sortId.equals("salesRegion")){
	  if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeSalesRegionCode = " class='active sort_a_1' ";
				}else {sortTypeSalesRegionCode = " class='active sort_d_1'  ";}
	}
	else if(sortId.equals("structureNodeName")){         
      if(sortOrder.equalsIgnoreCase("ASC")){
				sortTypeSalesRegionName = " class='active sort_a_1' ";
				}else {sortTypeSalesRegionName = " class='active sort_d_1' ";}
	}  
  
%>
<%=erMsg%>

         <!-- grid header -->
            <div class="table_mod_header">
            
            <table border=0 cellpadding=0 cellspacing=0 width="100%">
            <tr valign="middle">
               <td align="left" valign="middle">
               <h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px; white-space: nowrap; padding: 0; float: left;"><fmt:message key='SalesRegionSelector.searchResults'/></h2>  
               </td>
               <td align="right" valign="middle" colspan=2>
               <c:choose>
               <c:when test="${(numPages==1) || (pageNo==1)}"> | &lt;&lt; | &lt; | <fmt:message key='SalesRegionSelector.pages'/> <c:out value="${numPages}"/></td><td> </c:when>
               <c:otherwise>
               | <a href="javascript:showFilterPageData(1, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&lt;&lt;</a> | <a href="javascript:showFilterPageData(<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&lt;</a> | <fmt:message key='SalesRegionSelector.pages'/> <c:out value="${numPages}"/></td><td>
               </c:otherwise>
                 </c:choose>
                     <select name="filterPageNumber" id="filterPageNumber" size="1" class="inputTextSM" onChange="javascript:changeFilterPageData('<%= sortId %>','<%=procId%>');">
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
               <c:when test="${(numPages==1) || (numPages==pageNo)}"> | &gt;&gt; | &gt; | </td> </c:when>
               <c:otherwise>
                | <a href="javascript:showFilterPageData(<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&gt;</a> | <a href="javascript:showFilterPageData(<c:out value="${numPages}"/>, '<%= sortId %>','<%=procId%>','<%=revSortOrder%>','0');">&gt;&gt;</a> |
               </td>
               </c:otherwise>
                 </c:choose>
            </tr>
            </table>
            
            </div>                  
<!-- grid column header -->
<div class="mod_head">
<table width="355" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
   <col width="6%" />
   <col width="47%" />
   <col width="47%" />
</colgroup>
<thead>
   <tr>
      <th class="first" align="center">
      <%
      ArrayList al=new ArrayList();
      if (null!=request.getAttribute("salesRegionResults")){
		al=(ArrayList)request.getAttribute("salesRegionResults");
      }
      if((al.size()>1) && selectType.equals("1")){
      %>
      <input type="checkbox" name="selectAll" id="selectAll" value="selectAll" class="checkbox" onclick="javascript:toggleCheckboxesInGroup(this,this.form,'topGroup');javascript:adjustCustArray();"/>
      <%}%>
      </th>
       <th align="left" <%= sortTypeSalesRegionCode %>><a href="javascript:showSearchPageData(1, 'salesRegion','<%=procId%>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='SalesRegionSelector.salesRergionCode'/></a></th>
      <th align="left" <%= sortTypeSalesRegionName %>><a href="javascript:showSearchPageData(1, 'structureNodeName','<%=procId%>','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='SalesRegionSelector.salesRergionName'/></a></th>
      
   </tr>
</thead> 
</table>
</div>
<!-- grid body -->
<div class="mod_grid_sm " id="pickerSalesRegionsList">



<table width="355" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
   <col width="6%" />
   <col width="47%" />
   <col width="47%" />
</colgroup>

<tbody>

   <c:set var="counter" value="0"/> 
   
   <c:forEach var="entry" items="${salesRegionResults}">              
      <c:choose>
           <c:when test="${not empty entry}" >
           
           <c:set var="counter" value="${counter+1}"/> 
           
           <c:choose>  
              <c:when test="${counter%2==1}">
                  <tr>
                     <td class="first" align="center" valign="top">
                     <% if (selectType.equals("1")){%>
                     <input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value="${entry.nodeName}"/>|<c:out value='${entry.structureNodeName}'/>" class="checkbox topGroup" onChange="refreshArray('<c:out value='${entry.nodeName}'/>|<c:out value='${entry.structureNodeName}'/>');"/>
                     <%} else {%>
                     <input type="radio" name="selectLineItem" value="<c:out value="${entry.nodeName}"/>|<c:out value='${entry.structureNodeName}'/>" onChange="refreshRadioArray('<c:out value='${entry.nodeName}'/>|<c:out value='${entry.structureNodeName}'/>');">
                     
                     <%}%>
                     </td>
                     <td><c:out value="${entry.nodeName}"/></td>
                      <td><c:out value="${entry.structureNodeName}"/></td>
                  </tr>
              </c:when>
              <c:otherwise>
                  <tr class="watermelon">
                     <td class="first" align="center" valign="top">
                     <% if (selectType.equals("1")){%>
                     <input type="checkbox" name="selectLineItem" id="selectLineItem" value="<c:out value="${entry.nodeName}"/>|<c:out value='${entry.structureNodeName}'/>" class="checkbox topGroup" onChange="refreshArray('<c:out value='${entry.nodeName}'/>|<c:out value='${entry.structureNodeName}'/>');"/>
                     
                        <%} else {%>
                     <input type="radio" name="selectLineItem" value="<c:out value="${entry.nodeName}"/>|<c:out value='${entry.structureNodeName}'/>" onChange="refreshRadioArray('<c:out value='${entry.nodeName}'/>|<c:out value='${entry.structureNodeName}'/>');">
                     
                     <%}%>
                     
                     </td>
                     <td><c:out value="${entry.nodeName}"/></td>
                     <td><c:out value="${entry.structureNodeName}"/></td>
                  </tr>
              </c:otherwise>           
           </c:choose>  
             
           </c:when>         
        </c:choose>  
   </c:forEach> 
   
   

</tbody> 

</table>


</div> 
