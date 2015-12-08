<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <%@ page import="java.util.*" %>
 
  <!-- Code Write by Surendra Karnatapu-->
  <!-- Get all the URL parameters and display on the screen-->
<html>
<head>
	<title>Untitled</title>
</head>

<body style="text-align: center">


<div align="center"></div><h2><h3 align="center"><font size="5" color="#0000FF">
File Uploaded Successfully !</font></h3>
<h2 align="center"></h2>
<hr color="#000000">
<div align="center">
<pre >&nbsp;</pre>

</div>
<div align="center">
<pre ><u><b><font size="5">UPLOAD REQUEST INFORMATION</font></b></u></pre>

</div>

<table cellspacing="10" cellpadding="5" border="0">


<% 
String name = null;
String value = null;

 Enumeration enum = request.getParameterNames();
        for (; enum.hasMoreElements(); ) {
            // Get the name of the request parameter
            name = (String)enum.nextElement();
    
            // Get the value of the request parameter
            value = request.getParameter(name);
%>

<tr>
	<td width="50" ><strong><%=name %></strong></td>
	<td width="50">
	<p align="center"></td>
	<td width="50"  bgcolor="#c0c0c0"><%=value%></td>
</tr>


<%		
        }
%>		





</table>


<form method="POST" action="--WEBBOT-SELF--">
	<!--webbot bot="SaveResults" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
	<p align="center">
	<b><font size="5">
	<a href="https://tools-dev.cisco.com/ServiceSales/LEAPPROTO/CCX/action/FileUploadAction?redirecturl=https://localhost:8080/FileUpload/index.html">
	More Uploads</a></font></b></p>
</form>
<p align="center">&nbsp;</p>


</body>
</html>
