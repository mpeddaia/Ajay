<%@ page import="com.cisco.appsui.core.PageComposer" %>
<%@ taglib uri="/tags/camp" prefix="camp"%>

<%

    // set rootPath dynamically in CCX env, since path differs in dev, stage, and prod
	System.setProperty("com.cisco.appsui.rootPath", config.getServletContext().getRealPath("/") +
		"/WEB-INF/templates/");

     // instantiate PageComposer
	PageComposer myPage = new PageComposer(
		config.getServletContext().getRealPath("/") +
                	"/WEB-INF/data/PageComposer.properties",true);

     // set PageComposer entitlement level with access level from LDAP
     // do not hard code as shown here - must get LDAP access level from entitlement API
     	myPage.setEntitlementLevel("4");

     // get CDC image path
        String cdcImagePath = myPage.getProperty("appImagePath");

%>

<%-- AppHeaderTag inserts the header of the application --%>
<camp:AppHeaderTag pageComposer="<%=myPage%>"/>

