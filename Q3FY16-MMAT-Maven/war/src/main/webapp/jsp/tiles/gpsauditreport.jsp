<%@ page language="java"%>

<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="com.cisco.servicesales.session.MCMAccessManager" %> 
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 
<%@ page import="com.cisco.mcm.util.McmConstants" %> 
<%@ page import="com.cisco.servicesales.util.Constants" %> 
<%@ page import="com.cisco.mcm.bean.McmOverridesBean" %>
<%/*
String overRdsFlg="FALSE";
MCMUserSession userSession=(MCMUserSession)session.getAttribute(MCMUserSession.USER_SESSION_KEY);
 MCMAccessManager accessManager = userSession.getAccessManager();
 final Map accessPrivileges = accessManager.getAccessPrivileges();
 if ((accessPrivileges.containsKey(McmConstants.MCM_OVERRIDE_VALIDATIONS)) && (((Boolean)accessPrivileges.get("MAT_OVERRIDE_VALIDATIONS")).booleanValue()))
 {
 overRdsFlg="TRUE";
 }
 
 String endDate=(session.getAttribute("ENDDATE")).toString();
*/
%>



<!-- Start of SCC and SCM Menu sections. -->
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />

<script language="javaScript" src="<%=request.getContextPath()%>/js/newCalendar.js">
</script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/main_lib.js" type="text/javascript">
</script>
<script language="javaScript" src="<%=request.getContextPath()%>/js/reports.js">
</script>
</script>
<script type="text/javascript" language="javascript">
	
</script>

 <body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="">
    
  <div id="application_area">
	<!-- <div id="moduleContainerId"> -->

	<div id="mod_1" class="mod_header" style="width:99%">
	<img id="moduleIdExpand2" class="mh_expand" onClick="setImageState(this);return toggleElementDisplay(this.parentNode.id + 'block');" src="images/global/buttons_and_icons/icons/green/icn_twirldown_lg_o.gif" alt='Expand/Collapse' height="17" width="17" border="0" />
			<h2 class="mh_title" style="margin-left:15px;">
						Step 2: GPS Audit Report
			</h2>	
	 </div>        
      

 <div id="mod_1block" class="marque" style="width:99%; margin-left: 11px;"> 

 <!-- For Ajax response -->
	<span name="reportRes" id="reportRes">
	</span>

<form name=matReport action='mcmprocessreports.do'>
<input type=hidden name=event value="">

        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 bgcolor="#ffffff">
          <TBODY>
           <TR>
            <TD class=content><span class=content>            
                   
						 <table width="85%" border="0" cellpadding="2" cellspacing="0">
                                                  
                                                          
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                              <td><label for="TEMPLATE">Request Date(s):
                                  <img src="http://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="15" height="5">
                                  <input name="MAT_RPT_START_DATE" type="text" value="" size="10" readonly>
                                  <img src="http://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                  <a href="javascript:changeDate('document.matReport.MAT_RPT_START_DATE')">
                                      <img height=16 alt="Select Start Date" src="http://www.cisco.com/swa/i/icon_calendar.gif" width=16 border=0></a>
								   <img src="http://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                 <label for="TEMPLATE">to 
								 
								  <img src="http://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
								  <input name="MAT_RPT_END_DATE" type="text" value="" size="10" readonly>
                                  <img src="http://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                     <a href="javascript:changeDate('document.matReport.MAT_RPT_END_DATE')">
                                      <img height=16 alt="Select End Date" src="http://www.cisco.com/swa/i/icon_calendar.gif" width=16 border=0></a>
                                </td>
                            </tr>
                           
                            
                            
                           <!--  <tr>
                              <td colspan="2"><input type="button" name="reportSubmit" value="Run Report" onclick="javascript:validateForm()"></td>
                            </tr> -->
                            
                          </table>
					</td>
                  
                </tr>
                </tbody>
              </table>
		</div>
		<script>
		assignRepType(1);
		</script>
		
 		<div id="to_align" style="width:99%">
						<div id="button_1" class="button_block"  >
						
						<!-- button component -->
							<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="button_left" onClick="document.getElementById('reportSubmit').click();"></td>
									<td><input id="reportSubmit" class="button" type="button" name="reportSubmit" value="Run Report" onClick="javascript:setContextPath('<%=request.getContextPath()%>');javascript:validateForm()" /></td>
									<td class="button_right" onClick="document.getElementById('reportSubmit').click();"></td>
								</tr>
							</table>
							
							<!-- button component -->
							<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="button_left" onClick="document.getElementById('clear').click();"></td>
									<td><input id="clear" class="button" type="reset" name="clear" value="Clear" /></td>
									<td class="button_right" onClick="document.getElementById('clear').click();"></td>
								</tr>
							</table>
						
						</div>

					</div>
		</FORM>
	  </div>
	  </div>
	  </body>
	  </html>