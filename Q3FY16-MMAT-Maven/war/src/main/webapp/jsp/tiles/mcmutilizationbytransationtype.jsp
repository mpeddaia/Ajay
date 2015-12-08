<%@ page language="java"%>

<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="com.cisco.servicesales.session. MCMAccessManager" %> 
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


 <body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="">
    
  <div id="application_area">
	<!-- <div id="moduleContainerId"> -->

	<div id="mod_1" class="mod_header" style="width:99%">
	<img id="moduleIdExpand2" class="mh_expand" onClick="setImageState(this);return toggleElementDisplay(this.parentNode.id + 'block');" src="images/global/buttons_and_icons/icons/green/icn_twirldown_lg_o.gif" alt='Expand/Collapse' height="17" width="17" border="0" />
			<h2 class="mh_title" style="margin-left:15px;">
						Step 2: MCM Utilization Summary By Transaction Type
			</h2>	
	 </div>        
      

 <div id="mod_1block" class="marque" style="width:99%; margin-left: 11px;"> 

 	<span name="reportRes" id="reportRes">
	</span>

<form name=matReport action='mcmprocessreports.do'>
<input type=hidden name=event value="">

        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 bgcolor="#ffffff">
          <TBODY>
           <TR>
            <TD  class=content><span class=content>            
                   
						 <table width="100%" border="0" cellpadding="2" cellspacing="0">                                                            
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                              <td align="left"><label for="TEMPLATE">Request Date(s):
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="15" height="5">
                                  <input name="MAT_RPT_START_DATE" type="text" value="" size="10" readonly>
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                  <a href="javascript:changeDate('document.matReport.MAT_RPT_START_DATE')">
                                      <img height=16 alt="Select Start Date" src="https://www.cisco.com/swa/i/icon_calendar.gif" width=16 border=0></a>
								   <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                 <label for="TEMPLATE">to 
								 
								  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
								  <input name="MAT_RPT_END_DATE" type="text" value="" size="10" readonly>
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                     <a href="javascript:changeDate('document.matReport.MAT_RPT_END_DATE')">
                                      <img height=16 alt="Select End Date" src="https://www.cisco.com/swa/i/icon_calendar.gif" width=16 border=0></a>
								 
                                </td>
								
                            </tr>
							 <tr>
							 <input type="hidden" name="MAT_RPT_SUM_REQUEST_TYPE" value="">
                              <td align="left" ><label for="TEMPLATE">Request Type
							  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
							  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
							  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
							  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                  <select name="utilSummaryMoveRequestType">
										<option value="ALL" selected>ALL</option>
                                        
										<option value="MAT_MOVE_ALL" >MOVE SUMMARY (ALL TYPES)</option>
                                        <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">CONTRACT TO CONTRACT AND SITE TO SITE MOVE AT PRODUCT LEVEL</option>
                                        <option value="MAT_MOVE_C2C_S2S_AT_SITE">CONTRACT TO CONTRACT AND SITE TO SITE MOVE AT SITE LEVEL</option>
                                        <option value="MAT_MOVE_C2C_AT_CONTRACT">CONTRACT TO CONTRACT MOVE AT CONTRACT LEVEL</option>
                                        <option value="MAT_MOVE_C2C_AT_PRODUCT">CONTRACT TO CONTRACT MOVE AT PRODUCT LEVEL</option>
                                        <option value="MAT_MOVE_C2C_AT_SITE">CONTRACT TO CONTRACT MOVE AT SITE LEVEL</option>
                                        <option value="MAT_C2C_SVC_LVL_MOVE">CONTRACT TO CONTRACT MOVE AT SERVICE LEVEL</option>
                                        <option value="MAT_MOVE_S2S_AT_PRODUCT">SITE TO SITE MOVE AT PRODUCT LEVEL</option>
                                        <option value="MAT_MOVE_S2S_AT_SITE">SITE TO SITE MOVE AT SITE LEVEL</option>
                                        <option value="MAT_UE_MOVE_S2S_PRODUCT">MOVE UNCOVERED EQUIPMENT</option>
                                        <option value="MAT_CHG_SERVICE_LEVEL">CHANGE SERVICE LEVEL</option>										
                                        <option value="M_AND_P_ENTITLMNT_ADD_PRODUCTS">M AND P ENTITLMNT ADD PRODUCTS</option>
                                        <option value="MAT_DATE_CHANGE_PRODUCT_LINE">CONTRACT DATE CHANGE</option>
                                        <option value="MAT_BEST_SR_CR_SITES">SEARCH AND CREATE SHIP TO ID</option>
									    <option value="MAT_ADD" >ADD PRODUCTS TO SERVICE CONTRACTS</option>
										<option value="MAT_TERMINATE" >TERMINATE COVERAGE OF PRODUCTS FROM SERVICE CONTRACTS</option> 
										<option value="MAT_TERMINATE_CONTRACT" >CONTRACT TERMINATIONS</option>
										<option value="MAT_TERMINATE_SERVICE_LVL" >SERVICE LEVEL TERMINATION</option>
                                    <!-- Start changes by kunkisho for Q4FY14 -->
									    <option value="MAT_ADD_UPDATE_DEPLOYBASE"> ADD UPDATE DEPLOYBASE </option> 
									     <!-- End changes by kunkisho for Q4FY14 -->
                                    </select>
								   
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
		assignMcmSUM(3);
		assignRepType (4);
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