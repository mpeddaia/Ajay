
<%@ include file="localeInfo.jsp" %>  
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title><bean:message key="MCM.TITLE"/></title>
<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
	//String commingFrom = (String)request.getAttribute("commingFrom");
    String cscchomepage=combinedImagesLocation+"requestStatusDispatch.do?methodName=onDashboardAction";
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript">
	</SCRIPT>
	<SCRIPT>
		function closeWindow() 
		{ 
			var useragent = navigator.userAgent;
			if (useragent.lastIndexOf('Firefox/') > 0)
			{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserWrite");
			}
			window.open("","_self");
			window.close();
		} 
	</SCRIPT>
	<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
</head>
	<body marginheight="0" marginwidth="0"  >
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
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:closeWindow();"><fmt:message key='Common.closeWindow'/></a></td>
									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- screen title -->
		
		<h2 class="output">Output Reports</h2>
		<div id="mod_1">
		<form >
			  <div class="output">
			 <table width="915" >
			 <tr><td>
		                
	               &nbsp; <font color="RED"><B><fmt:message key='crosstrackOutputReports.requestID'/> #</B> </font><%=request.getParameter("upld_request_id") %> <br/><br/><br/>
	           		 <h2 class="output">&nbsp;Output Reports </h2>
								   
									 <h3>&nbsp;&nbsp;
									 		<a href=<%=request.getContextPath() %>/downloadreport.view?uploadRId=<%=request.getParameter("upld_request_id") %>&request_type=<%=request.getParameter("request_type") %>>
												<%=request.getParameter("request_type") %>
											</a>
									</h3>
						</td>
					</tr>
				</table>
				<BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/><BR/>
				
			
		    </div>
		    <hr>
			<!-- buttons start -->
			<div id="button_1" class="button_block_sm">
				<!-- button component -->
				
				<!-- button component -->
				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:closeWindow();">
					<tr>
						<td class="button_left" onclick="document.getElementById('Close').click();"></td>
						<td><input id="Close" class="button" type="reset" name="Close" value="<fmt:message key='crosstrackOutputReports.Close'/>" /></td>
						<td class="button_right" onclick="document.getElementById('Close').click();"></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
		<br/><br/>
<center>
<a href='<%= cscchomepage %>'><fmt:message key='crosstrackOutputReports.CSCCHomePage'/></a>
</center>
		<!-- modules end -->
	</body>

</html>