<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>Delete Saved Set Welcome Page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
	<script language="Javascript">
		function getResult() {
			var url = "../deleteSavedSet.do?methodName=loadFunctions&page=delete";			
			url += "&sourcesystem="+document.getElementById("sourcesystem").value;
			url += "&context="+document.getElementById("context").value;
			url += "&XtrackHelpContext="+document.getElementById("XtrackHelpContext").value;
			//alert("URL : " + url);
			var childwindow=window.open(url,"deleteSavedSet", "width=600, height=550, scrollbars");
			
			childwindow.creator=self;
			return false;
		}

		 function xtrackuseridselector(JSONObj) {
		 alert('json string parent page is ' + JSONObj);
			var mJSONObj = eval("(" + JSONObj + ")");
			var len=mJSONObj.UserIdSelector.length;
			//alert(len);
			var str="";
			 for(var i=0; i<len ;i++){
				str+= mJSONObj.UserIdSelector[i].UserId+","; 
		}
		 //alert(str);
			document.getElementById("result").value = str.substring(0,str.length-1);
		}
	</script>    
  </head>  
  
  <body>
    This JSP Page tests the <b>Delete Saved Set Functionality</b>. <br><br>
    <form action="#" name="deleteWelcomeForm" method="get" >
    	<input type="hidden" name="methodName" value="loadSetNames">
	    <table>
	    	<tr>
		    	<td><B>Calling application has to pass OracleApplicationSession, </B></td>
		    	<td><B>context, authLevel, helpContext</B></td>
		    </tr>
		    <tr>
		    	<td>Source System: (anything is fine) </td>
		    	<td><input type="text" id="sourcesystem" name="sourcesystem" value="XXCSS_CT"></td>
		    </tr>
		    <tr>
		    	<td>Context: (ADV_SEARCH_PAGE) </td>
		    	<td><input type="text" id="context" name="context" value="ADV_SEARCH_PAGE"></td>
		    </tr>
		    <tr>
		    	<td>HelpContext: (HELP_GEN_DASHBRD) </td>
		    	<td><input type="text" id="XtrackHelpContext" name="XtrackHelpContext" value="HELP_GEN_DASHBRD"></td>
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
