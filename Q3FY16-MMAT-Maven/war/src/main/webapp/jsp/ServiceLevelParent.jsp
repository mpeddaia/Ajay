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
    
    function fetchServiceLevels(jsonstr){
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
	  childwindow = window.open("../serviceLevelSelector.do?methodName=onshowPopup&withincontext="+withincontext+"&context="+context+"&contextvalue="+contextvalue+"&sourcesystem="+sourcesystem+"&status="+status+"&pickerselectionvalue="+pickerselectionvalue,"childWin","width=992,height=625, scrollbars, resizable=yes ");
	  childwindow.creator=self;
   		//return false;
    	    	
    }
    
    	function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('aaa').reset();
				return false;
			}
			
			if ((document.getElementById("Scenarios").value) == 1) {
				// Internal - Generic
				document.getElementById("withincontext").value = "N";
				document.getElementById("context").value = "";
				document.getElementById("contextvalue").value = "";
			}
			else if (((document.getElementById("Scenarios").value) == 2) || ((document.getElementById("Scenarios").value) == 3)) {
				// Internal or External - Context to Quote
				document.getElementById("withincontext").value = "Y";
				document.getElementById("context").value = "QUOTE";
				document.getElementById("contextvalue").value = "444";
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
    This JSP Page tests the <b>Service Level Selector UI</b>. <br><br>
    <form name="aaa" >
    	<input type="hidden" name="methodName" value="onshowPopup">
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - Generic</option>
						<option value="2">Internal - Context to Quote</option>
						<option value="3">External - Context to Quote</option>
						<option value="4">External - Context to Contracts</option>
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
		    	<td>Context Value: () </td>
		    	<td><input type="text" id="contextvalue" name="contextvalue" ></td>
		    </tr>
		    
		    <tr>
		    	<td>Status :Active/All </td>
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
	    		<td colspan="2">&nbsp; </td>
	    	</tr>
		    
	    	<TR>
  				<TD>
  					This is a test&nbsp;:&nbsp;<input type="text" name="installsite" value="" />&nbsp;
  					<img src="<%=basePath%>/images/global/buttons_and_icons/icons/icn_picker.gif" alt="Picker" height="13" width="13" align="middle" border="0" onclick="javascript:showChild();" />
  				</TD>
  			</TR>
		</table>
	</form>
  </body>
</html>

