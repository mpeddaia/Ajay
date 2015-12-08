<%@ include file="../localeInfo.jsp" %>
<%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>
<html>
<head>
<title>
<tiles:getAsString name="title"/>
</title>
</head>
<body>
    <%-- include header --%>
    <tiles:insert attribute="header"/>
    <%-- include tab menu --%>
    <tiles:insert attribute="tabmenu"/>
    <%-- include body --%>
    <tiles:insert attribute="body"/>
    <%-- include footer --%>
    <tiles:insert attribute="footer"/>
</body>
</html>