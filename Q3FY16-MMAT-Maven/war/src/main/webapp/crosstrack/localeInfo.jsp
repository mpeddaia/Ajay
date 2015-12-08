<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>  
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%@ page import="com.cisco.crosstrack.user.User"%>
<%@ page import="com.cisco.crosstrack.user.UserPreferences"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
String defLangCode = "en";
HttpSession mySession = request.getSession();
User userVar = (User)mySession.getAttribute("User");
if (userVar != null) {
	UserPreferences userPreferences = (UserPreferences)userVar.getUserPrefs();
	defLangCode = userPreferences.getLangCode();
	//System.out.println("Language Code in localeInfo.jsp :: " + defLangCode);
	request.setAttribute("defLangCode",defLangCode);
}
//request.setAttribute("defLangCode","ja");
%>
<fmt:setLocale value="${defLangCode}"/>

