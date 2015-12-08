<%
String ctxpath=request.getContextPath();
//out.println(session.getAttribute("INVALIDUSER"));
if(null!=session.getAttribute("INVALIDUSER")){

if ("FALSE".equals((session.getAttribute("INVALIDUSER")).toString())){
//out.println("here");
                        response.sendRedirect(ctxpath + "/InvalidAccess.jsp");
                        }
                        
                        }
%>