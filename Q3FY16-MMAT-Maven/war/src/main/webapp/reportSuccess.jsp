
<%--*******************************************
	Date:
	Description: Reports response
************************************************--%>

<%@ page language="java"%>
<%@ page import="com.cisco.servicesales.session. MCMAccessManager" %> 
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 

<%
	String overRdsFlg="FALSE";
	MCMUserSession userSession=(MCMUserSession)session.getAttribute(MCMUserSession.USER_SESSION_KEY);
	 MCMAccessManager accessManager = userSession.getAccessManager();	
%>
	<table width="100%" style="border: 1px solid #7f7f7f; " bgcolor="#E9E9E9" >	
	  <tbody>
		<tr>	
		<td style="border-right: 1px solid #7f7f7f; height: 45px;" align="center">
		<input type="hidden" value="" />
		<input type="hidden" value="" />
		<img id="success" onClick="" src="images/global/buttons_and_icons/icons/grey/icn_warning_green.gif" alt="success" height="20" width="20" border="0"/>
		</td>
		<td>
		<label><b>
		Request ID <b><%=request.getAttribute("REQUESTID")%> </b> has been submitted. The report output will be emailed to <b><%=userSession.getEmail()%></b>. You can check the status of a request in Request Status page</b>

		</label>
		</td>
		</tr>
	  </tbody>
	</table>
  
	<%-- <!-- <table border="0" cellpadding="0" cellspacing="0" width="402" bgcolor="#003333">
        <tr>
            <td background="https://www.cisco.com/apps-ui/generic/1.0/images/message_vertlines.gif"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="52" height="7" alt=""></td>
            <td width="100%"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
            <td valign="top" align="right"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/corner_ur_5.gif" width="5" height="5" alt=""></td>
        </tr>
    </table> -->
	<!-- // end message box header -->    
    <!-- // top spacer -->
	 <!-- <table border="0" cellpadding="0" cellspacing="0" width="402" bgcolor="#ffffcc">
        <tr> 
            <td bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="6" height="1" alt=""></td>
            <td width="100%" colspan="3"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="7" alt=""></td>
            <td bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr> -->
    <!-- // end top spacer -->

    <!-- // one of these for every message -->
        <!-- <tr>
            <td bgcolor="#003333" rowspan="2"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="6" height="1" alt=""></td>
            <td><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="7" height="1" alt=""></td>
            <td width="100%"><span class="statusheader"><b>Report Status...</b></span>
                <span class="status">
                    <BR><BR>
                    
                     Your request has been submitted for processing-Request ID <b><%=request.getAttribute("REQUESTID")%>
        </b> will be emailed to <b><%=accessManager.getEmail()%></b> upon completion.
            
                    <BR><BR>
                </span>  
            </td>
            <td><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="7" height="1" alt=""></td>
            <td bgcolor="#003333" rowspan="2"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr>
        <tr>
            <td width="100%" colspan="3"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="7" alt=""></td>
        </tr> -->
    <!-- // end one of these -->

    <!-- // bottom -->
        <!-- <tr>
            <td bgcolor="#003333" valign="top" align="left" rowspan="2"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/corner_ll_6.gif" width="6" height="6" alt=""></td>
            <td width="100%" colspan="3"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="5" alt=""></td>
            <td bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr>
        <tr>
            <td width="100%" colspan="4" bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr> -->
    <!-- // end bottom -->
    <!-- </table> -->  --%> 
