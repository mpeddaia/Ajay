<%@ taglib uri="/tags/struts-tiles" prefix="tiles" %>

<tiles:insert page="/WEB-INF/jsp/layout/Layout.jsp" flush="true">

  <tiles:put name="header" value="/WEB-INF/jsp/tiles/common/header.jsp"/>

  <tiles:put name="body"   value="/WEB-INF/jsp/tiles/statusDetail.jsp"/>

  <tiles:put name="footer" value="/WEB-INF/jsp/tiles/common/footer.jsp"/>

</tiles:insert>
