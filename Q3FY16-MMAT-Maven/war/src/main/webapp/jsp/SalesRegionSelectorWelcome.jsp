
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>Sales Region Welcome Page</title>
    
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
			var url = "../salesRegionSelectorDispatch.do?methodName=onshowPopup";
			url += "&strHeirName="+document.getElementById("strHeirName").value;
			url += "&strHeirStatus="+document.getElementById("strHeirStatus").value;
			url += "&strNodeStatus="+document.getElementById("strNodeStatus").value;
			url += "&strSourceSystem="+document.getElementById("strSourceSystem").value;
			url += "&opt="+document.getElementById("opt").value;
			url += "&status="+document.getElementById("status").value;
			//url += "&parentElementId="+document.getElementById("result").value;
		 	//alert("URL : " + url);
			childwindow = window.open(url,"SalesRegionSelector", "width=850, height=600, scrollbars, resizable=yes");
			childwindow.creator=self;
			return false;
		}

		function xtrackselector(xStr,yStr)
		{
			alert("JSON string inside parent page: " + yStr + ' :: ' +xStr);		
		}
		
		function xtrack_salesregionselector(xStr){
			alert(xStr);
		}
		
		function populateFields() {
		
			if ((document.getElementById("Scenarios").value) == -1) {
				document.getElementById('salesregionWelcomeForm').reset();
				return false;
			}
			
			document.getElementById("strHeirName").value = "CREV";
			document.getElementById("strHeirStatus").value = "ACTIVE";
			document.getElementById("strNodeStatus").value = "ACTIVE";
			document.getElementById("status").value = "ACTIVE";
			document.getElementById("opt").value = "MULTIPLE";
			document.getElementById("strSourceSystem").value = "XXCSS_CT";
		}
				
	</script>



  </head>  
  
  <body>
    This JSP Page tests the <b>Sales Region Selector UI</b>. <br><br>
    <form action="#" name="salesregionWelcomeForm" method="get" >
    	<input type="hidden" name="methodName" value="onshowPopup">
	    <table>
	    	<tr>
		    	<td>Scenarios</td>
     			<td>
					<select size="1" name="Scenarios" id="Scenarios" onChange="javascript:populateFields(); return false;">
						<option value="-1" selected="selected">Select One</option>
						<option value="1">Internal - Generic</option>
					</select>
				</td>
			</tr>
		    <tr>
		    	<td>Heir Name: (CREV/CA) </td>
		    	<td><input type="text" id="strHeirName" name="strHeirName"> </td>
		    </tr>
		    <tr>
	    		<td>Heir Status: (ACTIVE/CONFIRMED) </td>
	    		<td><input type="text" id="strHeirStatus" name="strHeirStatus" > </td>
		    </tr>
		    <tr>
	    		<td>Node Status: (ACTIVE/INACTIVE/ALL) </td>
	    		<td><input type="text" id="strNodeStatus" name="strNodeStatus" > </td>
		    </tr>
		    <tr>
	    		<td>Source System: (XXCSS_SOM/XXCSS_SCM) </td>
	    		<td><input type="text" id="strSourceSystem" name="strSourceSystem"></td>
		    </tr>
		    <tr>
	    		<td>Status: (ACTIVE/ALL)  </td>
	    		<td><input type="text" id="status" name="status"></td>
		    </tr>
		    <tr>
	    		<td>Select Type: (MULTIPLE/SINGLE)  </td>
	    		<td><input type="text" id="opt" name="opt"></td>
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

