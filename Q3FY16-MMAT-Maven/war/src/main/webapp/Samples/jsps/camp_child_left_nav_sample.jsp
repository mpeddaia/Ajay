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


    /* --------------       using ChildLeftNavGenerator	 -------------------- */

     // set ChildLeftNav properties dynamically in CCX env, since
     // file path differs in dev, stage, and prod

        myPage.setChildLeftNavConfigFile(config.getServletContext().getRealPath("/") +
       		"/WEB-INF/data/ChildLeftNav2.properties",true);

     // Activate Child Left Nav
     	myPage.activateChildLeftNavGenerator(true);

     // Set current Group
        myPage.setChildLeftNavCurrentGroup(1);

     // Set current Tab
        myPage.setChildLeftNavCurrentTab(2);

     // Set current Step
        myPage.setChildLeftNavCurrentStep(1);

     // Set window type to child
        myPage.setWindowType("child");

  /* --------------       using ChildLeftNavGenerator	 -------------------- */

%>

<%-- AppHeaderTag inserts the header of the application --%>
<camp:AppHeaderTag pageComposer="<%=myPage%>"/>

<%-- Insert your aplication content here --%>
<BR><BR>
<span class="contentbold"> Hello Cisco Systems </span>
<BR><BR>
<span class="content"> This example shows local navigation with groups and tabs in left column and steps across top </span>
<BR><BR>
<span class="content"> CDC Image Path from PageComposer is: <%=cdcImagePath%></span>

<%-- AppFooterTag inserts the footer of the application --%>
<camp:AppFooterTag pageComposer="<%=myPage%>"/>