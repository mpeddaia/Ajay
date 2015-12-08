<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Parameters.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
  </head>  
  
    <script language="JavaScript">
    
    function fetchInstallSites(jsonstr){
    alert("---------inside parent jsp json string out put is "+jsonstr);
    }
    
    function showChild() {
    
    	var withincontext = document.getElementById("withincontext").value;
    	
       	var context = document.getElementById("context").value;
       	var contextvalue = document.getElementById("contextvalue").value;
       	var status = document.getElementById("status").value;
    //	var ccouserid = document.getElementById("ccouserid").value;
	 //  	var authlevel = document.getElementById("authlevel").value; 
    	var sourcesystem = document.getElementById("sourcesystem").value;
    	  var pickerselectionvalue = document.getElementById("pickerselectionvalue").value;
    	  var quotenumber = document.getElementById("quotenumber").value;
	  // 	childwindow = window.open("../installSiteSelector.do?methodName=onshowPopup&withincontext="+withincontext+"&context="+context+"&contextvalue="+contextvalue+"&ccouserid="+ccouserid+"&sourcesystem="+sourcesystem+"&authlevel="+authlevel+"&pickerselectionvalue="+pickerselectionvalue+"&status="+status,"childWin","width=850,height=600, scrollbars");
	    //alert("show child");
	   	childwindow = window.open("../installSiteSelector.do?methodName=onshowPopup&withincontext="+withincontext+"&context="+context+"&contextvalue="+contextvalue+"&quotenumber="+quotenumber+"&sourcesystem="+sourcesystem+"&pickerselectionvalue="+pickerselectionvalue+"&status="+status+"&quotenumber="+quotenumber,"childWin","width=992,height=625, scrollbars,status=yes, resizable=yes");
    	childwindow.creator=self;
   		return false;
    	    	
    }
    
    	function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('testform').reset();
				return false;
			}
			
			if ((document.getElementById("Scenarios").value) == 1) {
				// Internal - Generic
				document.getElementById("withincontext").value = "N";
				document.getElementById("context").value = "";
				document.getElementById("contextvalue").value = "";
			}
			else if (((document.getElementById("Scenarios").value) == 2) || ((document.getElementById("Scenarios").value) == 4)) {
				// Internal or External - Context to Quote
				document.getElementById("withincontext").value = "Y";
				document.getElementById("context").value = "QUOTE";
				document.getElementById("contextvalue").value = "162843";
				document.getElementById("quotenumber").value = "16764";
			}
			else if (((document.getElementById("Scenarios").value) == 3) || ((document.getElementById("Scenarios").value) == 5)) {
				// Internal or External - Context to Contract
				document.getElementById("withincontext").value = "Y";
				document.getElementById("context").value = "CONTRACT";
				document.getElementById("contextvalue").value = "2421291";
			}
			else {
				// External - Context to Contracts
				document.getElementById("withincontext").value = "Y";
				document.getElementById("context").value = "CONTRACT";
				document.getElementById("contextvalue").value = "";
			}
			document.getElementById("status").value = "ACTIVE";
			document.getElementById("pickerselectionvalue").value = "MULTIPLE";
			document.getElementById("sourcesystem").value = "XXCSS_CT";
		}
    
  </script>
  <body>
    This JSP Page tests the <b>Install Site Selector UI</b>. <br><br>
    <form  action="./installSiteSelector.do?methodName=onshowPopup" name="testform" method="get" >
    	<input type="hidden" name="methodName" value="onshowPopup">
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - Generic</option>
						<option value="2">Internal - Context to Quote</option>
						<option value="3">Internal - Context to Contract</option>
						<option value="4">External - Context to Quote</option>
						<option value="5">External - Context to Contract</option>
						<option value="6">External - Context to Contracts</option>
					</select>
				</td>
			</tr>
		    <tr>
		    	<td>Within Context: (Y/N) </td>
		    	<td><input type="text" id="withincontext" name="withincontext"> </td>
		    </tr>
		    <tr>
		    	<td>Context: (CONTRACT/QUOTE) </td>
		    	<td><input type="text" id="context" name="context" ></td>
		    </tr>
		    <tr>
		    	<td>ContextValue: () </td>
		    	<td><input type="text" id="contextvalue" name="contextvalue" ></td>
		    </tr>
		    <tr>
		    	<td>QuoteNumber: () </td>
		    	<td><input type="text" id="quotenumber" name="quotenumber" ></td>
		    </tr>
		    <tr>
		    	<td>Status: (A) </td>
		    	<td><input type="text" id="status" name="status"></td>
		    </tr>
		    <tr>
		    	<td>Source System: (XXCSS_SOM) </td>
		    	<td><input type="text" id="sourcesystem" name="sourcesystem"></td>
		    </tr>
		    <tr>
		    	<td>Picker selection value: (single) </td>
		    	<td><input type="text" id="pickerselectionvalue" name="pickerselectionvalue"></td>
		    </tr>
			<tr>
		    	<td>Quote Number (optional)</td>
		    	<td><input type="text" id="quotenumber" name="quotenumber"></td>
		    </tr>
			<!-- 	
				Cco UserId :jdoe  <input type="text" id="ccouserid" name="ccouserid"><BR>
				Authlevel : 4 <input type="text" id="authlevel" name="authlevel"><BR>
			-->
		    <tr>
	    		<td colspan="2">&nbsp; </td>
	    	</tr>
		    <tr>
	    		<td>OUTPUT: </td>
	    		<td><input type="text" id="installsite" readonly>&nbsp;<input type = "submit" name="submit" value="Go" onclick="javascript:showChild(); return false;"/></td>
	    	</tr>
			<!--     <input type = "submit" name="submit" value="submit"/> -->
		</table>
    </form>
  </body>
</html>

