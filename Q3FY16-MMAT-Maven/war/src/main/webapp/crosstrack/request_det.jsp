<%@ page import="com.cisco.crosstrack.data.genjava.XxcssCtRefIdObjType" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ include file="localeInfo.jsp" %>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='request_det.title'/></title>
		
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		
		<!-- component linked resources -->
		<!--  Commented for Defect 7774 - Combining All common JS scripts 
		<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/genJSON.js"></script>		
		<script type="text/javascript" src="js/jsonrpc.js"></script>
      	<script language="javascript" src="js/datapersistence.js"></script>
      	-->
      	<script language="javascript" src="js/RequestDetails.js"></script>
      	<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>
      	
      	
	   <%-- <style type="text/css">
			#Layer1 {
				position:absolute;
				left:219px;
				top:215px;
				width:131px;
				height:17px;
				z-index:1;
			} 
       </style>
       --%>
        
        <script language="javascript">
        
        
          function displayErrors() {
        //   alert(" on display errors ");
          <%
           String emailReport = (String)request.getAttribute("Email_Report_Exists");
           String errorReport = (String)request.getAttribute("Request_details_error_message");
           
           
           
           if (emailReport != null ) {
           %> 
              <%-- var subject = '<%=request.getAttribute("Email_subject")%>';
 	          // var body = '<%=request.getAttribute("Email_body")%>';
 	         
 	          // alert('subject '+subject);
 	           // alert('body '+body);
               //window.open('<%=request.getContextPath()%>/crosstrack/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=1&strRequestName='+document.getElementById('RequestName').value+'&subject='+subject+'&body='+body, 'EMail','width=600,height=430,resizable=yes');
               
               --%>
              //  window.open('<%=request.getContextPath()%>/crosstrack/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=1&strRequestName='+document.getElementById('RequestName').value, 'EMail','width=650,height=430,resizable=yes');
               window.open('<%=request.getContextPath()%>/crosstrack/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=1&strRequestName='+document.getElementById('RequestName').value+'&InvokedFromXtrack=true', 'EMail','width=650,height=430,resizable=yes');
         <% } if (errorReport != null ) { %>
              var errorRep =  '<%=errorReport%>';
              alert(errorRep);
         <% } %>

        }
        
        function callReportType()
        {
        
        
        var reportValue=document.getElementById("selectName").value;
        // alert('report value '+reportValue);
        if (reportValue=="") {
	        alert("Please select the type of Report");
	      //   return false;
	        return ;
	        }
	        
		if (reportValue=="1") {
			var reqid=document.getElementById("reqId").value;
			var refid=document.getElementById("referenceId").value;
		
			 window.location="requestDetailsDispatch.do?methodName=onOnlineDownload&reqId="+reqid+"&refId="+refid+"&reportValue="+reportValue;
	        }
	         
	       if (reportValue=="2") {
	        var reqid=document.getElementById("reqId").value;
			var refid=document.getElementById("referenceId").value;
	        
 	        // window.open('jsp/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=1', 'EMail', 600, 430);
 	       
 	        
 	        window.location="requestDetailsDispatch.do?methodName=onOnlineEmail&reqId="+reqid+"&refId="+refid+"&reportValue="+reportValue;
 	        //window.open('<%=request.getContextPath()%>/crosstrack/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=1&strRequestName='+document.getElementById('RequestName').value, 'EMail', 600, 430);
 	        

	        }
	        if (reportValue=="3"){
	    	var reqid=document.getElementById("reqId").value;
			var refid=document.getElementById("referenceId").value;
		
		
			window.location="requestDetailsDispatch.do?methodName=onOnlineDownload&reqId="+reqid+"&refId="+refid+"&reportValue="+reportValue;
	       
	        
	       
	        }
	        if (reportValue=="4"){
	        
	        var reqid=document.getElementById("reqId").value;
			var refid=document.getElementById("referenceId").value;
			
	          // window.open('jsp/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=0', 'EMail', 600, 430);
	         // alert('Request name '+document.getElementById("RequestName").value);
	         
  	        window.location="requestDetailsDispatch.do?methodName=onOnlineEmail&reqId="+reqid+"&refId="+refid+"&reportValue="+reportValue;
	       // window.open('<%=request.getContextPath()%>/crosstrack/crosstrack_email.jsp?appShortName=XXCSS_SOM&emailFormatOpt=0&strRequestName='+document.getElementById('RequestName').value, 'EMail', 600, 430);
	        } 
	        
	   
        }
        function emailSubmit(toName, emailAddress, emailSubject, emailComent,copyEmail,selfMail)
				{
				sendEmail(toName, emailAddress, emailSubject, emailComent,copyEmail,selfMail);
				}
				
		function summaryPage(){
		
		var refid=document.getElementById("referenceId").value;
		//alert ("here"+refid);
		
		if (refid == "")  {
		   alert("XXCSS_CT:650079 - Please select Reference ID and then click on either Go or Refresh button");
		   return;
		 }
		   
		var summurl=document.getElementById("summurl").value;
		
		 // alert('summurl '+summurl.length);
		 
		//alert ("here"+summurl);
		if (summurl.length != 0) {
		   summaryURL=summurl+refid
		  // alert('summaryURL '+summaryURL);
		  // window.open(summaryURL,'SummaryPage','width=400,height=300,toolbar=yes,resizable=yes');
		  window.open(summaryURL);
		 }  else  {
		   alert('XXCSS_CT:650078 - There is no URL associated to this Reference ID');
		   
		 }
		//self.close();
		
				}
        </script>
</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->

<%
 try {
%>

		<input type=hidden name="emailFormatType" value=''/>
		<input type=hidden name="toName" value=''/>
		<input type=hidden name="emailAddress" value=''/>
		<input type=hidden name="emailSubject" value=''/>
		<input type=hidden name="emailComent" value=''/>
		<input type=hidden name="copyEmail" value=''/>
		
	
  <%-- <p><html:errors/><br>  --%> 
		
	<body marginheight="0" marginwidth="0" onLoad="javascript:displayErrors()";>
	
	<%-- 
	<div id="Layer1">
		  <table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="button_left" onclick="document.getElementById('refresh').click();"></td>
              <td><input onclick="javascript:showRequestDetails();" id="refresh" class="button" type="button" name="refresh" value="Refresh" /></td>
              <td class="button_right" onclick="document.getElementById('refresh').click();"></td>
            </tr>
          </table>
	</div>  
	--%>
    
    
   
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top"><img src="http://www.cisco.com/swa/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>
					<td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="http://www.cisco.com/swa/i/s.gif" alt="" height="8" width="100" border="0" /></td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="http://www.cisco.com/swa/i/s.gif" alt="" height="8" width="1" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='Common.closeWindow'/></a></td>
									<td align="left" valign="top" width="100%" background="http://www.cisco.com/swa/i/grn_vertlines_top.gif"><img src="http://www.cisco.com/swa/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- screen title - alternate version with additional elements -->


		 
		
<div class="title_alt" id="page_title">
<div class="mh_title"><fmt:message key='request_det.requestDetails'/></div>
<!-- module header action -->	
		<form id="module_action" action="#" method="get" name="module_action" class="inline">	
		<table border="0" cellspacing="0" cellpadding="0" class="mh_action ">
			<tr>
				<td><fmt:message key='request_det.action'/></td>
				<td>
					<select name="selectName" size="1" class="inputTextLarge" style="width:auto">
						<option selected="selected" value=""><fmt:message key='request_det.selectOne'/></option>
						<option value="1"><fmt:message key='request_det.downloadOutputReport'/></option>
						<option value="2"><fmt:message key='request_det.emailOutputReport'/></option>
						<option value="3"><fmt:message key='request_det.downloadErrorReport'/></option>
						<option value="4"><fmt:message key='request_det.emailErrorReport'/></option>
					</select>
				</td>
				
				<td style="padding:0"><table class="secondary_enabled_dark" border="0" cellspacing="0" cellpadding="0">
						<tr>
	<!-- <td class="button_left" onclick="document.getElementById('searchforCustomer').click();"></td> -->
	<td align="left">
	
	<a href="javascript:callReportType()"><img src="images/global/buttons_and_icons/icons/grey/icn_go.gif" alt="<fmt:message key='Common.goButtonAlt'/>" align="absmiddle" border="0" height="17" width="17" /></a>
	<!-- <input id="searchforCustomer" class="button" type="submit" name="searchforCustomer" value="Search for Customer(s)" /> --> </td>
	<!-- <td class="button_right" onclick="document.getElementById('searchforCustomer').click();"></td> -->
	</tr>
	</table>
	<!--<input id="searchforContract" class="button" type="submit" name="searchforContract" value="Search for Contract(s)" />--></td>
			</tr>
		</table>
		</form>
</div>


		
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
		
		
		<form id="FormName" action="#" method="get" name="FormName" class="inline">
			<div class="marque_grid">
			<div id="fields" class="sub_block_hr">
				<table border="0" cellspacing="0" cellpadding="0">
				<colgroup>
				<col width="250" />
				</colgroup>
					<tbody>
						<tr>
						
						<%-- AP# HTML code change start --%>
						 <td>
								<table border="0" cellspacing="0" cellpadding="0" width="489">
								<colgroup>
								<col width="125" />
								</colgroup>
								<tbody>
									<tr>
									<%
									//System.out.println("AP# ************************** inside request_det.jsp ");
									// com.cisco.crosstrack.data.dao.RequestStatusBean rdb=(com.cisco.crosstrack.data.dao.RequestStatusBean)request.getAttribute("RequestDBean");
									com.cisco.crosstrack.data.dao.RequestStatusBean rdb=(com.cisco.crosstrack.data.dao.RequestStatusBean)session.getAttribute("RequestDBean");
									
									%>
									
										<td align="right"><label><fmt:message key='request_det.requestIDNumberLabel'/>#</label>&nbsp;</td>
										<td class="readonly"><%=rdb.getRequestIdiString()%> </td> 
										
									
										    
										 <input type=hidden name="reqId" value="<%=rdb.getRequestIdiString()%>"/>
										
										 
										 
										 
										
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='request_det.requestTypeLabel'/></label>&nbsp;</td>
										<td class="readonly"><%=rdb.getRequestTypeStr()%></td>
									</tr>
									
									<tr>
										<td align="right"><label><fmt:message key='request_det.requestNameLabel'/></label>&nbsp;</td>
										<td class="readonly"><%=rdb.getRequestNameStr()%></td>
										<input type="hidden" name="RequestName" id ="RequestName" value="<%=rdb.getRequestNameStr()%>" />
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='request_det.funtionLabel'/></label>&nbsp;</td>
										<td class="readonly"><%=rdb.getFunctionTypeStr()%></td>
									</tr>
									<tr>
										<td align="right"><br/><label><fmt:message key='request_det.requestIDLabel'/></label>&nbsp;</td>
										<!-- <td class="readonly"><a href="#">Q-12355</a></td> -->
										<td valign="bottom">
										<select class="inputTextMedium" name="referenceId" >
										<option selected="selected" value=""><fmt:message key='Common.selectOne'/></option>
										<%
										if(null!=session.getAttribute("RefIds")){
										java.util.ArrayList al=(java.util.ArrayList)session.getAttribute("RefIds");
										for(int i=0 ;i< al.size();i++){
										if(((XxcssCtRefIdObjType)al.get(i)).getReferenceId()!=null){
										%>
										<option  value="<%=((XxcssCtRefIdObjType)al.get(i)).getReferenceId()%>"><%=((XxcssCtRefIdObjType)al.get(i)).getReferenceId()%></option>
										<%}}}%>
										</select>
                             <a href='javascript:summaryPage()' ><img  src="images/global/buttons_and_icons/icons/white/icn_go.gif" alt="<fmt:message key='Common.goButtonAlt'/>" align="absmiddle" border="0" height="17" width="17" /></a>
							<input type='hidden' name='summurl' value='<%=(String)session.getAttribute("SummaryURL")%>'/>

									&nbsp;&nbsp;&nbsp;<input onclick="javascript:showRequestDetails();" id="refresh" class="button" type="button" name="refresh" value="<fmt:message key='request_det.refreshButton'/>" /></td>
									
									</tr>
								</tbody>
								</table>
							</td><!--  window.top.close()onClick="javascript:summaryPage(); -->
							<td valign="top">
								<table border="0" cellspacing="0" cellpadding="0" width="370">
								<colgroup>
								<col width="125" />
								</colgroup>
								<tbody>
									<tr>
										<td align="right"><label><strong><fmt:message key='request_det.statusLabel'/> </strong></label>&nbsp;</td>
										<td class="readonly">
										<% if("COMPLETED".equals(rdb.getStatusStr())){%>
										<a href='requestDetailsDispatch.do?methodName=onOnlineDownload&reqId=<%=rdb.getRequestIdiString()%>&isLink=true'><%=rdb.getStatusStr()%></a>
										<%}else if("FAILED".equals(rdb.getStatusStr())){%>
										<a href='requestDetailsDispatch.do?methodName=onOnlineDownload&reqId=<%=rdb.getRequestIdiString()%>&isLink=true'><%=rdb.getStatusStr()%></a>
										<%}else if("COMPLETED WITH ERRORS".equals(rdb.getStatusStr())){%>
										<a href='requestDetailsDispatch.do?methodName=onOnlineDownload&reqId=<%=rdb.getRequestIdiString()%>&isLink=true'><%=rdb.getStatusStr()%></a>
										<%}else {%>
										<%=rdb.getStatusStr()%>
										<%}%>
										
										</td>
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='request_det.requestedLabel'/></label>&nbsp;</td>
										<td class="readonly"><%=rdb.getRequestDate()%><br />
											</td>
									</tr>
		                            <% if("COMPLETED".equalsIgnoreCase(rdb.getStatusStr())) { %>
									
									<tr>
										<td align="right"><label><fmt:message key='request_det.completedLabel'/></label>&nbsp;</td>
										<td class="readonly"><%=rdb.getCompleteDate()%><br />
											</td>
									</tr>
									
									<% } %>									
									
								</tbody>
								</table>
							</td>							
						<%-- AP# HTML code change will end here --%>	
						</tr>
					</tbody>
				</table>
				<br/>
			</div>
			<div class="sub_block_hr_nopad" id="table">		
<!-- grid column header -->
<div id="mailconf">

</div>
<div class="mod_head">
<table width="948" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="18%" />
	<col width="13%" />
	<col width="10%" />
	<col width="15%" />
	<col width="10%" />
	<col width="10%" />
	<col width="24%" />
</colgroup>
<thead>
	<tr>
		<th class="first" align="left"><fmt:message key='request_det.actionTableHead'/></th>
		<th align="left"><fmt:message key='request_det.startDateTableHead'/></th>
		<th align="left"><fmt:message key='request_det.timeTableHead'/></th>
		<th align="left"><fmt:message key='request_det.completeDateTableHead'/></th>
		<th align="left"><fmt:message key='request_det.timeTableHead'/></th>
		<th align="left"><fmt:message key='request_det.statusTableHead'/></th>
		<th align="left"><fmt:message key='request_det.reasonTableHead'/></th>
	</tr>
</thead>	
</table>
</div>

<!-- grid body -->
<div class="mod_grid_sm " id="grid_1">
<table width="948" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="18%" />
	<col width="13%" />
	<col width="10%" />
	<col width="15%" />
	<col width="10%" />
	<col width="10%" />
	<col width="24%" />
</colgroup>
</table>
</div>

			</div>
			<!-- grid info row -->
<div class="mod_info2">
<table width="566" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">
<colgroup>
	<col width="31%" />
	<col width="45%" />
	<col width="24%" />
</colgroup>
<tbody>
	<tr>
		<td></td>
		<td nowrap="nowrap" class="active"><fmt:message key='request_det.timeMessage'/></td>
		<td></td>
	</tr>
</tbody>	
</table>
</div>
<!-- grid info row end -->
<br />
			</div>
		</form>
		</div>
		<!-- modules end -->
		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->
<div id ="vvvvcalDiv"></div>
		
<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->
<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->

<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************ -->
	</body>


<% } catch (Exception ex) {
  ex.printStackTrace();
 }

%>
</html>