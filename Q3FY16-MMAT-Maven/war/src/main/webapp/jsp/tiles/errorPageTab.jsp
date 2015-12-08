<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main_styles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
</head>
<NOSCRIPT><LINK href="images/cscc/cdc.css" type=text/css rel=Stylesheet><LINK href="images/cscc/apps.css" type=text/css rel=Stylesheet></NOSCRIPT>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/contract_mgr.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/combinedscripts.js" type="text/javascript"></script>

<script>
var on=0;
function showDiv()
{
	if(on==0)
	{
	var ele=document.getElementById("errorDiv");
		ele.style.display="block";
		document.errorform.show.value="Hide Details"

		on =1;
	}
	else
	{
		var ele=document.getElementById("errorDiv");
		ele.style.display="none";

				document.errorform.show.value="Show Details"

		on=0;	 
	}
}
function hideDiv()
{
var ele=document.getElementById("errorDiv");
ele.style.display="none";
}
</script>
<form name=errorform >
<br><br>
<center>
	
	<font color=red><b><%=request.getAttribute("ERROR_MSG")%></b> </font><br/>
<%
String str= (String)request.getAttribute("ciscoLife");

if ( "local".equals(str) ||"stage".equals(str) || "dev".equals(str)   ) {
%>
</center>

						
						<!-- button component -->
						<table width=100%>
						
						<td width=55% >	<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
						
								
								<tr >
									<td valign=top class="button_left" onClick="document.getElementById('uploadButton').click();"></td>
									<td valign=top><input id="show" class="button" type="button" name="uploadButton" value="Show Details" onClick="javascript:showDiv()" /></td>
									<td  valign=top class="button_right" onClick="document.getElementById('uploadButton').click();"></td>
									<td  width=50></td>
									
								</tr>
							</table></td>
							<td width=45%></td>
						</table>
						
							
						
			
				
			
	


	<div id = "errorDiv" style ="display:none" ><pre>
	<font color=blue><i><%=request.getAttribute("ERROR_TRACE")%> </i></font></font></pre>
	</div>
<%
} 
%> 
<BR><BR>


