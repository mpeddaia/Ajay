<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ManageNotes Calling Page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my Manage Notes Page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    
     
  </head>  
  
  <%

   //Get the logged in user id here for any processing
   
   String contextPath = request.getContextPath();
     
  
%>
  
  <script>
	
	function showManageNotesChild() {
    	
    	var context = document.getElementById("context").value;
    	var contextvalue = document.getElementById("contextvalue").value;
    	var ccouserid = document.getElementById("ccouserid").value;
    	var sourcesystem = document.getElementById("sourcesystem").value;
    	var authlevel = document.getElementById("authlevel").value;
    	
	   	childwindow = window.open("<%= contextPath%>/manageNotes.do?methodName=onshowPopup&context="+context+"&contextvalue="+contextvalue+"&ccouserid="+ccouserid+"&sourcesystem="+sourcesystem+"&authlevel="+authlevel,"childWin","width=615,height=550, scrollbars, statusbar, resizable=yes");
    	childwindow.creator=self;
    	
    	//returnstring.innerHTML="This is the return string";
    	
   		//return false;
    	    	
    }
	
	function crosstrackManageNotes(xStr) {
    	alert("JSON string inside parent page: " + xStr);
	}

	function populateFields() {
		
		if ((document.getElementById("Scenarios").value) == -1) {
			document.getElementById('manageNotesForm').reset();
			return false;
		}
		
		if ((document.getElementById("Scenarios").value) == 1) {
			// Internal - Context to Quote
			document.getElementById("context").value = "QUOTE";
			document.getElementById("contextvalue").value = "10963";
			document.getElementById("sourcesystem").value = "XXCSS_QOT";
		}
		else if ((document.getElementById("Scenarios").value) == 2) {
			// Internal - Context to Quote
			document.getElementById("context").value = "CONTRACT";
			document.getElementById("contextvalue").value = "2421291";
			document.getElementById("sourcesystem").value = "XXCSS_SCM";
		}
		else {
			// Internal - Context to Opportunity
			document.getElementById("context").value = "OPPORTUNITY";
			document.getElementById("contextvalue").value = "4088541";
			document.getElementById("sourcesystem").value = "XXCSS_SOM";
		}
	}
			
    </script>   
  
  <body>
    This JSP Page tests the <b>Manage Notes Selector UI</b>. <br><br>
    <form  action="./manageNotes.do?methodName=onshowPopup" name="manageNotesForm" method="get" >
    	<input type="hidden" name="methodName" value="onshowPopup" >
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - Context to Quote</option>
						<option value="2">Internal - Context to Contract</option>
						<option value="3">Internal - Context to Opportunity</option>
					</select>
				</td>
			</tr>
		    <tr>
		    	<td>CCO user ID: (kkodali) </td>
		    	<td><input type="text" id="ccouserid" name="ccouserid" ></td>
		    </tr>
		    <tr>
		    	<td>Context: (CONTRACT/QUOTE) </td>
		    	<td><input type="text" id="context" name="context" ></td>
		    </tr>
		    <tr>
		    	<td>ContextValue: (1000016) </td>
		    	<td><input type="text" id="contextvalue" name="contextvalue" ></td>
		    </tr>
		    <tr>
		    	<td>SourceSystem: (XXCSS_QOT) </td>
		    	<td><input type="text" id="sourcesystem" name="sourcesystem"></td>
		    </tr>
		    <tr>
		    	<td>AuthLevel: (4) </td>
		    	<td><input type="text" id="authlevel" name="authlevel"></td>
		    </tr>
		    <tr>
	    		<td colspan="2">&nbsp; </td>
	    	</tr>
		    <tr>
		    	<td>Select Picker </td>
		    	<td>
		    	<input type = "submit" name="submit" value="Go" onclick="javascript:showManageNotesChild(); return false;"/></td>
		    </tr>
	    </table>
	    <div class="mod_grid_sm" id="returnstring">
	    
	   </DIV>
    </form>
  </body>
</html>
