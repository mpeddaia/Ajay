

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'Parameters.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
	<script language="Javascript"><!--
		function getResult() {
			var url = "../userIdSelector.do?methodName=onshowPopup";
			url += "&strCCOUserId="+document.getElementById("strCCOUserId").value;
			url += "&strSourceSystem="+document.getElementById("strSourceSystem").value;
			url += "&context="+document.getElementById("context").value;
			url += "&userType="+document.getElementById("userType").value;
			url += "&strAuthLevel="+document.getElementById("strAuthLevel").value;
			url += "&selectionType="+document.getElementById("selectionType").value;
			//alert("URL : " + url);
			var childwindow=window.open(url,"UserIdSelector", "width=600, height=550, scrollbars");
			
			childwindow.creator=self;
			return false;
		}

		 function xtrackuseridselector(JSONObj) {
		 alert('json string parent page is ' + JSONObj);
			var mJSONObj = eval("(" + JSONObj + ")");
			var len=mJSONObj.USerIdSelector.length;
			alert("Length of JSON String : " +len);
		}

		function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('userIdWelcomeForm').reset();
				return false;
			}
			
			if ((document.getElementById("Scenarios").value) == 2) {
				// External - Context to Contracts
				document.getElementById("context").value = "CONTRACT";
				document.getElementById("userType").value = "EXTERNAL";
			}
			else {
				// Internal - CCO_USER
				document.getElementById("context").value = "CCO_USER";
				document.getElementById("userType").value = "INTERNAL";
			}
			
			document.getElementById("selectionType").value = "MULTIPLE";
			document.getElementById("strSourceSystem").value = "XXCSS_CT";
		}

	--></script>
    
  </head>  
  
  <body>
    This JSP Page tests the <b>UserID Selector UI</b>. <br><br>
    <form action="#" name="userIdWelcomeForm" method="get" >
    	<input type="hidden" name="methodName" value="onshowPopup">
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - CCO_USER</option>
						<option value="2">External - Context to Contracts</option>
					</select>
				</td>
			</tr>
		    <tr>
		    	<td>CCO UserId: () </td>
		    	<td><input type="text" id="strCCOUserId" name="strCCOUserId" value=""></td>
		    </tr>
		    <tr>
		    	<td>Source System: (SOM) </td>
		    	<td><input type="text" id="strSourceSystem" name="strSourceSystem"></td>
		    </tr>
		    <tr>
		    	<td>Context: (CCO_USER) </td>
		    	<td><input type="text" id="context" name="context"></td>
		    </tr>
		    <tr>
		    	<td>User Type: (EXTERNAL/INTERNAL) </td>
		    	<td><input type="text" id="userType" name="userType"></td>
		    </tr>
		    <tr>
		    	<td>Auth Level: () </td>
		    	<td><input type="text" id="strAuthLevel" name="strAuthLevel"></td>
		    </tr>
		    <tr>
		    	<td>Select Type: () </td>
		    	<td><input type="text" id="selectionType" name="selectionType"></td>
		    </tr>
		    <tr>
	    		<td colspan="2">&nbsp; </td>
	    	</tr>
		    <tr>
	    		<td>OUTPUT: </td>
	    		<td><input type="text" id="result" readonly>&nbsp;<input type = "submit" name="submit" value="Go" onclick="javascript:getResult(); return false;"/></td>
	    	</tr>
		</table>    
    </form>
  </body>
</html>

