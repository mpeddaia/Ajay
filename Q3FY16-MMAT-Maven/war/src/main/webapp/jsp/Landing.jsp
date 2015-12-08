<%@ page language="java"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ page import="com.cisco.servicesales.session.*,
                 java.util.Map,
                 java.util.Set,
                 java.util.Iterator,
                 java.util.Collections,
                 com.cisco.servicesales.cache.countrystate.*,
                 com.cisco.servicesales.cache.*,
                 com.cisco.servicesales.form.LandingForm,
                 com.cisco.goldrush.userprefs.UserPreference" errorPage="ErrorPage.jsp" %>

<%@ include file="/WEB-INF/jsp/Common.jsp" %>

<% pageContext.setAttribute("states", ( (LandingForm)session.getAttribute("landingForm") ).getStates() ); %>
<jsp:useBean id="states" class="java.util.ArrayList" scope="page"/>

<% pageContext.setAttribute("countries", ( (LandingForm)session.getAttribute("landingForm") ).getCountries() ); %>
<jsp:useBean id="countries" class="java.util.ArrayList" scope="page"/>

<script type="text/javascript" language="javascript">
function submitChangeCountry() {
	document.LandingHtml.submit();	
}
</script>

<html:errors/>

<html:form name="LandingHtml" type="com.cisco.servicesales.form.LandingForm" action="landing.do">

<P Align=LEFT>

<table width="100%" border="0">
  <tr> 
    <td width="15%" bgcolor="#006666" valign="top">
    <font size="-1"> + Link1</font>
    <br>
    <font size="-1"> + Link2</font>
    </td>
<td width="85%">
<table width="849" border="1">
        <tr bgcolor="#669999">
      <td class="moduletitlerev" width="48%">APPLICATION DATA</td>
    <td width="28%" class="moduletitlerev">USER PRIVILEGES</td>
    <td width="24%" class="moduletitlerev">AUTHORIZATION INFORMATION</td>
  </tr>
  <tr> 
    <td height="157" rowspan="3" valign="top">
    	<html:select name="landingForm" property="productCountry" onchange="javascript:submitChangeCountry()">
        	<html:option value="-1"><bean:message key="screen.select.country" /></html:option>
        	<html:options collection="countries" property="countryName" labelProperty="countryName" />
        </html:select>
        <BR><BR>
        <html:select name="landingForm" property="productState">
        	<html:option value=""><bean:message key="screen.select.state" /></html:option>
        	<html:options collection="states" property="stateCode" labelProperty="stateDesc"/>
        </html:select>
    </td>
    
    <td rowspan="4" valign="top" align="left">
        
    <%
        final Map accessPrivileges = accessManager.getAccessPrivileges();
        final Set keys = accessPrivileges.keySet();
        for (Iterator iterator = keys.iterator(); iterator.hasNext();) {
            String nameOfAccessFunction = (String) iterator.next();
            boolean hasAccess = ((Boolean) accessPrivileges.get(nameOfAccessFunction)).booleanValue();
            if(hasAccess) {
    %>
               <font size="-3" style="font-weight:bold"><%=nameOfAccessFunction%></font><BR>
    <%
            }
        }
        
        final UserPreference userPreferences = userSession.getCachedUserPreferences();
    %>


    </td>
    <td valign="top" >
        <table width="100%" border="0">
        <tr> 
          <td width="44%"><b>Role</b></td>
          <td width="56%"><%=accessManager.getRole()%></td>
        </tr>
        <tr> 
          <td><b>Email</b></td>
          <td><%=accessManager.getEmail()%></td>
        </tr>
        <tr> 
          <td><b>Access Level</b></td>
          <td><%=accessManager.getAccessLevel()%></td>
        </tr>
        </table>
        
        <table width="100%" border="1">
        <tr bgcolor="#669999">
          <td class="moduletitlerev" height="22">Key User Profile Properties</td>
        </tr>
        <tr> 
          <td height="20"><font size=-1><B>Rows Per table</B>&nbsp;&nbsp;&nbsp;&nbsp;<%=userSession.getRowCount()%></font></td>	  
        </tr>
        </table>  
      </td>
  </tr>
  <tr> 
    <td rowspan="3">&nbsp;</td>
  </tr>
</table>
</td>
</tr>
</table>

</P>

</html:form>
