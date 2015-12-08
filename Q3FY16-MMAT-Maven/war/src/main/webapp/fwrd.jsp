<%
String str=request.getQueryString();
//out.println(str);
//response.sendRedirect("/CustAdv/ServiceSales/mcm/mcmindex.do?"+str);
 response.sendRedirect("/YS2MCM/index.do?"+str);
return;
%>