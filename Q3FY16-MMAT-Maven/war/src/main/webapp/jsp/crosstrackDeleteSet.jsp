<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language = "java" import ="org.json.*,com.metaparadigm.jsonrpc.JSONRPCBridge,java.util.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.cisco.crosstrack.filters.dao.PortletDTO" %>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%@ include file="localeInfo.jsp"%>

<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="handler" scope="request" class="com.cisco.crosstrack.filters.FilterHandler" />

<% JSONRPCBridge.registerObject("handler", handler); %>
<%	
	String appContext   = request.getContextPath();
	String sourceSystem = (String)request.getAttribute("sourceSystem");
	String ccouserid    = (String)request.getAttribute("ccouserid");
	String context      = (String)request.getAttribute("context");
%>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='DeleteSavedSet.title'/></title>
		
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
	
	//System.out.println("combinedScriptLocation in Header.jsp : "+combinedScriptLocation);
	//System.out.println("combinedImagesLocation in Header.jsp : "+combinedImagesLocation);
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts 		
		<script type="text/javascript" src="js/datapersistence.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jsonrpc.js" type="text/javascript"></script>
	-->
		<script type="text/javascript" src="js/deleteSavedSet.js" type="text/javascript"></script>
		
	</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->

	<body marginheight="0" marginwidth="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top"><img src="<%=combinedImagesLocation%>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>
				  <td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="100" border="0" /></td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="1" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='Common.closeWindow'/></a></td>
									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
				  </td>
				</tr>
			</tbody>
		</table>
		<!-- screen title -->
		<h1><fmt:message key='DeleteSavedSet.header'/></h1>
		<!-- modules start --><form id="FormName" action="#" method="get" name="FormName" class="inline">
		</form>
				
		<br><font color="red">
		<%Object errmsgobj = request.getAttribute("CTERREXMSG");
           if (errmsgobj != null){
        	   String errStr = (String)errmsgobj;
        	   out.println(errStr);
           }
         %>
         </font></br>
         
		<!-- modules end -->
		<!-- modules start -->
		<div id="mod_1" class="mod_pop" style="width:377px">
		<form id="FormName" action="#" method="get" name="FormName" class="inline">
			<div class="marque_grid">
<!-- input type="hidden" name="methodName" value='loadFunctions'/-->
<!-- grid column header -->
<div class="mod_head">
<table width="375" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="6%" />
	<col width="57%" />
	<col width="37%" />
</colgroup>
<thead>
	<tr>
		<th class="first" align="center"><input type="checkbox" class="checkbox" name="selectQuote" value="selectAll" onclick="toggleCheckboxesInGroup(this, this.form, 'checkbox topGroup')" /></th>
		<th class="active" align="left"><fmt:message key='DeleteSavedSet.SavedSearchSet'/></th>
		<th class="active" align="left"><fmt:message key='DeleteSavedSet.Entity'/></th>
	</tr>
</thead>	
</table>
</div>
<!-- grid body -->
<div class="mod_grid_sm" id="grid_1">
<table width="355" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="6%" />
	<col width="60%" />
	<col width="34%" />
</colgroup>
<%
	int savedSetSize = Integer.parseInt((String) request.getAttribute("savedSetSize"));
	java.util.HashMap savedSetNames = (java.util.HashMap) request.getAttribute("savedSetNames");
   	java.util.Set s;
	s = savedSetNames.keySet();
	Object[] keys = s.toArray(); 
	List valuesList;

   	for (int i=0; i<keys.length; i++) { 
   		PortletDTO portDTO = (PortletDTO) keys[i]; 
   		if (portDTO != null) {
			valuesList = (List) savedSetNames.get(keys[i]);
			for (int j=0; j<valuesList.size(); j++) {
				savedSetSize--;
%>
<tbody>
<% if (savedSetSize%2 == 0) {%>
	<tr>
		<td class="first" align="center" valign="top">
		<input type="checkbox" name="selectLineItem" value='<%= valuesList.get(j) %>,<%= portDTO.getFunctionName() %>' class="checkbox topGroup" /></td>
		<td><%= valuesList.get(j) %></td>		
		<td><%= portDTO.getFunctionName() %></td>
	</tr>
<% } else { %>	
	<tr class="watermelon">
		<td class="first" align="center" valign="top">
		<input type="checkbox" name="selectLineItem" value='<%= valuesList.get(j) %>,<%= portDTO.getFunctionName() %>' class="checkbox topGroup" /></td>
		<td><%= valuesList.get(j) %></td>
		<td><%= portDTO.getFunctionName() %></td>
	</tr>
<% } %>	
</tbody>	
<%
		}
	}
}
%>
</table>
</div> <!-- body grid end -->
			</div>
			<!-- buttons start -->
			<div id="button_1" class="button_block_sm">
				<!-- button component -->
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('sendRequest').click();"></td>
						<td><input id="processRequest" class="button" type="button" name="Delete" value="<fmt:message key='DeleteSavedSet.deleteButton'/>" onclick="return deleteSavedSetNames('<%= appContext %>','<%= sourceSystem %>','<%= ccouserid %>','<%= context %>');" /></td>
						<td class="button_right" onclick="document.getElementById('sendRequest').click();"></td>
					</tr>
				</table>
				<!-- button component -->
				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
					<tr>
						<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
						<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='Common.cancelButton'/>" /></td>
						<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
	</body>

</html>