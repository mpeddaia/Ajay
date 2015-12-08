<%@ include file="../localeInfo.jsp" %>
      
<%@ page import="java.util.Properties"%>
 <%   
    // set rootPath dynamically in CCX env, since path differs in dev, stage, and prod
	
	//System.setProperty("com.cisco.appsui.rootPath", config.getServletContext().getRealPath("/") +"/WEB-INF/templates/");
	
	    // instantiate PageComposer
    Properties prop = new Properties();
	    
    String typeServer = System.getProperty("cisco.life");
    ClassLoader classLoader = this.getClass().getClassLoader();
    
    
	if(typeServer.equalsIgnoreCase("stage") || typeServer.equalsIgnoreCase("stg")){
		
		prop.load(classLoader.getResourceAsStream("AppHeaderStage.properties"));
	}
	else if(typeServer.equalsIgnoreCase("prod") || typeServer.equalsIgnoreCase("prd")){
		prop.load(classLoader.getResourceAsStream("AppHeaderProd.properties"));		
	}
	else{
				
		prop.load(classLoader.getResourceAsStream("AppHeaderDev.properties"));
	}
	
	
	String feedbackPath = prop.getProperty("app.feedback.path");
	
	String helpContext = (String)request.getAttribute("XtrackHelpContext");
	System.out.print("### helpContext "+helpContext);
    String helpPath = prop.getProperty("app.help.path");
    
    // start npunnam toolKit CR
   		 String UsefullinksPath = prop.getProperty("app.Usefullinks.Path");
   		 String Training =prop.getProperty("app.Training.path");
    // End npunnam toolKit CR
    
  //if (helpContext != null) 
	   // helpPath = request.getScheme() + "://" + request.getServerName() + session.getAttribute("Xtrack_Help_URL")+"&hlpCTX="+helpContext;
	//else 
	  //helpPath =  request.getScheme() + "://" + request.getServerName() + session.getAttribute("Xtrack_Help_URL");
	
	

	String openACase =prop.getProperty("app.openACase.path");
	if ("ja".equals(request.getAttribute("defLangCode"))) 
		openACase =prop.getProperty("app.openACaseJapan.path");
	
	
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
	
	//  Properties for the reminder agreement div 
	String distiInspectReqPath = prop.getProperty ("app.disti.inspectionreq.path");
	String distiSecondaryProductsPath = prop.getProperty ("app.disti.secondaryproducts.path");
	String distiInternetCommerceAgreePath = prop.getProperty ("app.disti.internetcommerceagree.path");

	session.setAttribute("distiInspectReqPath", distiInspectReqPath);
	session.setAttribute("distiSecondaryProductsPath", distiSecondaryProductsPath);
	session.setAttribute("distiInternetCommerceAgreePath", distiInternetCommerceAgreePath);

%>

<!--  Calling the commonscript to load all the Javascript in one download -->
<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>
      
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0080)https://tools-stage.cisco.com/CustAdv/ServiceSales/somf/oppMan.do?method=loadPage -->
<HTML><HEAD><TITLE><fmt:message key='Header.title'/></TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META content="MSHTML 6.00.2900.2976" name=GENERATOR></HEAD>
<BODY bottomMargin=0 vLink=#663390 aLink=#663399 link=#003399 bgColor=#ffffff
leftMargin=0 topMargin=0  rightMargin=0><NOSCRIPT><LINK
href="images/cscc/cdc.css" type=text/css
rel=Stylesheet><LINK href="images/cscc/apps.css"
type=text/css rel=Stylesheet></NOSCRIPT>

<!--  Commented for Defect 7774 - Combining All common JS scripts 
<SCRIPT language=JavaScript
src="images/cscc/appsui_detect.js"></SCRIPT>

<SCRIPT language=JavaScript
src="images/cscc/cisco_detect.js"></SCRIPT>

<SCRIPT language=JavaScript
src="images/cscc/appsui.js"></SCRIPT>

<SCRIPT language=JavaScript
src="images/cscc/sitewide_tools.js"></SCRIPT>

-->

<SCRIPT language=JavaScript type=text/javascript>
			    var bannerList=new Array();
			    var totalcount=0;
			    var scrollCount=1;
			    var time=0;
			    var min=1;
			    var msgScrollTime=10000;
			    var msgStpTime=600000; 
			    var t; 
			    var tt;
			
				function closeThisWindow(){
					
					window.open('','_parent','');
					window.close();
				}
				
			    function openPopWindow(url,winName) {
				   
				   var swtwin = window.open(url, winName, 'width=643,height=492,outerWidth=643,outerHeight=492,top=50,left=70,resizable=yes,scrollbars=yes');
			       swtwin.focus();
				}	
				
				function openBannerpopup(){
				
					var dimen = "width=520,height=625,resizable=0,scrollbars=no";
					var msgId = arguments[0];
					window.open("bannerPage.do?methodName=bannerPopup&messageId="+msgId,"POPUP",dimen);
				}
				
				function openSeeallMsg(){
				
					var dimen = "width=700,height=625,resizable=0,scrollbars=yes";
					window.open("bannerPage.do?methodName=getMessagesSeeAll","POPUP",dimen);
				}
				
				
				function displayNews(){
				 
				    <c:forEach var="state" items="${sessionScope.BannerMsg}" varStatus="status">
					       var incrcount= '<c:out value="${status.count}"/>';
				           bannerObj=new Object();
					       bannerObj.messageId='<c:out value="${state.messageId}"/>';
					       bannerObj.bannerSummary='<c:out value="${state.summaryMessage}"/>';
					       bannerObj.critical='<c:out value="${state.citicality}"/>';
					       bannerObj.activeStartDate='<c:out value="${state.startDate}"/>';
					       bannerObj.attribute2='<c:out value="${state.attribute2}"/>';
					       bannerObj.linkName1='<c:out value="${state.linkName1}"/>';
					       bannerObj.linkURL1='<c:out value="${state.linkURL1}"/>';
					       bannerList[incrcount-1]=bannerObj; 
				    </c:forEach>
				    totalcount = bannerList.length;
				    if(totalcount >0){
				       time=msgScrollTime;
				       var  saveScrollCount='<c:out value="${sessionScope.saveScrollCount}"/>';
				    if(saveScrollCount != null && saveScrollCount != ''  ){
				       saveScrollCount = parseInt(saveScrollCount);
				    if (totalcount >= saveScrollCount){				
				       scrollCount =  saveScrollCount;				    
				       	}
				       }
				       scrollBanner();
				     }
				}
				
			    function scrollBanner(){			        
			         updateBannerMessage(scrollCount);
			         t=setTimeout("changeTimer()",time);
			    }
				
				function getRecord(locCount){
				     return bannerList[locCount-1];
				}
				
				function changeTimer(){			         
			          scrollCount = scrollCount+1;			         
			          if(scrollCount == totalcount+1){
			              time=msgStpTime;
			              scrollCount=1;
			          }else{
			          time=msgScrollTime;
			          }
			          scrollBanner();
			    }
			    function activeCountTimer(){
			           	if(scrollCount == totalcount ){
			           	    scrollCount=1;
			           	    time=msgStpTime;
			        	}else{
			            	scrollCount = scrollCount+1;
			            	time=msgScrollTime;
			        	}
			          scrollBanner();
			    }
			    function activeCount(){
			    
			         clearTimeout(tt);
			         tt=setTimeout("activeCountTimer()",msgScrollTime);
			    }
			    function buttonRotate(e){			   
			    	clearTimeout(t);
			    	if(e == 'D'){
			        	if(scrollCount == totalcount ){
			           	    scrollCount=1;
			        	}else{
			            	scrollCount = scrollCount+1;
			        	}
			        	updateBannerMessage(scrollCount);
					}else{
			 		if(scrollCount != min ){
			 			scrollCount = scrollCount-1;
						updateBannerMessage(scrollCount);
					}
					}
					activeCount();
				}
			
				function updateBannerMessage(scrollCount){
				
			 		eachbannerObj = getRecord(scrollCount);
			 		if(eachbannerObj !=null && eachbannerObj!=''){
			 		
			   	    var countUpdate=scrollCount+' of '+(totalcount);
			   	    document.getElementById("dateDisplay").innerHTML =eachbannerObj.activeStartDate;
			        if(eachbannerObj.attribute2 == 'E'){
			       		document.getElementById("bannerDisplay").innerHTML =getHTMLFormattedMessageExternal(eachbannerObj.activeStartDate,eachbannerObj.linkName1,eachbannerObj.linkURL1,eachbannerObj.critical);
			       	}else{
			    		document.getElementById("bannerDisplay").innerHTML =getHTMLFormattedMessageInternal(eachbannerObj.activeStartDate,eachbannerObj.messageId,eachbannerObj.bannerSummary,eachbannerObj.critical);
			   	    }
			   	    	     	
			   	  if ((totalcount >1) && (document.getElementById("bannerUpdownDisplay").innerHTML == "")) {
			   	  document.getElementById("bannerUpdownDisplay").innerHTML =getHTMLFormattedMessageUPDown();
			   	  }
			      document.getElementById("bannerSeeAllDisplay").innerHTML =countUpdate+'<br> <a href="javascript:openSeeallMsg(350,230,200,200,0,0,0,0,0,0,1,0);" ><b><font color="#808080"><fmt:message key="Header.seeall"/></font></b></a>';
			    
			      }
			      
			      //storeScrollCount(scrollCount);abnj commented Prod issue fix test
			
				}
				
				function getHTMLFormattedMessageInternal(startDate,messageId,summaryMessage,critical){
	
					htmlMessage='';
					if(critical=='High'){
				       htmlMessage+='<img  SRC="images/icn_warning_red.gif"  alt="High"/> &nbsp;';  
                  	}
					
					htmlMessage+='<a href="javascript:openBannerpopup('+messageId+',350,230,200,200,0,0,0,0,0,0,1,0);" >';
			        htmlMessage+='<b><font color="#808080">'+summaryMessage+'</font></b></a>';	       			 
					return htmlMessage;
			    }
			    
				function getHTMLFormattedMessageUPDown(){
				
				    htmlMessage='<table ><tr> <th rowspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>';
					htmlMessage+='<td><img  onclick=javascript:buttonRotate("U"); SRC="images/scroll-arrow_up.gif"  alt="Up"/></td></tr><tr><td>';
			        htmlMessage+='<img  onclick=javascript:buttonRotate("D"); SRC="images/scroll-arrow_down.gif" alt="Down"/></td></tr></table>';	       			 
					return htmlMessage;
			    }
			    function getHTMLFormattedMessageExternal(startDate,linkName1,linkURL1,critical){
				
				   htmlMessage='';
				    if(critical=='High'){
				      htmlMessage+='<img  SRC="images/icn_warning_red.gif"  alt="High"/> &nbsp;';  
                  	}
				  				
					htmlMessage+='<a href="'+linkURL1+'"target="_blank">';
			        htmlMessage+='<b><font color="#808080">'+linkName1+'</font></b></a>';
			     	return htmlMessage;
			    }
			    function storeScrollCount(scrollCount){
			  
			      XMLHttpRequestSendBanner('./bannerPage.do?methodName=saveBannerCount','POST','1000000',scrollCount);
	      
			    }
			    function XMLHttpRequestSendBanner(finalurl,requestType,timeOut,scrollCount){                 
				    var url,timer;
				    var XMLHttpReq = createXMLHttpReq();				      
				      function createXMLHttpReq(){
				         try { 
				            return new ActiveXObject("Msxml2.XMLHTTP");
				         }catch (e) {}
				         try { 
				            return new ActiveXObject("Microsoft.XMLHTTP");
				         }catch (e) {}
				         try {
				            return new XMLHttpRequest();
				         }catch (e) {} 
				
				      }
				
				      if( requestType == "POST")
				      {
				           var URL=finalurl+"&scrollCount="+scrollCount;
				           url = URL;
				            //  alert('get'+url);
				         	XMLHttpReq.open("POST",url,true);
				       
				         	 //timer = setTimeout( function() {
				           	 //   XMLHttpReq.abort();
				              // },timeOut); 				                 	              
				        	 XMLHttpReq.onreadystatechange = function() {
				           		 if (XMLHttpReq.readyState == 4) 
				            		{
				             		  // clearTimeout(timer);               
				             			  if (XMLHttpReq.status == 200) 
				               				{
				                  	 		 //  alert('=='+XMLHttpReq.responseText);
				               			 	}
				           			 }  
				        	 }     
				         XMLHttpReq.send('');
				      }

           }
				
				 
			</SCRIPT>
<!-- COMMON HEADER -->
<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=middle width=120 rowSpan=3><A href="https://www.cisco.com/en/US/hmpgs/index.html"><IMG
      height=73 alt="Cisco Systems"
      src="<%= combinedImagesLocation %>images/cscc/logo.gif" width=110
    border=0></A></TD>
    <TD vAlign=top noWrap width="100%" bgColor=#ffffff>

      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top noWrap width=90 bgColor=#336666><IMG height=8 alt=""
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=90
border=0></TD>
          <TD vAlign=top noWrap width="69%" bgColor=#336666><IMG height=8
            alt="" src="<%= combinedImagesLocation %>images/cscc/s.gif" width=1
            border=0></TD></TR>
        <TR>
          <TD vAlign=top noWrap><A class=secondarynav
            href="javascript:closeThisWindow();"><fmt:message key='Common.closeWindow'/></A></TD>
          <TD vAlign=top align=left
          background="<%= combinedImagesLocation %>images/cscc/grn_vertlines_top.gif"><IMG
            alt="" hspace=0
            src="<%= combinedImagesLocation %>images/cscc/whitemask11_botleft.gif"
            border=0><IMG height=8 alt=""
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=1
        border=0></TD></TR></TBODY></TABLE>
        
       <table border=0 cellspacing="0" cellpadding="0">
	       	<tr>
	       		<td> 
	       		
	       			 <table border=0 cellspacing="0" cellpadding="0">
	       			 
	       			 <tr>
							       			 
		       			 <td style="border-top: 1px solid #7f9db9; height: 48px" valign="top">
		       			 
		       				<IMG  height="50" alt="New Alerts" src="<%= combinedImagesLocation %>images/news-alert_arrow_bottom-leftborders.gif" >
		       			 
		       			 </td>
	       				 <td  valign="top" >
	       			 
		       			<div   class="bannerBox" style="width:503px;background-color: #eeeeee;" >
							
							<table width="100%">
															               <tr width="100%">
															                <td id="dateDisplay" width="18%"></td>
																		   	<td id="bannerDisplay" width="62%"></td>
																		   	<td id="bannerUpdownDisplay" width="5%"></td>
																		  	<td id="bannerSeeAllDisplay" width="15%"></td>
																		   </tr>
																	</table>	
						</div>		
						</td>
					</tr>
					</table>			
				</td>
	       	</tr>
       	</table>
        
        <IMG height=1 alt=""
      src="<%= combinedImagesLocation %>images/cscc/s.gif" width=288 border=0> </TD>

    <TD vAlign=top width=180><!-- Sitewide Tools -->
      <SCRIPT language=JavaScript> var tmp = new Array("print","email");precache_imgs( tmp );</SCRIPT>

        
        	<table cellSpacing=0 cellPadding=0 width=275 border=0><!-- Begin Sitewide Text Rollover Row -->
	<tbody>
	<tr>
			<td style="color:#FFFFFF;background-color:#336666;font-family:Arial;font-size:11;" colspan="3" height="21" width="177">
		<!--Comnt by  npunnam toolKit &nbsp;&nbsp;<strong><fmt:message key='Header.toolkit'/></strong> -->
		</td>		
		</tr>
<!-- End Sitewide Text Rollover Row --><!-- Begin Sitewide Icons Rollover Row -->
		<tr > 
		   
			<td bgColor=#669999 width="1">
			</td>
			
			<td bgColor="#FFFFFF" width="20">
			
			<img height=20 alt="" src="<%= combinedImagesLocation %>images/cscc/openCase.gif" width=20 border=0 name=printing>									
			</td>
			<td width="242">
				<table width="250">
					<tr>
						<td><font size="1"><a href="javascript:sitewide_toolkit_window('<%=openACase%>','openACaseWindow');"><font size=1><fmt:message key='Header.openCase'/></font></a> 
						<fmt:message key='Header.openCaseService'/> </font></td>
					</tr>      										
				
					
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3" bgColor=#669999>
				<!-- Start  npunnam toolkit CR-->
				<table>
					<tr height=5>
						<td valign=top bgColor=#669999 width="40" ><A class=toolslinks href="javascript:sitewide_toolkit_window('<%=feedbackPath%>','feedbackWindow');"><font size=1 color="#FFFFFF"><fmt:message key='Header.feedback'/></font></A>
						</td>
						<td bgColor=#669999><font size=1 color="#FFFFFF">|</font>
						</td>
						<td bgColor=#669999 width="30"><A class=toolslinks href="javascript:sitewide_toolkit_window('<%=helpPath%>','helpWindow');"><font size=1 color="#FFFFFF"><fmt:message key='Header.help'/></font></A>
						</td>
						<td bgColor=#669999><font color="#FFFFFF">|</font></td>
						<td bgColor=#669999 width="40"><A class=toolslinks href="javascript:sitewide_toolkit_window('<%=Training%>','Training');"><font size=1 color="#FFFFFF"><fmt:message key='Header.Training'/></font></A>
						</td>
						<td bgColor=#669999><font size=1 color="#FFFFFF">|</font>
						<td bgColor=#669999><A class=toolslinks href="javascript:sitewide_toolkit_window('<%=UsefullinksPath%>','Usefullinks');"><font size=1 color="#FFFFFF"><fmt:message key='Header.Usefullinks'/></font></A>
						</td>
					</tr>
				</table>
				<!-- End  npunnam toolkit CR-->
			</td>
		</tr>      
		
	</tbody>
</table>



        <IMG height=7 alt=""
      src="<%= combinedImagesLocation %>images/cscc/s.gif" width=1 border=0><BR><!-- End Sitewide Tools --></TD></TR></TBODY></TABLE><!-- END COMMON HEADER --><!-- TOOL-SPECIFIC HEADER --><!--// main content --><!-- begin Text Block -->
<TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff border=0>
  <TBODY>
  <TR>
   <!--  Commented to remove the vertical space
     <TD width=13><IMG height=1 alt="" 
      src="images/cscc/s.gif" width=13 border=0></TD>
      -->
    <TD width="100%"><!-- This piece is for the header tab in the contents --><!-- Please change the text to what it should say for your Content -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#ffcc66>
          <TD bgColor=#ffffff><IMG height=1 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=7></TD>
          <TD><IMG height=22 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=6></TD><!--This should be changed to your App Name -->
          <TD noWrap width="100%"><SPAN class=contenttitle><fmt:message key='Header.title'/> </SPAN><!--This should be changed to your app title--><!--span class="contenttitlesub">Contract Manger</span--></TD>
          <TD vAlign=top align=right><IMG height=13 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/corner_ur_13.gif" 
          width=13></TD>
          <TD bgColor=#ffffff><IMG height=1 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=7></TD></TR>
        <TR>
          <TD colSpan=5><IMG height=1 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=1></TD></TR>
        <TR>
          <TD><IMG height=1 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=7></TD>
          <TD bgColor=#ffcc66 colSpan=3><IMG height=1 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=1></TD>
          <TD><IMG height=1 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" width=7></TD></TR>
        <TR>
          <TD colSpan=5><IMG height=10 alt="" 
            src="<%= combinedImagesLocation %>images/cscc/s.gif" 
        width=1></TD></TR></TBODY></TABLE>
         <script type="text/javascript">
        displayNews();
        </script>
        
