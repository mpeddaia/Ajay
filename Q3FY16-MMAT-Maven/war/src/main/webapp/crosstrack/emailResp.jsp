<%@ include file="localeInfo.jsp" %>

<div class="watermelon">
<%
           String errorReport = (String)request.getAttribute("Request_details_error_message");
           
          if (errorReport != null ) { 
          //System.out.println("error report "+errorReport);
          %>
          <%=errorReport%>
         <% } else {%>
<fmt:message key='emailResp.emailSent'/>..
<% } %>
</div>