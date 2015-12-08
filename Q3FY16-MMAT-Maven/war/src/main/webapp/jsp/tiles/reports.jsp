<%@ page language="java"%>

<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="com.cisco.servicesales.session. MCMAccessManager" %> 
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 
<%@ page import="com.cisco.mcm.util.McmConstants" %> 
<%@ page import="com.cisco.servicesales.util.Constants" %> 
<%@ page import="com.cisco.mcm.bean.McmOverridesBean" %>
<%
String overRdsFlg="FALSE";
MCMUserSession userSession=(MCMUserSession)session.getAttribute(MCMUserSession.USER_SESSION_KEY);
  MCMAccessManager accessManager = userSession.getAccessManager();
 final Map accessPrivileges = accessManager.getAccessPrivileges();
 if ((accessPrivileges.containsKey(McmConstants.MCM_OVERRIDE_VALIDATIONS)) && (((Boolean)accessPrivileges.get("MAT_OVERRIDE_VALIDATIONS")).booleanValue()))
 {
 overRdsFlg="TRUE";
 }
 
 String endDate=(session.getAttribute("ENDDATE")).toString();

%>



<!-- Start of SCC and SCM Menu sections. -->


<!--   <script language="javaScript" src="/CustAdv/ServiceSales/mcm/js/newCalendar.js">   -->

  <script language="javaScript" src="/YS2MCM/js/newCalendar.js">  
 </script>
<script language='javascript'>
    NS4 = (document.layers) ? true : false;

    ie4 = (document.all)? true:false

    function show(id) {
        if (NS4) document.layers[id].visibility = "show"
        else if (ie4) document.all[id].style.visibility = "visible"
        else document.getElementById(id).style.display = "";
    }

    function hide(id) {
        if (NS4) document.layers[id].visibility = "hide"
        else if (ie4) document.all[id].style.visibility = "hidden"
        else document.getElementById(id).style.display = "none";
    }

    function assignDate(dateObject, contextStr) {

		//alert(contextStr);
        var thefield = eval( "document.matReport."+contextStr );
        //alert(dateObect);
        thefield.value = dateObect;//formatDate( dateObject );
    }
    function stat()
    {
    window.status=document.matReport.VAL_ALL.value;
    }
    

    
    function dateCompare(fromDateStr, toDateStr)
    {
        var lt=false;
        //     if (isDateOK (fromDateStr) && isDateOK(toDateStr)) {
        var temArr = fromDateStr.split("/");
        var month1 = parseInt (temArr[0],10);
        var day1 = parseInt (temArr[1],10);
        var year1 = parseInt (temArr[2],10);
        temArr = toDateStr.split("/");
        var month2 = parseInt (temArr[0],10);
        var day2 = parseInt (temArr[1],10);
        var year2 = parseInt (temArr[2],10);
        if (year1 == year2 && month1 == month2 && day1 == day2)
            return true;
        if (year1 != year2) {
            lt = (year1 <= year2);
        }
        if (!lt && month1 != month2) {
            lt = (month1 <= month2);
        }
        if (!lt && day1 != day2) {
            lt = (day1 <= day2);
        }
        if (!lt) {
         
            return false; 
        }
        else 
            return true;
  //  }
    
    }
    
    
    function IsNumeric(sText)
	{
   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   return IsNumber;
   
   }
    

var repType = -1;  // -1 indicates "no report type"
var mcmUBU =  -1; // for MCMUBU REPORT
var mcmRCR =  -1; // for MCMRCR REPORT
var mcmSUM =  -1; // for MCMSUM REPORT
var mcmFBT =  -1; // for MCMFBT REPORT
var mcmPTR =  -1; // for MCMPTR REPORT
var mcmRCRRID = -1;
var mcmVAOR = -1;

function assignMcmVAOR(value)
{
mcmVAOR = value;
}
function assignMcmPTR (value)
{ mcmPTR = value;
}
function assignRepType (value)
{ repType = value;
}
function assignMcmUBU (val)
{ mcmUBU = val;
}

function assignMcmRCR (value)
{ mcmRCR = value;
}
function assignMcmSUM(value)
{
mcmSUM = value;
}
function assignMcmRCRRID(value)
{
mcmRCRRID=value;
}
function assignMcmFBT(value)
{
mcmFBT = value;
}
    function validateForm() {
   // alert(repType);
    var stDate=document.matReport.MAT_RPT_START_DATE.value;
    var endDate=document.matReport.MAT_RPT_END_DATE.value
//    alert(mcmPTR);
    
   // 	if (mcmVAOR==1)
    //	{
    //	document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value=document.matReport.processingMoveRequestTypeVAOR.value;
    //	}
    	
    
	//    if(mcmPTR==1)
	 //   {
	 //   document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=document.matReport.processingMoveRequestType.value;
	//    }
    
	//    if (mcmSUM==1)
	//    {
	//  	  document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=document.matReport.utilSummaryMoveRequestType.value;
	//    }
	   
	//    if (mcmFBT==1)
	//    {
	//  	  document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value=document.matReport.failureMoveRequestType.value;
	//    }
    	//window.status=document.matReport.MAT_REPORT_TYPE.value;
    	
    	if(repType != 2)
    	
    	{
    	
	    	if ("" == stDate)
	    	{
	    		alert("Enter the start date");
	    		return false;
	    	}
	    	
	    	if ("" == endDate)
	    	{
	    		alert("Enter the end date");
	    		return false;
	    	}
    	}
    	
    	
	//	if(!(dateCompare(stDate,endDate)))
	//	{
	//	   alert ("Start date is not prior to the end date!");
	//	   return false;
	//	}
		
    	if (repType == -1)
    	{
    		alert("Select report type");
    		return false;
    	}
    	
    	
    	if(repType== 3 && mcmUBU== -1)
    	{
    		document.matReport.MAT_RPT_UBU_CCO_USER_ID.value="ALL";
    	}
    	if(repType== 3 && mcmUBU== 2)
    	{
	    	 if(""==document.matReport.MAT_RPT_UBU_CCO_USER_ID.value){
	    	 	alert("Enter CCO USER ID FOR Utilization By User Report");
	    	 	return false;
	    	 }
	    	
    	 }


    	if(repType == 4 && mcmSUM == 1)
    	{
	    	var vPTR="MAT_ADD";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value);
    	}
    	
    	if(repType == 4 && mcmSUM == 2)
    	{
	    	var vPTR="MAT_TERMINATE";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value);
    	}
    	
    	if(repType == 4 && mcmSUM == 3)
    	{
	    	var vPTR=document.matReport.utilSummaryMoveRequestType.value;
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value);
    	}
    	
    	if(repType == 4 && mcmSUM == 4)
    	{
	    	var vPTR="MAT_SITES_ALL";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value);
    	}

    	if(repType == 4 && mcmSUM == -1)
    	{
	    	var vPTR="ALL";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value);
    	}

    	if(repType == 5 && mcmFBT == -1)
    	{
	    	var vPTR="MAT_ADD";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
    	}



    	if(repType == 5 && mcmFBT == 2)
    	{
	    	var vPTR="MAT_TERMINATE";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
    	}
    	
    	
    	if(repType == 5 && mcmFBT == 3)
    	{
	    	var vPTR=document.matReport.failureMoveRequestType.value;
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
    	}

    	if(repType == 5 && mcmFBT == 4)
    	{
	    	var vPTR="MAT_SITES_ALL";
	    //	alert(vPTR);
	    	document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
    	}
    	
    	
    	if(repType == 6 && mcmPTR == 1)
    	{
	    	var vPTR="MAT_ADD";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=vPTR;
	    //	alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
    	}
    	if(repType == 6 && mcmPTR == 2)
    	{
	    	var vPTR="MAT_TERMINATE";
	    //	alert(vPTR);
	    	document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=vPTR;
	    //	alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
    	}
    	if(repType == 6 && mcmPTR == 3)
    	{
	    	var vPTR=document.matReport.processingMoveRequestType.value;
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
    	}
    	if(repType == 6 && mcmPTR == 4)
    	{
	    	var vPTR="MAT_SITES_ALL";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
    	}
    	if(repType == 6 && mcmPTR == -1)
    	{
	    	var vPTR="ALL";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
    	}
    	 
    	 if(repType == 7 && mcmRCR == -1)
    	{
    	document.matReport.MAT_RPT_RCR_CCO_USER_ID.value="ALL";
    	}
    	if(repType == 7 && mcmRCR == 2)
    	{
	    	 if(""==document.matReport.MAT_RPT_RCR_CCO_USER_ID.value){
	    	 	alert("Enter CCO USER ID FOR Reason Code Report");
	    	 	return false;
	    	 }
	    	
    	 }
    	 
    	if(repType == 7 && mcmRCRRID == -1)
    	{
    	document.matReport.MAT_RPT_TRN_REQUEST_ID.value="ALL";
    	}
    	if(repType == 7 && mcmRCRRID == 2)
    	{
	    	 if("" == document.matReport.MAT_RPT_TRN_REQUEST_ID.value){
	    	 	alert("Enter Request Id FOR Reason Code Report");
	    	 	return false;
	    	 }
	    	  if (!(IsNumeric(document.matReport.MAT_RPT_TRN_REQUEST_ID.value)))
	    	 {
	    	 alert("Enter numeric value for request id")
	    	 return false;
	    	 }
    	 }
    	 
    /*	 if(repType == 8 && mcmVAOR == 1)
    	{
	    	var vPTR="MAT_ADD";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value);
    	}
    	 
    	  if(repType == 8 && mcmVAOR == 2)
    	{
	    	var vPTR=document.matReport.voauditreport.value;
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value);
    	}
    	*/ 
    	  if(repType == 8 && mcmVAOR == -1)
    	{
	    	var vPTR="ALL";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value);
    	}
    	
    
    	
        document.matReport.event.value = "reportSubmit";
        document.matReport.submit();
        return true;
    }
    function checkEnter(event)
    {
        var code = 0;

        if (NS4)
            code = event.which;
        else
            code = event.keyCode;

        if (code==13)
            return true;

        return false;
    }

    var vMandatoryFields = ["FuncType", "Number"]
    var vMandatoryFieldLabels = ["Query Criteria", "Number"]

    function goToMultipage(page)
    {
       self.location = page
    }

    function doCommonValidations(formObject)
    {
       for (i=0; i < formObject.length; i++)
       {
          vElement = formObject.elements[i];

          vThisIsMandatory = false;
          for (j=0; j < vMandatoryFields.length; j++)
          {
             if (vElement.name == vMandatoryFields[j])
             {
                vThisIsMandatory = true;
                break;
             }
          }

          if (vThisIsMandatory == true)
          {
             if (vElement.type == "text")
                vValue = vElement.value
             else if (vElement.type == "select-one")
             {
                vValue = vElement.options[vElement.selectedIndex].value
             }
             else
                vValue = vElement.value

             if ((vValue == null ) || (vValue == ""))
             {
                alert (vMandatoryFieldLabels[j] + " must be entered.");
                return false;
             }
          }
       }
       return true;
    }

</SCRIPT>

        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
          <TR>
            <TD align=right colSpan=2><IMG height=10
            src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
          </TR>
          <TR>
                <TD class=contenttitlealt vAlign=top align=left>Mass Contract Management Report Request</TD>
          </TR>
          <TR>
            <TD align=right colSpan=2><IMG height=10 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
          </TR>
          </TBODY>
        </TABLE>

        <% if(null!= request.getAttribute("REQUESTID")){%>
        
        
         <!-- // begin message/status box -->
    <!-- // message box header -->
    <table border="0" cellpadding="0" cellspacing="0" width="402" bgcolor="#003333">
        <tr>
            <td background="https://www.cisco.com/apps-ui/generic/1.0/images/message_vertlines.gif"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="52" height="7" alt=""></td>
            <td width="100%"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
            <td valign="top" align="right"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/corner_ur_5.gif" width="5" height="5" alt=""></td>
        </tr>
    </table>
    <!-- // end message box header -->
    <table border="0" cellpadding="0" cellspacing="0" width="402" bgcolor="#ffffcc">
    <!-- // top spacer -->
        <tr>
            <td bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="6" height="1" alt=""></td>
            <td width="100%" colspan="3"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="7" alt=""></td>
            <td bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr>
    <!-- // end top spacer -->


    <!-- // one of these for every message -->
        <tr>
            <td bgcolor="#003333" rowspan="2"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="6" height="1" alt=""></td>
            <td><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="7" height="1" alt=""></td>
            <td width="100%"><span class="statusheader">Report Status...</span>
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
        </tr>
    <!-- // end one of these -->


    <!-- // bottom -->
        <tr>
            <td bgcolor="#003333" valign="top" align="left" rowspan="2"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/corner_ll_6.gif" width="6" height="6" alt=""></td>
            <td width="100%" colspan="3"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="5" alt=""></td>
            <td bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr>
        <tr>
            <td width="100%" colspan="4" bgcolor="#003333"><img src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1" height="1" alt=""></td>
        </tr>
    <!-- // end bottom -->
    </table>
    <!-- // end message/status box -->
<%}%>


<form name=matReport action='mcmprocessreports.do'>
<input type=hidden name=event value="">

        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
          <TBODY>
          <TR>
            <TD class=content><span class=content>
              <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#ffffff border=0>
                <tbody>
                <tr>
                  <td valign=bottom width=6><img height=1 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=6></td>
                  <td>
                    <table width="100%" border="0" cellpadding="2" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                              <td bgcolor="#FFFFFF" class="contentbold">Select date range for all reports below:</td>
                            </tr>
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                              <td bgcolor="#FFFFFF" class="contentbold"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
                              <td><span class="contentbold">Date Range:</span>
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="15" height="5">
                                  <input name="MAT_RPT_START_DATE" type="text" value="" size="10" readonly>
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                  <a href="javascript:changeDate('document.matReport.MAT_RPT_START_DATE')">
                                      <img height=16 alt="Select Start Date" src="https://www.cisco.com/swa/i/icon_calendar.gif" width=16 border=0>
                                  </a>
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="15" height="5">
                                  <input name="MAT_RPT_END_DATE" type="text" value="<%=endDate%>" size="10" readonly>
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                                     <a href="javascript:changeDate('document.matReport.MAT_RPT_END_DATE')">
                                      <img height=16 alt="Select End Date" src="https://www.cisco.com/swa/i/icon_calendar.gif" width=16 border=0>
                                  </a>
                                </td>
                            </tr>
                            <tr>
                            <td class="modulesubhead">
                            Note: Data for reports run for a date range greater than 6 months might not be available. 
                            
                            </td>
                            </tr>
                    </table>
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td bgcolor="#000000"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                      </tr>
                    </table>
                    <table width="85%" border="0" cellpadding="2" cellspacing="0">
                            <tr bgcolor="#CCCCCC">
                              <td colspan="2" bgcolor="#FFFFFF" class="contentbold">Select a report to run using radio buttons to the left below. Parameters for a given report are indented under that report name.</td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td colspan="2" bgcolor="#FFFFFF"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_GPS_AUDIT" onclick="assignRepType(1)">
                              </span></td>
                              <td nowrap class="contentbold">GPS Audit Report&nbsp;&nbsp;&nbsp;<span class="modulesubhead"></span></td>
                            </tr>
                            <tr>
                              <td colspan="2"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <!--tr  Not in Use JOhn 02/22/06 >
                              <td width="3%"><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_CURRENT_USER_LIST" onclick="assignRepType(2)">
                              </span></td>
                              <td width="97%" nowrap><span class="contentbold">Current MCM User List&nbsp;&nbsp;&nbsp;<span class="modulesubhead">Note: Ignores date range</span></span></td>
                            </tr>
                            <tr>
                              <td colspan="2"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr-->
                            <tr>
                              <td><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_UTILIZATION_BY_USER" onclick="assignRepType(3)">
                              </span></td>
                              <td nowrap class="contentbold">MCM Utilization By User</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="contentbold">
                                <input name="VAL_ALL" type="radio" value="ALL" checked onclick="assignMcmUBU(-1)">
                                        ALL&nbsp;&nbsp;&nbsp;or &nbsp;
                                <input name="VAL_ALL" type="radio" onclick="assignMcmUBU(2)">
                                        CCO User ID:
                                <input name="MAT_RPT_UBU_CCO_USER_ID" type="text" size="12">
                              </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>Request Type
                                  <select name="MAT_RPT_UBU_REQUEST_TYPE">
                                    <option value="ALL" selected>ALL</option>
                                    <option value="MAT_MOVE_ALL">Move Summary (All Types)</option>
                                    <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">Contract to Contract and Site to Site Move at Product Level</option>
                                    <option value="MAT_MOVE_C2C_S2S_AT_SITE">Contract to Contract and Site to Site Move at Site Level</option>
                                    <option value="MAT_MOVE_C2C_AT_CONTRACT">Contract to Contract Move at Contract Level</option>
                                    <option value="MAT_MOVE_C2C_AT_PRODUCT">Contract to Contract Move at Product Level</option>
                                    <option value="MAT_MOVE_C2C_AT_SITE">Contract to Contract Move at Site Level</option>
                                    <option value="MAT_MOVE_S2S_AT_PRODUCT">Site to Site Move at Product Level</option>
                                    <option value="MAT_MOVE_S2S_AT_SITE">Site to Site Move at Site Level</option>
                                    <option value="MAT_TERMINATE">Terminate Coverage of Products from Service Contracts</option>
                                    <option value="MAT_ADD">Add Products to Service Contracts</option>
                                    <option value="MAT_SITES_ALL">Search & Create Ship To Address/Site ID</option>
                                    <option value="MAT_UNCOVERED_EQUIPMENT">Move Uncovered Equipment</option>
                                   </select>
                                </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>Request Status
							<select name="MAT_RPT_UBU_STATUS">
								<option value="ALL" selected>ALL</option>
								<option value="COMPLETED">COMPLETED</option>
								<option value="PARTIAL SUCCESS">PARTIAL SUCCESS</option>
								<option value="FAILED">FAILED</option>
								<option value="IN PROGRESS">IN PROGRESS</option>
								<option value="PENDING">PENDING</option>
								<option value="DEFERRED">DEFERRED</option>
								<option value="Failure">Failure</option>
								
							</select></td>
                            </tr>
                            <tr>
                              <td colspan="2"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_UTIL_SUMM_BY_TRAN_TYPE" onclick="assignRepType(4)">
                              </span></td>
                              <td nowrap class="contentbold">MCM Utilization Summary By Transaction Type</td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                            <input type="hidden" name="MAT_RPT_SUM_REQUEST_TYPE" value="">
                              <td>&nbsp;</td>
                              <td nowrap>
                                    <input name="MAT_RPT_SUM_REQUEST_TYPE1" type="radio" value="MAT_ADD" onclick="assignMcmSUM(1)">
                                        Add Products to Service Contracts
                              </td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap class="content">
                                  <input name="MAT_RPT_SUM_REQUEST_TYPE1" type="radio" value="MAT_TERMINATE" onclick="assignMcmSUM(2)">
                                    Terminate Coverage of Products from Service Contracts
                              </td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap class="content">
                                  <input name="MAT_RPT_SUM_REQUEST_TYPE1" type="radio" value="MAT_MOVE_ALL" onclick="assignMcmSUM(3)">
                                    Moves&nbsp;
                                    <select name="utilSummaryMoveRequestType">
                                        <option value="MAT_MOVE_ALL" selected>Move Summary (All Types)</option>
                                        <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">Contract to Contract and Site to Site Move at Product Level</option>
                                        <option value="MAT_MOVE_C2C_S2S_AT_SITE">Contract to Contract and Site to Site Move at Site Level</option>
                                        <option value="MAT_MOVE_C2C_AT_CONTRACT">Contract to Contract Move at Contract Level</option>
                                        <option value="MAT_MOVE_C2C_AT_PRODUCT">Contract to Contract Move at Product Level</option>
                                        <option value="MAT_MOVE_C2C_AT_SITE">Contract to Contract Move at Site Level</option>
                                        <option value="MAT_MOVE_S2S_AT_PRODUCT">Site to Site Move at Product Level</option>
                                        <option value="MAT_MOVE_S2S_AT_SITE">Site to Site Move at Site Level</option>
                                        <option value="MAT_UNCOVERED_EQUIPMENT">Move Uncovered Equipment</option>
                                    </select>

                              </td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap class="content">
                                  <input name="MAT_RPT_SUM_REQUEST_TYPE1" type="radio" value="MAT_SITES_ALL" onclick="assignMcmSUM(4)">
                                    Address Search and Create
                              </td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap class="content">
                                  <input name="MAT_RPT_SUM_REQUEST_TYPE1" type="radio" value="ALL" checked onclick="assignMcmSUM(-1)">
                                  ALL
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <tr>
                              <td><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_FAILURE_BREAKDOWN"  onclick="assignRepType(5)">
                              </span></td>
                              <td nowrap class="contentbold">MCM Failure Breakout By Transaction Type / Error Message</td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <input type="hidden" name="MAT_RPT_FBT_REQUEST_TYPE" value="">
                              <td nowrap>
                                  <input name="MAT_RPT_FBT_REQUEST_TYPE1" type="radio" value="MAT_ADD" checked onclick="assignMcmFBT(-1)">
                                    Add Products to Service Contracts
                              </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_FBT_REQUEST_TYPE1" type="radio" value="MAT_TERMINATE" onclick="assignMcmFBT(2)">
                                    Terminate Coverage of Products from Service Contracts
                              </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_FBT_REQUEST_TYPE1" type="radio" value="MAT_MOVE_ALL"  onclick="assignMcmFBT(3)">
                                      Moves&nbsp;
                                  <select name="failureMoveRequestType">
                                      <option value="MAT_MOVE_ALL" selected>Move Summary (All Types)</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">Contract to Contract and Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_SITE">Contract to Contract and Site to Site Move at Site Level</option>
                                      <option value="MAT_MOVE_C2C_AT_CONTRACT">Contract to Contract Move at Contract Level</option>
                                      <option value="MAT_MOVE_C2C_AT_PRODUCT">Contract to Contract Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_AT_SITE">Contract to Contract Move at Site Level</option>
                                      <option value="MAT_MOVE_S2S_AT_PRODUCT">Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_S2S_AT_SITE">Site to Site Move at Site Level</option>
                                      <option value="MAT_UNCOVERED_EQUIPMENT">Move Uncovered Equipment</option>
                                  </select>
                             </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_FBT_REQUEST_TYPE1" type="radio" value="MAT_SITES_ALL" onclick="assignMcmFBT(4)">
                                    Address Search and Create
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2">
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                              </td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                              <td><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_PROCESSING_TIMES" onclick="assignRepType(6)">
                              </span></td>
                              <td nowrap class="contentbold">MCM Processing Times By Request</td>
                            </tr>
                            <tr  bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap>
                              <input name="MAT_RPT_PTR_REQUEST_TYPE" type="hidden" value="" >
                              
                                  <input name="MAT_RPT_PTR_REQUEST_TYPE_1" type="radio" value="MAT_ADD" onclick="assignMcmPTR(1)">
                                    Add Products to Service Contracts
                              </td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_PTR_REQUEST_TYPE_1" type="radio" value="MAT_TERMINATE" onclick="assignMcmPTR(2)">
                                    Terminate Coverage of Products from Service Contracts
                              </td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_PTR_REQUEST_TYPE_1" type="radio" value="MAT_MOVE_ALL" onclick="assignMcmPTR(3)">
                                      Moves&nbsp;
                                  <select name="processingMoveRequestType">
                                      <option value="MAT_MOVE_ALL" selected>Move Summary (All Types)</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">Contract to Contract and Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_SITE">Contract to Contract and Site to Site Move at Site Level</option>
                                      <option value="MAT_MOVE_C2C_AT_CONTRACT">Contract to Contract Move at Contract Level</option>
                                      <option value="MAT_MOVE_C2C_AT_PRODUCT">Contract to Contract Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_AT_SITE">Contract to Contract Move at Site Level</option>
                                      <option value="MAT_MOVE_S2S_AT_PRODUCT">Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_S2S_AT_SITE">Site to Site Move at Site Level</option>
                                      <option value="MAT_UNCOVERED_EQUIPMENT">Move Uncovered Equipment</option>
                                  </select>
                              </td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_PTR_REQUEST_TYPE_1" type="radio" value="MAT_SITES_ALL" onclick="assignMcmPTR(4)">
                                    Address Search and Create
                              </td>
                            </tr>
                            <tr bgcolor="#CCCCCC">
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_PTR_REQUEST_TYPE_1" type="radio" value="ALL" checked onclick="assignMcmPTR(-1)">
                                    ALL
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2">
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                              </td>
                            </tr>
                            <tr>
                              <td><span class="contentbold">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_REASON_CODE_RECONCILIATION" onclick="assignRepType(7)">
                              </span></td>
                              <td nowrap class="contentbold">Reason Code Reporting
                              </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td>
                                  <p><span class="contentbold">
                                  <input name="RCR_ALL" type="radio" value="ALL" checked onclick="assignMcmRCR(-1)">
                                    ALL&nbsp;&nbsp;&nbsp;or &nbsp;
                                  <input name="RCR_ALL" type="radio" onclick="assignMcmRCR(2)">
                                    CCO User ID:&nbsp;&nbsp;
                                  <input name="MAT_RPT_RCR_CCO_USER_ID" type="text" size="12">
                                </span></p>
                              </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><span class="contentbold">
                                <input name="TRN_ALL" type="radio" value="ALL" checked onclick="assignMcmRCRRID(-1)">
                                  ALL&nbsp;&nbsp;&nbsp;or &nbsp;
                                <input name="TRN_ALL" type="radio" onclick="assignMcmRCRRID(2)">
                                  Request ID:
                                <input name="MAT_RPT_TRN_REQUEST_ID" type="text" size="12" >
                                 &nbsp;&nbsp;&nbsp;
                                  <span class="modulesubhead"><font size=1>Note: Ignores date if Request ID is selected</font></span>
                              </span></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><span class="contentbold">
                                  Request Type
                                  <select name="MAT_RPT_RCR_REQUEST_TYPE">
                                      <option value="ALL" selected>ALL</option>
                                      <option value="MAT_MOVE_ALL">Move Summary (All Types)</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">Contract to Contract and Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_SITE">Contract to Contract and Site to Site Move at Site Level</option>
                                      <option value="MAT_MOVE_C2C_AT_CONTRACT">Contract to Contract Move at Contract Level</option>
                                      <option value="MAT_MOVE_C2C_AT_PRODUCT">Contract to Contract Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_AT_SITE">Contract to Contract Move at Site Level</option>
                                      <option value="MAT_MOVE_S2S_AT_PRODUCT">Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_S2S_AT_SITE">Site to Site Move at Site Level</option>
                                      <option value="MAT_TERMINATE">Terminate Coverage of Products from Service Contracts</option>
                                      <option value="MAT_ADD">Add Products to Service Contracts</option>
                                      
                                      
                                  </select>
                              </span></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><span class="contentbold">
                                Reason Code:
                                  <select name="MAT_RPT_RCR_REASONCODE">
                                    <option value="ALL" selected>ALL</option>
                                    <option value="C2C-Dwngrd w/o proof of pay">C2C-Dwngrd w/o proof of pay [M]</option>
                                    <option value="C2C-Dwngrd w/proof of pay">C2C-Dwngrd w/proof of pay [M]</option>
                                    <option value="C2C-Upgrd w/o proof of pay">C2C-Upgrd w/o proof of pay [M]</option>
                                    <option value="C2C-Upgrd w/proof of pay">C2C-Upgrd w/proof of pay [M]</option>
                                    <option value="C2C-Same/similar svc lvl">C2C-Same/similar svc lvl [M]</option>
                                    <option value="S#2C-Dwngrd w/o proof of pay">S#2C-Dwngrd w/o proof of pay [M]</option>
                                    <option value="S#2C-Dwngrd w/proof of pay">S#2C-Dwngrd w/proof of pay [M]</option>
                                    <option value="S#2C-Upgrd w/o proof of pay">S#2C-Upgrd w/o proof of pay [M]</option>
                                    <option value="S#2C-Upgrd w/proof of pay">S#2C-Upgrd w/proof of pay [M]</option>
                                    <option value="S#2C-Same/similar svc lvl">S#2C-Same/similar svc lvl [M]</option>
                                    <option value="S2C-Dwngrd w/o proof of pay">S2C-Dwngrd w/o proof of pay [M]</option>
                                    <option value="S2C-Dwngrd w/proof of pay">S2C-Dwngrd w/proof of pay [M]</option>
                                    <option value="S2C-Upgrd w/o proof of pay">S2C-Upgrd w/o proof of pay [M]</option>
                                    <option value="S2C-Upgrd w/proof of pay">S2C-Upgrd w/proof of pay [M]</option>
                                    <option value="S2C-Same/similar svc lvl">S2C-Same/similar svc lvl [M]</option>
                                                                
                                    <option value="Merger/Acquisition">Merger/Acquisition [T]</option>
                                    <option value="Move Product">Move Product [T]</option>
                                    <option value="Other">Other [T]</option>
                                    <option value="Out Of Business">Out Of Business [T]</option>
                                    <option value="upgrade">Upgrade [T]</option>
                                    <!-- Added the below new options for TD5083 
										Author:- kkakarla;
										Date:-18-June-2007; -->
										
									<option value="RMA">RMA [T]</option>
									<option value="Termination and Credit">Termination and Credit [T]</option>
									<option value="Change in service type">Change in service type [T]</option>
									<option value="Wrongly added">Wrongly added [T]</option>
									<option value="Sweep list customer">Sweep list customer [A]</option>
									<option value="Zero dollar product-no POP">Zero dollar product-no POP [A]</option>
									<option value="Token/Shell number provided">Token/Shell number provided [A]</option>
									<option value="SO#/PO# provided">SO#/PO# provided [A]</option>
									<!--option value="PO Reconciliation">PO Reconciliation [A]</option -->
									<!-- End TD5083;kkakarla -->
                                    <option value="Add Approved - No Charge">Add Approved - No Charge [A]</option>
                                    
                                </select>
                                  </span></td>
                            </tr>
                            <tr>
                              <td colspan="2"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <% if ("TRUE".equals(overRdsFlg)){ %>
                            <tr  bgcolor="#CCCCCC">
                              <td><span class="contentbold">
                              <input type="hidden" name="MAT_RPT_VOAR_REQUEST_TYPE" value="">
                                <input name="MAT_REPORT_TYPE" type="radio" value="MAT_VO_AUDIT_REPORT" onclick="assignRepType(8)">
                              </span></td>
                              <td nowrap class="contentbold">MCM VO Audit Report</td>
                            </tr>
                            <tr>
                            
                              <td colspan="2"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5"></td>
                            </tr>
                            <%}%>
                            
                            <!-- Not in uSe -John -- dated 01/20/06 -->
                            <!--tr>
                             <td>&nbsp;</td>
                              <td nowrap>
                              <input type="hidden" name="MAT_RPT_VOAR_REQUEST_TYPE" value="">
                                  <input name="MAT_RPT_VAOR_REQUEST_TYPE1" type="radio" value="MAT_ADD" onclick="assignMcmVAOR(1)">
                                    Add Products to Service Contracts
                              </td>
                            </tr>
                           
                            <tr>
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_VAOR_REQUEST_TYPE1" type="radio" value="MAT_MOVE_ALL" onclick="assignMcmVAOR(2)">
                                      Moves&nbsp;
                                  <select name="voauditreport">
                                      <option value="MAT_MOVE_ALL" selected>Move Summary (All Types)</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_PRODUCT">Contract to Contract and Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_S2S_AT_SITE">Contract to Contract and Site to Site Move at Site Level</option>
                                      <option value="MAT_MOVE_C2C_AT_CONTRACT">Contract to Contract Move at Contract Level</option>
                                      <option value="MAT_MOVE_C2C_AT_PRODUCT">Contract to Contract Move at Product Level</option>
                                      <option value="MAT_MOVE_C2C_AT_SITE">Contract to Contract Move at Site Level</option>
                                      <option value="MAT_MOVE_S2S_AT_PRODUCT">Site to Site Move at Product Level</option>
                                      <option value="MAT_MOVE_S2S_AT_SITE">Site to Site Move at Site Level</option>
                                  </select>
                              </td>
                            </tr>
                            
                            <tr>
                              <td>&nbsp;</td>
                              <td nowrap>
                                  <input name="MAT_RPT_VAOR_REQUEST_TYPE1" type="radio" value="ALL" checked onclick="assignMcmVAOR(-1)">
                                    ALL
                              </td>
                            </tr>
                            <tr>
                              <td colspan="2">
                                  <img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="5" height="5">
                              </td>
                            </tr-->
                            
                            <tr>
                              <td colspan="2"><input type="button" name="reportSubmit" value="Submit" onclick="javascript:validateForm()"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td nowrap>&nbsp;</td>
                            </tr>
                          </table></td>
                  <td><img height=1
            src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif"
            width=6></td>
                </tr>
                </tbody>
              </table>
              </span></TD>
          </TR>
          <TR>
            <TD class=caption align=left>&nbsp;</TD>
          </TR>
          </TBODY>
        </TABLE>
      </FORM><!--END APPLICATION - To keep in one column-->