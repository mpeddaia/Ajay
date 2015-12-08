<%
String str="0";
if(null!= request.getAttribute("REQUESTID")){
str=(request.getAttribute("REQUESTID")).toString();
}
request.setAttribute("REQUESTID",str);
//out.println(str);
//response.sendRedirect("/CustAdv/ServiceSales/mcm/mcmreports.do");
response.sendRedirect("/YS2MCM/reports.do");
return;
%>