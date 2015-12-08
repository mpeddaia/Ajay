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
//String requestType = (String)request.getAttribute("requesttype");
//String status = (String)request.getAttribute("status"); 
if(request.getAttribute("failedRowCount")!=null){
//int count = Integer.parseInt((String)request.getAttribute("failedRowCount"));
}

	
		%>
<script language='javascript'>
function statusPage(){	
	
  document.McmStatusDetailForm.action = "<%=request.getContextPath()%>/mcmstatusdetailview.do";
  //alert(document.McmStatusDetailForm.action);
document.McmStatusDetailForm.submit();
//submitForm(document.getElementById("MatStatusDetailForm"));
	
}

</script>

	
<% 
if ((request.getAttribute("status")==null ||  !request.getAttribute("status").equals("COMPLETED")
		) || 
        (
        request.getAttribute("requesttype")!=null)
        /* <%-- TD013;saatmaku;12-jun-08;start;Commented for consistency in request deatils page
         &&  request.getAttribute("requesttype").equals(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID) 
         request.getAttribute("requesttype")!=null &&  request.getAttribute("requesttype").equals(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID) && request.getAttribute("requesttype").equals(McmConstants.MCM_MAT_M_AND_P_ENTITLMNT) &&request.getAttribute("requesttype").equals(McmConstants.MCM_MAT_ADD) */ 
        
       )
       {
  %>
       
        

		
			<body onload=statusPage()>	
	
		<form name="McmStatusDetailForm" id="McmStatusDetailForm" action='mcmstatusdetailview.do'>
	<input type="hidden" name="method" value="statusDetails"/>
	<input type="hidden" name="requestid" value='<%=request.getAttribute("requestId")%> '/>
	<input type="hidden" name="status" value='<%=request.getAttribute("status")%> '/>
	<input type="hidden" name="requesttype" value='<%=request.getAttribute("requesttype")%> '/>
	<input type="hidden" name="overrides" value='<%=request.getAttribute("overrides")%> '/>
	<input type="hidden" name="event" value="loadDetails"/>
		
</form>
<body>
<%
	
	}
else
{
%>
	<script>
	
	alert("This MassMAT Request has been successful. There are no error messages to display");
	window.close();
	
	</script>
<%
}
%>
