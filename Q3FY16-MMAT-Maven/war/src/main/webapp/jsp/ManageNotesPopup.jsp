<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="localeInfo.jsp" %>
<jsp:useBean id="JSONRPCBridge1" scope="session"
	class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="manageNotesHandler" scope="request" 
	class="com.cisco.crosstrack.selector.handlers.ManageNotesHandler" /> 

<!--TO DO : Change genjava API name-->
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cisco.crosstrack.selector.data.dto.ManageNotesDTO" %>

<% 
 
	JSONRPCBridge1.registerObject("manageNotesHandlerRegObj", manageNotesHandler);
	
	String appContext = request.getContextPath();
	String context = (String)request.getAttribute("context");
	String contextvlaue = (String)request.getAttribute("contextvalue");
	String ccouserid = (String)request.getAttribute("ccouserid");
	String authlevel = (String)request.getAttribute("authlevel");
	String sourcesystem = (String)request.getAttribute("sourcesystem");
	String userType = (String) request.getAttribute("UserType");
	
	String sortColumn = (String) request.getAttribute("SORT_COLUMN");
	String lstKey = (String) request.getAttribute("NOTES_KEY");
	
	List noteTypeList = (List)request.getAttribute("noteTypeList");
      	
	Calendar cal = Calendar.getInstance();
	String[] monthName = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    
    // Get the components of the date
    int year = cal.get(Calendar.YEAR);             // 2006
    int month = cal.get(Calendar.MONTH);           // 0=Jan, 1=Feb, ...
    int day = cal.get(Calendar.DAY_OF_MONTH);      // 1...
    String sysDate = day + "-" + monthName[month] + "-" + year;
    
    String erMsg = "";
	if (null != request.getAttribute("ERRORMSG")) {
		erMsg = (String) request.getAttribute("ERRORMSG");
	}
	
	// commented to have MLS 
	//String title = "";	
	//title = " - " + context + " # " + contextvlaue;
%>


<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='ManageNotesSelector.manageNotes'/></title>

		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts 		
		<script type="text/javascript" src="js/jsonrpc.js"></script>
        <script type="text/javascript" src="js/datapersistence.js"></script>
        <script type="text/javascript" src="js/genJSON.js"></script>
        
	-->        
	<script type="text/javascript" src="js/ManageNotes.js"></script>
	<script type="text/javascript" src="js/popupAlerts.js"></script>
	<script type="text/javascript" src="js/child.js"></script>
	
<STYLE>
	.popup
	{
	COLOR: #000000;
	CURSOR: none;
	TEXT-DECORATION: none;
	}
</STYLE>

<script>
		var tempArray = new Array();
        var notesObjs = new Array();
        var noteIdArray = new Array();
//        noteIdArray = tempArray;

        function validateFormData(ctx, ctxval, ccouser, authlevel, sourcesytem,appctx,sysdate, userType)
		{
			var valid = false;

			if (validateNoteType()) {
				addNotes(ctx, ctxval, ccouser, authlevel, sourcesytem, sysdate, userType);
			}				
		}
		
		function confirmDialog(alertMessage) {
			execScript('num=msgbox("'+alertMessage+'","4132")',"vbscript");
			return(num==6);
		}
		
        function validateDeleteData(ctx, ctxval, ccouser, authlevel, sourcesytem, appctx, sortCol, key, userType)
		{
			//alert("inside validateDeleteData selected no is "+noteIdArray.length);
			var manageNoteAlerts = new ManageNoteAlerts();
			if (noteIdArray.length > 0){
			
				if (!confirmDialog(manageNoteAlerts.XXCSS_CT_650065)){
					return false;
				}
				
				deleteNotes(ctx, ctxval, ccouser, authlevel, sourcesytem, appctx, sortCol, key, userType);
				
			}else {
			  //alert("XXCSS_CT-650064: Please select Note(s) to delete and then click on Delete Note button.");
			  alert(manageNoteAlerts.XXCSS_CT_650064);
			  return false;
			}
		}
		        
     
        function createNoteIdArray(v)
        {
        	//alert(v);
           noteIdArray = modifyContent(noteIdArray, v);
          
        }

        function refreshNotesArray(v)
        {
           //alert('inside refreshArray for '+v);
           
            notesObjs = modifyContent(notesObjs, v);
       
        }

        function printSelectedItems()
        {
           printVal(notesObjs);
        }
        
		// Removes leading whitespaces
		function LTrim( value )
		{
			var re = /\s*((\S+\s*)*)/;

			return value.replace(re, "$1");
		}

		// Removes ending whitespaces
		function RTrim( value )
		{
			var re = /((\s*\S+)*)\s*/;

			return value.replace(re, "$1");
		}

		// Removes leading and ending whitespaces
		function trim( value )
		{
			return LTrim(RTrim(value));
		}

		//Special characters validations
		function charValidations(value) 
		{
		 	var manageNoteAlerts = new ManageNoteAlerts();
		 	var iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?";

		  	trimvalue = trim(value);

		  	for (var i = 0; i < trimvalue.length; i++) {

		  		if (iChars.indexOf(trimvalue.charAt(i)) != -1)
		  		{
		//			trimvalue.focus();
		  			//alert ("Entry has special characters. \n Please remove them and try again.");
		  			alert(manageNoteAlerts.entryHasSpecialChars);
		  			return false;
		  		}
		  	}
			return true;
		}

		function validateNoteType()
		{
			var manageNoteAlerts = new ManageNoteAlerts();
			var noteTypeObj = document.getElementById('noteType');
			var index = noteTypeObj.selectedIndex;
			//alert ("index is : " + index);

			var noteText = document.getElementById('noteText').value;
			
			//alert(noteText);
			
			if (index == 0) {
				//alert("XXCSS_CT-650063: Please select Notes Type.");
				alert(manageNoteAlerts.XXCSS_CT_650063);
				return false;
			}
			
			if (noteText == "") {
				//alert("XXCSS_CT-650073: Please enter Notes.");
				alert(manageNoteAlerts.XXCSS_CT_650073);
				return false;
			}
			
			if (noteText.length > 4000){
				//alert("XXCSS_CT-650072: Maximum characters allowed on Notes is limited to 4000 characters. Please modify and then Add.");
				alert(manageNoteAlerts.XXCSS_CT_650072);
				return false;

			}
			
			for (var i = 0; i < noteText.length; i++) {
				if (noteText.charCodeAt(i) > 127) {
					alert(manageNoteAlerts.entryHasSpecialChars);
					return false;
				}
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

	<body marginheight="0" marginwidth="0" onload="javascript:initialize('<%=context%>','<%=contextvlaue%>','<%=ccouserid%>','<%=authlevel%>','<%=sourcesystem%>','<%=appContext%>','<%=userType%>');">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top"><img src="<%=combinedImagesLocation%>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>
					<td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="100" border="0" /></td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="1" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='ManageNotesSelector.closeWindow'/></a></td>
									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<!-- screen title -->
  
	
	<%
		if(context.equalsIgnoreCase("QUOTE")){
		//title = " - " + context + " # " + contextvlaue;
		%>
				<h1><fmt:message key='ManageNotesSelector.manageNotes'/> - <fmt:message key='ManageNotesSelector.contextQuote'/> # <%=contextvlaue%></h1>
		<%
		}
		else if(context.equalsIgnoreCase("CONTRACT")) {
		%>
		
				<h1><fmt:message key='ManageNotesSelector.manageNotes'/> - <fmt:message key='ManageNotesSelector.contextContract'/> # <%=contextvlaue%></h1>
		<%
		}
		else {
		%>
				<h1><fmt:message key='ManageNotesSelector.manageNotes'/></h1>
		<%
		}
		%>

		<!-- modules start -->
		<div id="mod_1" class="mod_pop">

			<div class="marque">
				<h2><fmt:message key='ManageNotesSelector.addNote'/></h2>
				<table border="0" cellspacing="0" cellpadding="0">
				<colgroup>
				<col width="250" />
				</colgroup>
					<tbody>
						<tr>
<td valign="top">
<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td align="right"><label for="type"><fmt:message key='ManageNotesSelector.type'/></label></td>
	<td><select name="noteType" id="noteType" class="inputTextLarge" size="1">
		<option value="Select One" selected="selected"><fmt:message key='ManageNotesSelector.selectone'/></option>

<%
	noteTypeList = (List)request.getAttribute("noteTypeList");
	if (noteTypeList != null && noteTypeList.size() > 0) {
		for (int i=0; i < noteTypeList.size(); i++) {
			ManageNotesDTO mnDTO = (ManageNotesDTO)noteTypeList.get(i);
			if (mnDTO != null ) {
%>
			<option value="<%=mnDTO.getNoteTypeCode() %>" id="<%=mnDTO.getNoteTypeCode() %>" ><%=mnDTO.getNoteTypeDesc() %></option>
<%			
			}
		}
	}
%>
	</select></td>
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='ManageNotesSelector.user'/></label></td>
										<td class="readonly"><%=ccouserid%></td>
										<%--<SPAN title="<%=companyName%>" class="popup"><%=ccouserid%></SPAN> </td> --%>
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='ManageNotesSelector.date'/></label></td>
										<td class="readonly"><%=sysDate%></td>
									</tr>
								</table>
							</td>
							<td>
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td valign="top"><label for="note"><fmt:message key='ManageNotesSelector.note'/></label></td>
										<td><textarea name="noteText" id="noteText" class="textArea" rows="5" cols="30"></textarea></td>
									</tr>
								</table>
							</td>
						</tr>
						</tbody>
				</table>
				
				
			</div> <!-- marque end -->
			<!-- buttons start -->
			<div id="button_1" class="button_block_sm">
				<!-- button component -->
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('addNote').click();"></td>
						<td><input id="addNote" class="button" type="button" name="addNote" value="<fmt:message key='ManageNotesSelector.addNote'/>"  onclick="javascript:validateFormData('<%=context%>','<%=contextvlaue%>','<%=ccouserid%>','<%=authlevel%>','<%=sourcesystem%>','<%=appContext%>','<%=sysDate%>','<%=userType%>')" /></td>
						<td class="button_right" onclick="document.getElementById('addNote').click();"></td>
					</tr>
				</table>
				<!-- button component -->
				<!-- <table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close()">
					<tr>
						<td class="button_left" onclick="document.getElementById('close1').click();"></td>
						<td><input id="close1" class="button" type="reset" name="close1" value="Cancel" /></td>
						<td class="button_right" onclick="document.getElementById('close1').click();"></td>
					</tr>
				</table> -->
			</div> <!-- button_1 -->
</div> <!-- mod_1 end -->		
		
		<div id="mod_2" class="mod_pop"> 
		
<input type="hidden" name="appContext" id="appContext" value='<%=appContext%>'/>
<input type="hidden" name="context" id="context" value='<%=context%>'/>
<input type="hidden" name="contextvalue" id="contextvalue" value='<%=contextvlaue%>'/>
<input type="hidden" name="ccouserid" id="ccouserid" value='<%=ccouserid%>'/>
<input type="hidden" name="authlevel" id="authlevel" value='<%=authlevel%>'/>
<input type="hidden" name="sourcesystem" id="sourcesystem" value='<%=sourcesystem%>'/>
<input type="hidden" name="userType" id="userType" value='<%=userType%>'/>
<input type="hidden" name="errorString" id="errorString" value='<%=erMsg%>'/>

<div id="notesResults">
</div> <!-- notesResults end -->		
			<!-- buttons start -->
			<div id="button_2" class="button_block_sm">
				<!-- button component -->
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('deleteNote').click();"></td>
						<td><input id="deleteNote" class="button" type="submit" name="deleteNote" value="<fmt:message key='ManageNotesSelector.deleteNote'/>" onclick="javascript:validateDeleteData('<%=context%>','<%=contextvlaue%>','<%=ccouserid%>','<%=authlevel%>','<%=sourcesystem%>','<%=appContext%>','<%=sortColumn%>','<%=lstKey%>','<%=userType%>');"/></td>
						<td class="button_right" onclick="document.getElementById('deleteNote').click();"></td>
					</tr>
				</table>
				<!-- button component -->
				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close()">
					<tr>
						<td class="button_left" onclick="document.getElementById('close2').click();"></td>
						<td><input id="close2" class="button" type="reset" name="close2" value="<fmt:message key='ManageNotesSelector.cancel'/>" /></td>
						<td class="button_right" onclick="document.getElementById('close2').click();"></td>
					</tr>
				</table>
			</div> <!-- button_2 end -->

		</div> <!-- mod_2 end -->

		<!-- modules end -->
	</body>

</html>