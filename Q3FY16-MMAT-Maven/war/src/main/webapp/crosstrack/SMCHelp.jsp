<%@ page import="com.cisco.crosstrack.menu.*" %>
<%@ page import="com.cisco.crosstrack.data.dto.*" %>
<%@ page import="com.cisco.crosstrack.user.UserAttributes"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ include file="localeInfo.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><fmt:message key='SMCHelp.title'/></title>

 
<script type="text/javascript" src="js/compjs/cxDHTMLMenu.js"></script>
<SCRIPT language=JavaScript src="images/cscc/sitewide_tools.js"></SCRIPT>

<!-- ********************* APPLICATION AREA START *********************************************** -->
<!-- linked resources added by Tristream Start -->
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/menu_styles.css" type="text/css" media="screen" />
<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
<!-- component linked resources -->

<!--  Commented for Defect 7774 - Combining All common JS scripts 
<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>
-->

<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>

</head>

<body>
<%	
	String erMsg = (String)request.getAttribute("Help_error_message");
	if (erMsg == null) erMsg = "";
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top" width="166"><img src="http://www.cisco.com/swa/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>
					 <td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="219"><img src="http://www.cisco.com/swa/i/s.gif" alt="" height="8" width="100" border="0" /></td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="73%"><img src="http://www.cisco.com/swa/i/s.gif" alt="" height="8" width="1" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="219"><a class="cisco" href="javascript:self.close();"><fmt:message key='Common.closeWindow'/></a></td>
									<td align="left" valign="top" width="73%" background="http://www.cisco.com/swa/i/grn_vertlines_top.gif"><img src="http://www.cisco.com/swa/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
								<tr>
								 <td><img height=20 align=right alt="" src="images/cscc/openCase.gif" width=20 border=0 name=printing></td>
								  <td>
									<% if ("ja".equals(request.getAttribute("defLangCode"))) {%>
									   <a href="javascript:sitewide_toolkit_window('http://ciscojapan.custhelp.com/cgi-bin/ciscojapan.cfg/php/enduser/acct_login.php?p_sid=KL6wbNqi&p_accessibility=&p_lva=&p_sp=&p_li=&p_next_page=std_alp.php','openACaseWindow');"> <font size=1><fmt:message key='SMCHelp.openCase'/></font></a> <fmt:message key='SMCHelp.openCaseString'/></td>
								    <%} else{ %>
									   <a href="javascript:sitewide_toolkit_window('http://ciscopsc.custhelp.com/cgi-bin/ciscopsc.cfg/php/enduser/ask.php','openACaseWindow');"> <font size=1><fmt:message key='SMCHelp.openCase'/></font></a> <fmt:message key='SMCHelp.openCaseString'/></td>
								   <%}%>
								   <td align=right>&nbsp;</td>

								  </tr>
							</tbody>
						</table>
					</td> 
				</tr>
			</tbody>
			
		</table>


		<h1>  <fmt:message key='SMCHelp.help'/></h1>
		<table border="0" cellpadding="0" cellspacing="0">
		<tbody>
		<%
		//User user=(User)session.getAttribute("User");
		String authlevel="";
				
		if (userVar.getIsProxy()) {
		authlevel = userVar.getProxyAuthLevel()+"";
		//System.out.println("authlevel is "+authlevel);
		}else {
		authlevel = userVar.getUserAttributes().getAccessLevel()+"";
		}
		
		if("ja".equals(request.getAttribute("defLangCode"))){
			if(authlevel.equalsIgnoreCase("4"))
			{
			%>
		  	<tr>
		  		<td>&nbsp;&nbsp;</td>
		  	</tr>
			<tr>
		  		<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="http://wwwin-japan.cisco.com/ca/organization/sso/tools.shtml" target="_blank"><fmt:message key='SMCHelp.helpLink'/></a></td>
		  	</tr>
			<%
			}else {
			%>
		  	<tr>
		  		<td>&nbsp;&nbsp;</td>
			</tr>
		  	<tr>
		  		<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="http://www.cisco.com/japanese/warp/partner/support/t_r.shtml" target="_blank"><fmt:message key='SMCHelp.helpLink'/></a></td>
		  	</tr>
			<%
			}
		}
		
		if("es".equals(request.getAttribute("defLangCode"))){
			if(!authlevel.equalsIgnoreCase("4"))
			{
		%>
		  	<tr>
		  		<td>&nbsp;&nbsp;</td>
			</tr>
		  	<tr>
		  		<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href ="http://www.cisco.com/web/LA/serviciospartners/espanol/herramientas.html" target="_blank"><fmt:message key='SMCHelp.helpLink'/></a> </td>
		  	</tr>
		<%
		}}
		%>

		</tbody>
		</table>
		
		<div id="application_nav">
			<div id="menu_container">
				<!-- DHTML TAB-MENU NAVAGATION START  onMouseOver="over(event)" onMouseOut="out(event)"-->
				<div id="tabs" class="module_tabs">
				<table border="0" id="menu" cellspacing="0" cellpadding="0">
						<tr><br>
							<c:forEach var="row" items="${TabMenu.parentMenuBeans}">
							 <c:set var="Tab1" value="${row.primaryDisplayMenu}"scope="session"/> 
							
							 <c:choose>
									<c:when test='${row.primaryDisplayMenu == pTabName}'>
									 	<td valign="center" class="active">
									
									 	
							 				 <a href='smcHelpDispatchAction.do?methodName=onParentMenu&TabName=<c:out value="${row.primaryDisplayMenu}"/>&parentTabIndex=<c:out value="${row.tabIndex}"/>' id="tab1" ><img src="images/components/mtabs/default/mtab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span><c:out value="${row.primaryDisplayMenu}"/></span><img src="images/components/mtabs/default/mtab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>
							 				<td>
										 
									 </c:when>
									 <c:otherwise>
									 
										<td valign="center">
											  <a href='smcHelpDispatchAction.do?methodName=onParentMenu&TabName=<c:out value="${row.primaryDisplayMenu}"/>&parentTabIndex=<c:out value="${row.tabIndex}"/>' id="tab1" ><img src="images/components/mtabs/default/mtab_left_first_normal.gif" alt="" align="absmiddle" border="0" /><span><c:out value="${row.primaryDisplayMenu}"/></span><img src="images/components/mtabs/default/mtab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
											 <td>
										 
									 </c:otherwise>
							</c:choose>
												
						 </c:forEach>
						</tr>
				</table>
				</div>
			</div>
		</div>
			
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td width="2%"> </td>
    <td valign=top width="20%"><br>
	<table width="100%"  border="0" cellpadding="0" cellspacing="0">
 		 <c:forEach var="subRow" items="${TabMenuChildren}"><tr><td><br></td></tr>
 				 
 		 
 		 <c:choose>
				<c:when test='${subRow.helpContext == phlpCTX}'>
				
				 	<tr><td valign="center" bgcolor="white">
		 				<b><a href='smcHelpDispatchAction.do?methodName=onChildMenu&TabName=<c:out value="${TabMenuItem}" />&hlpCTX=<c:out value="${subRow.helpContext}"/>'><c:out value="${subRow.secondaryDisplayMenu}"/></a></b>
		 				<td>
					 </tr>
				 </c:when>
				 <c:otherwise>
				 
					<tr><td valign="center" >
						 <b><a href='smcHelpDispatchAction.do?methodName=onChildMenu&TabName=<c:out value="${TabMenuItem}" />&hlpCTX=<c:out value="${subRow.helpContext}"/>'><c:out value="${subRow.secondaryDisplayMenu}"/></a></b>
						 <td>
					 </tr>
				 </c:otherwise>
		</c:choose>
 		 
		 </c:forEach>
		 </table>
    </td>
    <td width="2%" bgcolor=white> </td>
    <td valign="top" bgcolor=white width="76%"><br>
    <c:forEach var="helpRow" items="${HelpDescription}">
    
	    <c:choose>
		    <c:when  test="${!empty helpRow}">
		        <c:choose>
						<c:when test='${helpRow.portletDesc == "Title"}'>
						 	<b><a href="<c:out value="${helpRow.url}"/>" target="_blank"><c:out value="${helpRow.portlet}"/></a></b><br> 
						 </c:when>
						 <c:otherwise>
							    <c:out value="${helpRow.portletDesc}"/><br>
						 </c:otherwise>
				</c:choose>
						<div id="errorResults">	<font color="red">	<%=erMsg%></font></div>	
					</c:when> 
				<c:otherwise><b></b>

				</c:otherwise>
						
		</c:choose>
	
	</c:forEach>
    
    </td>
  </tr>
  
 

</table>





</body>


</html>
