<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.crosstrack.data.dao.RequestDetailsBean" %>
<%@ include file="localeInfo.jsp" %>

<%
ArrayList rdbList=(ArrayList)request.getAttribute("requestDetailsResults");
%>

<div id="mailconf">

</div>
<div class="mod_head">
<table width="948" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="18%" />
	<col width="13%" />
	<col width="10%" />
	<col width="15%" />
	<col width="10%" />
	<col width="10%" />
	<col width="24%" />
</colgroup>
<thead>
	<tr>
		<th class="first" align="left"><fmt:message key='request_det.actionTableHead'/></th>
		<th align="left"><fmt:message key='request_det.startDateTableHead'/></th>
		<th align="left"><fmt:message key='request_det.timeTableHead'/></th>
		<th align="left"><fmt:message key='request_det.completeDateTableHead'/></th>
		<th align="left"><fmt:message key='request_det.timeTableHead'/></th>
		<th align="left"><fmt:message key='request_det.statusTableHead'/></th>
		<th align="left"><fmt:message key='request_det.reasonTableHead'/></th>
	</tr>
</thead>	
</table>
</div>


<div class="mod_grid_sm " id="grid_1">
<table width="948" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="18%" />
	<col width="13%" />
	<col width="10%" />
	<col width="15%" />
	<col width="10%" />
	<col width="10%" />
	<col width="24%" />
</colgroup>
<tbody>



<%
for (int cntr=0; cntr<rdbList.size();cntr++){

if(cntr%2==1){
%>
                  <tr>
                     	<td class="first"><%=((RequestDetailsBean)rdbList.get(cntr)).getAction()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStartDate()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStartTime()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getCompleteDate()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getCompleteTime()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStatus()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getReason()%></td>
                  </tr>
                  <%}else{%>
                   <tr class="watermelon">
                     	<td class="first"><%=((RequestDetailsBean)rdbList.get(cntr)).getAction()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStartDate()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStartTime()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getCompleteDate()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getCompleteTime()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStatus()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getReason()%></td>
                  </tr>
                  <%}}%>

	</tbody>	
</table>
</div> <!-- body grid end -->
