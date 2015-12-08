
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cisco.crosstrack.data.dao.RequestDetailsBean" %>
<%@ include file="localeInfo.jsp" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		
		<!-- component linked resources -->
		<!--  Commented for Defect 7774 - Combining All common JS scripts 
		<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>				
		<script type="text/javascript" src="js/genJSON.js"></script>		
		<script type="text/javascript" src="js/jsonrpc.js"></script>
      	<script language="javascript" src="js/datapersistence.js"></script>
      	-->
      	<script language="javascript" src="js/requeststatus.js"></script>
      	<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>
      	
	
<%
//System.out.println(((RequestDetailsBean)request.getAttribute("requestDetailsResults")).getAction());
ArrayList rdbList=(ArrayList)request.getAttribute("requestDetailsResults");
%>
          
  
  
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
		<th class="first" align="left"><fmt:message key='RequestDetails.action'/></th>
		<th align="left"><fmt:message key='RequestDetails.startDate'/></th>
		<th align="left"><fmt:message key='RequestDetails.time'/></th>
		<th align="left"><fmt:message key='RequestDetails.completeDate'/></th>
		<th align="left"><fmt:message key='RequestDetails.time'/></th>
		<th align="left"><fmt:message key='RequestDetails.status'/></th>
		<th align="left"><fmt:message key='RequestDetails.reason'/></th>
	</tr>
</thead>	
</table>
</div>

<!-- grid body -->
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
//System.out.println("..in here ");
%>
                  <tr>
                     	<td class="first"><%=((RequestDetailsBean)rdbList.get(cntr)).getAction()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getAction()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStartDate()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getStartTime()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getCompleteDate()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getCompleteTime()%></td>
						<td><%=((RequestDetailsBean)rdbList.get(cntr)).getReason()%></td>
                  </tr>

                  <tr class="watermelon">
                     	<td class="first"><fmt:message key='RequestDetails.stage'/> 2</td>
		<td>29-Jan-2005</td>
		<td>2:27 PM</td>
		<td>30-Jan-2005</td>
		<td>2:30 PM</td>
		<td><fmt:message key='RequestDetails.complete'/></td>
		<td>&nbsp;</td>
                  </tr>

<% 
}
%>

  
  </table>
  </div>
