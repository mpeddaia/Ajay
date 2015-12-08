<%@ page import="com.cisco.appsui.core.PageComposer" %>
<%@ taglib uri="/WEB-INF/camp.tld" prefix="camp"%>
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

    //setting margin for child window
	myPage.activateApplMargin(true);

%>


<%-- AppHeaderTag inserts the header of the application --%>
<%-- camp:AppHeaderTag pageComposer="<%=myPage%>"/> --%>

<%-- Using the getHeader() method of PageComposer instead of the tags --%>
<% out.print (myPage.getHeader()); %>

<%-- Insert your aplication content here --%>
<BR><BR>
<span class="contentbold"> Hello Cisco Systems </span>
<BR><BR>
<span class="content"> This example shows how to generate a basic framework using the getHeader() and getFooter() methods</span>
<BR><BR>
<span class="content"> of the PageComposer object instead of JSP Custom Tags.</span>

<%-- Using the getFooter() method of PageComposer instead of the tag --%>
<% out.print (myPage.getFooter()); %>

<%-- AppFooterTag inserts the footer of the application --%>
<%-- <camp:AppFooterTag pageComposer="<%=myPage%>"/> --%>