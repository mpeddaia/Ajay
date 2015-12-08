<%@ page language="java"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/jstl-c" prefix="c"%>

<%@ page import="java.util.*"%>
<%@ page import="com.cisco.mcm.util.McmConstants"%>
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 

<!-- As part of SSO Q1FY12 release calling the toggleindicator function for all the mandatory fields  on  on_blur event and on_focus event -->

<% 
ResourceBundle rb=ResourceBundle.getBundle("DownloadTemplateResources");
//String matuser=(session.getAttribute("MATUSER")).toString();
MCMUserSession userSession=(MCMUserSession)session.getAttribute(MCMUserSession.USER_SESSION_KEY);

String loggedUserId = userSession.getUserId();
String userAccessLevel = userSession.getAccessLevel();

session.setAttribute("loggedUserId",loggedUserId);
session.setAttribute("userAccessLevel",userAccessLevel);

String overRdsFlg="FALSE";
HashMap map=(HashMap)session.getAttribute("ROLES");
if (map.containsKey(McmConstants.MASS_MAT_OVERRIDES) && (request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR) ||request.getAttribute("userRole").equals(McmConstants.XXCSS_PORTABLE_SOLUTION))) {
	overRdsFlg="TRUE";
}
%>

<%
boolean confirm=false;
if (null!=(request.getParameter("uploadRequestId"))) {
	confirm=true;
}
%>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/contract_mgr.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/combinedscripts.js" type="text/javascript"></script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head> 
		<title><bean:message key="MCM.TITLE" /></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

<script language="javascript" type="text/javascript">
/***AJAX-BEGIN***************************/
var myInnerContentDiv;
window.onload = Init;
var http_request = false;

// Functiojn to post the request
function makePOSTRequest(url, parameters) {
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
            // set type accordingly to anticipated content type
            http_request.overrideMimeType('text/html');
        }
    } else if (window.ActiveXObject) { // IE
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");

        } catch(e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch(e) {}
        }
    }
    if (!http_request) {
        return false;
    }
    inProgress();
    try {
        http_request.onreadystatechange = alertContents;
        http_request.open('POST', url, true);
        http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        http_request.setRequestHeader("Content-length", parameters.length);
        http_request.setRequestHeader("Connection", "close");
    } catch(e) {}
    http_request.send(null);
}

// Function to handle the response
function alertContents() {

	myInnerContentDivId = "showList"; // added to fix the browser compatibility issue by vibk
    if (http_request.readyState == 4) {
        if (http_request.status == 200) {

            result = http_request.responseText;
            //alert('result '+result);
            try {
                document.getElementById(myInnerContentDivId).innerHTML = result;
            } catch(e) {
                //document.getElementById('Text').innerHTML = result;
            }
        } else {
            alert('There was a problem with the request.');
        }
    }
}

function Init() {
    myInnerContentDivId = "showList";
}

// Function to build the parameters: Not used here
function submitForm(obj) {
    var params = "?reqType=" + encodeURI(document.McmUploadForm.requestType.value);
    params = params + "&method=reqChanged";
    params = params + "&showOverRidePage=true";
		if(document.getElementById("messageBox"))
    if (document.getElementById("messageBox")) document.getElementById("messageBox").style.display = "none";
    var url = "<%=request.getContextPath()%>/mcmindex.do" + params;
    makePOSTRequest(url, params);
}

function inProgress() {
    var progressMsg = "<TABLE cellSpacing=0 cellPadding=0 width='100%' border='0' bgcolor='#ffffff'>" + "<TBODY><tr>    <td width='100%' colspan='4'>" + "<hr color='#7f7f7f'> </td> </tr> " + " <TR> <td width='5'></td> <TD class=contentbold colspan='2' > " + " <font size='2' color='red'>In Progress.... " + " </font> <img src='<%=request.getContextPath()%>/images/wait.gif' alt=''> </TD> </TR> </TBODY> </TABLE>";
    //var progressMsg = "";
    try {

        doument.getElementById(myInnerContentDivId).innerHTML = progressMsg;
    } catch(e) {
        //document.getElementById('Text').innerHTML = progressMsg;
    }

}

/***AJAX-END*******************************/

function overRidesCheck() {

    var vHdnReqType = document.McmUploadForm.hidreqtype.value;
	//alert(vHdnReqType);
    if (vHdnReqType == "null" || vHdnReqType == "MAT_TERMINATE" || vHdnReqType == "MAT_UE_MOVE_S2S_PRODUCT" || vHdnReqType == "MAT_SEARCH_AND_CREATE_SHIP_TO_ID" || vHdnReqType == "IBCFG_EXP" || vHdnReqType == "PORTABLE_SOLUTIONS" || vHdnReqType == '' ||vHdnReqType == "SCM_AM_DELINK") {
        
        //Start Q3FY15 PSLDOS Validation changes by amalekar
        var ldos_check = document.getElementById("PS_VO_TYPE_LDOS_OVERRIDE");
    	  	
    	
    	if(ldos_check!=null){  	
       	if(ldos_check.checked){
    		return chkPSLDOSOverRides();
    	    
    	}
    	}
        //End Q3FY15 PSLDOS Validation changes by amalekar
        
        return true;
    }
    else {

	        window.status = document.McmUploadForm.McmHdnAListSize.value;
	        var i = 0;
	        //Changed the below variable value to HdnChkVals to fix defect 37856 by vibk 
	        var j = document.McmUploadForm.McmHdnAListSize.value; 
	       // var j = document.McmUploadForm.McmHdnChkVals.length; 
	       
	       
	        <%
	        if (!request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR)) { %>
	            j = 0;
	            <%
	        } %>
	
	        if (j > 1) 
	        {
	            for (i = 0; i < document.McmUploadForm.McmHdnChkVals.length; i++) 
	            {
	          		
	          		//alert(document.McmUploadForm.McmHdnChkVals[i].value);
	          		//alert(document.McmUploadForm.McmHdnChkVals.length);
		          	
		
		                var ele = document.McmUploadForm.McmHdnChkVals[i].value ;
		
		                if (eval("document.McmUploadForm." + ele + ".checked")) 
		                {
		                    return chkOverRides();
		                }
		            
	            
	        	}
	        }
	        else {
	            if (document.McmUploadForm.McmHdnChkVals) {
	                ele1 = document.McmUploadForm.McmHdnChkVals.value;
					if (eval("document.McmUploadForm." + ele1 + ".checked")) {
		                    return chkOverRides();
		                }
	               
	            }
	        }
        return true;
    }
}

function chkOverRideSelections(overRidesString) {
    var j = document.McmUploadForm.McmHdnAListSize.value;
   

    if (j > 1) {
        for (i = 0; i < j; i++) {
            if (overRidesString.indexOf(i + "") != -1) {

                var ele = document.McmUploadForm.McmHdnChkVals[i].value;

                if (!eval("document.McmUploadForm." + ele + ".checked")) {
                    alert("Please select all required overrides ");
                    return false;
                }
            }
        }
    }
    return true;
}

  function chkOverRides()
  {
  // TD2492
  	/* 	if (document.McmUploadForm.mat_vo_initiator.value==""||document.McmUploadForm.mat_vo_approvername.value==""||document.McmUploadForm.mat_vo_solcatcase.value==""||document.McmUploadForm.mat_vo_customername.value==""||document.McmUploadForm.mat_vo_reasoncode.value==""){
  		alert("Enter all the mandatory fields");
  		return false;
  	}*/
	
	//if(document.getElementById("mat_vo_initiator").value=="") {
	var psUserRole = document.McmUploadForm.userrole.value;
	var ele1 = document.McmUploadForm.McmHdnChkVals.value;
	if(document.McmUploadForm.mat_vo_initiator.value=="") 
	{
		alert("Enter Requestor/Initiator name");	
		document.McmUploadForm.mat_vo_initiator.focus();
		return false;
	} 
	else if(document.McmUploadForm.mat_vo_approvername.value=="" && psUserRole!="XXCSS_PORTABLE_SOLUTION") {
		alert("Enter Approver Name");
		document.McmUploadForm.mat_vo_approvername.focus();
		return false;
	}
	else if (document.McmUploadForm.mat_vo_customername.value=="" && psUserRole!="XXCSS_PORTABLE_SOLUTION") {
		alert("Enter Customer/Partner Name");	
		document.McmUploadForm.mat_vo_customername.focus();
		return false;
	}
	else if(document.McmUploadForm.mat_vo_reasoncode.selectedIndex==-1 || document.McmUploadForm.mat_vo_reasoncode.options[document.McmUploadForm.mat_vo_reasoncode.selectedIndex].value=="") {
		alert("Select Reason Code ");	
		document.McmUploadForm.mat_vo_reasoncode.focus();  
		return false;
	}
	else if ((document.McmUploadForm.hidreqtype.value=="MAT_DATE_CHANGE_PRODUCT_LINE") && (eval("document.McmUploadForm." + ele1 + ".checked"))  && (document.McmUploadForm.notes.value ==""))
		{
					alert("If Coverage Duration Override is checked, then Deal ID or Proof of Purchase information must be provided in the Notes field");
					document.McmUploadForm.notes.focus();
					return false;
		}
	
	
	/*	alert("Enter all the mandatory fields");
  		return false;
  	} */
	// TD2492;saatmaku;12 oct 2007;end;Removal of solcat id from the override
  	else 
  	{ 
  	
		var answer = confirm ("Do you want to continue with the validation override selection(s)?")
		if (answer)
			return true;
		else
			return false; 	
  	
  		//return true;
  	}
  
  }
 
  // START New function add for LDOS OVERRIDE
  
    function chkPSLDOSOverRides()
  {
  // TD2492
  	/* 	if (document.McmUploadForm.mat_vo_initiator.value==""||document.McmUploadForm.mat_vo_approvername.value==""||document.McmUploadForm.mat_vo_solcatcase.value==""||document.McmUploadForm.mat_vo_customername.value==""||document.McmUploadForm.mat_vo_reasoncode.value==""){
  		alert("Enter all the mandatory fields");
  		return false;
  	}*/
	
	//if(document.getElementById("mat_vo_initiator").value=="") {
	var psUserRole = document.McmUploadForm.userrole.value;
	var ele1 = document.McmUploadForm.McmHdnChkVals.value;
	if(document.McmUploadForm.mat_vo_initiator.value=="") 
	{
		alert("Enter Requestor/Initiator name");	
		document.McmUploadForm.mat_vo_initiator.focus();
		return false;
	} 
	else if(document.McmUploadForm.mat_vo_approvername.value=="") {
		alert("Enter Approver Name");
		document.McmUploadForm.mat_vo_approvername.focus();
		return false;
	}
	else if (document.McmUploadForm.mat_vo_customername.value=="") {
		alert("Enter Customer/Partner Name");	
		document.McmUploadForm.mat_vo_customername.focus();
		return false;
	}
	else if(document.McmUploadForm.mat_vo_reasoncode.selectedIndex==-1 || document.McmUploadForm.mat_vo_reasoncode.options[document.McmUploadForm.mat_vo_reasoncode.selectedIndex].value=="") {
		alert("Select Reason Code ");	
		document.McmUploadForm.mat_vo_reasoncode.focus();  
		return false;
	}
	else if ((document.McmUploadForm.hidreqtype.value=="MAT_DATE_CHANGE_PRODUCT_LINE") && (eval("document.McmUploadForm." + ele1 + ".checked"))  && (document.McmUploadForm.notes.value ==""))
		{
					alert("If Coverage Duration Override is checked, then Deal ID or Proof of Purchase information must be provided in the Notes field");
					document.McmUploadForm.notes.focus();
					return false;
		}
	
	
	/*	alert("Enter all the mandatory fields");
  		return false;
  	} */
	// TD2492;saatmaku;12 oct 2007;end;Removal of solcat id from the override
  	else 
  	{ 
  	
		var answer = confirm ("Do you want to continue with the validation override selection(s)?")
		if (answer)
			return true;
		else
			return false; 	
  	
  		//return true;
  	}
  
  }
  
  //END New function add for LDOS OVERRIDE 
  
  
  
  function toggleSAMChk(nThis)
  {

    if (nThis.checked) {
        //Original code
        //document.McmUploadForm.MAT_VO_TYPE_SAM.disabled = false;
        //Original code
        
        //Added by amalekar
        //Check and Disable SAM Check Override checkbox when 
        //Service Level Match checkbox is checked.  
        document.McmUploadForm.MAT_VO_TYPE_SAM.checked = true;
        document.McmUploadForm.MAT_VO_TYPE_SAM.disabled = true;
        //checkOverrideBiz(document.getElementById("MAT_VO_TYPE_SAM"));
        //Added by amalekar
        
    }
    else {
        document.McmUploadForm.MAT_VO_TYPE_SAM.checked = false;
        document.McmUploadForm.MAT_VO_TYPE_SAM.disabled = true;
    }

}
function validateForm(thisobj) {
    //window.status=document.McmUploadForm.McmHdnAListSize.value;
    var requestFlag = getRequestType(document.McmUploadForm.requestType.value);
    if (requestFlag == false) {
        return false;
    }

    var requestName = document.getElementById("mat_request_name").value;
    document.McmUploadForm.uploadRequestName.value = requestName;
    if (requestName == "" || requestName == " ") {
        alert("Request Name is a required field");
        document.getElementById("mat_request_name").focus();
        return false;
    }
    extFlag = getExtension(document.McmUploadForm.fileName.value);
    if (extFlag == false) {
        return false;
    }
    var emailFlag = validateSingleEmail(document.McmUploadForm.email);
    if (emailFlag == false) {
        return false;
    }

    var overRidesFlag = true;
    if (document.McmUploadForm.hdnOverRds.value == "TRUE") {
        overRidesFlag = overRidesCheck();
        if (overRidesFlag == false) {

            return false;
        }
    }

   if (extFlag == true && emailFlag == true && requestFlag == true && overRidesFlag == true) {
        document.McmUploadForm.uploadDefinitionName.value = document.McmUploadForm.requestType.value;
        if (document.McmUploadForm.uploadDefinitionName.value == "MAT_M_AND_P_ENTITLMNT_ADD_PRODUCTS") {
            document.McmUploadForm.uploadDefinitionName.value = "M_AND_P_ENTITLMNT_ADD_PRODUCTS";
        }
        document.McmUploadForm.reqType.value = document.McmUploadForm.requestType.value;
        document.McmUploadForm.uploadButton.disabled = true;

        document.McmUploadForm.action = "<%=request.getContextPath()%>/ServiceSalesUpload";
        document.McmUploadForm.submit();

    }
}

function getExtension(value) {
    extString = value.substring(value.lastIndexOf('.') + 1, value.length);

    if (extString == null || extString == "") {
        alert("Locate File is a required field");
        return false;
    }
    if (extString != "xls") {
        alert("Please load only an Excel file");
        return false;
    }
    return true;
}

function getRequestType(value) {
    if (value == null || value == "Please Select" || value == "") {
        alert("Request Type is a required field");
        return false;
    }
    else if (value == "MAT_TERMINATE_CONTRACT" || value == "CONTRACT_TERMINATIONS") {
        var isConfirm = confirm("This operation will terminate all the contracts in your spreadsheet at the header level (including all products underneath).This is a non revertible operation. Are you sure you should like to proceed?");
        return isConfirm;
    }
    return true;
}

function validateSingleEmail(fld) {
    if ((fld.value == null) || (fld.value == "") || (fld.length == 0)) {
        alert("Email is a required field");
        return false;
    }
    if (!fld.value) {
        return true;
    }
    regExp = new RegExp(" ", "g");
    var emailValue = fld.value.replace(regExp, ""); //fld.value;
    var emailArray = emailValue.split(",");
    for (i = 0; i < emailArray.length; i++) {
        if (!validateEmail(emailArray[i])) {
            fld.focus();
            return false;
        }
    }
    return true;
}

function validateEmail(val) {
    var wordchar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_,';
    var char1 = val.charAt(0);
    var charN = val.charAt(val.length - 1);
    var at = val.indexOf('@');
    var dot = val.indexOf('.', at + 2);
    if (val.indexOf(' ') != -1 || at == -1 || dot == -1 || wordchar.indexOf(char1) == -1 || wordchar.indexOf(charN) == -1) {
        alert('The Email address entered field must contain a valid email address. ');
        return false;
    }

    var pre_at = val.charAt(at - 1);
    var post_at = val.charAt(at + 1);
    var pre_dot = val.charAt(dot - 1);
    var post_dot = val.charAt(dot + 1);

    //  if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 || fld.value.indexOf('@',at+2) != -1)
    if (wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 || wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1) {
        alert('The Email address field must contain a valid email address.');
        fld.focus();
        return false;
    }
    return true;
}

function downloadTemplate() {
    var selectedTemplate = document.McmUploadForm.selectTemplate.value
    if ("" == selectedTemplate) {
        alert("Select the template to download");
        return false;
    }
    else {
        //needs to be changed later..
        var filepath = "<%=request.getContextPath()%>/docs/xlsTemplates/" + selectedTemplate + ".xls";
        window.open(filepath, "template_window");
    }
}

function reqChangeType() {

    var reqType = document.McmUploadForm.requestType.value;
    
    //Added new variable userRole to get value from hidden field. By amalekar on 19.4.2013 for Q4FY13
    var userRole = document.getElementById("userRoleHdn").value;
   	
   	//alert("Request type : "+reqType);
   	//alert("User Role : "+userRole);
   	
	if(reqType!="SCM_AM_DELINK")
	{
    document.McmUploadForm.hidreqtype.value = reqType;
	
	// Added new check condition if 
	// (reqType == "MAT_DNR_PRODUCT_LVL" || userRole == "XXCSS_OPS_SUPER_USR" || userRole == "XXCSS_PORTABLE_SOLUTION")
	// By amalekar on 19.4.2013 for Q4FY13 
	
    if ("" != reqType || reqType == "MAT_DNR_PRODUCT_LVL" || userRole == "XXCSS_OPS_SUPER_USR" || userRole == "XXCSS_PORTABLE_SOLUTION") {
        document.McmUploadForm.action = "<%=request.getContextPath()%>/mcmindex.do?reqType=" + reqType;
        submitForm(document.getElementById("McmUploadForm"));
    }
    }
    else
    {
     document.McmUploadForm.hidreqtype.value = reqType;
     document.getElementById("showList").innerHTML ="";
    }
}

function checkSpecialChars(obj) {
    var iChars = "!@#$%^&*()+=-[]\';,./{}|\":<>?";
    for (var i = 0; i < obj.value.length; i++) {
        if (iChars.indexOf(obj.value.charAt(i)) != -1) {
            alert("Containts special characters. These are not allowed. Please remove them and try again.");
            obj.focus();
            return false;
        }
    }
}

function requestStatus(reqId) {
    document.McmUploadForm.action = "<%=request.getContextPath()%>/mcmstatusdetailview.do?requestid=" + reqId;
    document.McmUploadForm.submit();
}

function setTransact() {
	if (document.getElementById('transactLine').checked) {
		document.McmUploadForm.TRANSACT_LINE_ITEM.value = "Y";
	}
	else {
		document.McmUploadForm.TRANSACT_LINE_ITEM.value = "N";
	}
}

//Added as a part of Q2FY13 release by sphilipo
function goToSAMUrl()
{	
	var SAMUrl = 'https://tools.cisco.com/apidc/sam/search.do';
	window.open(SAMUrl);	
}
//End of changes by sphilipo for Q2FY13-->

</script>
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
	</head>
	<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="toggleIndicator_blur('lblemail','email')">

		<div id="application_area">
			<!-- <div id="moduleContainerId"> -->
			<table height="16">
				<tr>
					<td></td>
				</tr>
			</table>

			<div id="mod_1" class="mod_header" style="width:99%">
				<h2 class="mh_title" style="margin-left:15px;">
					Upload Manager
				</h2>
			</div>

			<!-- Body Starts from here -->

			<div id="marque_1" class="marque" style="width:99%; margin-left: 11px;">

			<%
			if(confirm){
			%>
				<div id="messageBox" name="messageBox" style="display:block">
					<!-- // begin message/status box -->
					<!-- // message box header --> <!-- //Removing message box header and border as part of SSO Q2FY12 by vibk -->
				
					<table border="0" cellpadding="0" cellspacing="0" width="402" >
						<!-- // top spacer --> <!--  //Removing top spacer as part of SSO Q2FY12 Release -by vibk -->
					 	
						<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
							
							<td width="100%"><br/> 
								File Upload Successful ... <BR>
								<br> 
								<%  //commenting below 4 lines for Static analysis
								//StringBuffer url = request.getRequestURL(); --removing as part of static analysis for C3t Q3FY12 by vibk
								//String urll = url.toString(); --removing as part of static analysis for C3t Q3FY12 by vibk
								//if(url.indexOf("TESTF")!=-1) --removing as part of static analysis for C3t Q3FY12 by vibk
								//urll = url.substring(0,url.indexOf("TESTF")); --removing as part of static analysis for C3t Q3FY12 by vibk
								
								String helpUrl = (String)session.getAttribute("Xtrack_Help_URL");
										
								int lastIndex = helpUrl.lastIndexOf("/");
								String xtrackJVM = helpUrl.substring(0,lastIndex);
					            %> 
					            Request Number: 
					           <% if (userSession.getUserRole().equalsIgnoreCase("XXCSS_EXT_DISTRIBUTOR")  || userSession.getUserRole().equalsIgnoreCase("XXCSS_2_TIER_RESELLER")) { %> 
					           <%=session.getAttribute("processRequestId")%>
					           <%} 
					           else { %>
					            <a href="<%=xtrackJVM %>/requestStatusDispatch.do?methodName=onRequestAction"><%=session.getAttribute("processRequestId")%></a> 
					            <%} %>
					            <br> 
					            Request Name: <%=request.getParameter("matReqName")%>
					            <br> 
					            Email Addresses: <%=request.getParameter("email")%>
								<BR> 
								
								<br/>
								
								
							</td>
							</tr>
					</table>
					<!-- // end message/status box -->
				</div>
				<%} //End of if (confirm)
				else if(null!=(request.getAttribute("errorMessage"))){
				%>
				
				<div id="messageBox" name="messageBox" style="display:block">
					<!-- // begin message/status box -->
					<!-- // message box header --> <!-- //Removing message box header and border as part of SSO Q2FY12 by vibk -->
				
					<table border="0" cellpadding="0" cellspacing="0" width="402" >
						<!-- // top spacer --> <!--  //Removing top spacer as part of SSO Q2FY12 Release -by vibk -->
					 	
						<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
							
							<td width="100%"><br/> 
								<b>The Uploaded Template is different from the Request type selected, Please upload the appropriate template and submit the Request.</b><BR>
								<br> 
							</td>
							</tr>
					</table>
					<!-- // end message/status box -->
				</div>
				
				<%}%>

				<form name="McmUploadForm" id="McmUploadForm" method="post" enctype="multipart/form-data">
					
					<input type="hidden" name="loggedUserId" value="<%=loggedUserId%>" />
					<input type="hidden" name="userAccessLevel" value="<%=userAccessLevel%>" />
					
					<table align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" width="100%">
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
							<td width="5"></td>
							<td>
								<TABLE cellSpacing=0 cellPadding=0 width="60%" border="0">
									<TBODY>
										<TR>
											<TD class=contentbold colspan="2" align="left">
												<font size="2" color="red"> <bean:message key="MCM.MAIN.DOWNLOADTEMPLATE" /></font>
											</TD>
										</TR>
										<TR>
											<table width="95%" border="0" cellspacing="0" cellpadding="2">
												<!--  <table> -->
												<tr>
													<TD noWrap width="127" align="right">
														<label for="TEMPLATE">
															Template 
														</label>
													</TD>
													<td align="left" ><!-- decreased its width size from 81% to 50%, to add SAM link -->
													<span class=content>
														<select name="selectTemplate">
															<c:forEach var="templ" items="${loadattribs1}">
																<option value="<c:out value="${templ.id}"/>">
																	<c:out value="${templ.description}" />
																</option>
															</c:forEach>
														</select>
														<input type=button value="Download" name="DownloadTemplate" onclick="javascript:downloadTemplate()" />
													</span>
													<!-- </td> -->
													<!--Added as a part of Q2FY13 release by sphilipo-->
													<!--  <td width="5%"></td> -->
													<!-- <td align="left" noWrap > -->
													 <% if (!(userSession.getUserRole().equalsIgnoreCase(McmConstants.XXCSS_PORTABLE_SOLUTION))) { %> 
													<span>
															<font style="font-family:Arial, Helvetica, sans-serif; " color="#29A3FF">
																&nbsp; To Confirm address requirements please visit the <a href="#" onclick="javascript:goToSAMUrl()"><b>Service Availability Matrix</b></a>
															 </font>
													</span>	
													<% }%>														 
													</td>
													<!--End of changes by sphilipo-->	
												</tr>
											</table>
										</TR>
										<%
										
								   if(map.containsKey(McmConstants.MASS_MAT_UPLD_ACTIONS) &&("RW".equals((String)map.get(McmConstants.MASS_MAT_UPLD_ACTIONS))))
								   {
//										   if(request.getAttribute("userRole").equals(McmConstants.XXCSS_CS_OPS) ||
// 											  request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR) ||
//											  request.getAttribute("userRole").equals(McmConstants.XXCSS_PORTABLE_SOLUTION) 
//											  || (request.getAttribute(McmConstants.XXCSS_EXTERNAL_USER).equals("3"))
//											  )
//											  {

									   %>
										<tr>
											<td width="100%" colspan="4">
												<hr color="#7f7f7f">
											</td>
										</tr>
										<TR>
											<td width="5"></td>
											<TD class=contentbold colspan="2">
												<font size="2" color="red"><bean:message key="MCM.MAIN.UPLOAD.HEADER" /></font>
											</TD>
										</TR>

										<TR>
										
										
											<td width="5"></td>
											<TD colspan="2" class=contentbold>

												<table width="95%" border="0" cellspacing="0" cellpadding="2">
													<TR>

														<TD width="10%" align="right" noWrap>
															<!-- <bean:message  key="MCM.MAIN.UPLOAD.REQUESTTYPE"/> -->
															<label for="RequestType">
																<bean:message key="MCM.MAIN.UPLOAD.REQUESTTYPE" />
															</label>
														</TD>
														<TD class=content noWrap width="35%">
														    <!-- Added new hidden field userRoleHdn By amalekar on 19.4.2013 for Q4FY13 --> 
															<input type="hidden" id="userRoleHdn" value="<%=request.getAttribute("userRole") %>>"/>
															
															<!-- Changes removed  as on 19.4.2013-->
															<!-- Changes added for Q4FY13 DNR. on 26.3.2013 added  selectedRequestType=="MAT_DNR_PRODUCT_LVL" in if condition by sphilipo-->
															<!-- Changes removed  as on 19.4.2013-->
																														
															<select name="requestType" id="requestType" onchange="javascript:reqChangeType()"  onfocus="toggleIndicator_focus('lblrtype')" onblur="toggleIndicator_blur('lblrtype','requestType')">
																<option selected>
																	<%=rb.getString(McmConstants.DefaultValue)%>
																</option>
																<c:forEach var="reqsType" items="${loadattribs}">
																	<option value="<c:out value="${reqsType.id}"/>">
																		<c:out value="${reqsType.description}" />
																	</option>
																</c:forEach>
															</select>	
															<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
															<label name="lblrtype" id="lblrtype" style='color:red;font-size:14pt'>*</label>													
														</TD>

														<TD noWrap width="10%" align="right">
															<!-- <bean:message  key="MCM.MAIN.UPLOAD.REQUESTNAME"/> -->
															<label for="RequestName">
																<bean:message key="MCM.MAIN.UPLOAD.REQUESTNAME" />
															</label>
														</TD>
														<TD class=content noWrap width="20%">
															<input type=text maxlength="80" size="30" id="mat_request_name" name="mat_request_name" onblur="checkSpecialChars(this);toggleIndicator_blur('lblrname','mat_request_name')"  onFocus="toggleIndicator_focus('lblrname')"/>
															<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
															<label name="lblrname" id="lblrname" style='color:red;font-size:14pt'>*</label>
														</TD>

														<td noWrap width="5%" align="right">
															<label for="Notes">
																<bean:message key="MCM.MAIN.UPLOAD.NOTES" />
															</label>
														</td>
														<TD class=content noWrap width="20%">
															<input type=text maxlength="80" size="30" name="notes" />
														</TD>
													</TR>

													<TR>
														<TD align="right" noWrap>
															<!--  <bean:message  key="MCM.MAIN.UPLOAD.LOCATEFILE"/> -->
															<label for="FILENAME">
																<!-- <bean:message key="MCM.MAIN.UPLOAD.LOCATEFILE"/> -->
																FileName/Path
															</label>
														</TD>
														<td>
															<input type=file maxlength="80" size="47" id="filename" name="fileName" MAXFILESIZE='10240000' onblur="toggleIndicator_blur('lblfilename','filename')" onfocus="toggleIndicator_focus('lblfilename')" />
															<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
															<label name="lblfilename" id="lblfilename" style='color:red;font-size:14pt'>*</label>
														</td>

														<TD align="right" noWrap>
															<!-- <bean:message  key="MCM.MAIN.UPLOAD.EMAIL"/> -->
															<label for="Email">
																<bean:message key="MCM.MAIN.UPLOAD.EMAIL" />
															</label>
														</TD>
														<TD class=content noWrap align="left">
															<input type=text size="30" maxlength="256" id="email" name="email" value=<c:out value="${email}"/> onblur="toggleIndicator_blur('lblemail','email')" onfocus="toggleIndicator_focus('lblemail')" >
															<!--  Adding label  * to indicate  mandatory  field as part of SSO Q2FY12 Release  -->
															<label name="lblemail" id="lblemail" style='color:red;font-size:14pt'></label>
														</TD>
														<td noWrap align="right">
															&nbsp;
														</td>
														<TD class=content noWrap width="120">
															&nbsp;
														</TD>
													</TR>

												</table>
											</TD>
										</TR>

										<tr height=7>
											<td></td>
										</tr>
								</TABLE>
								
								<div name="showList" id="showList">
								</div>
								</div>

								<div id="to_align" style="width:99%">
									<div id="button_1" class="button_block">

										<!-- button component -->
										<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="button_left" onClick="document.getElementById('uploadButton').click();"></td>
												<td>
													<input id="uploadButton" class="button" type="button" name="uploadButton" value="Submit" onClick="javascript:validateForm(this)" />
												</td>
												<td class="button_right" onClick="document.getElementById('uploadButton').click();"></td>
											</tr>
										</table>

										<!-- button component -->
										<table class="primary_enabled" style="float:left" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td class="button_left" onClick="document.getElementById('clear').click();"><br></td>
												<td>
													<input id="clear" class="button" type="reset" name="clear" value="Clear" onclick="clearAsterisk();" />
												</td>
												<td class="button_right" onClick="document.getElementById('clear').click();">&nbsp;</td>
											</tr>
										</table>
									</div>
								</div>

								<input type="hidden" name="uploadDefinitionName" value="" />
								<input type="hidden" name="reqType" value="" />
								<input type="hidden" value="/mcmindex.do" name="redirecturl" />
								<input type="hidden" value="/errorPage.do" name="errorRedirectUrl" />
								<input type="hidden" name="isOnlineProcess" value="false" />
								<input type="hidden" name="TRANSACT_LINE_ITEM" value="N" />
								<input type="hidden" name="hidreqtype" value='<%=request.getParameter("reqType")%>' />
								<input type="hidden" name="userrole" value='<%=request.getAttribute("userRole")%>' />
								<input type="hidden" name="processRequestId" value='<%=request.getAttribute("processRequestId")%>' />
								<input type="hidden" name="uploadRequestName" value='<%=request.getAttribute("mat_request_name")%>' />
								<input type="hidden" name="hdnOverRds" value="<%=overRdsFlg%>" />

								
								
								
								</form>

								</div>
	</body>
</html>
<% 
//} 
} 
%>


