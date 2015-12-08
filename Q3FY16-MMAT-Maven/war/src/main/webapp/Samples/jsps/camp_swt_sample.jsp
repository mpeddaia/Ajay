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

   /* --------------       using SWTGenerator	 -------------------- */

	// setting a number of properties used for SiteWide Toolkit.
    myPage.setSWT("camp_print_sample.jsp","camp_email_sample.jsp",null,null,"camp_feedback_sample.jsp","camp_help_sample.jsp");

	//This method will set new url for help link.
	myPage.setSWTHelpURL("camp_help_sample.jsp");

	//This method will set new url for feedback link.
	myPage.setSWTFeedbackURL("camp_feedback_sample.jsp");

	//This method will activate the bookmark icon.
	myPage.activateBookmark(true);

	//This method will inactivate the glossary icon.
	myPage.activateGlossary(false);

   /* --------------       using SWTGenerator	 -------------------- */

%>

<%-- AppHeaderTag inserts the header of the application --%>
<camp:AppHeaderTag pageComposer="<%=myPage%>"/>

<%-- Insert your aplication content here --%>
<BR><BR>
<span class="contentbold"> Hello Cisco Systems </span>
<BR><BR>
<span class="content"> This example shows how to set sitewide toolkit urls dynamically</span>
<BR><BR>
<span class="content"> CDC Image Path from PageComposer is: <%=cdcImagePath%></span>

<%-- AppFooterTag inserts the footer of the application --%>
<camp:AppFooterTag pageComposer="<%=myPage%>"/>