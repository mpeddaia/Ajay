
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%
	String classString = "class ='active sort_d_1'";
	String dateClass = "";
	String noteTypeClass = "";
	String userIdClass = "";
%>

<%
	String listKey = (String) request.getAttribute("NOTES_KEY");
	String sortCol = (String) request.getAttribute("SORT_COLUMN");
	String sortOrder = (String) request.getAttribute("SORT_ORDER");
	
	String userType = (String) request.getAttribute("UserType");
	String userId =  "";
	userId = (String) request.getAttribute("ccouserid");
		
	String enableString = "";
	
	if ("Internal".equalsIgnoreCase(userType)){
	   enableString = "enabled";
	   }
	 else{
	   enableString = "disabled";
	   }
	
	if ("ASC".equalsIgnoreCase(sortOrder)){
		classString = "class ='active sort_a_1'";
	}else {
		classString = "class ='active sort_d_1'";
	}
	
	if ("creationDate".equalsIgnoreCase(sortCol))
		dateClass = classString;
	else
	if ("description".equalsIgnoreCase(sortCol))
		noteTypeClass = classString;
	else if ("userId".equalsIgnoreCase(sortCol))
		userIdClass = classString;

	String jsonStr = (String)request.getAttribute("jsonStr");
	String erMsg = "";
	if (null != request.getAttribute("ERRORMSG")) {
		erMsg = (String) request.getAttribute("ERRORMSG");
	}
%>
<div id="errorResults">
<font color="red"> <%= erMsg %> </font>
</div> <!-- errorResults end -->	
<div class="marque_grid">
<form id="ManageNotesForm" action="#" method="get" name="ManageNotesForm" class="inline">
	<div class="header_white"><h2><fmt:message key='ManageNotesSelector.deleteNotes'/> - <span><fmt:message key='ManageNotesSelector.selectItemsDelete'/></h2></div>
			

<div id="table_block_1">	
<!-- grid column header -->
<div class="mod_head">
<table width="565" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="4%" />
	<col width="15%" />
	<col width="17%" />
	<col width="25%" />
	<col width="49%" />
</colgroup>
<% 
String sortStr = "javascript:sort('"+listKey +"',";


%>
<thead>
	<tr>
		<th class="first" align="center"><input type="checkbox" name="selectAll" value="selectAll" 
		class="checkbox" onclick="toggleCheckboxesInGroup(this, this.form, 'group1');adjustNotesArray();" /></th>
		<th align="left" <%= dateClass %> id="creationDate" ><a href="<%= sortStr%>'creationDate')"><fmt:message key='ManageNotesSelector.date'/></a></th>
		<th align="left" <%= userIdClass %> id ="userID" ><a href="<%= sortStr%>'userId')"><fmt:message key='ManageNotesSelector.user'/></a></th>
		<th align="left" <%= noteTypeClass %> id="noteTypeCode" ><a href="<%= sortStr%>'description')"><fmt:message key='ManageNotesSelector.type'/></a></th>
		<th align="left"><fmt:message key='ManageNotesSelector.note'/></th>
	</tr>
</thead>	
</table>
</div> <!-- mod_head end -->
<!-- grid body -->
<div class="mod_grid_sm " id="resultsList">
<table width="565" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="4%" />
	<col width="15%" />
	<col width="17%" />
	<col width="25%" />
	<col width="49%" />
</colgroup>
<tbody>
 	<input type="hidden" name="returnString" id="returnString" value='<%=jsonStr%>'/>

	<c:set var="counter" value="0"/> 
   <c:set var="delete" value="Y"/>
   <c:set var="userid" value="${ccouserid}"/>

   <c:forEach var="entry" items="${notesList}">              
      <c:choose>
           <c:when test="${not empty entry}" >

           <c:set var="counter" value="${counter+1}"/> 
           
           <c:choose>  
              <c:when test="${counter%2==1}"> 

	<tr>
		<td class="first" align="center" valign="top">
		<input type="checkbox" name="selectedNotes" class="checkbox group1" value='<c:out value="${entry.noteID}"/>:<c:out value="${entry.userId}"/>:<c:out value="${entry.noteTypeCode}"/>:<c:out value="${entry.applShortName}"/>:<c:out value="${entry.noteContext}"/>:<c:out value="${entry.noteContextId}"/>:<c:out value="${entry.canDelete}"/>'
				onclick="createNoteIdArray('<c:out value="${entry.noteID}"/>:<c:out value="${entry.userId}"/>:<c:out value="${entry.noteTypeCode}"/>:<c:out value="${entry.applShortName}"/>:<c:out value="${entry.noteContext}"/>:<c:out value="${entry.noteContextId}"/>:<c:out value="${entry.canDelete}"/>');"  <c:if test="${entry.canDelete eq 'N'}"> <%=enableString%> </c:if> /></td>
		<td valign="top"><c:out value="${entry.creationDate}"/></td>
		
		<% if ("Internal".equalsIgnoreCase(userType)) { %>
			<td class="readonly" valign="top"><SPAN title='<c:out value="${entry.userName}"/> (<c:out value="${entry.companyName}"/>)' class="popup"><c:out value="${entry.userIdRole}"/></SPAN> </td>
		<% } else { %>		
	    	<td valign="top"><c:out value="${entry.userIdRole}"/></td>
	    <% } %>
		
		<td valign="top"><c:out value="${entry.noteTypeDesc}"/></td>
		<td valign="top"><c:out value="${entry.noteText}"/></td>
	</tr>
	</c:when>
    <c:otherwise>	
	<tr class="watermelon">
		<td class="first" align="center" valign="top">
		<input type="checkbox" name="selectedNotes" class="checkbox group1" value='<c:out value="${entry.noteID}"/>:<c:out value='${entry.userId}'/>:<c:out value="${entry.noteTypeCode}"/>:<c:out value="${entry.applShortName}"/>:<c:out value="${entry.noteContext}"/>:<c:out value="${entry.noteContextId}"/>:<c:out value="${entry.canDelete}"/>'
			onclick="createNoteIdArray('<c:out value="${entry.noteID}"/>:<c:out value="${entry.userId}"/>:<c:out value="${entry.noteTypeCode}"/>:<c:out value="${entry.applShortName}"/>:<c:out value="${entry.noteContext}"/>:<c:out value="${entry.noteContextId}"/>:<c:out value="${entry.canDelete}"/>');"  <c:if test="${entry.canDelete eq 'N'}"> <%=enableString%> </c:if> /></td>
		<td valign="top"><c:out value="${entry.creationDate}"/></td>
	    
	    <% if ("Internal".equalsIgnoreCase(userType)) { %>
			<td class="readonly" valign="top"><SPAN title='<c:out value="${entry.userName}"/> (<c:out value="${entry.companyName}"/>)' class="popup"><c:out value="${entry.userIdRole}"/></SPAN> </td>
		<% } else { %>		
	    	<td valign="top"><c:out value="${entry.userIdRole}"/></td>
	    <% } %>
	    
		<td valign="top"><c:out value="${entry.noteTypeDesc}"/></td>
		<td valign="top"><c:out value="${entry.noteText}"/></td>
	</tr>
	
	</c:otherwise>                         
           </c:choose>  
           
                     <!-- Hidden fields to pass for update action -->
                     <!-- input type="hidden" name="objToPassBack" value=''/-->

           </c:when>         
        </c:choose>  
   </c:forEach>
   
   <c:if test="${counter==0}">
      <tr>
         <td  class="first" valign="top" colspan=2 valign="middle" align="center">
            <fmt:message key='ManageNotesSelector.noDataFound'/>
         </td>
      </tr>
   </c:if>
	
</tbody>	
</table>

<SCRIPT>

  
      </SCRIPT>
</div> <!-- body grid end -->
</div> <!-- table_block_1 end -->
</div>
</form>


