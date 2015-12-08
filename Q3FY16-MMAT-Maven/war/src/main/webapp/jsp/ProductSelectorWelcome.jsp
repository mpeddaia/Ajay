



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
			var url = "../productSelectorDispatch.do?methodName=onshowPopup";
			url += "&strWithincontext="+document.getElementById("strWithincontext").value;
			url += "&strContext="+document.getElementById("strContext").value;
			url += "&strContextValue="+document.getElementById("strContextValue").value;
			url += "&strSourceSystem="+document.getElementById("strSourceSystem").value;
			url += "&strCCOUserId="+document.getElementById("strCCOUserId").value;
			url += "&strStatus="+document.getElementById("strStatus").value;
			url += "&strSelectType="+document.getElementById("strSelectType").value;
			//url += "&parentElementId="+document.getElementById("result").value;
				//alert("URL : " + url);
			window.open(url,"ProductSelector", "width=600, height=550, scrollbars, status=yes, resizable=yes");
			//return false;
		}

		 function xtrack_productselector(JSONObj) {
		 alert('JSON string in parent window: ' + JSONObj);
			var mJSONObj = eval("(" + JSONObj + ")");
			var len=mJSONObj.ProductSelector.length;
			alert("length of JSON Object:: " + len);
			var str="";
			 for(var i=0; i<len ;i++){
				str+= mJSONObj.ProductSelector[i].ProductNumber+","; 
		}
		 //alert('JSON string in parent window: ' + str);
			document.getElementById("result").value = str.substring(0,str.length-1);
		}

		function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('productWelcomeForm').reset();
				return false;
			}
			
			if ((document.getElementById("Scenarios").value) == 1) {
				// Internal - Generic
				document.getElementById("strWithincontext").value = "N";
				document.getElementById("strContext").value = "";
				document.getElementById("strContextValue").value = "";
			}
			else if (((document.getElementById("Scenarios").value) == 2) || ((document.getElementById("Scenarios").value) == 4)) {
				// Internal or External - Context to Quote
				document.getElementById("strWithincontext").value = "Y";
				document.getElementById("strContext").value = "QUOTE";
				document.getElementById("strContextValue").value = "444";
			}
			else if (((document.getElementById("Scenarios").value) == 3) || ((document.getElementById("Scenarios").value) == 5)) {
				// Internal or External - Context to Contract
				document.getElementById("strWithincontext").value = "Y";
				document.getElementById("strContext").value = "CONTRACT";
				document.getElementById("strContextValue").value = "2421291";
			}
			else {
				// External - Context to Contracts
				document.getElementById("strWithincontext").value = "Y";
				document.getElementById("strContext").value = "CONTRACT";
				document.getElementById("strContextValue").value = "";
			}
			document.getElementById("strStatus").value = "ACTIVE";
			document.getElementById("strSelectType").value = "MULTIPLE";
			document.getElementById("strSourceSystem").value = "XXCSS_CT";
		}

	</script>

  </head>  
  
  <body>
    This JSP Page tests the <b>Product Selector UI</b>. <br><br>
     <form action="#" name="productWelcomeForm" method="get" > 
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
		    	<td><input type="text" id="strWithincontext" name="strWithincontext"> </td>
		    </tr>
		    <tr>
		    	<td>Context: (CONTRACT/QUOTE)</td>
		    	<td><input type="text" id="strContext" name="strContext" ></td>
		    </tr>
		    <tr>
		    	<td>ContextValue: (2421291)</td>
		    	<td><input type="text" id="strContextValue" name="strContextValue" ></td>
		    </tr>
		    <tr>
		    	<td>SourceSystem: (XXCSS_SCM/CT)</td>
		    	<td><input type="text" id="strSourceSystem" name="strSourceSystem"></td>
		    </tr>
		    <tr>
		    	<td>CCO User Id: (A-ALGER/mjamsand)</td>
		    	<td><input type="text" id="strCCOUserId" name="strCCOUserId"></td>
		    </tr>
		    <tr>
		    	<td>Status: (ACTIVE)</td>
		    	<td><input type="text" id="strStatus" name="strStatus"></td>
		    </tr>
		    <tr>
		    	<td>SelectType: (MULTIPLE/SINGLE)</td>
		    	<td><input type="text" id="strSelectType" name="strSelectType"></td>
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

