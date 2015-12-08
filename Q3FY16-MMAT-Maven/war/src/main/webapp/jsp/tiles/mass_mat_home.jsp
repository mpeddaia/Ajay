<%@ page language="java"%>

<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 

<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="com.cisco.servicesales.session.MCMAccessManager" %> 
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 
<%@ page import="com.cisco.mcm.bo.McmUploadBO" %> 
<%@ page import="com.cisco.mcm.util.McmConstants" %> 
<%@ page import="com.cisco.servicesales.util.Constants" %> 
<%@ page import="com.cisco.mcm.bean.McmOverridesBean" %>
<%@ page import="javax.servlet.http.HttpSession" %>


<%// @ include file="userCheck.jsp" %>
<%    //            response.sendRedirect(ctxpath1 + "/InvalidAccess.jsp");
              //         }catch (Exception e)
               //        {
               
                //       }
//}


ResourceBundle rb=ResourceBundle.getBundle("DownloadTemplateResources");
String matuser=(session.getAttribute("MATUSER")).toString();
String overRdsFlg="FALSE";
 HashMap map=(HashMap)session.getAttribute("ROLES");
 if (map.containsKey(McmConstants.MASS_MAT_OVERRIDES))
 {
 overRdsFlg="TRUE";
 }
		       
%>


<%//=matuser%>

<%//=session.getAttribute(Constants.USER_NAME)%>
<%//=request.getContextPath()%>
<%
boolean confirm=false;
if (null!=(request.getParameter("uploadRequestId")))
{
confirm=true;
}
%>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/contract_mgr.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/combinedscripts.js" type="text/javascript"></script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title><bean:message key="MCM.TITLE"/></title>
    
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
            //http_request.overrideMimeType('text/xml');
            http_request.overrideMimeType('text/html');
         }
      } else if (window.ActiveXObject) { // IE
	     try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
			
         } catch (e) {
            try {
               http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
      if (!http_request) {
           return false;
      }
      inProgress();
	  try{
      http_request.onreadystatechange = alertContents;
      http_request.open('POST', url, true);
	  http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.setRequestHeader("Content-length", parameters.length);
      http_request.setRequestHeader("Connection", "close");
	  }catch(e){
	  }
	 //http_request.send(false);
	  http_request.send(null);
	  

   }
	
	// Function to handle the response
	function alertContents() {			
		
		if (http_request.readyState == 4) {
			if (http_request.status == 200) {
			 
				result = http_request.responseText; 	
				//alert('result '+result);
				try{
				
					document.getElementById(myInnerContentDivId).innerHTML = result;            				
				}catch(e){ 
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
		var params = "?reqType=" + encodeURI( document.McmUploadForm.requestType.value ); 		
		params = params + "&method=reqChanged";  
		//params = params + "&mat_request_name="+ encodeURI( document.McmUploadForm.mat_request_name.value ); 
		//params = params + "&notes="+ encodeURI( document.McmUploadForm.notes.value ); 
		//params = params + "&email="+ encodeURI( document.McmUploadForm.email.value ); 
		//params = params + "&hdnOverRds="+ encodeURI( document.McmUploadForm.hdnOverRds.value );
		//params = params + "&hidreqtype="+ encodeURI( document.McmUploadForm.hidreqtype.value ); 
		params = params + "&showOverRidePage=true"; 
		if(document.getElementById("messageBox"))
			document.getElementById("messageBox").style.display = "none"; 
		var url = "<%=request.getContextPath()%>/mcmindex.do"+params;	
		makePOSTRequest(url, params);
	}
	
	
		function inProgress(){
		
		
		var progressMsg = "<TABLE cellSpacing=0 cellPadding=0 width='100%' border='0' bgcolor='#ffffff'>" +
		                    "<TBODY><tr>	<td width='100%' colspan='4'>" +
								"<hr color='#7f7f7f'> </td> </tr> " +       
							" <TR> <td width='5'></td> <TD class=contentbold colspan='2' > " + 
							" <font size='2' color='red'>In Progress.... " +
								" </font> <img src='<%=request.getContextPath()%>/images/wait.gif' alt=''> </TD> </TR> </TBODY> </TABLE>" ;
		try{
		
         doument.getElementById(myInnerContentDivId).innerHTML = progressMsg;                     
		}catch(e){ 
				//document.getElementById('Text').innerHTML = progressMsg;
			}
		
			
	}
	 
/***AJAX-END*******************************/


  function overRidesCheck()
  {
	
  var vHdnReqType=document.McmUploadForm.hidreqtype.value;
 
  
  <%--//if (vHdnReqType=="null" || vHdnReqType=="MAT_TERMINATE" || vHdnReqType=="MAT_UE_MOVE_S2S_PRODUCT" || vHdnReqType=="MAT_SEARCH_SITES" || vHdnReqType=="MAT_CREATE_SITES" || vHdnReqType=="IBCFG_EXP"|| vHdnReqType=="PORTABLE_SOLUTIONS")--%>//PORTABLE SOLUTIONS
 <%--//Added the below if condition on 17th oct 2007 as per the requirement for TD-2489 --%>
 if (vHdnReqType=="null" || vHdnReqType=="MAT_TERMINATE" || vHdnReqType=="MAT_UE_MOVE_S2S_PRODUCT" || vHdnReqType=="MAT_SEARCH_AND_CREATE_SHIP_TO_ID" || vHdnReqType=="IBCFG_EXP"|| vHdnReqType=="PORTABLE_SOLUTIONS")
  {
  return true;
  }
  /*else if(vHdnReqType=="MAT_ADD") {				
		if(!chkOverRideSelections("1,3"))
			return false;
  }else if(vHdnReqType=="MAT_MOVE_C2C_AT_CONTRACT") {				
		if(!chkOverRideSelections("0,1,2,3,4"))
			return false; MAT_MOVE_C2C_AT_SITE
  }else if(vHdnReqType=="MAT_MOVE_C2C_AT_SITE") {				
		if(!chkOverRideSelections("0,1,2,3,4"))
			return false; 
  }else if(vHdnReqType=="MAT_MOVE_C2C_AT_PRODUCT") {				
		if(!chkOverRideSelections("0,1,2,3,4"))
			return false; 
  }else if(vHdnReqType=="MAT_MOVE_C2C_S2S_AT_SITE") {				
		if(!chkOverRideSelections("2,3,0,5,1"))
			return false; 
  }else if(vHdnReqType=="MAT_MOVE_C2C_S2S_AT_PRODUCT") {				
		if(!chkOverRideSelections("5,4,2,3,0"))
			return false; 
  }else if(vHdnReqType=="MAT_MOVE_S2S_AT_SITE") {				
		if(!chkOverRideSelections("0,1"))
			return false; 
  }else if(vHdnReqType=="MAT_MOVE_S2S_AT_PRODUCT") {				
		if(!chkOverRideSelections("0,1"))
			return false; 
  } */
  else 
  { 
  
	window.status=document.McmUploadForm.McmHdnAListSize.value;
	var i=0;
	var j=document.McmUploadForm.McmHdnAListSize.value;
	<%
		if(!request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR)){
	%>
		
		j = 0;
		
	
	<%}%>
	 
	if(j>1){
		for(i=0;i<j;i++)
		{
		
		var ele=document.McmUploadForm.McmHdnChkVals[i].value;
		
		if(eval("document.McmUploadForm."+ele+".checked"))
		{
			
			return chkOverRides();
		}
		}
	}
	else
	{

		if(document.McmUploadForm.McmHdnChkVals)
		{
		ele1=document.McmUploadForm.McmHdnChkVals.value;
		
		if(eval("document.McmUploadForm."+ele1+".checked"))
		{
			return chkOverRides();
		}
		}
		
		
	}
	return true;
  
  
  }
  //return true;  
  }
  
  function chkOverRideSelections(overRidesString){
		var j=document.McmUploadForm.McmHdnAListSize.value;
		 
		if(j>1){
			for(i=0;i<j;i++) {
				if(overRidesString.indexOf(i+"") != -1){
											
					var ele=document.McmUploadForm.McmHdnChkVals[i].value;
				
					if(!eval("document.McmUploadForm."+ele+".checked")) {					
						alert("Please select all required overrides ");
						return false;
					}
				}/* else {	
					alert("not required for "+i);		
				}*/				
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
	if(document.McmUploadForm.mat_vo_initiator.value=="") {
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
	/*	alert("Enter all the mandatory fields");
  		return false;
  	} */
	// TD2492;saatmaku;12 oct 2007;end;Removal of solcat id from the override
  	else { 
  	
		var answer = confirm ("Do you want to continue with the validation override selection(s)?")
		if (answer)
			return true;
		else
			return false; 	
  	
  		//return true;
  	}
  
  }
 
  
  function toggleSAMChk(nThis)
  {

  if(nThis.checked)
	{
	  document.McmUploadForm.MAT_VO_TYPE_SAM.disabled=false;
	}
	
	else
	{
	  document.McmUploadForm.MAT_VO_TYPE_SAM.checked=false;
	  document.McmUploadForm.MAT_VO_TYPE_SAM.disabled=true;
	}
    
  }
  function validateForm(thisobj) {
  	/*<!-- TD2492 

	 TD5082;start;alonikar;13 jul 2007;Added the validation for solcatId in UI 
	  	 var check	=  McmUploadForm.solcatId;
		 	if ( check!=null)
	  {
	  var solcatFlag = getSolcatId(document.McmUploadForm.solcatId.value);

	if (solcatFlag == false) {
		return false;
	}

	  }
  TD2492 -->  */
//window.status=document.McmUploadForm.McmHdnAListSize.value;
	var requestFlag = getRequestType(document.McmUploadForm.requestType.value);
	if (requestFlag == false) {
		return false;
	}	
	
	var requestName = document.getElementById("mat_request_name").value;	
	if(requestName == "" || requestName == " " ) {
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
	if (document.McmUploadForm.hdnOverRds.value=="TRUE"){
	overRidesFlag = overRidesCheck();
	if (overRidesFlag == false) {
		
		return false;
	}
	}

	if (extFlag == true && emailFlag == true && requestFlag == true &&  overRidesFlag == true) {
        document.McmUploadForm.uploadDefinitionName.value = document.McmUploadForm.requestType.value;
        if( document.McmUploadForm.uploadDefinitionName.value == "MAT_M_AND_P_ENTITLMNT_ADD_PRODUCTS"){ 
			document.McmUploadForm.uploadDefinitionName.value = "M_AND_P_ENTITLMNT_ADD_PRODUCTS";
		}
        document.McmUploadForm.reqType.value = document.McmUploadForm.requestType.value;
	    document.McmUploadForm.uploadButton.disabled=true;
		
		
	    document.McmUploadForm.action="<%=request.getContextPath()%>/ServiceSalesUpload";
		document.McmUploadForm.submit();
		
		
	}
}

function getExtension(value) {
  extString = value.substring(value.lastIndexOf('.') + 1,value.length);

  if (extString==null || extString=="") {
  	alert ("Locate File is a required field");
  	return false;
  }
  if (extString!="xls") {
  	alert ("Please load only an Excel file");
  	return false;
  }
  return true;
}
//<!--  Td2492 -->
// <!-- Td5082 -->

 /*  function getSolcatId(value) {
  if (value ==null || value=="") {
  	alert ("solcat Id is a required field");
  	return false;
  }
  return true;
}*/

//<!-- Td2492;saatmaku;12 oct 2007;end;Remove the validation for  solcatId in UI  -->

function getRequestType(value) {
  if (value ==null || value=="Please Select" || value=="") {
  	alert ("Request Type is a required field");
  	return false;
  }
else if (value == "MAT_TERMINATE_CONTRACT" || value == "CONTRACT_TERMINATIONS"){
confirm("This operation will terminate all the contracts in your spreadsheet at the header level (including all products underneath).This is a non revertible operation. Are you sure you should like to proceed?");
} 
return true;
}
 
function validateSingleEmail(fld)
{
    if( (fld.value==null) || (fld.value=="") || (fld.length==0) ) {
		alert ("Email is a required field");
		return false;
	}
	if(!fld.value)
	{
		return true;
	}
	regExp = new RegExp(" ", "g");
	var emailValue = fld.value.replace(regExp, ""); //fld.value;

    var emailArray = emailValue.split(",");
    for(i=0; i<emailArray.length; i++) {
        if(!validateEmail(emailArray[i]) ) {
            fld.focus();
            return false;
        }
    }
    return true;
}

function validateEmail(val) {
	var wordchar= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_,';
        var char1= val.charAt(0);
        var charN= val.charAt(val.length-1);
        var at= val.indexOf('@');
        var dot= val.indexOf('.',at+2);
        if(val.indexOf(' ') != -1 || at == -1 || dot == -1 || wordchar.indexOf(char1) == -1 || wordchar.indexOf(charN) == -1)
        {
            alert('The Email address entered field must contain a valid email address. ' );
            return false;
        }
    
        var pre_at= val.charAt(at-1);
        var post_at= val.charAt(at+1);
        var pre_dot= val.charAt(dot-1);
        var post_dot= val.charAt(dot+1);
   
    //	if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 || fld.value.indexOf('@',at+2) != -1)
        if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 )
        {
            alert('The Email address field must contain a valid email address.'  );
            fld.focus();
            return	 false;
        }
        return true;
}
  
  
 /* function getObj(name) {
  if (document.getElementById)
      { return document.getElementById(name); }
  else if (document.all)
      { return document.all[name]; }
  else if (document.layers)
      { return document.layers[name]; } }
  */
  function downloadTemplate()
  {
  var selectedTemplate=document.McmUploadForm.selectTemplate.value
  if (""==selectedTemplate)
  {
  alert("Select the template to download");
  return false;
  }
  else
  {
  //needs to be changed later..

 	var filepath = "<%=request.getContextPath()%>/docs/xlsTemplates/"+ selectedTemplate +".xls";
    window.open(filepath, "template_window");
  }
 	
  } 
  
  
  function reqChangeType()
  {
		
	var reqType=document.McmUploadForm.requestType.value;
	
	document.McmUploadForm.hidreqtype.value=reqType;

	if(""!=reqType){ 
		document.McmUploadForm.action="<%=request.getContextPath()%>/mcmindex.do?reqType="+reqType;
		submitForm(document.getElementById("McmUploadForm"));
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
 function requestStatus(reqId){
		document.McmUploadForm.action="<%=request.getContextPath()%>/mcmstatusdetailview.do?requestid="+reqId;
		document.McmUploadForm.submit();
  }

</script>
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
  <%//=request.getAttribute("loadattribs") %>
  <%//=request.getAttribute("emailid") %>
</head>
 <body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="">
 
    
  <div id="application_area">
	<!-- <div id="moduleContainerId"> -->
	<table height="16"><tr><td></td></tr></table>

	<div id="mod_1" class="mod_header" style="width:99%">
			<h2 class="mh_title" style="margin-left:15px;">
						Mass Contract Management
			</h2>	
	 </div> 
	
  
  
  
     <!-- Body Starts from here -->
	
	  <div id="marque_1" class="marque" style="width:99%; margin-left: 11px;"> 
	  
	<%
if(confirm){
%>
	<div id="messageBox" name="messageBox" style="display:block">
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
            <td width="100%"><span class="statusheader">File Upload Successful ...</span>
                <span class="status">
                    <BR><BR>


					<%  
						StringBuffer url = request.getRequestURL();		
						String urll = url.toString();
						if(url.indexOf("TESTF")!=-1)
						urll = url.substring(0,url.indexOf("TESTF"));
						
						
						String helpUrl = (String)session.getAttribute("Xtrack_Help_URL");
						int lastIndex = helpUrl.lastIndexOf("/");
						String xtrackJVM = helpUrl.substring(0,lastIndex);
					%>                  
                                                 
                   Request Number: <a href="<%=xtrackJVM %>/requestStatusDispatch.do?methodName=onRequestAction"><%=session.getAttribute("processRequestId")%></a> <br>
					Request Name: <%=request.getParameter("mat_request_name")%><br>  
                    Email Addresses: <%=request.getParameter("email")%>  <br>
                                                 
                    
      
                        
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
	</div>
<%}%>
	 
	<form  name="McmUploadForm" id="McmUploadForm"  method="post" enctype="multipart/form-data">
	
    <table align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" width="100%">
     <tr><td height="5"></td></tr>
        <tr>
           <td width="5"></td>
            <td >
                <TABLE cellSpacing=0 cellPadding=0 width="60%" border="0">
                    <TBODY>
                  
					<%
					
					%>
					
                        <TR>
                            <TD class=contentbold colspan="2" align="left"><font size="2" color="red">
							<bean:message  key="MCM.MAIN.DOWNLOADTEMPLATE"/></font>
                            </TD>
                        </TR>
                       <!--  <TR bgcolor="#FFFFFF">
                            <TD class=contentbold colspan="2">&nbsp;</TD>
                        </TR> -->
                      <TR>
                           <!--  <TD colspan="2" class=contentbold>  -->
					
							<table width="75%" border="0" cellspacing="0" cellpadding="2">
                               <!--  <table> -->
                                    <tr>
									
									<TD  noWrap width=130 align = "right">
									<!-- <bean:message  key="MCM.MAIN.TEMPLATE"/> -->
									<label for="TEMPLATE">
										<!-- <bean:message key="MCM.MAIN.UPLOAD.TEMPLATE"/> 
										Need to pick from Properties file-->
									Template
									</TD>
                                        <td align ="left" width="81%">   										
                                        <select name="selectTemplate"> 
                                           <c:forEach var="templ" items="${loadattribs1}"> 
                                              <option value="<c:out value="${templ.id}"/>"><c:out value="${templ.description}"/></option> 
										    </c:forEach> 
										  </select>                                         
                                       <!--  </td>
                                        <td  width="49%" align="left"> -->
                                            <input type=button value="Download" name="DownloadTemplate" onclick="javascript:downloadTemplate()" />
                                        </td>
                                    </tr>
                                </table>
                            </td> 
                        </TR>  
						 <%
						   if(map.containsKey(McmConstants.MASS_MAT_UPLD_ACTIONS))
						   {	//request.setAttribute("userRole","abc");
							
							   if(request.getAttribute("userRole").equals(McmConstants.XXCSS_CS_OPS) ||
									request.getAttribute("userRole").equals(McmConstants.XXCSS_OPS_SUPER_USR)||
									request.getAttribute("userRole").equals(McmConstants.XXCSS_PORTABLE_SOLUTION)){
						   %>
						<tr>
							<td width="100%" colspan="4">
								<hr color="#7f7f7f">	
							</td>
						</tr>
                          <TR>
						   <td width="5"></td>
                            <TD class=contentbold colspan="2" ><font size="2" color = "red" ><bean:message  key="MCM.MAIN.UPLOAD.HEADER"/></font>
                            </TD>
                        </TR>  
                      
						 <TR>
						 <td width="5"></td>
                           <TD colspan="2" class=contentbold>
						  
						   <table width="95%"  border="0" cellspacing="0" cellpadding="2">                           
                            <TR>
							
                            <TD width="10%" align="right" noWrap>
                                <!-- <bean:message  key="MCM.MAIN.UPLOAD.REQUESTTYPE"/> -->
								<label for="RequestType">
							 <bean:message key="MCM.MAIN.UPLOAD.REQUESTTYPE"/>
							</label>
                            </TD>
                            <TD class=content noWrap width="35%">                        
                            
                            <select name="requestType" id="requestType" onchange="javascript:reqChangeType()"> 
                              <option selected ><%=rb.getString(McmConstants.DefaultValue)%></option>
                            		       <c:forEach var="reqsType" items="${loadattribs}"> 
                                              <option value="<c:out value="${reqsType.id}"/>"><c:out value="${reqsType.description}"/></option> 
										    </c:forEach> 
										  </select> 
								
                            </TD>
                       
					       
                            <TD noWrap width="10%" align="right" >
                                <!-- <bean:message  key="MCM.MAIN.UPLOAD.REQUESTNAME"/> -->
								<label for="RequestName">
							 <bean:message key="MCM.MAIN.UPLOAD.REQUESTNAME"/>
							</label>
                            </TD>
                            <TD class=content noWrap width="20%">
                            <input type=text maxlength="80" size="30" id="mat_request_name" name="mat_request_name" onblur="checkSpecialChars(this)" /> </TD>

							
                            <!-- <TD class=contentbold noWrap width=110 align="right">
                                <bean:message  key="MCM.MAIN.UPLOAD.NOTES"/>
                            </TD> -->
							<td  noWrap width="5%" align="right">
							<label for="Notes">
							 <bean:message key="MCM.MAIN.UPLOAD.NOTES"/>
							</label>
                           </td>
							<TD class=content noWrap width="20%">
    							<input type=text maxlength="80" size="30" name="notes" />
  							</TD>
							
                            </TR>
						 
					   <TR>
							
                                            
                            <TD  align = "right" noWrap>
                               <!--  <bean:message  key="MCM.MAIN.UPLOAD.LOCATEFILE"/> -->
							   <label for="FILENAME">
							 <!-- <bean:message key="MCM.MAIN.UPLOAD.LOCATEFILE"/> -->
							 FileName/Path
							 </label>
                            </TD>
                            <td >
                                <input type=file   maxlength="80" size="47" name="fileName" MAXFILESIZE='10240000'/>
                                   
                            </td>
							
                            <TD align="right" noWrap>
                                <!-- <bean:message  key="MCM.MAIN.UPLOAD.EMAIL"/> -->
								<label for="Email">
							 <bean:message key="MCM.MAIN.UPLOAD.EMAIL"/>
							 </label>
                            </TD>
                            <TD class=content noWrap align="left">
                                <% // some  condition here %>
                                    <input type=text  size="30" maxlength="256"  name="email" value=<c:out value="${email}"/> >

                                     
                               
                                   <!--  <span><img src="https://www.cisco.com/apps-ui/generic/interim/images/Required_Alert.gif" width="60" height="9"></span> -->
                            </TD>
							<!-- Td2492;saatmaku;12 oct 2007;start;Remove the validation for  solcatId in UI  -->

							<!-- Td5082;start;alonikar;13 jul 2007;Added the code to display solcatId in UI -->
                     
							<% /*if ( (null == request.getParameter("reqType")) || 		     !((request.getParameter("reqType").equals("IBCFG_EXP"))||
							(request.getParameter("reqType").equals("MAT_SEARCH_SITES"))||
							(request.getParameter("reqType").equals("MAT_UE_MOVE_S2S_PRODUCT")) ||
							(request.getParameter("reqType").equals("MAT_CREATE_SITES")) ||
							(request.getParameter("reqType").equals("PORTABLE_SOLUTIONS"))) ) 
							{ */%>
							
                       		<!-- <TR> -->
							<!-- <TD align = "right" noWrap width=110>
    							<!-- <bean:message  key="MCM.MAIN.UPLOAD.SOLCATID"/> 
								<label for="RequestType">
							 <bean:message key="MCM.MAIN.UPLOAD.SOLCATID"/>
							 </label>
  							</TD>
  							<TD class=content noWrap width="120">
    							<input type=text maxlength="80" size="30" name="solcatId" />
  							</TD> -->
                       		<!--  </TR> -->
						<%  //} else  %>	
						

						<!-- <TD class=contentbold align = "right" noWrap width=130> -->
						<% //} %>
						 <!--  TD5082;end;alonikar  %> -->
						<!-- Td2492;saatmaku;12 oct 2007;end;Remove the validation for  solcatId in UI  -->
                      <td  noWrap align="right">
							&nbsp;
                           </td>
							<TD class=content noWrap width="120">
    							&nbsp;
  							</TD>
						</tr>
						
						</table>
                        </td>
                      </TR>
				
					  <tr height=7><td></td></tr>
					 
					   
                        
                        <input type="hidden" name="hdnOverRds" value="<%=overRdsFlg%>" />
						
                    </TABLE>

					<div name="showList" id="showList">						
					</div>
					<span id="Text"></span>

					</div> 

					<!--  </td>
					<td>&nbsp;</td>
					</tr>  -->
					<div id="to_align" style="width:99%">
						<div id="button_1" class="button_block"  >
						
						<!-- button component -->
							<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
								
								<tr>
									<td class="button_left" onClick="document.getElementById('uploadButton').click();"></td>
									<td><input id="uploadButton" class="button" type="button" name="uploadButton" value="Submit" onClick="javascript:validateForm(this)" /></td>
									<td class="button_right" onClick="document.getElementById('uploadButton').click();"></td>
								</tr>
							</table>
							
							<!-- button component -->
							<table class="primary_enabled" style="float:left" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="button_left" onClick="document.getElementById('clear').click();"></td>
									<td><input id="clear" class="button" type="reset" name="clear" value="Clear" /></td>
									<td class="button_right" onClick="document.getElementById('clear').click();"></td>
								</tr>
							</table>
						
						</div>

					</div>
					
			
	  

	   
	  
	
		<input type="hidden" name="uploadDefinitionName" value=""/>
		<input type="hidden" name="reqType" value=""/>
		<input type="hidden" value="/jsp/tiles/fwrd.jsp" name="redirecturl" />
		<input type="hidden" value="/errorPage.do" name="errorRedirectUrl" />
		<!--<input type="hidden" name="isOnlineProcess" value="true"/>-->
		<input type="hidden" name="isOnlineProcess" value="false"/>
	<input type="hidden" name="hidreqtype" value='<%=request.getParameter("reqType")%>' />
	<input type="hidden" name="userrole" value='<%=request.getAttribute("userRole")%>'/>
	<input type="hidden" name="processRequestId" value='<%=request.getAttribute("processRequestId")%>' />
	
    </form>
	
	</div>
	
	<!-- </div> -->
  </body>
</html>
	  <% } %>
<%
	}
	  %>

																																	