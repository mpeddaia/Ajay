<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="MCM.TITLE"/></title>
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
</head>
<body>
<div id="mod_1" class="mod_header" style="width:99%">
				<h2 class="mh_title" style="margin-left:15px;">
					Output Report
				</h2>
			</div>
<div id="messageBox" name="messageBox" style="display:block">
					<!-- // begin message/status box -->
					
					<table border="0" cellpadding="0" cellspacing="0" width="402" >
						
					 	
						<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
							
							<td width="100%"><br/> 
								Request ID : <%=request.getParameter("upld_request_id") %> <BR>
								<br> 
								
								<h5>Output Reports</h5>
								<a href=<%=request.getContextPath() %>/downloadreport.view?uploadRId=<%=request.getParameter("upld_request_id") %>&request_type=<%=request.getParameter("request_type") %>>
								<%=request.getParameter("request_type") %></a>
								<br/>
							</td>
							</tr>
					</table>
					<!-- // end message/status box -->
				</div>
</body>
</html>