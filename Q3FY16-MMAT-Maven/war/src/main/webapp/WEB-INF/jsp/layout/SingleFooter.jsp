<%@ page import="com.cisco.appsui.core.PageComposer" %>
<%@ include file="../localeInfo.jsp" %>

<%
    // set rootPath dynamically in CCX env, since path differs in dev, stage, and prod
	System.setProperty("com.cisco.appsui.rootPath", config.getServletContext().getRealPath("/") +
		"WEB-INF/templates/");
    
    // instantiate PageComposer
	//PageComposer
	try {
	    myPage = new PageComposer(
		config.getServletContext().getRealPath("/") +
                	"WEB-INF/data/PageComposer.properties",true);
    } catch (Exception ignore){}

	String ImagePath = myPage.getProperty("appImagePath");

    // set PageComposer entitlement level with access level from LDAP
    // do not hard code as shown here - must get LDAP access level from entitlement API
    // put it in try catch in case of invalid session
    try {
        myPage.setEntitlementLevel(accessManager.getAccessLevelAsString());
    } catch (Exception ignore) {}

    //setting window type to print
	myPage.setWindowType("content");

	// setting a number of properties used for SiteWide Toolkit.
    myPage.setSWT("camp_print_sample.jsp","camp_email_sample.jsp",null,null,"camp_feedback_sample.jsp","camp_help_sample.jsp");
%>
<%-- AppFooterTag inserts the footer of the application --%>
<camp:AppFooterTag pageComposer="<%=myPage%>"/>