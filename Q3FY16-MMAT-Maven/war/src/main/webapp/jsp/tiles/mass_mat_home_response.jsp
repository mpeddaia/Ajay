
<%@ page language="java"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 

<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="com.cisco.mcm.bean.McmOverridesBean" %> 
<%@ page import="com.cisco.mcm.util.McmConstants" %> 
<input type="hidden" name="processRequestId" value='<%=request.getAttribute("processRequestId")%>' />

<%
 HashMap map=(HashMap)session.getAttribute("ROLES");
// HashMap hm=(HashMap)session.getAttribute("OVERRIDES"); --removing as part of static analysis for C3t Q3FY12 by vibk
ArrayList aList=(ArrayList)session.getAttribute("OVERRIDESLIST");


%>
<input type="hidden" name="McmHdnAListSize" value="<%=(aList==null?"0":(""+aList.size() ) )%>" >
<%
 if (map.containsKey(McmConstants.MASS_MAT_OVERRIDES))
 {
if(request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR)){
 //if user contains overside functions 
%>

<% 
					
						if (((Boolean)session.getAttribute("showFlag")).booleanValue()&& null!=request.getParameter("reqType")){

						
						
						%> 
						
						 <TABLE cellSpacing=0 cellPadding=0 width="100%" border="0" bgcolor="#ffffff">
		                    <TBODY>
                            <tr>
							<td width="100%" colspan="4">
								<hr color="#7f7f7f">	
							</td>
						</tr>                    
                          <TR>
						    <td width="5"></td>
                            <TD class=contentbold colspan="2" >
							<font size="2" color="red"><bean:message  key="MCM.MAIN.OVERRIDEVALIDATIONS"/></font>
                            &nbsp;&nbsp;&nbsp;<font color="red"><bean:message key="MCM.MAIN.OVERRIDEVALIDATIONS.NOTE" /></font></TD>
                         </TR> 
                  
                        <TR>
						<td width="5"></td>
						<TD colspan="2" class=contentbold>
						   <table width="75%" border="0" cellspacing="0" cellpadding="2">
						   <TR> 
                            <TD width =120 align ="right" noWrap>
                               <label for="Requestor"><bean:message key="MCM.MAIN.REQUESTOR.INIATOR"/></label>
                            </TD>
                            <TD class=content align="left" width=240 noWrap> <input class=content maxlength=80 size=30 id="mat_vo_initiator" name="mat_vo_initiator" value="" onBlur="checkSpecialChars(this)">                      
								<img onclick="javascript:setParentElement('mat_vo_initiator');javascript:setField('mat_vo_initiator','I');javascript:showChild()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt='Picker' height="13" width="13" border="0" valign="top"/>
								<span id ="selectedCustomers" STYLE="color:red; font-size:14pt"></span>
							  
                            </TD>    
                  			
                            <TD width= 125 align ="right" noWrap >
                                <label for="approver"><bean:message key="MCM.MAIN.APPROVER.NAME"/></label>
                            </TD>
                            <TD class=content noWrap> <input class=content maxlength=80 size=30 name="mat_vo_approvername" id="mat_vo_approvername" value="" onBlur="checkSpecialChars(this)"> 
                            <img onclick="javascript:setParentElement('mat_vo_approvername');javascript:setField('mat_vo_approvername','E');javascript:showChild()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt='Picker' height="13" width="13" border="0" valign="top"/>
							<span id ="selectedCustomers" STYLE="color:red; font-size:14pt"></span>
                            </TD>  
                   
                    <TR>
				
                        <TD  width =120 align="right" noWrap>
						<label for="RequestType"><bean:message key="MCM.MAIN.CUSTOMER.PARTNERNAME"/></label>
                        </TD>
                        <TD width=240 class=content noWrap> <input class=content maxlength=80 size=30 name="mat_vo_customername" id="mat_vo_customername" value="" onBlur="checkSpecialChars(this)"> 
                        <img onclick="javascript:setParentElement('mat_vo_customername');javascript:setField('mat_vo_customername','E');javascript:showCustomerSelectorChild()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt='Picker' height="13" width="13" border="0" valign="top"/> 
						<span id ="selectedCustomers" STYLE="color:red; font-size:14pt"></span>
                        </TD>
                  
                        <TD  align="right" noWrap>
						<label for="RequestType"><bean:message key="MCM.MAIN.REASON.CODE"/></label>
                        </TD>
                        <TD  class=content noWrap>
                            <select id="mat_vo_reasoncode" name="mat_vo_reasoncode">
                                <option value="">Please Select
                                <option value="Cap Case">CAP Case
                                <option value="IBMP Engagement">IBMP Engagement
                                <option value="Strategic Customer Contract Clean up">Strategic Customer Contract Clean up
                            </select>
                        </TD>						
                      </TR>
					
					<tr>
							
                            <TD width =120 align ="right" valign="top" noWrap>
                               <label for="overrides"> <bean:message key="MCM.MAIN.OVERRIDES"/></label>
                            </TD>
                            <!-- <td colspan="2"> class="listBoxSm" -->
							<TD class=content align="left" width=240 noWrap>
														
							<div style="border: 1px solid #7f9db9; width: 185px;height: 70px" align="left">
                                <table border="0" width="100%" cellspacing="0" cellpadding="0">
                                    <tr>
									
                                        <td align="left">
                                        <%
                                        for (int i=0;i<aList.size();i++){
                                        McmOverridesBean mob=(McmOverridesBean)aList.get(i);
                                       String strTmp="MAT_VO_TYPE_"+((mob).getId()).toString();
                                       if (strTmp.length() >=30){
                                       strTmp=strTmp.substring(0,29);}
                                     
                                       
                                       if(((request.getParameter("reqType").equals("MAT_MOVE_C2C_AT_SITE"))||(request.getParameter("reqType").equals("MAT_MOVE_C2C_AT_PRODUCT"))||(request.getParameter("reqType").equals("MAT_MOVE_C2C_AT_CONTRACT"))) && (((mob).getId()).toString()).equals("ST_CON_SVCL_LVL_MATCH") ){
                                        %>
                                         <input type="checkbox"  name="<%=strTmp%>" value="<%=((McmOverridesBean)aList.get(i)).getId()%>" <%=((McmOverridesBean)aList.get(i)).getEnableStr()%>  onclick="javascript:toggleSAMChk(this)"/>&nbsp;<%=((McmOverridesBean)aList.get(i)).getDescription()%>
                                         <input type=hidden name="McmHdnChkVals" value="<%=strTmp%>">
                                        <%} else {%>
                                        <input type="checkbox"  name="<%=strTmp%>" value="<%=((McmOverridesBean)aList.get(i)).getId()%>" <%=((McmOverridesBean)aList.get(i)).getEnableStr()%>/>&nbsp;<%=((McmOverridesBean)aList.get(i)).getDescription()%>
                                        <input type=hidden name="McmHdnChkVals" value="<%=strTmp%>">
                                        <%}%>
                                       
										<br><%}  %>
                                        
                                        </td>
                                     </tr>
 
                                </table>
								</div>
								</td>
                            <TD  align="right" noWrap>
								&nbsp;
								</TD>
								<TD  class=content noWrap>
									&nbsp; 
								</TD>
							</TR>
						</table>
						</td>
						</TR>
						  <tr height=7><td></td></tr>
					</TABLE>
				<%} %>	
				
				
<%
}}
else
{
%>
<TABLE cellSpacing=0 cellPadding=0 width='100%' border='0' bgcolor='#ffffff'>
		                    <TBODY><tr>	<td width='100%' colspan='4'>
								<hr color='#7f7f7f'> </td> </tr>       
							 <TR> <td width='5'></td> <TD class=contentbold colspan='2' > 
							 <font size='2' color='red'>You don't have permissions to override functions 
								 </font>  </TD> </TR> </TBODY> </TABLE>
<%
}
%>

