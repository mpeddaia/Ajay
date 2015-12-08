<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%
			//Testing
			//request.setAttribute("selectionType", "Multiple");
			//request.setAttribute("selectionType", "Single");
			String sortId = (String) request.getAttribute("sortId");
			if (sortId == null || sortId.equals("")) {
				sortId = "-1";
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
			String userNameSortClass = "";
			String userIdSortClass = "";
			String companyNameSortClass = "";

			if(sortId.equals("userName")){
				if(sortOrder.equalsIgnoreCase("ASC")){
				userNameSortClass= " class='active sort_a_1' ";
				}else {
					userNameSortClass= " class='active sort_d_1' ";
				}
			}else if(sortId.equals("userId")){
				if(sortOrder.equalsIgnoreCase("ASC")){
					userIdSortClass = " class='active sort_a_1' ";
				}else {
					userIdSortClass = " class='active sort_d_1' ";
				}
			}else if(sortOrder.equalsIgnoreCase("ASC")){
					companyNameSortClass = " class='active sort_a_1' ";
					userIdSortClass = " class='active sort_a_1' ";
					}else {
					companyNameSortClass = " class='active sort_d_1' ";
				userIdSortClass = " class='active sort_d_1' ";
			}				
			

			String pageNo = (String) request.getAttribute("pageNo");
			if (pageNo == null || pageNo.equals("")) {
				pageNo = "-1";
			}
%>

<head>
	<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

	<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scrip		
	<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
	<script language="JavaScript" src="js/crosstrackselectors.js" type="text/javascript"></script>
	-->

</head>
<!-- Pagination Tab -->

<div class="table_mod_header">

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr valign="middle">
			<td align="left" valign="middle">
				<h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px; white-space: nowrap; padding: 0; float: left;">
					<fmt:message key='UserSelector.userLookupResults'/>
				</h2>
			</td>
			<td align="right" valign="middle">
				| <a href="javascript:searchItems('tablediv',1, '<%= sortId %>','<%= revSortOrder%>','0');">&lt;&lt;</a> | <a href="javascript:searchItems('tablediv',<c:out value="${pageNo-1}"/>, '<%= sortId %>','<%= revSortOrder%>','0');">&lt;</a> | <fmt:message key='UserSelector.Pages'/>
				<c:out value="${numPages}" />
			</td>
			<td>
				<select name="userIdPageNumber" id="userIdPageNumber" size="1" class="inputTextSM" onChange="javascript:searchUsersPagDD('tablediv','<%= sortId %>');">
					<c:forEach var="curPage" begin="1" end="${numPages}">
						<c:choose>
							<c:when test="${curPage==pageNo}">
								<option selected value="<c:out value="${curPage}"/>">
									<c:out value="${curPage}" />
								</option>
							</c:when>
							<c:otherwise>
								<option value="<c:out value="${curPage}"/>">
									<c:out value="${curPage}" />
								</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>

				| <a href="javascript:searchItems('tablediv',<c:out value="${pageNo+1}"/>, '<%= sortId %>','<%= revSortOrder%>','0');">&gt;</a> | <a href="javascript:searchItems('tablediv',<c:out value="${numPages}"/>, '<%= sortId %>','<%= revSortOrder%>','0');">&gt;&gt;</a> |
			</td>
		</tr>
	</table>

</div>

<!--Table Meta Data-->
<div class="mod_head">
	<table width="100%" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
		<col width="6%" />
		<c:choose>
			<c:when test="${userType != null && userType eq 'PROXY'}">
				<col width="30%" />
				<col width="30%" />
				<col width="34%" />
			</c:when>
			<c:otherwise>										
				<col width="35%" />
				<col width="59%" />
			</c:otherwise>
		</c:choose>
		<thead>
			<tr>
				<c:choose>
					<c:when test="${selectionType != null && selectionType eq 'MULTIPLE' }">
					<th align="left">
						<input type="checkbox" name="selectLineItem" value="selectAll" class="checkbox topGroup"
									onclick="toggleCheckboxesInGroup(this,FormName,'topGroup');adjustUserIdArray();">
					</th>
					</c:when>
					<c:otherwise>
						<th align="left"></th>
					</c:otherwise>
				</c:choose>
				<th <%= userIdSortClass %> align="left">
					<a href="javascript:searchItems('tablediv',1, 'userId','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='UserSelector.userId'/></a>
				</th>
				<th <%= userNameSortClass %> align="left">
					<a href="javascript:searchItems('tablediv', 1,'userName','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='UserSelector.name'/></a>
				</th>
				<!-- write the logic here to display company name-->
				<c:choose>
					<c:when test="${userType != null && userType eq 'PROXY'}">
						<th <%= companyNameSortClass %> align="left">
							<a href="javascript:searchItems('tablediv',1, 'companyName','<%=revSortOrder%>','<%=prevSortId%>');"><fmt:message key='UserSelector.companyName'/></a>
						</th>
					</c:when>
				</c:choose>
			</tr>
		</thead>
	</table>
</div>

<!-- Table body -->

<div class="mod_grid_sm" id="dataGrid">

	<table width="100%" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0" style="word-wrap:break-word;" >
		<col width="6%" />
		<c:choose>
			<c:when test="${userType != null && userType eq 'PROXY'}">
				<col width="30%" />
				<col width="30%" />
				<col width="34%" />
			</c:when>
			<c:otherwise>										
				<col width="35%" />
				<col width="59%" />
			</c:otherwise>
		</c:choose>
		<tbody>
			<c:set var="counter" value="0" />

			<c:forEach var="userDto" items="${usersList}">
				<c:choose>
					<c:when test="${not empty userDto}">
						<c:set var="counter" value="${counter+1}" />

						<c:choose>
							<c:when test="${counter%2==1}">
								<tr>
									<td class="first" align="center" valign="top">
									<c:choose>
										<c:when test="${selectionType != null && selectionType eq 'MULTIPLE' }">
											<input type="checkbox" name="selectLineItem" id="selectedUserId" class="checkbox topGroup" value="<c:out value="${userDto.userId}" />" class="checkbox" onChange="refreshUserIdArray('<c:out value='${userDto.userId}'/>');" />
										</c:when>
										<c:otherwise>
											<input type="radio" name="selectLineItem" id="selectedUserId" value="<c:out value="${userDto.userId}"/>" class="radio" onChange="refreshRadioArray('<c:out value='${userDto.userId}'/>');" />
										</c:otherwise>
									</c:choose>
									</td>
									<td>
										<c:out value="${userDto.userId}" />
									</td>
									<td>
										<c:out value="${userDto.name}" />
									</td>
									<c:choose>
										<c:when test="${userType != null && userType eq 'PROXY'}">
											<td>
												<c:out value="${userDto.strCompanyName}" />
											</td>
										</c:when>
									</c:choose>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="watermelon">
									<td class="first" align="center" valign="top">
										<c:choose>
											<c:when test="${selectionType != null && selectionType eq 'MULTIPLE' }">
												<input type="checkbox" name="selectLineItem" id="selectedUserId" class="checkbox topGroup" value="<c:out value="${userDto.userId}"/>" class="checkbox" onChange="refreshUserIdArray('<c:out value='${userDto.userId}'/>');" />
											</c:when>
											<c:otherwise>
												<input type="radio" name="selectLineItem" id="selectedUserId" value="<c:out value="${userDto.userId}"/>" class="radio" onChange="refreshRadioArray('<c:out value='${userDto.userId}'/>');" />
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:out value="${userDto.userId}" />
									</td>
									<td>
										<c:out value="${userDto.name}" />
									</td>
									<c:choose>
										<c:when test="${userType != null && userType eq 'PROXY'}">
											<td>
												<c:out value="${userDto.strCompanyName}" />
											</td>
										</c:when>
									</c:choose>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>
			</c:forEach>

			<c:if test="${counter==0}">
				<tr>
					<td class="first" valign="top" colspan=3 valign="middle" align="center">
						<font color="#9c0000"><fmt:message key='UserSelector.noDataFound'/></font>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>

</div>

