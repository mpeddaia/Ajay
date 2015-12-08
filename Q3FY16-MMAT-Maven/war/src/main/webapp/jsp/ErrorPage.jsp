<%@ page isErrorPage="true" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>

<% 
   String errMessage    = null;
   
   if (exception != null ) {
      errMessage = exception.getMessage();
   }
%>

<html:errors/>
<br><br>

<%
if ( (errMessage==null) || (errMessage.trim().equals("")) ) {
%>	<bean:message key="errors.deadEnd" arg0="" />
<%
} else {
	out.println("<b>" + errMessage + "</b>");
}

%> 
<BR><BR>
<% exception.printStackTrace(); %>
