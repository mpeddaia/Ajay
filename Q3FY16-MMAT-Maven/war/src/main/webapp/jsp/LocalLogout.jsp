<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" %>

<%	ResourceBundle menuProps = ResourceBundle.getBundle("menu");
	
	//Sunis-logout issue end.
	String typeServer = System.getProperty("cisco.life");
	String logoutURL = null;
	if("prod".equalsIgnoreCase(typeServer) ||"prd".equalsIgnoreCase(typeServer))
    	logoutURL = menuProps.getString( "ProdLogoutUrl");
	else if("stage".equalsIgnoreCase(typeServer) ||"stg".equalsIgnoreCase(typeServer))
    	logoutURL = menuProps.getString("StageLogoutUrl");
	else if("dev".equalsIgnoreCase(typeServer))
    	logoutURL = menuProps.getString("DevLogoutUrl");        
	else 
		logoutURL = menuProps.getString("StageLogoutUrl");
	//Sunis -logout issue end.
	
	logoutURL = logoutURL.replaceAll("AppSpecificLogout.html",request.getContextPath()+ "/AppSpecificLogout.html");
 %>
<html>
<head></head>

<body>
<script language="JavaScript">  

 window.location="<%=logoutURL%>";<%session.invalidate();%>
</script>

</body>
</html>
