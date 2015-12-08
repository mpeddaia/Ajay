<!-- JSPNAME =BannerPopup.jsp -->

<%@ page pageEncoding="UTF-8" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/jstl-c" prefix="c" %>
<%@ taglib uri="/tags/jstl-fmt" prefix="fmt" %>

<fmt:bundle basename="ApplicationResource">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>popWindow</title>		
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
	
	</head>
	
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->
	<script language="javascript">
	
	function openPopupwindow(url){

		var pWindow = window.open(url);
	}
	
	</script>
	
	<!-- top banner -->

	<body marginheight="0" marginwidth="0" onload="javascript:self.focus();">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top" id="logo"><img src="<%= combinedImagesLocation %>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>
					<td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="<%= combinedImagesLocation %>resources/i/s.gif" alt="" height="8" width="100" border="0" /></td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="<%= combinedImagesLocation %>resources/i/s.gif" alt="" height="8" width="1" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key="Common.closeWindow" /></a></td>
									<td align="left" valign="top" width="100%" background="<%= combinedImagesLocation %>resources/i/grn_vertlines_top.gif"><img src="<%= combinedImagesLocation %>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- screen title -->
		<h1>&nbsp;</h1>
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
		<form id="FormName" action="#" method="get" name="FormName" class="inline">
		
		
		
			<div class="marque_banner">
			 <fmt:message key="banner.visits"/><b> <c:out value="${BannerDTO.attribute1}"/></b>
				<table  border="0" cellspacing="0" cellpadding="0" >
				
					<tbody>
						<tr>
							<td align="left" valign="top"><b><font size="2"><c:out value="${BannerDTO.summaryMessage}"/></font></b></td>
						</tr>
						<tr>	
							<td><c:out value="${BannerDTO.startDate}"/></td>							
						</tr>
					</tbody>
			  </table>			
			  <br>
			  <table  border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed; width:85%;word-wrap:break-word;overflow:auto;">
				
					<tbody>
						<tr>
							<td><c:out value="${BannerDTO.detailMessage}"/></td>							
						</tr>
					</tbody>
			  </table>			
			  <br>
			  
			   <table  border="0" cellspacing="0" cellpadding="0" >
			   <tr>
			   	<c:if test="${BannerDTO.linkURL1 != null ||BannerDTO.linkURL2 !=null||BannerDTO.linkURL3 !=null||BannerDTO.linkURL4 !=null ||BannerDTO.linkURL5 !=null}">
			   	<td><b>For Further Information:</b></td>
			   	</c:if>
			   </tr>
			   </table>
			 
			    <table  border="0" cellspacing="0" cellpadding="0" >
				<!--<colgroup>
				<col width="40" />
				<col width="90" />
				--></colgroup>
					<tbody>
						<tr>
							<td><a href="javascript:openPopupwindow('<c:out value="${BannerDTO.linkURL1}"/>');"><c:out value="${BannerDTO.linkName1}"/> </a><td>
						</tr>
						
						<tr>
							<td><a href="javascript:openPopupwindow('<c:out value="${BannerDTO.linkURL2}"/>');"><c:out value="${BannerDTO.linkName2}"/> </a><td>
						</tr>
						
						<tr>
							<td><a href="javascript:openPopupwindow('<c:out value="${BannerDTO.linkURL3}"/>');"><c:out value="${BannerDTO.linkName3}"/></a> <td>
						</tr>
						
						<tr>
							<td><a href="javascript:openPopupwindow('<c:out value="${BannerDTO.linkURL4}"/>');"><c:out value="${BannerDTO.linkName4}"/> </a><td>
						</tr>
						
						<tr>
							<td><a href="javascript:openPopupwindow('<c:out value="${BannerDTO.linkURL5}"/>');"><c:out value="${BannerDTO.linkName5}"/> </a><td>
						</tr>
						
					</tbody>
				</table>
	
				
			</div>
<br>
<div id ="vvvvcalDiv">
<table width="100%" >
<colgroup>
	<col width="20%" />
</colgroup>
	<tr >
		<td> &nbsp; </td>
		<td> <a href="javascript:openPopupwindow('https://www.cisco.com/web/services/ordering/cscc/index.html');">CSCC on Cisco.com</a></td>
		<td> <a href="javascript:openPopupwindow('https://www.cisco.com/web/services/resources/cscc/training/index.html');">CSCC Training</a> </td>
		<td> <a href="javascript:openPopupwindow('https://www.cisco.com/web/services/ordering/cscc/support.html');">CSCC Support </a></td>
		<td> &nbsp; </td>
	</tr>
	<tr>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
	</tr>
	<tr>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
		<td> &nbsp; </td>
		<td><input type="button" id="close" name="close" value="Close" onclick="javascipt:self.close();"/>&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>

</div>
		
<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->
<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->
<script language="javascript">
/** calendar */


</script>
<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->

</body>

</html>
</fmt:bundle>