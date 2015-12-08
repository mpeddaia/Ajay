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

   /* --------------       using AppNavGenerator	 -------------------- */

    // set AppNav properties dynamically in CCX env, since path differs in dev, stage, and prod
        myPage.setAppNav(config.getServletContext().getRealPath("/") +
        		"/WEB-INF/data/AppNav.properties",true);

	myPage.activateAppNavGenerator(true);

	//This method call is used to change the tab type from the default value set
	//inside the AppNav.properties file.Use either STANDARD or STEPWISE
	myPage.setAppNavTabType("STEPWISE");

	//This method call is used to change the step type of the third tab from the
	//default value set inside the AppNav.properties file.Use either STANDARD or STEPWISE
	myPage.setAppNavStepType(3,"STEPWISE");

	//This method call is used to change the name of the third tab from the
	//default value set inside the AppNav.properties file.
	myPage.setAppNavTabName(3,"Renamed Tab");

	//sets the current tab to 2
	myPage.setAppNavCurrentTab(4);

	//sets teh current step to 3
	myPage.setAppNavCurrentStep(3);

   /* --------------       using AppNavGenerator	 -------------------- */

%>

<%-- AppHeaderTag inserts the header of the application --%>
<camp:AppHeaderTag pageComposer="<%=myPage%>"/>

<%-- Insert your aplication content here --%>
<BR><BR>
<span class="contentbold"> Hello Cisco Systems </span>
<BR><BR>
<span class="content"> This example shows local navigation with tabs and steps across top </span>
<BR><BR>
<span class="content"> CDC Image Path from PageComposer is: <%=cdcImagePath%></span>
<BR><BR>
<%-- AppFooterTag inserts the footer of the application --%>
<camp:AppFooterTag pageComposer="<%=myPage%>"/>
