<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<%@ page import="com.cisco.mcm.util.McmConstants" %>
<%@ page import="com.cisco.mcm.exception.McmException" %>

<% 
   McmException excp=(McmException)session.getAttribute(McmConstants.ERR_ATTRIB);
%>


<br><br>

<%
if ((excp!=null)) {
%>	<font color=red><b><bean:message key="<%=excp.getException_id()%>" /></b></font>
<%
} 
%> 
<BR><BR>
<% //(excp.getExc()).printStackTrace(); %>
