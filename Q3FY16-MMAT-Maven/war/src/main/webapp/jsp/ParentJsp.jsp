
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'ParentJsp.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
	</head>
	<script language="Javascript">
  function callXtrackContract()
		  {
		   
   		   var strWithincontext = document.getElementById("strWithincontext").value;
		   var strContext = document.getElementById("strContext").value;
    	   var strContextValue = document.getElementById("strContextValue").value;
    	   var strCCOUserId = document.getElementById("strCCOUserId").value;
    	   var strSourceSystem = document.getElementById("strSourceSystem").value;     	   
    	   var strSelectType = document.getElementById("strSelectType").value;
    	   var strStatus = document.getElementById("strStatus").value;        
           
           childwindow = window.open("/MyProductSelectorTest/productSelectorDispatch.do?methodName=onshowPopup&strWithincontext="+strWithincontext+"&strContext="+strContext+"&strContextValue="+strContextValue+"&strCCOUserId="+strCCOUserId+"&strSourceSystem="+strSourceSystem+"&strSelectType="+strSelectType+"&strStatus="+strStatus,"childWin","width=1010,height=600, scrollbars");
           
		  	
		   
		   
		 //return false;
		  }
   </script>
	<body>

		<form name=parentForm>

			<input type="hidden" id="strWithincontext" name="strWithincontext" value="Y">
			<input type="hidden" id="strContext" name="strContext" value="CONTRACT">
			<input type="hidden" id="strContextValue" name="strContextValue" value="2421291">
			<input type="hidden" id="strCCOUserId" name="strCCOUserId" value="A-ALGER">
			<input type="hidden" id="strSourceSystem" name="strSourceSystem" value="CONTRACT">
			<input type="hidden" id="strSelectType" name="strSelectType" value="MULTIPLE">
			<input type="hidden" id="strStatus" name="strStatus" value="active">
			<table>
				<TR>
					<TD>
						This is My Calling JSP page.
						<br>
						&nbsp;
						<img src="<%=basePath%>/images/global/buttons_and_icons/icons/icn_picker.gif" alt="Picker" height="13" width="13" align="middle" border="0" onclick="javascript:callXtrackContract();" />
					</TD>
				</TR>

			</table>

		</form>


	</body>
</html>
