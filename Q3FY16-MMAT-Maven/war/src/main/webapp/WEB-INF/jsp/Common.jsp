<%@ page import="com.cisco.appsui.core.PageComposer,
                 com.cisco.servicesales.session. MCMAccessManager"%>
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %>
<%
    // set rootPath dynamically in CCX env, since path differs in dev, stage, and prod
	System.setProperty("com.cisco.appsui.rootPath", config.getServletContext().getRealPath("/") +
		"WEB-INF/templates/");

    // instantiate PageComposer
	PageComposer myPage = null;
	
	try {
	  myPage = new PageComposer(
		config.getServletContext().getRealPath("/") +
                	"WEB-INF/data/PageComposer.properties",true);
    } catch (Exception e) {
      e.printStackTrace(System.out);
    }

	String lImagePath = myPage.getProperty("appImagePath");
	String lSpacerImage = myPage.getProperty("appSpacerImg");
	MCMUserSession userSession = MCMUserSession.getInstanceFromSession(session);
     MCMAccessManager accessManager = null;
  	String userId = "";
    try {
        accessManager = userSession.getAccessManager();
        userId = userSession.getUserId();
    } catch (Exception ignore) {}
	
%>