<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/jstl-c" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cisco.mcm.bean.McmOverridesBean"%>
<%@ page import="com.cisco.mcm.util.McmConstants"%>

<!-- As part of SSO Q1FY12 release calling the toggleindicator function for all the mandatory fields  on  on_blur event and on_focus event -->
<%
HashMap map=(HashMap)session.getAttribute("ROLES");
HashMap hm=(HashMap)session.getAttribute("OVERRIDES");
ArrayList aList=(ArrayList)session.getAttribute("OVERRIDESLIST");
%>
<%
if (map.containsKey(McmConstants.MASS_MAT_OVERRIDES)) {
////Start of Changes added for Q4FY13 DNR. on 26.3.2013 added request.getParameter("reqType").equals(McmConstants.MAT_DNR_PRODUCT_LVL) in if condition. by sphilipo
if(request.getParameter("reqType").equals(McmConstants.MAT_DNR_PRODUCT_LVL) || request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR) || request.getAttribute("userRole").equals(McmConstants.XXCSS_PORTABLE_SOLUTION)){
 //if user contains overside functions 
		if (((Boolean)session.getAttribute("showFlag")).booleanValue()&& null!=request.getParameter("reqType")) {
%>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border="0" bgcolor="#ffffff">
<input type="hidden" name="processRequestId" value='<%=request.getAttribute("processRequestId")%>' />
	<TBODY>
	<!-- Removed HR Tag as part of SSO Q2FY12 Release -->
		<c:if test="${transactFlag eq 'Y'}">
		<tr>
			<td width="5"></td>
			<TD colspan="2" class=contentbold>
				<table width="75%" border="0" cellspacing="0" cellpadding="2">
					<TR>
						<TD align="right">
							<input type="checkbox" id="transactLine" onClick="javascript:setTransact()" />
						</TD>
						<TD width="100%" colspan="2">
							Transact Specified Line Items Only
						</TD>
					</TR>
				</table>
			</TD>
		</tr>
		
        </c:if>
        <tr>
			<td width="100%" colspan="4">
				<hr color="#7f7f7f">
			</td>
		</tr>
		<TR>
			<td width="5"></td>
			<TD class=contentbold colspan="2">
				<font size="2" color="red"><bean:message key="MCM.MAIN.OVERRIDEVALIDATIONS" /></font> &nbsp;&nbsp;&nbsp;<font color="red"><bean:message key="MCM.MAIN.OVERRIDEVALIDATIONS.NOTE" /></font>
			</TD>
		</TR>

		<TR>
			<td width="5"></td>
			<TD colspan="2" class=contentbold>
				<table width="75%" border="0" cellspacing="0" cellpadding="2">
					<TR>
						<TD width=120 align="right" noWrap>
							<label for="Requestor">
								<bean:message key="MCM.MAIN.REQUESTOR.INIATOR" />
							</label>
						</TD>
						<TD class=content align="left"  noWrap>
							<input class=content maxlength=80 size=30 id="mat_vo_initiator" name="mat_vo_initiator" value="" onFocus="toggleIndicator_focus('lblrequestor')" onBlur="toggleIndicator_blur('lblrequestor','mat_vo_initiator');checkSpecialChars(this)">
							<img onclick="javascript:setParentElement('mat_vo_initiator');javascript:setField('mat_vo_initiator','I');javascript:showChild()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt='Picker' height="13" width="13" border="0" valign="top" />
							<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
							<label name="lblrequestor" id="lblrequestor" style='color:red;font-size:14pt'></label>

						</TD>

						<TD width=125 align="right" noWrap>
							<label for="approver">
								<bean:message key="MCM.MAIN.APPROVER.NAME" />
							</label>
						</TD>
						<TD class=content noWrap>
							<input class=content maxlength=80 size=30 name="mat_vo_approvername" id="mat_vo_approvername" value="" onFocus ="toggleIndicator_focus('lblapprover')" onBlur="toggleIndicator_blur('lblapprover','mat_vo_approvername');checkSpecialChars(this)">
							<img onclick="javascript:setParentElement('mat_vo_approvername');javascript:setField('mat_vo_approvername','E');javascript:showChild()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt='Picker' height="13" width="13" border="0" valign="top" />
							<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
							<label name="lblapprover" id="lblapprover" style='color:red;font-size:14pt'></label>
						</TD>
					<TR>

						<TD width=120 align="right" noWrap>
							<label for="RequestType">
								<bean:message key="MCM.MAIN.CUSTOMER.PARTNERNAME" />
							</label>
						</TD>
						<TD class=content noWrap>
							<input class=content maxlength=80 size=30 name="mat_vo_customername" id="mat_vo_customername" value="" onFocus="toggleIndicator_focus('lblcustomer')" onBlur="toggleIndicator_blur('lblcustomer','mat_vo_customername');checkSpecialChars(this)">
							<img onclick="javascript:setParentElement('mat_vo_customername');javascript:setField('mat_vo_customername','E');javascript:showCustomerSelectorChild()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt='Picker' height="13" width="13" border="0" valign="top" />
							<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
							<label name="lblcustomer" id="lblcustomer" style='color:red;font-size:14pt'></label>
						</TD>

						<TD align="right" noWrap>
							<label for="RequestType">
								<bean:message key="MCM.MAIN.REASON.CODE" />
							</label>
						</TD>
						<TD class=content noWrap>
							<select id="mat_vo_reasoncode" name="mat_vo_reasoncode" onFocus="toggleIndicator_focus('lblrcode')" onBlur="toggleIndicator_blur('lblrcode','mat_vo_reasoncode')">
								<option value="">
									Please Select
								<option value="Cap Case">
									CAP Case
								<option value="IBMP Engagement">
									IBMP Engagement
								<option value="Strategic Customer Contract Clean up">
									Strategic Customer Contract Clean up
							</select>
							<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
							<label name="lblrcode" id="lblrcode" style='color:red;font-size:14pt'></label>
						</TD>
					</TR>

					<tr>
						<TD width=120 align="right" valign="top" noWrap>
							<label for="overrides">
								<bean:message key="MCM.MAIN.OVERRIDES" />
							</label>
						</TD>
						<!-- <td colspan="2"> class="listBoxSm" -->
						<TD class=content align="left" width=240 noWrap>

							<div style="border: 1px solid #7f9db9; width: 100%;height: 100%" align="left">
								<table border="0" width="100%" cellspacing="0" cellpadding="0">
									<tr>

										<td align="left">
											<%
                                        String strTmp ="";
                                        for (int i=0;i<aList.size();i++){
                                        	McmOverridesBean mob=(McmOverridesBean)aList.get(i);
                                        	if(request.getAttribute("userRole").equals(McmConstants.XXCSS_PORTABLE_SOLUTION)){
                                        		strTmp="PS_VO_TYPE_"+((mob).getId()).toString();
                                        	}else{
                                       			strTmp="MAT_VO_TYPE_"+((mob).getId()).toString();
                                        	}//end if else
                                        	
                                       		if (strTmp.length() >=30){
                                       			strTmp=strTmp.substring(0,29);
                                       		}//end if
                                       // Added check to remove  Bill to Override check and SAM Check override for Link Standalone Minor Products Transaction and Remove the Currency Check and SAM Check Override for Move Configured Minor Products Transaction as part of SSO Q2FY12 Release
                                        if(((request.getParameter("reqType").equals("MAT_MOVE_C2C_AT_SITE"))||(request.getParameter("reqType").equals("MAT_MOVE_C2C_AT_PRODUCT"))||(request.getParameter("reqType").equals("MAT_MOVE_C2C_AT_CONTRACT"))) && (((mob).getId()).toString()).equals("ST_CON_SVCL_LVL_MATCH") ){
                                    %>
											<input type="checkbox" name="<%=strTmp%>" id="<%=strTmp%>" value="<%=((McmOverridesBean)aList.get(i)).getId()%>" <%=((McmOverridesBean)aList.get(i)).getEnableStr()%> onclick="javascript:toggleSAMChk(this);checkOverrideBiz(this)" />
											&nbsp;
											<%=((McmOverridesBean)aList.get(i)).getDescription()%>
											<input type=hidden name="McmHdnChkVals" value="<%=strTmp%>">
											<%} else {
											if ((request.getParameter("reqType").equals("SCM_AM_MOVE")) && ((((McmOverridesBean)aList.get(i)).getDescription().equals("Currency Check")) || (((McmOverridesBean)aList.get(i)).getDescription().equals("SAM Check"))))
											{
												continue;
											}
											
											
											if ((request.getParameter("reqType").equals("SCM_AM_LINK")) && ((((McmOverridesBean)aList.get(i)).getDescription().equals("Bill TO ID Check")) || (((McmOverridesBean)aList.get(i)).getDescription().equals("SAM Check"))))
											{
												continue;
											}
											
											%>
											<input type="checkbox" name="<%=strTmp%>" id="<%=strTmp%>" value="<%=((McmOverridesBean)aList.get(i)).getId()%>" <%=((McmOverridesBean)aList.get(i)).getEnableStr()%> onclick="checkOverrideBiz(this)"  />
											&nbsp;
											<%=((McmOverridesBean)aList.get(i)).getDescription()%>
											<input type=hidden name="McmHdnChkVals" value="<%=strTmp%>">
											<%}%>
											<br>
											<%}  %>
										</td>
									</tr>
								</table>
							</div>
						</TD>
						<TD align="right" noWrap>
							&nbsp;
						</TD>
						<TD class=content noWrap>
							&nbsp;
						</TD>
					</tr>
				</table>
			</TD>
		</TR>
		<tr height=7>
			<td></td>
		</tr>
</TABLE>
<%} 
else {//if (request.getParameter("transactFlag").equalsIgnoreCase("Y")) {
%>
<!-- Removed HR Tag as part of SSO Q2FY12 Release -->
<c:if test="${transactFlag eq 'Y'}">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border="0" bgcolor="#ffffff">

<input type="hidden" name="processRequestId" value='<%=request.getAttribute("processRequestId")%>' />
	<TBODY>
		<tr>
			<td width="5"></td>
			<TD colspan="2" class=contentbold>
				<table width="75%" border="0" cellspacing="0" cellpadding="2">
					<TR>
						<TD align="right">
							<input type="checkbox" id="transactLine" onClick="javascript:setTransact()" />
						</TD>
						<TD width="100%" colspan="2">
							Transact Specified Line Items Only
						</TD>
					</TR>
					<tr>
						<td width="100%" colspan="4">
							<hr color="#7f7f7f">
						</td>
					</tr>
				</table>
			</TD>
		</tr>
	</TBODY>
</TABLE>
</c:if>
<%}}}
else
{
%>
<TABLE cellSpacing=0 cellPadding=0 width='100%' border='0' bgcolor='#ffffff'>
	<TBODY>
		<tr>
			<td width='100%' colspan='4'>
				<hr color='#7f7f7f'>
			</td>
		</tr>
		<TR>
			<td width='5'></td>
			<TD class=contentbold colspan='2'>
				<font size='2' color='red'>You don't have permissions to override functions </font>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<%
}
%>
<input type="hidden" name="McmHdnAListSize" value="<%=(aList==null?"0":(""+aList.size() ) )%>">