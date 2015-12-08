<%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>
<%@ include file="../localeInfo.jsp" %>

<html>
<head>
<title>
 <tiles:getAsString name="title"/>
</title>
</head>
<body>
    <%-- include header --%>
    <tiles:insert attribute="header"/>
    <%-- include TabMenu --%>
    <tiles:insert attribute="menu"/>
    <%-- include body --%>
    <tiles:insert attribute="body"/>
    <%-- include footer --%>
    <tiles:insert attribute="footer"/>
</body>
</html>


