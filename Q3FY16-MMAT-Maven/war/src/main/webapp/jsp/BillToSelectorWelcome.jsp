
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
			var url = "../billtoselect.do?methodName=onshowPopup";
			url += "&withinContext="+document.getElementById("withinContext").value;
			url += "&context="+document.getElementById("context").value;
			url += "&contextValue="+document.getElementById("contextValue").value;
			url += "&status="+document.getElementById("status").value;
			url += "&pickerSelection="+document.getElementById("pickerSelection").value;
			url += "&userType="+document.getElementById("userType").value;
			url += "&strSourceSystem="+document.getElementById("strSourceSystem").value;			
			//url += "&parentElementId="+document.getElementById("result").value;
			//	alert("URL : " + url);
			childwindow = window.open(url,"BillToSelector", "width=992, height=550, scrollbars, resizable=yes");
	    	childwindow.creator=self;
			//return false;
		}

		 function xtrack_billtoselector(JSONObj) {
		 alert('JSON string in parent page is : ' + JSONObj);
/*		 
			var mJSONObj = eval("(" + JSONObj + ")");
			var len=mJSONObj.BillToSelector.length;
			//alert(len);
			var str="";
			 for(var i=0; i<len ;i++){
				str+= mJSONObj.BillToSelector[i].BilltoID+","+mJSONObj.BillToSelector[i].BilltoName+","+
				mJSONObj.BillToSelector[i].Address1+","+mJSONObj.BillToSelector[i].Address2+","+
				mJSONObj.BillToSelector[i].Address3+","+mJSONObj.BillToSelector[i].City+","+
				mJSONObj.BillToSelector[i].State+","+mJSONObj.BillToSelector[i].PostalCode+","+
				mJSONObj.BillToSelector[i].Country+","; 
		}
		 //alert(str);
			document.getElementById("result").value = str.substring(0,str.length-1);
*/			
		}

		function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('billToWelcomeForm').reset();
				return false;
			}
			if ((document.getElementById("Scenarios").value) == 2) {
				document.getElementById("withinContext").value = "Y";
				document.getElementById("userType").value = "EXTERNAL";
				document.getElementById("context").value = "CONTRACT";
			}
			else {
				document.getElementById("withinContext").value = "N";
				document.getElementById("userType").value = "INTERNAL";
				document.getElementById("context").value = "";
			}
			document.getElementById("status").value = "ACTIVE";
			document.getElementById("pickerSelection").value = "MULTIPLE";
			document.getElementById("strSourceSystem").value = "XXCSS_CT";
		}

	</script>
  </head>  
  
  <body>
    This JSP Page tests the <b>BillTo Selector UI</b>. <br><br>
     <form action="#" name="billToWelcomeForm" method="get" >
     	<input type="hidden" name="methodName" value="onshowPopup">
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - Generic</option>
						<option value="2">External - Context to Contracts</option>
					</select>
				</td>
			</tr>
		    <tr>
		    	<td>Within Context: (N) </td>
		    	<td><input type="text" id="withinContext" name="withinContext"> </td>
		    </tr>
		    <tr>
		    	<td>Context: (CONTRACT/QUOTE) </td>
		    	<td><input type="text" id="context" name="context" ></td>
		    </tr>
		    <tr>
		    	<td>ContextValue: () </td>
		    	<td><input type="text" id="contextValue" name="contextValue" ></td>
		    </tr>
		    <tr>
		    	<td>Status: (ACTIVE) </td>
		    	<td><input type="text" id="status" name="status"></td>
		    </tr>
		    <tr>
		    	<td>SelectType: (MULTIPLE/SINGLE) </td>
		    	<td><input type="text" id="pickerSelection" name="pickerSelection"></td>
		    </tr>
		    <tr>
		    	<td>User Type: (EXTERNAL/INTERNAL) </td>
		    	<td><input type="text" id="userType" name="userType"></td>
		    </tr>
		    <tr>
		    	<td>Source System:  </td>
		    	<td><input type="text" id="strSourceSystem" name="strSourceSystem"></td>
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

