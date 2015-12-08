<html>

<%
	String combinedImagesLocation = (String)session.getAttribute("combinedimagesurl");
	if(combinedImagesLocation==null)
		combinedImagesLocation = "";
	String newUrl = (String) session.getAttribute("newUrl");
%>
	
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Cisco Service Contract Center</title>

<META HTTP-EQUIV="refresh" CONTENT="5;url=<%= newUrl %>"> 

</head>

<body style="font-family: Arial">

<table align="center" border="0">
	<tr valign="middle">
		<td>
			<IMG height=73 alt="Cisco Systems" src="<%= combinedImagesLocation %>images/cscc/logo.gif" width=110 border=0 align=middle>
		</td>		
		<td>
			<font size="5" color="#669999">Cisco Service Contract Center</font>
		</td>		
	</tr>
</table>
<p>&nbsp;</p>
<font size="3" color="#669999">
<p align="center">The URL for this page has changed. Please bookmark the new URL. </p>
<p align="center">You will be redirected to the new page. If you are not redirected in 5 seconds, please <a href="<%= newUrl %>">click here</a>. </p>
</font>

</body>

</html>
