<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ include file="../localeInfo.jsp" %>

<fmt:bundle basename="ApplicationResource">

<html>
<head>

<link rel="stylesheet" href="css/coomnJQuery.css" type="text/css">

<script type="text/javascript">
	
<%
String contextPath = request.getContextPath();
%>

</script>


</head>

<body>


	<script type="text/javascript" src="js/punchOut.js"></script>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	
	
	
<!-- ################################### Punch Out Bar Start ######################################## -->
<!-- ### This JSP was added as part of B2BPunchout during Q3FY13 release ### -->
 
		<div id="punchoutBar" style="border: 1px solid #CCCCCC; height: 40px; background-color: #FFFFCC; padding: 0px 10px;">
			<table width="100%">
				<tr>
					<td width="50%" valign="top"><img src="images/punchout_icon.png" alt="" width="22" height="22"><span style="font-weight: bold; font-size: 14px; color: #000000;">&nbsp;&nbsp;<fmt:message key="punchout.heading"/></span></td>
					<td width="50%" align="right" valign="middle">  
						<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
							<tr align="left">
								
									<td>&nbsp;</td>
									
									<!--Begin Q3FY13 - 2TNG Changes - B2B Punchout : Exit Session - nshakya -->
									<td style="padding: 0;">
										<a href="javascript:showPopoverByMasking('#exitSessionWarning');"><u><fmt:message key="punchout.link.exitsession"/></u></a>
									</td>
									
									<!--End Q3FY13 - 2TNG Changes - B2B Punchout : Exit Session - nshakya -->
									
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>	
	
	
	
<!--### Add all the popover divs below ###-->
<div id="boxes">

 <!--Begin Q3FY13 - 2TNG Changes - B2B Punchout: Exit Session - nshakya -->
	 <div id="exitSessionWarning" class="window" style="width: 350px; background-color: rgb(255, 255, 255); display: none; ">
		<div id="mod_2" class="table_mod_header" style="border-bottom:medium none;">
				<strong><font color="white">&nbsp;&nbsp;&nbsp;<fmt:message key="punchout.label.warning"/></font>
				</strong>
		</div>
		<div style="padding: 10px; padding-bottom: 5px;">
			<table>
				<tbody>
					<tr>
						<td valign="middle">
							<img src="images/icon_warn.gif" alt="">
							&nbsp;&nbsp;
						</td>
						<td style="white-space: normal; font-size: 13" valign="middle">
							<fmt:message key = "punchout.message.warning1"/>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="font-size: 13 ; white-space: normal"><br/>
							<fmt:message key = "punchout.message.warning2"/>
						</td>
					</tr>
				</tbody>
			</table>
			<br>

			<table style="padding:0px; padding-bottom: 2px;" cellspacing="0" cellpadding="0" border="0" class="primary_enabled">
				<tbody>
					<tr align="left">
						<td style = "padding-right: 0px;" onclick="$('#mask').hide();$('.window').hide();" class="button_left" style="padding:0px">
						</td>
						<td style = "padding-top: 0px; padding-right: 0px">
						<a class="button" href="#"><input type="button" onclick="$('#mask').hide();$('.window').hide();" value="<fmt:message key="punchout.button.cancel"/>" name="Next" class="button" id="next" >
						</a>
						</td>
						<td onclick="$('#mask').hide();$('.window').hide();" class="button_right" style="padding:0px">
						</td>
						<td>
							&nbsp;
						</td>
						<td style = "padding-right: 0px;" onclick="javascript:exitSession();" class="button_left">
						</td>
						<td style = "padding-top: 0px; padding-right: 0px">
							<input type="button" onclick="javascript:exitSession();" value="<fmt:message key="punchout.button.yes"/>" name="stdView" class="button" id="stdView" >
						</td>
						<td onclick="javascript:exitSession();" class="button_right">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<!--End Q3FY13 - 2TNG Changes - B2B Punchout: Exit Session - nshakya -->

</div>

<div id="mask" style="display:none"></div>	
			
</body>


</html>
</fmt:bundle>