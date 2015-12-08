<%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>
<html>
<head><title>MCM
</title></head>
<body>
    <%-- include header --%>
    <tiles:insert attribute="header"/>
    <%-- include body --%>
    <tiles:insert attribute="body"/>
    <%-- include footer --%>
    <tiles:insert attribute="footer"/>
</body>
</html>


