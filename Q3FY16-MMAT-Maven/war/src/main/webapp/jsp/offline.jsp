<%@ page import="com.cisco.crosstrack.offline.data.dto.OfflineDTO" %>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="localeInfo.jsp" %>

<%
String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='Offline.title'/></title>
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		<script language="JavaScript">

		function submitProcess(optVal){
//		alert(document.offlineFrm.requestName.value);
			window.opener.document.getElementById("requestName").value=document.offlineFrm.requestName.value;
			if(optVal==1){
				window.opener.document.getElementById("processType").value="OFFLINE";
			}
			else
			{
				window.opener.document.getElementById("processType").value="ONLINE";
			}
		
			if(document.offlineFrm.emailNotify.checked){
				window.opener.document.getElementById("mailNotify").value="true";
			}
			else
			{
				window.opener.document.getElementById("mailNotify").value="false";
			}
	
			window.opener.validateSaveSubmit();
		
	    	self.close();
		}
		
		function confirmWin()
		{
			var response = window.confirm("This process will be aborted.Are you sure you want to proceed ?");
			if(response)
			{
				window.close();
			}
			
		}
		
		</script>
	</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->
	
	<%
	OfflineDTO ODTO=(OfflineDTO)request.getAttribute("offline");

	String optns=ODTO.getProcessType(); //(String)request.getParameter("processType");
	
	
	%>
	
	

	<body marginheight="0" marginwidth="0" >
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
		<h1><fmt:message key='Offline.options'/></h1>
		<!-- modules start -->
		<div id="mod_1" class="mod_pop" style="width:475px">
		<form id="offlineFrm"  name="offlineFrm" class="inline" method="post">
						
		
		
			<div class="marque">
				<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
				<tbody>
						<tr>
							<td align="left" colspan="3"><b><fmt:message key='Offline.processName'/>: <%=ODTO.getProcessName()%></b></td>
						</tr>
						<tr>
						<td align="left" colspan="3"><strong><%=ODTO.getMsgTxt()%></strong><br></td>
						</tr>
						<tr>
							<td align="left" width="30%"><b><fmt:message key='Offline.requestName'/></b></td>		
							<td valign="top" align="left" width="30%"><input type="text" name="requestName" id="requestName" value='<%=ODTO.getRequestName()%>' class="inputTextLarge" /></td> 
                            <td align="left"><b><fmt:message key='Offline.emailNotification'/> </b><input type="checkbox" name=emailNotify checked/> 	</td>
						</tr>
					</tbody>	
				</table>	
				
				
				
				
			</div>
			<!-- buttons start -->
			<div id="button_1" class="button_block_sm" style="width:375px">
				<!-- button component -->
				
				<%
				if (optns.equals("BOTH")){
				%>
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('validateOffline').click();"></td>
						<td><input id="validateOffline" class="button" type="button" name="validateOffline" value="     <fmt:message key='Offline.offlineButton'/>    " onclick="javascript:submitProcess(1)"/></td>
						<td class="button_right" onclick="document.getElementById('validateOffline').click();"></td>
					</tr>
				</table>
				
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('validateNow').click();"></td>
						<td><input id="validateNow" class="button" type="button" name="validateNow" value="     <fmt:message key='Offline.onlineButton'/>     " onclick="javascript:submitProcess(2)"/></td>
						<td class="button_right" onclick="document.getElementById('validateNow').click();"></td>
					</tr>
				</table>
				<%}%>
				
				
				<%
				if (optns.equals("ONLINE")){
				%>
				<table class="primary_disabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" ></td>
						<td><input id="validateOffline" class="button" type="button" name="validateOffline" value="     Offline    " DISABLED /></td>
						<td class="button_right"></td>
					</tr>
				</table>
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('validateNow').click();"></td>
						<td><input id="validateNow" class="button" type="button" name="validateNow" value="     Online     " onclick="javascript:submitProcess(2)"/></td>
						<td class="button_right" onclick="document.getElementById('validateNow').click();"></td>
					</tr>
				</table>
				<%}%>
				
				<%
				if (optns.equals("OFFLINE")){
				%>
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('validateOffline').click();"></td>
						<td><input id="validateOffline" class="button" type="button" name="validateOffline" value="     <fmt:message key='Offline.offlineButton'/>    " onclick="javascript:submitProcess(1)"/></td>
						<td class="button_right" onclick="document.getElementById('validateOffline').click();"></td>
					</tr>
				</table>
				
				<table class="primary_disabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" ></td>
						<td><input id="validateNow" class="button" type="button" name="validateNow" value="     <fmt:message key='Offline.onlineButton'/>     " DISABLED /></td>
						<td class="button_right" ></td>
					</tr>
				</table>
				<%}%>
				
				
				<!-- button component -->
				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" >
					<tr>
						<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
						
						<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='Common.cancelButton'/>" onclick="confirmWin()"/></td>
					
						
						<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
						
					</tr>
				</table>
			</div>
		</form>
		</div>
		
		
		
		<!-- modules end -->
	</body>

