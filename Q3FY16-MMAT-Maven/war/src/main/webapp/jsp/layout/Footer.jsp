<%@ include file="../localeInfo.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" %>
<%
			String combinedScriptLocation3 = request.getScheme() + "://"
			+ request.getServerName()
			+ session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation3 = request.getScheme() + "://"
			+ request.getServerName()
			+ session.getAttribute("combinedimagesurl");
			User user=(User)session.getAttribute("User");
			String roleType = user.getChkRoleType();
			String ccoUserId = user.getUserAttributes().getUid();
			String distiSignIn=null;
			ResourceBundle menuProps = ResourceBundle.getBundle("menu");
			if(null != session.getAttribute("distiSignIn")){
			  distiSignIn=(String)session.getAttribute("distiSignIn");
			}else{
			  distiSignIn="NO";
			}
			String crossTrackContext=menuProps.getString("CrossTrackContext");
			String mcmContext=menuProps.getString("MCMContext");
			
			HttpSession sessionObj1 = request.getSession();
	        String  copyRight = (String)sessionObj1.getAttribute("COPY_RIGHT");	
	        copyRight = "1992-"+copyRight;
%>

<!-- FOOTER -->
<!-- Changes done for Critical alerts popup by gyeddula start-->
<link rel="stylesheet" href="css/coomnJQuery.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>


<script>
$(document).ready(function() {
 var roleType ="<%=roleType%>";
 var distiSignIn ="<%=distiSignIn%>";
 var id="#reminderAgreement1";
 //alert('Loading footer.jsp');
 // alert('webroot Footer.jsp: distiSignIn :'+distiSignIn);
// alert(document.getElementById('amContext').value);
 //alert(document.getElementById('quoteContext').value);
//alert(document.getElementById('crossTrackContext').value);
	//document.getElementById('mcmContext').value
//vtiruvee Q1FY13 commented the below code and added next line to check for 2-TIER RESELLER too
 //if(roleType == 'DISTRIBUTOR' && distiSignIn == "NO"){
 //alert('before if distiSignIn'+distiSignIn);
 if(distiSignIn == "NO"){
 
 
	$.ajax({
	      type:  "POST",
	      url:   document.getElementById('crossTrackContext').value+"/requestStatusDispatch.do?methodName=distiSigninAggrement",
	      async:  false,


	       data: "",
	      error:  function (request, msg, err){
	     


	       },


	      success:  function(data){
				        var response =data;
						//alert('response from xtrack Footer '+response);
						if(response == 'firstTimeDistiSaved'){
										$.ajax({
										      type:  "POST",
										      url:   document.getElementById('mcmContext').value+"/mcmindex.do?method=saveDistiSigninAggrement",
										      async:  true,
										       data: "",
										      error:  function (request, msg, err){},
										      success:  function(data){ 
										      


										      }
										      });


						displayCriticalAlerts();	


						  }
					 }
				alert('after success distiSignIn'+distiSignIn);
	       
     });
  		
  	}
 	 alert('after if distiSignIn'+distiSignIn);

});

//Q3Fy13 - CSCC Notifications AM TD - ajabalak
//Added below code for CSCC Critical alerts functionality
//Start

function displayCriticalAlerts(){
	//alert('in displayCriticalAlerts()');
	var criticalDivId="#criticalAlertDev";
	var userId = document.getElementById("userIdInFooter").value;
	var dontDisplayCookieName = userId+"dontDisplay";
	if($.cookie(dontDisplayCookieName)==null||$.cookie(dontDisplayCookieName)=="N"){
	//alert("before ajax call");
	$.ajax({
		 type:	"GET",
		  url: 	document.getElementById('crossTrackContext').value+"/bannerPage.do?methodName=getCriticalMessages",
    	async: 	false,
	    error: 	function (request, msg, err){
				},
	  success: 	function(data){
					var checkString = data;
					//alert('checkString:'+checkString);
					if(checkString.indexOf("checkbox")>0){
						criticalAlertOverlay(criticalDivId);
						$(window).resize(function(){
							if ($(criticalDivId).is(':visible'))
								criticalAlertOverlay(criticalDivId);
							
							
						});
					}else
						displayReminderAgreement(); 
				  }
				  });
				  //alert("after the ajax call");
		}
 
}
//End: ajabalak

function displayReminderAgreement(){
	
	var roleType ="<%=roleType%>";
	var distiSignIn ="<%=distiSignIn%>";
	var id="#reminderAgreement1";
	if(roleType == '2-TIER RESELLER'||roleType == 'DISTRIBUTOR'){
									resizeOverlay (id);
						           $(window).resize(function() {
							           if ( $(id).is(':visible') ) {
											resizeOverlay(id);
							           }

						            });
						}
	
	

}

//Q3Fy13 - CSCC Notifications AM TD - ajabalak
//Added below code for CSCC Critical alerts functionality
//Start


function criticalAlertOverlay(id)
{
	//alert('criticalAlertOverlay()');
	var maskHeight = $(document).height();
	var maskWidth = $(document).width();
	$("#mask").css({"width":maskWidth, "height":maskHeight});
	$("#mask").fadeIn(1000);
	$("#mask").fadeTo("slow", 0.8);	
	var winH = $(window).height();
	var winW = $(window).width();
	$(id).css({"width":400});	
	$(id).css("top", (winH/2) - $(id).height() / 2);
	$(id).css("left", winW / 2 - $(id).width() / 2);
	$(id).fadeIn(2000);
	window.scroll(winH / 2, winW / 5);
	window.scrollTo('top','left' );	

}
//End: ajabalak

function resizeOverlay (id) {

	var maskHeight = $(document).height();
	var maskWidth = $(document).width();

//Set heigth and width to mask to fill up the whole screen
	$("#mask").css({"width":maskWidth, "height":maskHeight});

//transition effect		
	$("#mask").fadeIn(1000);
	$("#mask").fadeTo("slow", 0.8);	

//Get the window height and width
	var winH = $(window).height();
	var winW = $(window).width();

//Set the popup window to center
	$(id).css("top", (winH/2) - $(id).height() / 2);
	$(id).css("left", winW / 2 - $(id).width() / 2);																				

//transition effect

	$(id).fadeIn(2000);
	//hideDropdowns();
	window.scroll(winH / 2, winW / 5);
	window.scrollTo('top','left' );	
	//alert('callig buttonFocus');
//buttonFocus();
//setTimeout("buttonFocus()",500);
//document.getElementById('ok').focus();
//var ok_id = $(document).attr("ok");
//alert($(ok_id).value());         
//$(ok_id).focus(); 
$//("#mask").fadeIn(100);
//alert('ok');
//$(document).ready(function(){
$("#ok").focus();
//}); 
}
function buttonFocus(){
//alert('callig buttonFocus');
document.getElementById('ok').focus();
}
function openCriticalPopupwindow(msgid){	
	//alert('in openCriticalPopupwindow');
	var dimen = "width=520,height=625,resizable=1,scrollbars=no";
	window.open("bannerPage.do?methodName=bannerPopup&messageId="+msgid,"POPUP",dimen);
}

function openSeeallMsgInCriticalPopup(){
 //alert('in openSeeallMsgInCriticalPopup');
	var dimen = "width=700,height=625,resizable=1,scrollbars=yes";
	window.open("bannerPage.do?methodName=getMessagesSeeAll","POPUP",dimen);
}
</script>







<div id="boxes">
	<div id="mask"></div>
	<div id="maskAlert"></div>
<div id="criticalAlertDev" class="reminderwindow" style="border:1px solid black ;background-color:white">
		<div id="heading" class="table_mod_header" style="border-bottom: none;">
			<strong><h1><fmt:message key="criticalMessages.header" /></h1></strong>
		</div>
		
		<iframe id="criticalMessageFrame" width="380" height="300" src='<%=crossTrackContext%>/bannerPage.do?methodName=getCriticalMessages'
				style="padding-top: 10px; padding-right: 0px; padding-bottom: 10px; padding-left: 16px; overflow-x: hidden;" 
			></iframe> 
		<div style="padding:5px;background-color:white">
			<a style="float: left;"  href="javascript:openSeeallMsgInCriticalPopup();"><p style="font-size:14px;color:#3333CC;"><font face="Arial"><fmt:message key="criticalMessages.showAll" /></font></p></a>
			<table border="0" cellspacing="0" cellpadding="0" id="button_ok" style="padding: 0; margin: 4px 4px; height: 20px; vertical-align: top; border:none; float: right;" align="right" >
              					<tr>
              						<td class="button_left" style="background-image: url('<%= combinedImagesLocation3 %>images/global/buttons_and_icons/buttons/btn_primary_lf.gif'); background-repeat: no-repeat; cursor: pointer; width: 12px" onclick="document.getElementById('ok').click();"></td>
              						<td><input id="ok"  style="color:; font-size: 	11px; font-family: Arial, Helvetica, sans-serif; font-weight: bold; background-image: url('<%= combinedImagesLocation3 %>images/global/buttons_and_icons/buttons/btn_primary_md.gif'); background-repeat: repeat-x; white-space: nowrap; cursor: pointer; margin: 0; padding: 0 1px; width: 100%; height: 20px; border: none" size="50" type="button" name="ok"  onclick="javascript:$('#mask').hide();$('.window').hide();$('#criticalAlertDev').hide();displayReminderAgreement();" value='<fmt:message key="partner.agreement.OK"/>'/></td>
              						<td style="background-image: url('<%= combinedImagesLocation3 %>images/global/buttons_and_icons/buttons/btn_primary_rt.gif'); background-repeat: no-repeat; cursor: pointer; width: 12px" onclick="document.getElementById('ok').click();"></td>
              					</tr>
					</table>
			</div>
		
		</div>
	
	<!-- Changes done for Critical alerts popup by gyeddula end-->
	<div id="reminderAgreement1" class="reminderwindow"
		style="border:1px solid black ;">
		<div id="mod_2" class="table_mod_header" style="border-bottom: none;">
			<strong><font color="white">&nbsp;&nbsp;&nbsp;<fmt:message key="partner.agreement.heading" /></font> </strong>
		</div>
		<div style="padding-left:10px;background-color:white">
			<center>
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<colgroup>
						<col width="100" />
						<col width="20" />
						<col width="800" />
					</colgroup>
					<tbody>
						<tr>
							<td align="" colspan="3">
							</td>
							<font size="3" color="#669999"><fmt:message key="partner.agreement.webOrdering" /></font>
							<td>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" valign="top">
								<img
									src="<%=combinedImagesLocation3%>images/cscc/icn_black_plus.gif"
									height="6" width="6" align="absmiddle" border="0" />
							</td>
							<td>
							<!-- 	<font size="3" color="#669999">Distributor's use of this 
									tool is subject to its distribution agreement, as applicable. </font>  -->
									<font size="3" color="#669999"><fmt:message key="partner.agreement.ICPA.stmt" /></font>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" valign="top">
								<img
									src="<%=combinedImagesLocation3%>images/cscc/icn_black_plus.gif"
									height="6" width="6" align="absmiddle" border="0" />
							</td>
							<td>
								<!-- <font size="3" color="#669999">Partner, if applicable,
									has received express authorization from the end user customer
									to sell the services <br>to such customer, that partner
									seeks through this tool. </font> -->
								<font size="3" color="#669999"> <fmt:message key="partner.agreement.valid.indirectchannel.stmt" /></font>
									
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" valign="top">
								<img
									src="<%=combinedImagesLocation3%>images/cscc/icn_black_plus.gif"
									height="6" width="6" align="absmiddle" border="0" />
							</td>
							<td>
								<!-- <font size="3" color="#669999">Distributor, if
									applicable, has received express authorization from the partner
									to sell the services to such <br>authorized partner, that
									distributor seeks to quote through this tool. </font>  -->
								<font size="3" color="#669999"><fmt:message key="partner.agreement.authorization.stmt" />	 </font>
									
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" valign="top">
								<img
									src="<%=combinedImagesLocation3%>images/cscc/icn_black_plus.gif"
									height="6" width="6" align="absmiddle" border="0" />
							</td>
							<td>
								 <font size="3" color="#669999"><fmt:message key="partner.agreement.disti.authorization.stmt" /> </font>  
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" valign="top">
								<img
									src="<%=combinedImagesLocation3%>images/cscc/icn_black_plus.gif"
									height="6" width="6" align="absmiddle" border="0" />
							</td>
							<td>
								<font size="3" color="#669999"><fmt:message key="partner.agreement.suspend.stmt" />	 </font>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="center" valign="top">
								<img
									src="<%=combinedImagesLocation3%>images/cscc/icn_black_plus.gif"
									height="6" width="6" align="absmiddle" border="0" />
							</td>
							<td>
								<font size="3" color="#669999"><fmt:message key="partner.agreement.retains.right.stmt" /><a
									href="javascript:goDistribution('<c:out value="${distiInspectReqPath}"/>')"><fmt:message key="partner.agreement.licensing.stmt" /></a> <fmt:message key="partner.agreement.for" />  <a
									href="javascript:goDistribution('<c:out value="${distiSecondaryProductsPath}"/>')"><fmt:message key="partner.agreement.market.products.stmt" /></a>. </font>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
							</td>
							<td>

							</td>
						</tr>
						<tr height="10">
							<td></td>
							<td>
							</td>
							<td>

							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font size="3" color="#669999"><fmt:message key="partner.agreement.note" /></font>
							</td>
							<td>
							</td>
							<td>

							</td>
						</tr>
						<tr>
							<td colspan="3">
								<font size="3" color="#669999"><fmt:message key="partner.agreement.purchase.order.stmt" /><a
 									href="javascript:goDistribution('<c:out value="${distiInternetCommerceAgreePath}"/>')"><fmt:message key="partner.agreement.link" /></a>
								</font>
							</td>
							<td>
							</td>
							<td>

							</td>
						</tr>
					</tbody>
				</table>
			</center>
			<center><table border="0" cellspacing="0" cellpadding="0" id="button_ok" style="padding: 0; margin: 4px 4px; height: 20px; vertical-align: top; border:none; float: center;" align="center" >
              					<tr>
              						<td class="button_left" style="background-image: url('<%= combinedImagesLocation3 %>images/global/buttons_and_icons/buttons/btn_primary_lf.gif'); background-repeat: no-repeat; cursor: pointer; width: 12px" onclick="document.getElementById('ok').click();"></td>
              						<td><input id="ok"  style="color:; font-size: 	11px; font-family: Arial, Helvetica, sans-serif; font-weight: bold; background-image: url('<%= combinedImagesLocation3 %>images/global/buttons_and_icons/buttons/btn_primary_md.gif'); background-repeat: repeat-x; white-space: nowrap; cursor: pointer; margin: 0; padding: 0 1px; width: 100%; height: 20px; border: none" size="50" type="button" name="ok"  onclick="javascript:$('#mask').hide();$('.window').hide();$('#reminderAgreement1').hide()" value='<fmt:message key="partner.agreement.OK"/>'/></td>
              						<td style="background-image: url('<%= combinedImagesLocation3 %>images/global/buttons_and_icons/buttons/btn_primary_rt.gif'); background-repeat: no-repeat; cursor: pointer; width: 12px" onclick="document.getElementById('ok').click();"></td>
              					</tr>
					</table></center>
			

		</div>
	</div>
</div>
<input type="hidden" id="crossTrackContext" value="<%=crossTrackContext%>"/>
<input type="hidden" id="mcmContext" value="<%=mcmContext%>"/>
<input type="hidden" id="userIdInFooter" value="<%=ccoUserId%>"/>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR>
			<TD colSpan=4>
				<IMG height=17 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
		</TR>
		<TR>
			<TD width=13>
				<IMG height=1 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=13>
			</TD>
		<TD class=featuretext noWrap width="100%" colSpan=2>
				<!-- vtiruvee Q1FY13 commented close window -->  &nbsp; 
				<!-- <A class=secondarynav href="javascript:closeThisWindow();"><fmt:message
						key='Common.closeWindow' />
				</A>  -->
			</TD> 
			<td> &nbsp; </td>
			<TD>
				<IMG height=1 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=14>
			</TD>
		</TR>
		<TR>
			<TD colSpan=4>
				<IMG height=4 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
		<TR bgColor=#669999>
			<TD
				background="<%=combinedImagesLocation3%>images/cscc/popup_footer_pattern.gif">
				<IMG height=1 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=13>
			</TD>
			<TD width="100%" colSpan=2>
				<IMG height=4 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
		</TR>
		<TR>
			<TD
				background="<%=combinedImagesLocation3%>images/cscc/popup_footer_pattern.gif">
				<IMG height=3 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
			<TD width="100%">
				<IMG height=1 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
			<TD width=1>
				<IMG height=1 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
		</TR>
		<TR>
			<TD>
				<IMG height=1 alt=""
					src="<%=combinedImagesLocation3%>images/cscc/s.gif" width=1>
			</TD>
			<TD vAlign=top width="100%" colSpan=2>
				<SPAN class=footertext>&#xA9; <%= copyRight %> Cisco Systems, Inc. <fmt:message
						key='Footer.rights' />. <A class=footerlink
					href="javascript:openLargePopup('https://www.cisco.com/en/US/swassets/sw293/sitewide_important_notices.html','popuplarge');"><fmt:message
							key='Footer.impNotices' /> </A>, <A class=footerlink
					href="javascript:openLargePopup('https://www.cisco.com/en/US/swassets/sw293/privacy_statement.html','popuplarge');"
					alt=""><fmt:message key='Footer.privacyStat' />
				</A>, <fmt:message key='Footer.and' /> <A class=footerlink
					href="javascript:openLargePopup('https://www.cisco.com/en/US/swassets/sw293/trademark_statement.html','popuplarge');"><fmt:message
							key='Footer.trademarks' />
				</A> <fmt:message key='Footer.of' /> Cisco Systems, Inc.</SPAN>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<!--// END FOOTER -->
</BODY>
</HTML>
