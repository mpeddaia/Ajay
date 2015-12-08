<!-- JSPNAME =BannerPopup.jsp -->

<%@ page pageEncoding="UTF-8" language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-logic" prefix="logic" %>
<%@ taglib uri="/tags/jstl-c" prefix="c" %>
<%@ taglib uri="/tags/jstl-fmt" prefix="fmt" %>
<%@ page import="java.util.ArrayList" %>

<fmt:bundle basename="ApplicationResources">

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
		
		<script>
	function Close(){
		 self.close();
		
	}
</script>
	
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
									<td valign="top" nowrap="nowrap" width="100"><!-- vtiruvee Q1FY13 commented close window -->  &nbsp; 
									<!-- <a class="cisco" href="javascript:self.close();"><fmt:message key="Help.closeWindow" /></a> --> </td>
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
		<h1 style="width:975px">
					<fmt:message key='Help.CSCC'/>
				</h1> 
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
		
		
		
			<div class="marque">
			
				<table width="80%" height="20%" cellspacing="0" cellpadding="0" >
				
					<tbody>
					<tr>
					<TD>   
							<tr align="LEFT" valign="top">
							<div class="sub_block" >
							<h3><%= request.getAttribute("heading") %></h3>
							
							</div>
							</font></tr>							
							
							<tr align="LEFT" >
							<div  style="overflow:auto; width=420; height=280">
							<%
                ArrayList al=(ArrayList)request.getAttribute("helpList");
                if(al!=null && al.size() >0){
                      for(int i=0;i<al.size();i++){
                      String s=(String)al.get(i); 
                      out.println(s);%> <br>
                      <%}
                } %></div>
							</tr>
							</TD>
						</tr>
						
						<tr align="LEFT">
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td >
						<!-- button component -->
						<!-- vtiruvee Q1FY13 changed the close button style to standard green-->
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('closeMe2').click();"></td>
						
						<td><input id="closeMe2" class="button" type="reset" name="closeMe2" value='<fmt:message key="addline.button.close"/>' onClick="javascript:Close();"/></td>
						<td class="button_right" onclick="document.getElementById('closeMe2').click();"></td>
					</tr>
				</table>	
						</td>
						</tr>
						
						
					</tbody>
			  </table>			
			  <br>

</div>

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