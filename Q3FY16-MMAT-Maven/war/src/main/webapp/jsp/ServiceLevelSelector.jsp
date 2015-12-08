<%@ include file="localeInfo.jsp" %>

<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<jsp:useBean id="JSONRPCBridge" scope="session"

     class="com.metaparadigm.jsonrpc.JSONRPCBridge" />



<jsp:useBean id="slshandler" scope="request"

     class="com.cisco.crosstrack.selector.handlers.ServiceLevelSelectorHandler" />

 <%@  page import="com.cisco.crosstrack.selector.data.dao.SelectorDAO, com.cisco.crosstrack.selector.data.genjava.XxcssCtServicePrgObjType"%>


<% JSONRPCBridge.registerObject("handler", slshandler); %>



   <%
		
		String appContext = request.getContextPath();

		String withincontext = (String)request.getAttribute("withincontext");		
  		String context = (String)request.getAttribute("context");
  		String contextvlaue = (String)request.getAttribute("contextvalue");
  		String status = (String)request.getAttribute("status");
  		String pickerselectionvalue = (String)request.getAttribute("pickerselectionvalue");
  		String sourcesystem = (String)request.getAttribute("sourcesystem");
  		String ccouserid = (String)request.getAttribute("ccouserid");
  		String authlevel = (String)request.getAttribute("authlevel");
  				
        java.util.ArrayList serviceProgramList = (java.util.ArrayList)request.getAttribute("serviceprogramlist");
        
       
        
        //String title = "";
		//	if ("y".equalsIgnoreCase(withincontext)) {
		//		if ("CONTRACT".equalsIgnoreCase(context)){
		//			title = " - Context to Contracts";
		//		}				
		//		else {
		//			title = " - " + context + " # " + contextvlaue;
		//		}				
		//	}

   %>



<html xmlns="http://www.w3.org/1999/xhtml">

<head>

		<title><fmt:message key='ServiceLevelSelector.title'/></title>

		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>
	
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jsonrpc.js"></script>
        <script type="text/javascript" src="js/datapersistence.js"></script>
        <script type="text/javascript" src="js/genJSON.js"></script>
        <script type="text/javascript" src="js/crosstrackselectors.js"></script>
	-->
        <script type="text/javascript" src="js/child.js"></script>
        <script type="text/javascript" src="js/servicelevelselector.js"></script>                
        <script type="text/javascript" src="js/popupAlerts.js"></script>        

  <script>

        var serviceLevelObjs = new Array();

        //alert('Page loaded.. Just created a new array : '+objs.length);

        function refreshServiceLevelArray(v)

        {

           //alert('inside refreshArray for '+v);

           serviceLevelObjs = modifyContent(serviceLevelObjs, v);

           //printVal(objs);

        }
		
		function refreshRadioArray(v)

         {
         
        	for(var b=0;b<serviceLevelObjs.length;b++)

		      {
		           serviceLevelObjs.splice(b,1);
     	      }

		            serviceLevelObjs = modifyRadioContent(serviceLevelObjs, v);
		           // alert('---------'+installObjs);
         }


        function printSelectedItems()

        {

           printVal(serviceLevelObjs);

        }

        

        function resetForm()

        {

        	//alert("In reset form");

        	document.ServiceLevelForm.reset();

        	

        }



        function transferDataToMain()

        {
			//alert('-----inside transfer---'+serviceLevelObjs);
			var serviceAlerts = new ServiceLevelAlerts();
           if(serviceLevelObjs.length==0)

           {

              //alert('Please select atleast one checkbox to continue');
			  alert(serviceAlerts.selectOneCheckBox);
              return false;

           }

//           transferData(objs);

			//var jsonstr = makeJSONStr(serviceLevelObjs,'ServiceLevelSelector', 'servicelevelcode', 'serviceleveldesc');
			var jsonstr = makeServiceLevelJSONStr(serviceLevelObjs,'ServiceLevelSelector', 'ServiceLevelGroup','ServiceLevelCode');

			//alert('json string :' + jsonstr);

			self.creator.fetchServiceLevels(jsonstr);

			self.close();

        }
        
        	
function makeServiceLevelJSONStr(obj,v1,v2,v3)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ ' - '+sl[1]+'","'+v3+'" : "'+sl[0]+'"  }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}
        
        
        function validateFormData()
		{

			var valid = false;


			//alert("valid is :" +valid);
			if (validateInput()) {				
				valid = true;
			}

			if(valid == true) {
						//alert("-----before calling showPageData");
					  	showSearchPageDataPagination(-1, -1, -1,'ASC','svclvlCode','searchbutton'); 

			}			
			
		}

       function validateInput(){
       		var serviceAlerts = new ServiceLevelAlerts();
       		var svcCode= trim(document.getElementById('servicelevelcode').value);
       		//alert('------svcCode'+svcCode.length);
       		var svcProgram= trim(document.getElementById('serviceprogram').value);
       		//alert('------svcProgram'+svcProgram);
       		var svcDesc= trim(document.getElementById('serviceleveldesc').value);
       		//alert('------svcDesc'+svcDesc);
       		var svcGroup= trim(document.getElementById('servicelevelgroup').value);
       		//alert('------svcGroup'+svcGroup);   
       		
       		if( svcCode.length<1 && svcProgram=="-1" && svcDesc.length<1 && svcGroup.length<1){
       			//alert('XXCSS_CT-650030:Please enter Service Level Code or Full or Partial Description or service Level Group or Service Program');       			
       			alert(serviceAlerts.XXCSS_CT_650030);
       			return false;
       		}
       		
       		if(validateAscii(svcCode)){
		  	    alert('Entry has special characters that are not allowed.\nPlease remove them and try again.');
		  	    return false;
		  	}
       		
       		//if(!trim(svcCode) || trim(svcCode).length<2 ){
       		if(svcCode.length>0 && svcCode.length<2){
       			//alert('XXCSS_CT-650031:Minimum 2 characters are required for searching the Service Level Code. Please modify and resubmit your search');
       			alert(serviceAlerts.XXCSS_CT_650031);
       			return false;
       		}
       		if(svcCode.length>40){
       			//alert('XXCSS_CT-650032:Maximum characters allowed for searching Service Level Code is limited to 40 characters. Please modify and resubmit your search');
       			alert(serviceAlerts.XXCSS_CT_650032);
       			return false;
       		}
       		
       		if(validateAscii(svcDesc)){
		  	    alert('Entry has special characters that are not allowed.\nPlease remove them and try again.');
		  	    return false;
		  	}
       		if(svcDesc.length>0 && svcDesc.length<3){
       			//alert('XXCSS_CT-650033:Minimum 3 characters are required for searching the Service Level Description. Please modify and resubmit your search');
       			alert(serviceAlerts.XXCSS_CT_650033);
       			return false;
       		}
       		if(svcDesc.length>40){
//       			alert('XXCSS_CT-650034:Maximum characters allowed for searching Service Description is limited to 40 characters. Please modify and resubmit your search');
				alert(serviceAlerts.XXCSS_CT_650034);
       			return false;
       		}
       		
       		if(validateAscii(svcGroup)){
		  	    alert('Entry has special characters that are not allowed.\nPlease remove them and try again.');
		  	    return false;
		  	}
       		
       		return true;
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

	

	<body marginheight="0" marginwidth="0" onload="javascript:initialize('<%=withincontext%>','<%=context%>','<%=contextvlaue%>','<%=status%>','<%=pickerselectionvalue%>','<%=sourcesystem%>','<%=ccouserid%>','<%=authlevel%>','<%=appContext%>','ASC','0','searchbutton');">
	
	<input type="hidden" name="withincontext" id="withincontext" value='<%=withincontext%>'/>
	<input type="hidden" name="context" id="context" value='<%=context%>'/>
	<input type="hidden" name="status" id="status" value='<%=status%>'/>
	<input type="hidden" name="pickerselectionvalue" id="pickerselectionvalue" value='<%=pickerselectionvalue%>'/>
	<input type="hidden" name="sourcesystem" id="sourcesystem" value='<%=sourcesystem%>'/>
	<input type="hidden" name="ccouserid" id="ccouserid" value='<%=ccouserid%>'/>
	<input type="hidden" name="authlevel" id="authlevel" value='<%=authlevel%>'/>
	<input type="hidden" name="contextvlaue" id="contextvlaue" value='<%=contextvlaue%>'/>
	<input type="hidden" name="appContext" id="appContext" value='<%=appContext%>'/>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">

			<tbody>

				<tr>

					<td align="center" valign="top"><img src="<%=combinedImagesLocation%>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" /></td>

					<td bgcolor="#ffffff" valign="top" width="100%">

						<table width="100%" border="0" cellspacing="0" cellpadding="0">

							<tbody>

								<tr>

									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="100" border="0" /></td>

									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%"><img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="1" border="0" /></td>

								</tr>

								<tr>

									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='ServiceLevelSelector.closeWindow'/></a></td>

									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>

								</tr>

							</tbody>

						</table>

					</td>

				</tr>

			</tbody>

		</table>
		
		
<form name="ServiceLevelForm" action="#" method="get" class="inline">

		<!-- screen title -->
		
		<%
			if ("y".equalsIgnoreCase(withincontext)) {
				if ("CONTRACT".equalsIgnoreCase(context)){
					//title = " - Context to Contracts";
		%>
					<h1><fmt:message key='ServiceLevelSelector.title'/> - <fmt:message key='ServiceLevelSelector.context'/></h1>
		<%
				}			
				else {
				//title = " - " + context + " # " + contextvlaue;
		%>
							
				<h1><fmt:message key='ServiceLevelSelector.title'/> - <fmt:message key='ServiceLevelSelector.contextQuote'/> # <%=contextvlaue%></h1>
		<%
				}				
			}
			else {
		%>
				<h1><fmt:message key='ServiceLevelSelector.title'/></h1>
			<%
			}
			%>
		

		<!-- modules start -- style="width:962px"-->

		<div id="mod_1" class="mod_pop">

		

			<div class="marque_grid">

			<div id="searchFilters" class="sub_block_hr">

				<h3><fmt:message key='ServiceLevelSelector.searchFilters'/></h3>

				

				 <!-- input type="button" value="Selected Items" onClick="javascript:printSelectedItems();" -->
				<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">

				<colgroup>

				<col width="200" />

				<col width="200" />

				<col width="200" />

				</colgroup>

					<tbody>

						<tr>

							<td align="right"><label for="Service Level Code"><font color= "red"> * </font><fmt:message key='ServiceLevelSelector.serviceLevelCode'/></label></td>

							<td><input name="servicelevelcode" id="servicelevelcode" class="inputTextVLarge" type-"text" size="40">

							</td>

							<td align="right"><label for="Service Program"><font color= "red"> * </font><fmt:message key='ServiceLevelSelector.serviceProgram'/></label></td>
							
							<td><select name="serviceprogram" id="serviceprogram" class="inputTextXLarge" size="1">
								<option value="-1"><fmt:message key='ServiceLevelSelector.selectOne'/></option>
								<%
									XxcssCtServicePrgObjType serviceProgObj;
									
									for(int i=0; i<serviceProgramList.size() ; i++){
									serviceProgObj = (XxcssCtServicePrgObjType)serviceProgramList.get(i);
									
								%>
									<option value='<%=serviceProgObj.getServiceProgram() %>' > <%=serviceProgObj.getServiceProgram() %></option>
									
									<%}%>
									

								</select></td>

						</tr>

						<tr>

							<td align="right"><label for="Description"><font color= "red"> * </font><fmt:message key='ServiceLevelSelector.fullOrPartialDesc'/></label></td>

							<td><input name="serviceleveldesc" id="serviceleveldesc" class="inputTextVLarge" type-"text" size="40">

							</td>

							<td>&nbsp;</td>

							<td>&nbsp;</td>

						</tr>							
												
						<tr>

							<td align="right"><label for="Service Level Group"><font color= "red"> * </font><fmt:message key='ServiceLevelSelector.serviceLevelGroup'/></label></td>

							<td><input name="servicelevelgroup" id="servicelevelgroup" class="inputTextVLarge" type-"text" size="40">

							</td>

							<td>&nbsp;</td>

							<td>&nbsp;</td>

						</tr>						

					</tbody>

				</table>

				<div class="inline_tertiary">

					<!-- button component -->

					<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">

						<tr>

							<td class="button_left" onclick="document.getElementById('searchforServiceLevel').click();"></td>

							<td style="padding:0"><input id="searchforServiceLevel" class="button" type="button" name="searchforServiceLevel" value="<fmt:message key='ServiceLevelSelector.searchServiceLevelsButton'/>" onclick="javascript:validateFormData();"/></td>

							<td class="button_right" onclick="document.getElementById('searchforServiceLevel').click();"></td>

						</tr>

					</table>

					<a href="javascript:resetForm();" class="inline_buttonAlt float_right"><fmt:message key='ServiceLevelSelector.clearAllField'/> <img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='ServiceLevelSelector.clearFieldsAlt'/>" align="absmiddle" height="13" width="13" border="0" name="ClearFields" id="ClearFields" /></a>

					<br class="clear_all" />

				</div>

<font color= "red">&nbsp;<fmt:message key='ServiceLevelSelector.oneFieldMandatory'/> </font>
			</div>

   
	

	<!--  regionresults div start -->

	<div id="regionResults">



				<div class="table_mod_header">

					<h2 class="mh_title"><fmt:message key='ServiceLevelSelector.serviceLevelCode'/></h2>

					<!-- module header pagination -->

				</div>

				<div class="sub_block" id="tab1_content">



	<!-- grid column header -->

	<div class="mod_head">

		<table width="760" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">

		<colgroup>

			<%if(authlevel.equalsIgnoreCase("4")){%>
			<col width="10%" />
   			<col width="20%" />
   			<col width="20%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />
   			<col width="10%" />   			
   			<%}else{%>
   			<col width="10%" />
   			<col width="20%" />
   			<col width="20%" />
   			<col width="30%" />
   			<col width="10%" />
   			<col width="10%" />   			
   			<%}%>

		</colgroup>

		<thead>

			<tr>

				<th class="active sort_a_1" align="left"><a href="#"><fmt:message key='ServiceLevelSelector.serviceLevelCode'/></a></th>

				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.serviceLevelDesc'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.serviceLevelGroup'/></a></th>

				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.serviceProgram'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.hardwareOrSoftware'/></a></th>
				
				<%if(authlevel.equalsIgnoreCase("4")){%>
				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.serviceCategory'/></a></th>
				
				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.brandCode'/></a></th>
				
				<%}%>
				
				<th align="left"><a href="#"><fmt:message key='ServiceLevelSelector.status'/></a></th>

			</tr>

		</thead>	

		</table>

	</div>

<!-- grid body -->

	<div class="mod_grid_sm " id="resultsList">

	





	</div> <!-- body grid end -->



			</div> <!--end sub_block -->



</div> <!-- End regionresults div -->



</form>



			</div>

			<!-- buttons start -->

			<div id="button_1" class="button_block_med">

				<!-- button component -->

				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">

					<tr>

						<td class="button_left" onclick="document.getElementById('selectservicelevel').click();"></td>

						<td><input id="selectservicelevel" class="button" type="button" name="selectservicelevel" value="<fmt:message key='ServiceLevelSelector.selectServiceLevels'/>" onclick="javascript:transferDataToMain();" /></td>

						<td class="button_right" onclick="document.getElementById('selectservicelevel').click();"></td>

					</tr>

				</table>

				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">

					<tr>

						<td class="button_left" onclick="document.getElementById('cancel').click();"></td>

						<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='ServiceLevelSelector.cancel'/>" /></td>

						<td class="button_right" onclick="document.getElementById('cancel').click();"></td>

					</tr>

				</table>

			</div>

		

		</div>







		<!-- modules end -->

		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->

<div id ="vvvvcalDiv"></div>



<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->

<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->



<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************ -->

	</body>



</html>

