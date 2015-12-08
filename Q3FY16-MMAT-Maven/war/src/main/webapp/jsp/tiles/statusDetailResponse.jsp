<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<%@ page import="com.cisco.servicesales.list.EnhancedList" %> 
<%@ page import="com.cisco.servicesales.list.engine.Column" %> 
<%@ page import="com.cisco.mcm.bo.McmStatusDetailContext" %> 
<%@ page import="com.cisco.servicesales.list.Paginator" %> 
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 
<%@ page import="java.util.*" %> 

<%
McmStatusDetailContext  statusDetailContext=(McmStatusDetailContext)session.getAttribute("statusDetailContext");
Paginator paginator=statusDetailContext.getPaginator();
EnhancedList enhancedList=statusDetailContext.getEnhancedList();
System.out.println("enhancedList Size::" + enhancedList.getSize());
List list=(List)paginator.current();
System.out.println("Page list Size::" + list.size());
List headercolumns=statusDetailContext.getDisplayColumns();
MCMUserSession userSession=(MCMUserSession)session.getAttribute(MCMUserSession.USER_SESSION_KEY);
//out.println(userSession.getEmail());
HashMap hm=(HashMap)session.getAttribute("repType");
System.out.println("Rep Type :" + session.getAttribute("repType"));

%>

 <table cellspacing=0 cellpadding=0 width="100%" border=0>
                                    <tbody>
                                      <!--<table width="100%" border="0" cellspacing="0" cellpadding="0">-->
                                      <!--</table>-->
                                      <!-- added a table inside the td so that there isn't a line in between the button and the message by krys -->
									<!--String selectionBoxName, String firstLink, String previousLink, String nextLink, String lastLink, String specificPageLink-->
                                      <tr valign=top align=right bgcolor=#669999>
                                        <td align=right colspan=20>
                                             <%String html = paginator.getPaginatorBar("pageNumberTop","javascript:jumpToFirstPage();\">", "javascript:previousPage();\">", "javascript:nextPage();", "javascript:jumpToLastPage();","javascript:jumpToPage(this.options[this.selectedIndex]);");											
										     html = html.replaceAll("&lt;","<span style=\"color:#ffffff;font-weight:bold\">&lt;</span>");											
											 html = html.replaceAll("&gt;","<span style=\"color:#ffffff;font-weight:bold\">&gt;</span>");										   
										   %>
										 

										   <div style="color:#ffffff"><%=html%></div>
											
                                        </td>
                                      </tr>
                                      
								</table>
<div id="scroll" style="overflow-y:scroll; height: 180; ">
<table cellspacing=1 cellpadding=0 width="100%" border=0>
<THEAD>
<tr valign=top align=left bgcolor=#A1A1A1>
									  <%//=headercolumns.size()%>
									  <% for (int i=0; i<headercolumns.size();i++){%>
									  
										<td nowrap class="contentbold" width="<%=(100/headercolumns.size())%>%"  style="BORDER-LEFT: #d8d8d8 1px solid;">
											<% if(((Column)headercolumns.get(i)).isSortable()){%>
												<A HREF="javascript:sort('<%=((Column)headercolumns.get(i)).getName()%>')">&nbsp;<font color="#FFFFFF">&nbsp;<bean:message  key="<%=((Column)headercolumns.get(i)).getDisplayLabel()%>"/>&nbsp;</font></A>
											<% } else { %>
												<A HREF="javascript:sort('<%=((Column)headercolumns.get(i)).getName()%>')">&nbsp;<font color="#FFFFFF">&nbsp;<bean:message  key="<%=((Column)headercolumns.get(i)).getDisplayLabel()%>"/>&nbsp;</font></A>
												
											<% }%>
											<% if(enhancedList.isSortedOn(((Column)headercolumns.get(i)).getName())){
												if(enhancedList.isAscendingSort()){%>
													<img src="https://www.cisco.com/apps-ui/generic/1.0/images/mod_grey_arrow_dwn.gif" width="7" height="4">
												<%} else {%>
													<img src="https://www.cisco.com/apps-ui/generic/1.0/images/mod_grey_arrow_up_.gif" width="7" height="4">
												<%}
												}%>
											

										</td>
									  <% } %>
									  </tr>
								</THEAD>
									  <% for(int i=0;i<list.size();i++){
									  Map aRow = (Map) list.get(i);
										if( i%2 ==0){
									  %>

										  <tr bgcolor=#ffffff>
										  <% for(int j=0;j<headercolumns.size();j++){
											 // #foreach($column in $headercolumns)%>
												<td align=center width="<%=(100/headercolumns.size())%>%">
												<%
												Column displayColumn = ((Column)headercolumns.get(j));
												if(null!=(aRow.get(displayColumn.getName()))){
												
											  //    here if(aRow.get(displayColumn.getName()).equals("errorMessage")){
											  %>
												<%=aRow.get(displayColumn.getName())%>	  
												<%} else {%>
												--
											  <%  }%>

												</td>
											  <%}%>
										  </tr>
										  <%}else{%>
											 <tr bgcolor=#e7e7e7>
										  <% for(int j=0;j<headercolumns.size();j++){
											 // #foreach($column in $headercolumns)%>
												<td align=center>
												<%
												Column displayColumn = ((Column)headercolumns.get(j));
												if(null!=(aRow.get(displayColumn.getName()))){
												
											  //    here if(aRow.get(displayColumn.getName()).equals("errorMessage")){
											  %>
												<%=aRow.get(displayColumn.getName())%>	  
												<%} else {%>
												--
											  <%  }%>

												</td>
											  <%}%>
										  </tr>
										  <%}%>
									  <%}%>
					    
                                     <!-- <tr valign=top align=right bgcolor=#669999>
                                        <td align=right colspan=20>
                                            <%=paginator.getPaginatorBar("pageNumberTop", "javascript:previousPage()", "javascript:nextPage()", "javascript:jumpToPage(this.options[this.selectedIndex])")%>
                                        </td>
                                      </tr>-->

                                    </tbody>
                                  </table>
								  </div>