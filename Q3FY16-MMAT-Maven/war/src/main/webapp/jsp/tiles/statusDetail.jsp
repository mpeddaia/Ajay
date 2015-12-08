<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<%@ page import="com.cisco.servicesales.list.EnhancedList" %> 
<%@ page import="com.cisco.servicesales.list.engine.Column" %> 
<%@ page import="com.cisco.mcm.bo.McmStatusDetailContext" %> 
<%@ page import="com.cisco.servicesales.list.Paginator" %> 
<%@ page import="com.cisco.servicesales.session.MCMUserSession" %> 
<%@ page import="com.cisco.mcm.util.McmConstants" %>
<%@ page import="java.util.*" %> 

<%

McmStatusDetailContext  statusDetailContext=(McmStatusDetailContext)session.getAttribute("statusDetailContext");
EnhancedList enhancedList=statusDetailContext.getEnhancedList();
	System.out.println("enhancedList Size::" + enhancedList.getSize());

Paginator paginator=statusDetailContext.getPaginator();
List list=(List)paginator.current();
	System.out.println("Page list Size::" + list.size());
List headercolumns=statusDetailContext.getDisplayColumns();
MCMUserSession userSession=(MCMUserSession)session.getAttribute(MCMUserSession.USER_SESSION_KEY);
HashMap hm=(HashMap)session.getAttribute("repType");

HashMap hm1=null;
	if (null != session.getAttribute("matOverrides")) {
hm1=(HashMap)session.getAttribute("matOverrides");
}

String emailVal="";
	if (null != session.getAttribute("UserEmailId")) {
emailVal=(session.getAttribute("UserEmailId")).toString();
}
%>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/contract_mgr.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/combinedscripts.js" type="text/javascript"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title><bean:message key="MCM.TITLE"/></title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

	<STYLE type=text/css>
	THEAD TR {
		POSITION: relative; ; TOP: expression(offsetParent.scrollTop)
	}
	</STYLE>
  </head>


<script language="javascript">
		var displayLoadingImage = "<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" height=\"200\"><tr><td valign=\"middle\"><p align=\"center\"><img  src='<%=request.getContextPath()%>/images/wait.gif' alt=''>&nbsp;<font size=\"3\">Loading..</font></td></tr></table>";
    function previousPage() {
		document.MatStatusDetailForm.event.value = "pageprevious";
		var url = "mcmstatusdetailview.do";
		var params = "?";
		params += "event=pageprevious";
		params += "&method=";
		params += "&requesttype="+document.getElementById("requesttype").value;
		params += "&usersource=scc";
			document.getElementById('statusDetailRes').innerHTML = displayLoadingImage;
		makePOSTRequestForSort(url,params);
//        document.MatStatusDetailForm.submit();
    }

    function nextPage() {
        document.MatStatusDetailForm.event.value = "pagenext";
//        document.MatStatusDetailForm.submit();
		var url = "mcmstatusdetailview.do";
		var params = "?";
		params += "event=pagenext";
		params += "&method=";
		params += "&requesttype="+document.getElementById("requesttype").value;
		params += "&usersource=scc";
			document.getElementById('statusDetailRes').innerHTML =displayLoadingImage;
		makePOSTRequestForSort(url,params);
    }

    function jumpToPage(pageNumberSelected) {
        document.MatStatusDetailForm.event.value = "pagespecific";
        document.MatStatusDetailForm.pagenumber.value = pageNumberSelected.value;
//        document.MatStatusDetailForm.submit();
		var url = "mcmstatusdetailview.do";
		var params = "?";
		params += "event=pagespecific";
		params += "&method=";
		params += "&requesttype="+document.getElementById("requesttype").value;
		params += "&pagenumber="+pageNumberSelected.value;
		params += "&usersource=scc";
			document.getElementById('statusDetailRes').innerHTML = displayLoadingImage;
		makePOSTRequestForSort(url,params);
    }

	 function jumpToFirstPage() {
		var url = "mcmstatusdetailview.do";
		var params = "?";
		params += "event=pagefirst";
		params += "&method=";
		params += "&requesttype="+document.getElementById("requesttype").value;
		params += "&usersource=scc";
			document.getElementById('statusDetailRes').innerHTML = displayLoadingImage;
		makePOSTRequestForSort(url,params);
    }

	 function jumpToLastPage() {
		var url = "mcmstatusdetailview.do";
		var params = "?";
		params += "event=pagelast";
		params += "&method=";
		params += "&requesttype="+document.getElementById("requesttype").value;
		params += "&usersource=scc";
			document.getElementById('statusDetailRes').innerHTML = displayLoadingImage;
		makePOSTRequestForSort(url,params);
    }

    function sort(sortColumnSelected) {
		
        document.MatStatusDetailForm.event.value = "sort";
        document.MatStatusDetailForm.sortcolumn.value = sortColumnSelected;
	    //document.MatStatusDetailForm.submit();
		var url = "mcmstatusdetailview.do";
		var params = "?";
		params += "event=sort";
		params += "&sortcolumn="+sortColumnSelected;
		params += "&method=";
		params += "&requesttype="+document.getElementById("requesttype").value;
		params += "&pagenumber=";
		params += "&usersource=scc";
			document.getElementById('statusDetailRes').innerHTML =displayLoadingImage;



		makePOSTRequestForSort(url,params);
	
    }

	//Modified the function to implement the Ajax submit
    function submitForm() {
		var url = "mcmstatusdetailview.do";
		var params = "?";		
		var emailFlag = validateSingleEmail(document.MatStatusDetailForm.email);
		if (emailFlag == false) {
			return false;
		}else
		{    
			//document.MatStatusDetailForm.event.value = "sendemail";			
			params += "&event=sendemail";
			params += "&method=sendEmail";
			params += "&email="+document.getElementById("email").value;
			params += "&requesttype="+document.MatStatusDetailForm.repType.options[document.MatStatusDetailForm.repType.selectedIndex].value;
			params += "&repType="+document.getElementById("repType").value;
			document.getElementById('reportRes').innerHTML = "<font size='1' color='red'>In Progress.... </font>";
			document.getElementById('download2').disabled = true;
			makePOSTRequest(url,params); 
			//document.MatStatusDetailForm.submit();
		}
    }

   var http_request = false;
   // Function to post the request
   function makePOSTRequest(url, parameters) {	  
      http_request = false;	  
      if (window.XMLHttpRequest) { // Mozilla, Safari,...
         http_request = new XMLHttpRequest();
         if (http_request.overrideMimeType) { 
         	// set type accordingly to anticipated content type
            //http_request.overrideMimeType('text/xml');
            http_request.overrideMimeType('text/html');  
         }
      } else if (window.ActiveXObject) { // IE
         try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
      if (!http_request) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }
      
      http_request.onreadystatechange = alertContents;
      http_request.open('POST', url, true);
      http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.setRequestHeader("Content-length", parameters.length);
      http_request.setRequestHeader("Connection", "close");
      http_request.send(parameters);

   }
	
	// Function to handle the response
	function alertContents() {	
		if (http_request.readyState == 4) {
			if (http_request.status == 200) {
				//alert(http_request.responseText);
				result = http_request.responseText;				
				document.getElementById('reportRes').innerHTML = '<bean:message key="emailSentMsg"/>';            
				document.getElementById('download2').disabled = false;
				//document.getElementById('reportRes').innerHTML = "RESULT DISPLAYED HERE";
			} else {
				alert('There was a problem with the request.');
			}
		}
	}


 function makePOSTRequestForSort(url, parameters) {	  
	  url=url+parameters;
	  http_request = false;	  
	  
	if (window.ActiveXObject) { // IE	
         try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }else  if (window.XMLHttpRequest) { // Mozilla, Safari,...      
         http_request = new XMLHttpRequest();
         if (http_request.overrideMimeType) { 
         	// set type accordingly to anticipated content type
            //http_request.overrideMimeType('text/xml');
            http_request.overrideMimeType('text/html');  
         }
      }
      if (!http_request) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }
      
      http_request.onreadystatechange = alertContentsForSort;
      http_request.open('POST', url, true);
      http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.setRequestHeader("Content-length", parameters.length);
      http_request.setRequestHeader("Connection", "close");
      http_request.send(false);

   }
	
	// Function to handle the response
	function alertContentsForSort() {	
		if (http_request.readyState == 4) {
			if (http_request.status == 200) {
				result = http_request.responseText;				
				document.getElementById('statusDetailRes').innerHTML = result; 
				document.getElementById('reportRes').innerHTML = "";
			} else {
				alert('There was a problem with the request.');
			}
		}
	}


function validateSingleEmail(fld)
{
    if( (fld.value==null) || (fld.value=="") || (fld.length==0) ) {
		alert ("Email is a required field");
		return false;
	}
	if(!fld.value)
	{
		return true;
	}
	regExp = new RegExp(" ", "g");
	var emailValue = fld.value.replace(regExp, ""); //fld.value;

    var emailArray = emailValue.split(",");
    for(i=0; i<emailArray.length; i++) {
        if(!validateEmail(emailArray[i]) ) {
            fld.focus();
            return false;
        }
    }
    return true;
}

function validateEmail(val) {
	var wordchar= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_,';
        var char1= val.charAt(0);
        var charN= val.charAt(val.length-1);
        var at= val.indexOf('@');
        var dot= val.indexOf('.',at+2);
        if(val.indexOf(' ') != -1 || at == -1 || dot == -1 || wordchar.indexOf(char1) == -1 || wordchar.indexOf(charN) == -1)
        {
            alert('The Email address entered field must contain a valid email address. ' );
            return false;
        }
    //     alert ("at: " + at);
    //     alert("dot: " + dot);
        var pre_at= val.charAt(at-1);
    //     alert ("pre_at: " + pre_at);
        var post_at= val.charAt(at+1);
    //     alert ("post_at: " + post_at);
        var pre_dot= val.charAt(dot-1);
    //     alert ("pre_dot: " + pre_dot);
        var post_dot= val.charAt(dot+1);
    //     alert ("post_dot: " + post_dot);
    //     alert ("fld.value.indexOf('@',at+2): " + fld.value.indexOf('@',at+2));
    //	if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 || fld.value.indexOf('@',at+2) != -1)
        if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 )
        {
            alert('The Email address field must contain a valid email address.'  );
            fld.focus();
            return	 false;
        }
        return true;
}
  
		/*01-June-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - Start*/
		//Handles the onchange action of Report Type selection
		function showReport(selectObj){
			document.getElementById('reportRes').innerHTML = "";
			var reportType = selectObj.options[selectObj.selectedIndex].value;

			var url = "mcmstatusdetailview.do";
			var params = "?";		
			params += "&event=loadResults";
			params += "&method=statusDetails";
			params += "&requesttype="+document.getElementById("requesttype").value;
			params += "&repType="+reportType;
			params += "&requestid="+document.getElementById("requestid").value;
			params += "&status="+document.getElementById("status").value;
			params += "&overrides="+document.getElementById("overrides").value;

			document.getElementById('statusDetailRes').innerHTML =displayLoadingImage;			

			makePOSTRequestforResults(url,params); 
		}

	   	function makePOSTRequestforResults(url, parameters) {	  
	      http_request = false;	  
	      if (window.XMLHttpRequest) { // Mozilla, Safari,...
	         http_request = new XMLHttpRequest();
	         if (http_request.overrideMimeType) { 
	            http_request.overrideMimeType('text/html');  
	         }
	      } else if (window.ActiveXObject) { // IE
	         try {
	            http_request = new ActiveXObject("Msxml2.XMLHTTP");
	         } catch (e) {
	            try {
	               http_request = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch (e) {}
	         }
	      }
	      if (!http_request) {
	         alert('Cannot create XMLHTTP instance');
	         return false;
	      }
 
	      http_request.onreadystatechange = displayResults;
	      http_request.open('POST', url, true);
	      http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	      http_request.setRequestHeader("Content-length", parameters.length);
	      http_request.setRequestHeader("Connection", "close");
	      http_request.send(parameters);
	   	}
    
		// Function to handle the response
		function displayResults() {	
			if (http_request.readyState == 4) {
				if (http_request.status == 200) {
					result = http_request.responseText;				
					document.getElementById('statusDetailRes').innerHTML = result;            
				} else {
					alert('There was a problem in retrieving the results.');
				}
			}
		}
		/*01-June-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - End*/
  
	</script>
	<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />

	<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="">

  <div id="application_area">
	<!-- <div id="moduleContainerId"> -->
			<table height="16">
				<tr><td></td></tr>
			</table>

	<div id="mod_1" class="mod_header" style="width:99%">
				<h2 class="mh_title" style="margin-left:15px;">Request Status Detail</h2>
	 </div>   
  
     <!-- Body Starts from here -->
	
	 <div id="marque_1" class="marque" style="width:99%; margin-left: 11px;"> 
	  
				<form name="MatStatusDetailForm" action='mcmstatusdetailview.do'>
					<input type="hidden" name="pagenumber" 	id="pagenumber" />
					<input type="hidden" name="sortcolumn" 	id="sortcolumn" value="" />
					<input type="hidden" name="usersource" 	id="usersource" value="scc" />
					<input type="hidden" name="event" 		id="event" 		value="" />
					<input type="hidden" name="requesttype" id="requesttype" value='<%=statusDetailContext.getRequestType()%>'/>
					<input type="hidden" name="method" 		id="method" 	value="" />
					<input type="hidden" name="requestid" 	id="requestid" 	value='<%=statusDetailContext.getRequestNumber()%>' />
					<input type="hidden" name="status" 		id="status" 	value="<%=statusDetailContext.getStatus()%>" />
					<input type="hidden" name="overrides" 	id="overrides" 	value="<%=statusDetailContext.getOrStatus()%>" />
                  
					<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
						<TBODY><TR>
							<TD class="content" colspan="2">
								<span class="content">
									<table cellspacing="0" cellpadding="0" width="100%" bgcolor="#ffffff" border="0" bordercolor="#669999" >
										<tbody><tr>
											<td>
												<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF">
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
														<td width="50%">
															<label for="RequestName:">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Request Name:</label>
															<span class="content"> <%if ("null".equals(statusDetailContext.getRequestName())) {%> N/A <%} else {%> <%=statusDetailContext.getRequestName()%> <%}%></span>
														</td>
														<td>
															<label for="RequestName:">Request Number:</label>
															<span class="content"><%=statusDetailContext.getRequestNumber()%></span>
														</td>
                            </tr>
                           
                            <tr bordercolor="#CCCCCC" bgcolor="#FFFFFF">
														<td>
															<label for="RequestName:">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Request Type:</label>
															<!-- Modified as part of Q2FY13::to display label of request type for external user -->
															<% 
															//Added by sphilipo . Added check for external user role
															if (McmConstants.EXT_ROLES.contains(userSession.getUserRole())&& 
															(statusDetailContext.getRequestType().equals(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID) 
															||statusDetailContext.getRequestType().equals(McmConstants.MCM_UE_MOVE_S2S_PRODUCT)))
															{%>
															  <span class="content"> <bean:message key="<%=statusDetailContext.getRequestTypeOut()%>" /> </span>
															  <% 
															}
															else//End of changes for Q2FY13
															{%>															
															<span class="content"> <bean:message key="<%=statusDetailContext.getRequestType()%>" /> </span>
															<%
															}
															 %>
                              </td>
														<td>
															<label for="RequestName:">Status:</label>
															<span class="content"> <%=statusDetailContext.getStatus()%></span>
														</td>
                            </tr>
													<%if (request.getAttribute("matOverrides") != null) {%>
													<tr>
														<td>
															<label for="RequestName:">Requestor/Initiator:</label>
															<bean:write name="matOverrides" property="mat_vo_initiator" />
														</td>
													</tr>
													<tr>
														<td>
															<label for="RequestName:">Approver Name:</label>
															<bean:write name="matOverrides" property="mat_vo_approver" />
														</td>
													</tr>
                            <!--TD2492;saatmaku;12 oct 2007;start;Removal of solcat case from override -->
		                    <!-- <tr><td><b>Solcat Case#:</b><bean:write name="matOverrides" property="mat_vo_solcat_num" /></td></tr> -->
		                     <!--TD2492;saatmaku;12 oct 2007;end;Removal of solcat case from override-->
                            
													<tr>
														<td>
															<label for="RequestName:">Customer/Partner Name:</label>
															<bean:write name="matOverrides" property="mat_vo_customer_name" />
														</td>
													</tr>
													<tr>
														<td>
															<label for="RequestName:">Reason Code:</label>
															<bean:write name="matOverrides" property="mat_vo_reason_code" />
														</td>
													</tr>
													<tr>
														<td>
															<b><label for="RequestName:">Overrides:</label> </b>
                            <c:forEach var='item' items='${matOverrides.mat_vo_values}'>
								<c:out value="${item.description}" />,&nbsp;
							</c:forEach>
														</td>
													</tr>
                         <%}%>
                         
													<%if (request.getParameter("requesttype") != null && "MAT_CREATE_SITES".equals(request.getParameter("requesttype"))) {%>
													<tr>
														<td>
															<b># Lines Submitted:</b>
															<%=statusDetailContext.getLinesSubmitted()%>
														</td>
													</tr>
													<tr>
														<td>
															<b># Lines Created :</b>
															<%=statusDetailContext.getLinesFoundorCreated()%>		
														</td>		
													</tr>
													<%}%>
                         
													<%if (request.getParameter("requesttype") != null && "MAT_SEARCH_SITES".equals(request.getParameter("requesttype"))) {%>
													<tr>
														<td>
															<b># Lines Submitted:</b>
															<%=statusDetailContext.getLinesSubmitted()%>
														</td>
													</tr>
													<tr>
														<td>
															<b># Lines Found :</b>
															<%=statusDetailContext.getLinesFoundorCreated()%>
														</td>
													</tr>
													<tr>
														<td>
															<b># Lines Not Found:</b>
															<%=statusDetailContext.getLinesNotFound()%>
														</td>
													</tr>
                         <%}%>
                         
                        <tr><td height="20"></td></tr>
                            
                          </table>
											</td>
										</tr>
										<tr>
											<td>
						<div id="statusDetailRes">
													<table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tbody>
                                      <!--<table width="100%" border="0" cellspacing="0" cellpadding="0">-->
                                      <!--</table>-->
                                      <!-- added a table inside the td so that there isn't a line in between the button and the message by krys -->
									<!--String selectionBoxName, String firstLink, String previousLink, String nextLink, String lastLink, String specificPageLink-->
															<tr valign="top" align="right" bgcolor="#669999">
																<td align="right" colspan="20">
                                           <%String html = paginator.getPaginatorBar("pageNumberTop","javascript:jumpToFirstPage();\">", "javascript:previousPage();\">", "javascript:nextPage();", "javascript:jumpToLastPage();","javascript:jumpToPage(this.options[this.selectedIndex]);");											
											 html = html.replaceAll("&lt;","<span style=\"color:#ffffff;font-weight:bold\">&lt;</span>");											
											 html = html.replaceAll("&gt;","<span style=\"color:#ffffff;font-weight:bold\">&gt;</span>");										   
										   %>

										   <div style="color:#ffffff"><%=html%></div>
											
                                        </td>
                                      </tr>
														</tbody>
								</table>
								
								<div id="scroll" style="overflow-y:scroll; height: 180;">
														<table cellspacing="1" cellpadding="0" width="100%" border="0">
								  <THEAD>
																<tr valign="top" align="left" bgcolor="#A1A1A1">
									  <%//=headercolumns.size()%>
									  <% for (int i=0; i<headercolumns.size();i++){%>
									  
										<td nowrap class="contentbold" width="<%=(100/headercolumns.size())%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
											<% if(((Column)headercolumns.get(i)).isSortable())
											{%>
													
												<A HREF="javascript:sort('<%=((Column)headercolumns.get(i)).getName()%>')">&nbsp;<font color="#FFFFFF">&nbsp;<bean:message  key="<%=((Column)headercolumns.get(i)).getDisplayLabel()%>"/></font></A>&nbsp;
											<% } else { 
																//out.println("else part of  isSortable : " + ((Column)headercolumns.get(i)).getDisplayLabel());
																//if (userSession.getAccessLevel().equalsIgnoreCase("4") && ((Column)headercolumns.get(i)).getDisplayLabel().equalsIgnoreCase("upload.mat.column.error_message"))
																	//	{
																	
																		//}
																//else
																//{
											
											%>
															<A HREF="javascript:sort('<%=((Column)headercolumns.get(i)).getName()%>')">&nbsp;<font color="#FFFFFF">&nbsp;<bean:message  key="<%=((Column)headercolumns.get(i)).getDisplayLabel()%>"/></font></A>&nbsp;
												
											<% }%>
											<% if(enhancedList.isSortedOn(((Column)headercolumns.get(i)).getName()))
											 {
												if(enhancedList.isAscendingSort())
												{%>
													<img src="https://www.cisco.com/apps-ui/generic/1.0/images/mod_grey_arrow_dwn.gif" width="7" height="4"/>
												<%} else 
												{%>
													<img src="https://www.cisco.com/apps-ui/generic/1.0/images/mod_grey_arrow_up_.gif" width="7" height="4"/>
												<% }
												}
												%>
											

										</td>
									  <% } %>
									  </tr>
											  </THEAD>
									  <% for(int i=0;i<list.size();i++){
									  Map aRow = (Map) list.get(i);
														if (i % 2 == 0) {%>
													<tr bgcolor="#ffffff">
										  <% for(int j=0;j<headercolumns.size();j++){
											 // #foreach($column in $headercolumns)%>
														<td align="center" width="<%=(100/headercolumns.size())%>%">
															<%Column displayColumn = ((Column) headercolumns.get(j));
															
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
													<tr bgcolor="#e7e7e7">
										  <% for(int j=0;j<headercolumns.size();j++){
											 // #foreach($column in $headercolumns)%>
														<td align="center">
															<%Column displayColumn = ((Column) headercolumns.get(j));
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
                            <%//=paginator.getPaginatorBar("pageNumberTop", "javascript:previousPage()", "javascript:nextPage()", "javascript:jumpToPage(this.options[this.selectedIndex])")%>
                                        </td>
                                      </tr>-->

                                    </tbody>
                                  </table>
								  </div>
                       </div>
					  </td>
					  </tr>
					 
					  <tr>
					  <td>
											<table cellspacing="0" cellpadding="0" width="100%" border="0">
												<tbody><tr>
													<td height="10">
														<img height="1" src="https://www.cisco.com/apps-ui/generic/1.0/images/spacer.gif" width="1">
                                  <table width="75%" border="0">
                                  <tr>
																<td>
																	<span class="contentbold">Report Types:</span>
																	<select name="repType" id="repType" onchange="showReport(this)">
																	<!--  Added below if condition to add the report type as Output as part of Q1FY13 SmarCare Services changes by vibk -->
																	<% 
																	if (McmConstants.EXT_ROLES.contains(userSession.getUserRole()) && 
																		(!(statusDetailContext.getRequestType().equals(McmConstants.MAT_DNR_CONTRACT_LVL))) &&
																		(!(statusDetailContext.getRequestType().equals(McmConstants.MAT_DNR_SITE_LVL))) &&
																		(!(statusDetailContext.getRequestType().equals(McmConstants.MAT_DNR_PRODUCT_LVL)))  
																		)
																	{%>
																	  <option value="O">Output</option>
																	  <% 
																	  System.out.println(" Is request type MAT_DNR_CONTRACT_LVL type"+!(statusDetailContext.getRequestType().equals(McmConstants.MAT_DNR_CONTRACT_LVL)));
																	  System.out.println(" Is request type MAT_DNR_SITE_LVL type"+!(statusDetailContext.getRequestType().equals(McmConstants.MAT_DNR_SITE_LVL)));
																	  System.out.println(" Is request type MAT_DNR_PRODUCT_LVL type"+!(statusDetailContext.getRequestType().equals(McmConstants.MAT_DNR_PRODUCT_LVL)));
																	}
																	else 
																	{%>
																	         <% if (hm.containsKey("E")){%>
																	  										<option value="E">Errors</option>
																	  		<%}
									                                         if (hm.containsKey("G")){%>
																											<option value="G">GU</option>
									                                        <%}%>
									                                        <% if (hm.containsKey("S")){%>
																											<option value="S">Success</option>
									                                        <%}%>  
									                                        <!--TD013;saatmaku;Adding to display results in the Request Details page drop down --> 
									                                        <% if (hm.containsKey("R")){%>
																											<option value="R">Results</option>
									                                        <%}
									                                        
									                                        }%>                                       
                                        </select>

									</td>
                                    </tr>
															<tr><td>&nbsp;</td></tr>
                                    <tr>
																<td>
																	<span class="contentbold">Email Address:</span>
																	<input type="text" name="email" id="email" value="<%=emailVal%>" />
																</td>
                                    </tr>
                                    <tr>
                                      <td>&nbsp;</td>
                                    </tr>
                                    <tr>
										
									<td><input id="download2" class="button" type="button" name="download2" value="Email" onClick="javascript:submitForm(this)" /></td>
									

                                     
                                    </tr>
                                    <tr>
																<td class="caption">Tip: Click the Email button to receive the above information in an Excel spreadsheet.
																	<br />
																	<div id="reportRes"><div>
																</td>
                                    </tr>
                    </table>

</td>
												</tr></tbody>
                    </table>
                  </td>
									</tr></tbody>
              </table>
</td>
						</tr></tbody>
</table>
</form>
</div>
 </div>

  </body>
</html>
