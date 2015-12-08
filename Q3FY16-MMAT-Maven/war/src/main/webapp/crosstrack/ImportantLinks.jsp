<%@ page import="com.cisco.crosstrack.menu.*" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>

<%	
	String erMsg = (String)request.getAttribute("Imp_error_message");
	if (erMsg == null) erMsg = "";
%>

		<!-- module header -->
	
		<!-- APPLICATION WORK SPACE AREA -->
		<div id="application_area">
		<!-- container for all modules -->
		<div id="moduleContainerId">
<!-- ********************* APPLICATION MODULE START *********************************************** -->
<div id="errorResults">		
	<font color="red"><%=erMsg%></font>
</div>
<c:set var="currentGroup" value="" />
	<c:set var="displayGroup" value=""/>
	<c:set var="counter" value="0" />
	<c:forEach var="link" items="${ImportantLinks}">
	 

	  <%-- Counter <c:out value="${counter}" /> --%>
	 <c:choose>
		    <c:when  test="${not empty link}">
		    
		    <c:if test="${link.functionGroup != currentGroup}" >
		      	<c:set var="currentGroup" value="${link.functionGroup}" />
		      	 <c:if test="${counter != 0}" >
		      
					<br clear="all" />		
				 </c:if>	
				 
				 <c:if test="${counter == 0}" >
		      		<br clear="all" />	
					<br clear="all" />
				 </c:if>
				 
									
											
					    <div id="mod_1" class="mod_header">
									<!-- module header title -->
									
								
									<h2 class="mh_title">&nbsp;&nbsp;<c:out value="${link.functionGroup}" /></h2>
										 <c:set var="counter" value="${counter+1}" />
						 </div>		      		
		    </c:if>
		        
<!-- colasp/expand block -->
		<div id="mod_1block" class="moduleDisplayBlock">
			<!-- marque block -->
			<div id="marque_1" class="marque">
			<!-- START SUB MODULE BLOCKS **************** -->

				<div id="imp_links1" class="sub_block_hr">
					<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
					<colgroup>
						<col width="20" />
						<col width="200" />
						<col width="20" />
						<col width="800" />
					</colgroup>
					<tbody>
						<tr>
							<td>&nbsp;</td>
							<td align="right" valign="top"><a href="<c:out value="${link.url}" />" target="_blank" >
						    	<c:out value="${link.functionName}" />  </a>							
							</td> 	
							
						   <%--	<td align="right" valign="top"><a href="javascript:sitewide_toolkit_window('<c:out value='${link.url}' />','linkWindow')">
                               <c:out value="${link.functionName}" /></a>							
							
							</td> 
							--%>
													
							<td>&nbsp;</td>
							
							<td align="justify" nowrap class="readonly"><c:out value="${link.functionDesc}" /></td>
						</tr>
					</tbody>
				</table>
				</div>


			<!-- END SUB MODULE BLOCKS ****************** -->
			</div>

		</div><!-- module display container -->
			        	
		        	
	        </c:when>
	        
			<c:otherwise><b></b>
<div id="errorResults">		
	<font color="red"><%=erMsg%></font>
</div>
			</c:otherwise>
						
	</c:choose>
	
	</c:forEach>
	

	<br clear="all" />



	<!-- ********************* APPLICATION MODULE END *********************************************** -->
		</div><!-- module container -->
		</div><!-- app area -->


