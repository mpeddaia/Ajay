<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge" />
     
<jsp:useBean id="handler" scope="request" class="com.cisco.crosstrack.offline.handlers.EmailFormatHandler" />

<%@ page import="java.math.BigDecimal,java.util.*,com.cisco.crosstrack.user.User" %> 
<%@ include file="localeInfo.jsp" %>  
  
<%  
    JSONRPCBridge.registerObject("handler",handler);
    String contextPath = request.getContextPath();
   
    User user=(User)session.getAttribute("User"); 
    String strUserName = request.getRemoteUser();
    String strUserMailId = user.getUserAttributes().getEmail();
    
    System.out.println("User email from the profile "+strUserMailId);
    if (strUserMailId == null || (strUserMailId.length() == 0)) 
         strUserMailId = strUserName+"@cisco.com";
    System.out.println("Final user email  "+strUserMailId);
 
 
 %>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='crosstrackEmail.title'/></title>
		<script language="JavaScript" src="../js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
	
	//System.out.println("combinedScriptLocation in Header.jsp : "+combinedScriptLocation);
	//System.out.println("combinedImagesLocation in Header.jsp : "+combinedImagesLocation);
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="../css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="../css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="../css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts 		
       <script type="text/javascript" src="../js/compjs/jsonrpc.js"></script>
	-->       
		<script language="JavaScript" src="../js/email.js" type="text/javascript"></script>
		<script language="JavaScript">
		function sendMail(varOpt)
		{
		/*
		if(varOpt=="1"){
		window.opener.document.getElementById("emailFormatType").value=document.EmailFrmName.emailFormat.value;
		}
		window.opener.document.getElementById("toName").value=document.EmailFrmName.toName.value;
		
		window.opener.document.getElementById("emailSubject").value=document.EmailFrmName.subject.value;
		window.opener.document.getElementById("emailComent").value=document.EmailFrmName.comment.value;
		if(document.getElementById("sameUser").checked)
  		  window.opener.document.getElementById("copyEmail").value="true";
  		 else 
		  window.opener.document.getElementById("copyEmail").value="false";
		
	
		
		  if(!validateEmail(document.EmailFrmName.emailAddress))
            return;
        window.opener.document.getElementById("emailAddress").value=document.EmailFrmName.emailAddress.value;     		
		window.opener.emailSubmit();
		
		*/
		
		  if(!validateEmail(document.EmailFrmName.emailAddress))
            return;
            
		var toName=document.EmailFrmName.toName.value;
		var emailAddress=document.EmailFrmName.emailAddress.value; 
		var emailSubject=document.EmailFrmName.subject.value;
		var emailComent=document.EmailFrmName.comment.value;
		var copyEmail=document.getElementById("sameUser").checked;
		
		var selfMail=document.getElementById("copySelf").value;
		window.opener.emailSubmit(toName, emailAddress, emailSubject, emailComent,copyEmail,selfMail);
		
		self.close();
		
		}
		
		
		function fulltrim(str)
      {
         while ((str.charAt(0) == " ") || (str.charAt(0) == "\t"))
         {
           //alert("Found a space in the beginning");
           str = str.substring(1,str.length);
         }

         while ((str.charAt(str.length-1) == " ") || (str.charAt(str.length-1) == "\t"))
         {
            //alert("Found a space in the end");
            str = str.substring(0,str.length-1);
         }

         return str;
      }

      function validateEmail(emailfield) 
      {
 
         if( (emailfield.value==null) || (emailfield.value=="") || (emailfield.length==0) )
         {
            alert ("Email address is a required field");
            emailfield.focus();
            return false;
         }
         if(!emailfield.value)
         {
            return true;
         }

         var newEmail = emailfield.value;
         //alert("emailField :"+newEmail);
         var fieldSize = emailfield.value.length;
         //alert("Size of email : "+fieldSize);
 
         newEmail = fulltrim(newEmail);
 
         //alert("emailField :"+newEmail);

         regExp = new RegExp(" ", "g");
         emailTrimmed = newEmail.replace(regExp, ",");
         //alert("emailField: " + emailTrimmed);
         emails=emailTrimmed.split(",");
         i=0;
         while(emails.length>i) {
            var fld=emails[i];

            var wordchar='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_';
            var val= fld;
            var char1= val.charAt(0);
            var charN= val.charAt(val.length-1);
            var at= fld.indexOf('@');
            var dot= fld.indexOf('.',at+2);
            if(fld.indexOf(' ') != -1 
                  || at == -1
                  || dot == -1 
                  || wordchar.indexOf(char1) == -1
                  || wordchar.indexOf(charN) == -1)
               {
               alert('Please enter a valid email-address');
               emailfield.select();
               return false;
            }
            var pre_at= val.charAt(at-1);
            var post_at= val.charAt(at+1);
            var pre_dot= val.charAt(dot-1);
            var post_dot= val.charAt(dot+1);
            if(wordchar.indexOf(pre_at) == -1 
                  || wordchar.indexOf(post_at) == -1
                  ||  wordchar.indexOf(pre_dot) == -1 
                  || wordchar.indexOf(post_dot) == -1
                  || fld.indexOf('@',at+2) != -1)
            {
               alert('Please enter a valid email-address');
               emailfield.select();
               return    false;
            }

            i++;
         }
         return true;
      }
		
		</script>
	</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->
	
	<%
	String strAppShrtName=(String)request.getParameter("appShortName");
	boolean eFrmt=true;
	int frmt=1;
	
	String reqName = "";
	reqName = (String)request.getParameter("strRequestName");
	if (reqName == null) 
	 reqName =  "";
	
	String subject ="";
	String body ="";
	String InvokedFromXtrack =  request.getParameter("InvokedFromXtrack");
    System.out.println("InvokedFromXtrack  "+InvokedFromXtrack);
	
	if("true".equalsIgnoreCase(InvokedFromXtrack)) {
	 
	 subject = (String)session.getAttribute("Xtrack_Email_subject");
	
	if (subject == null) subject = "";
	
	body = (String)session.getAttribute("Xtrack_Email_body");
	
	if (body == null) 	body = "";
	
	} 	else {
	subject = request.getParameter("subject");
	if (subject == null) subject = (String)request.getAttribute("subject");
	if (subject == null) subject = "";
	
	body = request.getParameter("body");
	if (body == null) body = (String)request.getAttribute("body");
	if (body == null) 	body = "";
	}
    
	
	
	if (null!=request.getParameter("emailFormatOpt") && "1".equals((String)request.getParameter("emailFormatOpt"))){
	eFrmt=false;
	frmt=0;
	}
//	String emailFormatOpt=(String)request.getParameter("emailFormatOpt");
	
	%>

	<body marginheight="0" marginwidth="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top"><img src="http://www.cisco.com/swa/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>
					<td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="http://www.cisco.com/swa/i/s.gif" alt="" height="8" width="100" border="0" /></td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="http://www.cisco.com/swa/i/s.gif" alt="" height="8" width="1" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='Common.closeWindow'/></a></td>
									<td align="left" valign="top" width="100%" background="http://www.cisco.com/swa/i/grn_vertlines_top.gif"><img src="http://www.cisco.com/swa/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- screen title -->
		<h1><fmt:message key='crosstrackEmail.email'/></h1>
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
		<form id="EmailFrmName" method="post" name="EmailFrmName" class="inline">
			<div class="marque">
				<h3><fmt:message key='crosstrackEmail.emailSettings'/></h3>
				
				<%-- commenting the code for format type. format type is passed as null to offline framework APIs.
				<%
				if(eFrmt){
				
				%>
				
				<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
				<colgroup>
				<col width="100" />
				</colgroup>
					<tbody>
						<tr>
							<td align="right"><label for="lblemailFormat">E-mail Format</label></td>
							<td><select name="emailFormat" id="emailFormat" class="inputTextLarge" size="1">
								<option value="-1" selected="selected">Select One</option>
								
							</select></td>
						</tr>
					</tbody>
				</table>
				<%}%>
				
				--%>
				
				
				<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
				<colgroup>
				<col width="100" />
				</colgroup>
					<tbody>
						<tr>
							<td align="right"></td>
							<td class="pop_heads"><label><strong><fmt:message key='crosstrackEmail.recipient'/></strong></label></td>
							<td align="right"></td>
							<td class="pop_heads"><label><strong><fmt:message key='crosstrackEmail.sender'/></strong></label></td>
						</tr>
						<tr>
							<td align="right"><label for="toName"><fmt:message key='crosstrackEmail.toName'/></label></td>
							<td><input type="text" name="toName" value="<%=request.getRemoteUser()%>" id="toName" class="inputTextXLarge" /></td>
							<td align="right"><label><fmt:message key='crosstrackEmail.fromName'/></label></td>
							<td class="readonly"><%=strUserName%></td>
						</tr>
						<tr>
							<td align="right"><label for="emailAddress"><fmt:message key='crosstrackEmail.emailAddress'/></label></td>
							<td><input type="text" name="emailAddress" id="emailAddress" value="<%=strUserMailId%>" class="inputTextXLarge" /></td>
							<td align="right"><label><fmt:message key='crosstrackEmail.emailAddress'/></label></td>
							<td class="readonly"><%=strUserMailId%></td>
						</tr>
					</tbody>
				</table>
				
				<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
				<colgroup>
				<col width="100" />
				</colgroup>
					<tbody>
						 <tr>
							<td align="right"></td>
							<td class="pop_heads"><label><strong><fmt:message key='crosstrackEmail.emailContent'/></strong></label></td>
						</tr>
						<tr>
							<td align="right"><label for="subject"><fmt:message key='crosstrackEmail.subject'/></label></td>
							<td><input type="text" name="subject" id="subject" value="<%=subject%>" class="inputTextVLarge" /></td>
						</tr>
						<tr>
							<td align="right" valign="top"><label for="comment"><fmt:message key='crosstrackEmail.comment'/></label></td>
							<td><textarea name="comment" id="comment"  class="textArea" rows="4"> <%=body%> </textarea></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td><input type="checkbox"  name="sameUser" id="sameUser" value=""/></td>
							<td align="right"><label for="sameUser"><fmt:message key='crosstrackEmail.sendMessage'/></label></td>
							<input type="hidden" name="copySelf" value="<%=strUserMailId%>" id="copySelf"/>
						</tr>

					</tbody>
				</table>
				
				
			</div>
			<!-- buttons start -->
			<div id="button_1" class="button_block_sm">
				<!-- button component -->
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('sendEmail').click();"></td>
						<td><input id="sendEmail" class="button" type="button" name="sendEmail" value="<fmt:message key='crosstrackEmail.sendEmail'/>" onclick="javascript:sendMail('<%=frmt%>')"/></td>
						<td class="button_right" onclick="document.getElementById('sendEmail').click();"></td>
					</tr>
				</table>
				<!-- button component -->
				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
					<tr>
						<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
						<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='Common.cancelButton'/>" /></td>
						<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
		
		
		
		<!-- modules end -->
	</body>

</html>