



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
			var url = "../custSelectorDispatch.do?methodName=onshowPopup";
			url += "&strWithinContext="+document.getElementById("strWithinContext").value;
			url += "&strContext="+document.getElementById("strContext").value;
			url += "&strContextValue="+document.getElementById("strContextValue").value;
			url += "&strSourceSystem="+document.getElementById("strSourceSystem").value;
			url += "&strSearchHier="+document.getElementById("strSearchHier").value;
			url += "&strRequestedData="+document.getElementById("strRequestedData").value;
			url += "&strStatus="+document.getElementById("strStatus").value;
			url += "&strSelectType="+document.getElementById("strSelectType").value;
			// alert("URL : " + url);
			childwindow =window.open(url,"CustomerSelector", "width=500, height=460, scrollbars, resizable=yes");
			childwindow.creator=self;
			
			//return false;
		}

		 function xtrack_customerselector(JSONObj,abc) {
			var mJSONObj = eval("(" + JSONObj + ")");
			var len=mJSONObj.CustomerSelector.length;
			//alert(len);
			var str="";
			 for(var i=0; i<len ;i++){
				str+= mJSONObj.CustomerSelector[i].CustomerNumber+","+mJSONObj.CustomerSelector[i].CustomerName+","; 
		}
		 //alert(str);
			document.getElementById("result").value = str.substring(0,str.length-1);
		}

		function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('customerWelcomeForm').reset();
				return false;
			}
			
			if ((document.getElementById("Scenarios").value) == 1) {
				// Internal - CSC Generic
				document.getElementById("strWithinContext").value = "N";
				document.getElementById("strContext").value = "";
				document.getElementById("strContextValue").value = "";
				document.getElementById("strSearchHier").value = "CSC";
				document.getElementById("strRequestedData").value = "BOTH";
			}
			else if ((document.getElementById("Scenarios").value) == 2) {
				// Internal - Context to Opp. ID
				document.getElementById("strWithinContext").value = "Y";
				document.getElementById("strContext").value = "Opportunity";
				document.getElementById("strContextValue").value = "4088541";
				document.getElementById("strSearchHier").value = "CSC";
				document.getElementById("strRequestedData").value = "BOTH";
			}
			else {
				// External - ERP & CSC Generic
				document.getElementById("strWithinContext").value = "Y";
				document.getElementById("strContext").value = "CONTRACT";
				document.getElementById("strContextValue").value = "";
				document.getElementById("strSearchHier").value = "";
				document.getElementById("strRequestedData").value = "";
			}
			document.getElementById("strStatus").value = "ACTIVE";
			document.getElementById("strSelectType").value = "MULTIPLE";
			document.getElementById("strSourceSystem").value = "XXCSS_CT";
		}

	</script>
  </head>  
  
  <body>
    This JSP Page tests the <b>Customer Selector UI</b>. <br><br>
    <form action="#" name="customerWelcomeForm" method="get" >
    	<input type="hidden" name="methodName" value="onshowPopup">
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - CSC Generic</option>
						<option value="2">Internal - Context to Opp. ID</option>
						<option value="3">External - ERP & CSC Generic</option>
					</select>
				</td>
			</tr>
		    <tr>
		    	<td>Within Context: (Y/N) </td>
		    	<td><input type="text" id="strWithinContext" name="strWithinContext"> </td>
		    </tr>
		    <tr>
		    	<td>Context: (Opportunity) </td>
		    	<td><input type="text"  id="strContext" ></td>
		    </tr>
		    <tr>
		    	<td>Context Value: (4088541/4088542) </td>
		    	<td><input type="text"  id="strContextValue" ></td>
		    </tr>
		    <tr>
		    	<td>Search Hier: (CSC) </td>
		    	<td><input type="text" id="strSearchHier" ></td>
		    </tr>
		    <tr>
		    	<td>Source System: (XXCSS_SOM) </td>
		    	<td><input type="text"  id="strSourceSystem"></td>
		    </tr>
		    <tr>
		    	<td>Requested Data: (BOTH) </td>
		    	<td><input type="text"  id="strRequestedData"></td>
		    </tr>
		    <tr>
		    	<td>Status: (ACTIVE) </td>
		    	<td><input type="text"  id="strStatus"></td>
		    </tr>
		    <tr>
		    	<td>SelectType: (MULTIPLE/SINGLE) </td>
		    	<td><input type="text"  id="strSelectType"></td>
		    </tr>
		    <tr>
	    		<td colspan="2">&nbsp; </td>
	    	</tr>
		    <tr>
	    		<td>OUTPUT: </td>
	    		<td><input type="text" id="result" readonly>&nbsp;<input type ="submit" name="submit" value="Go" onclick="javascript:getResult(); return false;"/></td>
	    	</tr>
		</table>	</form>
</body>
</html>

