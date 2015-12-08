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

	//setting the Feedback URL for the SWT
	myPage.setSWTFeedbackURL("camp_feedback_sample.jsp");

	//setting the Print URL for the SWT
	myPage.setSWTPrintURL("camp_print_sample.jsp");

	//setting the Help URL for the SWT
	myPage.setSWTHelpURL("camp_help_sample.jsp");


    // get CDC image path
    String cdcImagePath = myPage.getProperty("appImagePath");
%>

<%-- AppHeaderTag inserts the header of the application --%>
<camp:AppHeaderTag pageComposer="<%=myPage%>"/>

<%-- Insert your aplication content here --%>

			<table border="0" cellspacing="1" cellpadding="7" width="100%">
 					<tr bgcolor="#ffffff">
						<td class="content">
							<span class="contentbold">Embedded Application</span> - demonstrates generation of CISCO.COM Embedded framework<br>
							<a href="camp_sample.jsp" class="contentlink">View Sample App</a> |
							<a href="camp_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">Child Application</span> - demonstrates generation of CISCO.COM Child window framework<br>
							<a href="javascript:openChildWindow('camp_child_sample.jsp','child');" class="contentlink">View Sample App</a> |
							<a href="camp_child_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">AppNav Sample</span> - demonstrates local navigation with AppNav tabs and steps<br>
							<a href="camp_app_nav_sample.jsp" class="contentlink">View Sample App</a> |
							<a href="camp_app_nav_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">SWT Sample</span> - demonstrates dynamic generation of sitewide toolkit<br>
							<a href="camp_swt_sample.jsp" class="contentlink">View Sample App</a> |
							<a href="camp_swt_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">ChildLeftNav Sample</span> - demonstrates local navigation in child window with groups and tabs in left column and steps across top <br>
							<a href="javascript:openChildWindow('camp_child_left_nav_sample.jsp','child');" class="contentlink">View Sample App</a> |
							<a href="camp_child_left_nav_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">Help Window</span> - demonstrates generation of CISCO.COM Help Window framework<br>
							<a href="javascript:sitewide_toolkit_window('camp_help_sample.jsp','help');" class="contentlink">View Sample App</a> |
							<a href="camp_help_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">Feedback Window</span> - demonstrates generation of CISCO.COM Feedback Window framework<br>
							<a href="javascript:sitewide_toolkit_window('camp_feedback_sample.jsp','feedback');" class="contentlink">View Sample App</a> |
							<a href="camp_feedback_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">Print Window</span> - demonstrates generation of CISCO.COM Print Window framework<br>
							<a href="javascript:sitewide_toolkit_window('camp_print_sample.jsp','feedback');" class="contentlink">View Sample App</a> |
							<a href="camp_print_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">Content Window</span> - demonstrates generation of CISCO.COM Content Window framework<br>
							<a href="javascript:openLargePopup('camp_content_sample.jsp','content');" class="contentlink">View Sample App</a> |
							<a href="camp_content_sample.txt" class="contentlink">View Source</a><br><br>
							<span class="contentbold">Embedded Application</span> - demonstrates generation of CISCO.COM Embedded framework using the CAMP API methods to get the header and footer.<br>
							<a href="camp_header_sample.jsp" class="contentlink">View Sample App</a> |
							<a href="camp_header_sample.txt" class="contentlink">View Source</a><br><br>
                       </td>
                     </tr>
             </table>

<%-- AppFooterTag inserts the footer of the application --%>
<camp:AppFooterTag pageComposer="<%=myPage%>"/>