<%@ page language="java"%>
<%@ page import="com.cisco.servicesales.util.Constants" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<% 
  String message = (String)session.getAttribute(Constants.ERROR_MESSAGE); 
  String sccUserName = (String)session.getAttribute(Constants.USER_NAME);
  if ( (sccUserName==null) || (sccUserName.trim().equals("")) ) {
  	sccUserName="";
  }

//response.sendRedirect("/CustAdv/ServiceSales/mcm/mcmindex.do");
response.sendRedirect("/YS2MCMindex.do");
%>




<%@ include file="/jsp/tiles/common/header.jsp" %>
<br>

<bean:message key="errors.header"/>
<% if(message==null || message.trim().equals("")) { %>
    <bean:message key="errors.invalidSession"/>
<% } else { %>
  <bean:message key="<%=message%>" arg0="<%=sccUserName%>" />
<% } %>
<bean:message key="errors.footer"/>

<br><br>
<%@ include file="/jsp/tiles/common/footer.jsp" %>

