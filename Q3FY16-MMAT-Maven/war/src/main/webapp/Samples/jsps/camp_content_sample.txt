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

	String lImagePath = myPage.getProperty("appImagePath");
	String lSpacerImage = myPage.getProperty("appSpacerImg");

    // set PageComposer entitlement level with access level from LDAP
    // do not hard code as shown here - must get LDAP access level from entitlement API
    myPage.setEntitlementLevel("4");

    //setting window type to print
	myPage.setWindowType("content");

	// setting a number of properties used for SiteWide Toolkit.
    myPage.setSWT("camp_print_sample.jsp","camp_email_sample.jsp",null,null,"camp_feedback_sample.jsp","camp_help_sample.jsp");


%>

<%-- AppHeaderTag inserts the header of the application --%>
<camp:AppHeaderTag pageComposer="<%=myPage%>"/>

<!-- This piece is for the header tab in the contents -->
<!-- Please change the text to what it should say for your Content -->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr bgcolor="#FFCC66">
		<td bgcolor="#ffffff"><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="7" height="1" alt=""></td>
		<td><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="6" height="22" alt=""></td>
		<!--This should be changed to your App Name -->
		<td nowrap="" width="100%"><span class="contenttitle">your appname here:</span>
		<!--This should be changed to your app title-->
		<span class="contenttitlesub">your page title here</span></td>
		<td valign="top" align="right"><img src="<%=lImagePath%>/corner_ur_13.gif" width="13" height="13" alt=""></td>
		<td bgcolor="#ffffff"><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="7" height="1" alt=""></td>
	</tr>
	<tr>
		<td colspan="5"><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="1" height="1" alt=""></td>
	</tr>
	<tr>
		<td><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="7" height="1" alt=""></td>
		<td colspan="3" bgcolor="#FFCC66"><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="1" height="1" alt=""></td>
		<td><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="7" height="1" alt=""></td>
	</tr>
	<tr>
		<td colspan="5"><img src="<%=lImagePath%>/<%=lSpacerImage%>" width="1" height="10" alt=""></td>
	</tr>
</table>

<%-- Insert your aplication content here --%>
<BR><BR>
<span class="contentbold"> Hello Cisco Systems </span>
<BR><BR>
<span class="content"> This example shows how to generate a content window</span>
<BR><BR>

<%-- AppFooterTag inserts the footer of the application --%>
<camp:AppFooterTag pageComposer="<%=myPage%>"/>