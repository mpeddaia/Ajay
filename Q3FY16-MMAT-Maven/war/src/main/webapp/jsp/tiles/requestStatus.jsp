<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<%@ page import="com.cisco.servicesales.list.EnhancedList" %> 
<%@ page import="com.cisco.servicesales.list.engine.Column" %> 
<%@ page import="com.cisco.mcm.bo.McmUploadSummaryContext" %> 
<%@ page import="com.cisco.servicesales.list.Paginator" %> 
<%@ page import="java.util.*" %><%@ page import="java.net.URLEncoder" %><%@ page import="com.cisco.mcm.util.McmConstants" %> 
<%
String requestType = (String)request.getAttribute("requesttype");
String status = (String)request.getAttribute("status"); 
 //int count = Integer.parseInt((String)request.getAttribute("failedRowCount"));
 
	
		%>
<script language='javascript'>
function statusPage(){	
	
  document.McmStatusDetailForm.action = "<%=request.getContextPath()%>/mcmstatusdetailview.do";
  //alert(document.McmStatusDetailForm.action);
document.McmStatusDetailForm.submit();
//submitForm(document.getElementById("MatStatusDetailForm"));
	
}

</script>




<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="">

<div id="application_area">
<table height="16"><tr><td></td></tr></table>
<div id="mod_1" class="mod_header" style="width:99%">
			<h2 class="mh_title" style="margin-left:15px;">
						Request Status
			</h2>	
</div> 
<div id="marque_1" class="marque" style="width:99%; margin-left: 11px;">

						
	<table border=0 cellSpacing=1 cellPadding=0 width="100%" margin-left="11px">
		<tr bgcolor=#A1A1A1>
			<td align="center">										
			<font color=#ffffff>Request Id</font>
			</td>
			<td align="center">
			<font color=#ffffff>Request Type</font>
			</td>
			<td align="center">
			<font color=#ffffff>Request Name</font>
			</td>
			<td align="center">
			<font color=#ffffff>Status</font>
			</td>
		</tr>
		<form name="McmStatusDetailForm" id="McmStatusDetailForm" action='mcmstatusdetailview.do'>
	<input type="hidden" name="method" value="statusDetails"/>
	<input type="hidden" name="requestid" value='<%=request.getAttribute("requestId")%> '/>
	<input type="hidden" name="status" value='<%=request.getAttribute("status")%> '/>
	<input type="hidden" name="requesttype" value='<%=request.getAttribute("requesttype")%> '/>
	<input type="hidden" name="overrides" value='<%=request.getAttribute("overrides")%> '/>
	<input type="hidden" name="event" value="loadDetails"/>
		<tr bgcolor=#ffffff>
			<td align="center">
				<%=request.getAttribute("requestId")%>
			</td>
			<td align="center">
				<%=requestType %>
				<!--<%=requestType%>-->
			</td>
			<td align="center" width="400" nowrap>
				<bean:message key="<%=requestType %>"/>
				<!--<%=requestType%>-->
			</td>
			
			<td align="center">
					<a href="javascript:statusPage();"><%=status%></a>
			</td>
		</tr>
			</form>
	</table>
		
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>

	<TR>
		<TD align=right colSpan=2><IMG height=10 src="https://www.cisco.com/apps-ui/generic/1.0/images/pixel.gif" width=1></TD>
	 </TR>

</TABLE>

</div>
<table height="110"><tr><td></td></tr></table>
</div>

</body>
