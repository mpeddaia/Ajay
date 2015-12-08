<%
String str=request.getQueryString();

response.sendRedirect(request.getContextPath()+"/mcmindex.do?"+str);
return;
%>