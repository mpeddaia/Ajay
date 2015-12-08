<%@ page import="com.cisco.crosstrack.data.genjava.XxcssCtRefIdObjType" %>
<%@ include file="localeInfo.jsp" %>

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='RequestDetails.title'/></title>
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
      	<script language="javascript" src="js/requeststatus.js"></script>
      	<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>
      	
	    <style type="text/css">
<!--
#Layer1 {
	position:absolute;
	left:219px;
	top:210px;
	width:131px;
	height:17px;
	z-index:1;
}
-->
        </style>
</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->

	<body marginheight="0" marginwidth="0">
	<div id="Layer1">
		  <table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="button_left" onclick="document.getElementById('save1').click();"></td>
              <td><input onclick="javascript:showRequestDetails(-1,-1);" id="refresh" class="button" type="button" name="refresh" value="<fmt:message key='RequestDetails.refreshButton'/>" /></td>
              <td class="button_right" onclick="document.getElementById('save1').click();"></td>
            </tr>
          </table>
	</div>
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
<div class="mh_title"><fmt:message key='RequestDetails.request'/></div>
<!-- module header action -->	
		<form id="module_action" action="#" method="get" name="module_action" class="inline">	
		<table border="0" cellspacing="0" cellpadding="0" class="mh_action ">
			<tr>
				<td><fmt:message key='RequestDetails.action'/></td>
				<td>
					<select name="selectName" size="1" class="inputTextLarge" style="width:auto">
						<option selected="selected" value=""><fmt:message key='Common.selectOne'/></option>
						<option value=""><fmt:message key='RequestDetails.downloadErrorReport'/></option>
						<option value=""><fmt:message key='RequestDetails.downloadValidErrorReport'/></option>
						<option value=""><fmt:message key='RequestDetails.emailSystemReport'/></option>
						<option value=""><fmt:message key='RequestDetails.emailValidReport'/></option>
					</select>
				</td>
				
				<td style="padding:0"><table class="secondary_enabled_dark" border="0" cellspacing="0" cellpadding="0">
						<tr>
	<!-- <td class="button_left" onclick="document.getElementById('searchforCustomer').click();"></td> -->
	<td align="left"><input type="image" name="" src="../images/global/buttons_and_icons/icons/grey/icn_go.gif" alt="<fmt:message key='Common.goButtonAlt'/>" align="absmiddle" border="0" height="17" width="17" />
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
							<td>
								<table border="0" cellspacing="0" cellpadding="0">
								<colgroup>
								<col width="125" />
								</colgroup>
								<tbody>
									<tr>
										<td align="right"><label><fmt:message key='RequestDetails.requestID'/>#</label></td>
										<td class="readonly">19110</td>
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='RequestDetails.requestType'/></label></td>
										<td class="readonly"><fmt:message key='RequestDetails.offlineValid'/></td>
									</tr>
									
									<tr>
										<td align="right"><label><fmt:message key='RequestDetails.requestName'/></label></td>
										<td class="readonly"><fmt:message key='RequestDetails.userEntered'/></td>
									</tr>
									<tr>
										<td align="right"><label><fmt:message key='RequestDetails.function'/></label></td>
										<td class="readonly"><fmt:message key='RequestDetails.estimate'/></td>
									</tr>
									<tr>
										<td align="right"><br/><label><fmt:message key='RequestDetails.referenceID'/></label></td>
										<!-- <td class="readonly"><a href="#">Q-12355</a></td> -->
										<td valign="bottom">
										<select class="inputTextMedium" name="referenceId" >
										<%
										if(null!=request.getAttribute("RefIds")){
										java.util.ArrayList al=(java.util.ArrayList)request.getAttribute("RefIds");
										for(int i=0 ;i< al.size();i++){
										%>
										<option selected="selected" value="<%=((XxcssCtRefIdObjType)al.get(i)).getReferenceId()%>"><%=((XxcssCtRefIdObjType)al.get(i)).getReferenceId()%></option>
										<%}}%>
										</select>
<a href="../estimate_quote/cis_QUOTE_sum_det_ex.html" target="_blank"><img onClick="javascript:window.top.close();" src="../images/global/buttons_and_icons/icons/white/icn_go.gif" alt="GO" align="absmiddle" border="0" height="17" width="17" /></a>									</td>
									</tr>
								</tbody>
								</table>
							</td>
							<td valign="top">
								<table border="0" cellspacing="0" cellpadding="0">
								<colgroup>
								<col width="125" />
								</colgroup>
								<tbody>
									<tr>
										<td align="right"><label><strong><fmt:message key='RequestDetails.status'/></strong></label></td>
										<td class="readonly"><a href="#"><fmt:message key='RequestDetails.completed'/></a></td>
									</tr>
									<tr>
										<td align="right" valign="top"><label><fmt:message key='RequestDetails.requested'/></label></td>
										<td class="readonly">29-Jan-2005<br />
											2:25 PM (PDT)</td>
									</tr>
									<tr>
										<td align="right" valign="top"><label><fmt:message key='RequestDetails.completed'/></label></td>
										<td class="readonly">29-Jan-2005<br />
											2:25 PM (PDT)</td>
									</tr>
								</tbody>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
			</div>
			<div class="sub_block_hr_nopad" id="tableDAT">	
			</div>	
<!-- grid column header -->

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
		<th class="first" align="left"><fmt:message key='RequestDetails.action'/></th>
		<th align="left"><fmt:message key='RequestDetails.startDate'/></th>
		<th align="left"><fmt:message key='RequestDetails.time'/></th>
		<th align="left"><fmt:message key='RequestDetails.completeDate'/></th>
		<th align="left"><fmt:message key='RequestDetails.time'/></th>
		<th align="left"><fmt:message key='RequestDetails.status'/></th>
		<th align="left"><fmt:message key='RequestDetails.reason'/></th>
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
			</div> <!-- body grid end -->
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
		<td nowrap="nowrap" class="active"><fmt:message key='RequestDetails.pdt'/></td>
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

</html>