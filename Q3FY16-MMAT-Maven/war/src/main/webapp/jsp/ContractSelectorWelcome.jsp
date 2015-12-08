
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'Parameters.jsp' starting page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

	<script language="Javascript">
		function getResult() {
			var url = "../contractSelectorDispatch.do?methodName=onshowPopup";
			url += "&strWctx="+document.getElementById("strWctx").value;
			url += "&Context="+document.getElementById("Context").value;
			url += "&ContextValue="+document.getElementById("ContextValue").value;
			url += "&strSourceSystem="+document.getElementById("strSourceSystem").value;
			url += "&strCCOUserId="+document.getElementById("strCCOUserId").value;
			url += "&status="+document.getElementById("status").value;
			url += "&opt="+document.getElementById("opt").value;
			url += "&strAuthLevel="+document.getElementById("strAuthLevel").value;
			//url += "&parentElementId="+document.getElementById("result").value;
		 	//alert("URL : " + url);
			childwindow = window.open(url,"ContractSelector", "width=850, height=600, scrollbars, status=yes, resizable=yes");
			childwindow.creator=self;
			return false;
		}

		function xtrackselector(xStr,yStr)
		{
			alert("JSON string inside parent page: " + yStr + ' :: ' +xStr);		
		}

		function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('contractWelcomeForm').reset();
				return false;
			}
			
			if ((document.getElementById("Scenarios").value) == 4) {
				// External - Context to Contracts
				document.getElementById("strWctx").value = "Y";
				document.getElementById("Context").value = "CONTRACT";
				document.getElementById("ContextValue").value = "";
			}
			else if ((document.getElementById("Scenarios").value) == 1) {
				// Internal - Generic
				document.getElementById("strWctx").value = "N";
				document.getElementById("Context").value = "";
				document.getElementById("ContextValue").value = "";
			}
			else {
				// Internal or External - Context to Quote
				document.getElementById("strWctx").value = "Y";
				document.getElementById("Context").value = "QUOTE";
				document.getElementById("ContextValue").value = "444";
			}
			document.getElementById("status").value = "ACTIVE";
			document.getElementById("opt").value = "MULTIPLE";
			document.getElementById("strSourceSystem").value = "XXCSS_CT";
		}
		
	</script>



  </head>  
  
  <body>
    This JSP Page tests the <b>Contract Selector UI</b>. <br><br>
    <form action="#" name="contractWelcomeForm" method="get" >
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
		    	<td><input type="text" id="strWctx" name="strWctx"> </td>
		    </tr>
		    <tr>
	    		<td>Context: (CONTRACT/QUOTE) </td>
	    		<td><input type="text" id="Context" name="Context" > </td>
		    </tr>
		    <tr>
	    		<td>ContextValue: (444) </td>
	    		<td><input type="text" id="ContextValue" name="ContextValue" > </td>
		    </tr>
		    <tr>
	    		<td>SourceSystem: (SOM) </td>
	    		<td><input type="text" id="strSourceSystem" name="strSourceSystem"></td>
		    </tr>
		    <tr>
	    		<td>CCO User Id: (jode) </td>
	    		<td><input type="text" id="strCCOUserId" name="strCCOUserId"></td>
		    </tr>
		    <tr>
	    		<td>Status: (ACTIVE)  </td>
	    		<td><input type="text" id="status" name="status"></td>
		    </tr>
		    <tr>
	    		<td>SelectType: (MULTIPLE/SINGLE)  </td>
	    		<td><input type="text" id="opt" name="opt"></td>
		    </tr>
		    <tr>
				<td>Auth Type: (4) </td>
				<td><input type="text" id="strAuthLevel" name="strAuthLevel"></td>
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

