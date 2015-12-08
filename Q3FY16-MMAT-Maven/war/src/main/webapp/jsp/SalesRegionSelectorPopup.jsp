<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" import="org.json.*,com.metaparadigm.jsonrpc.JSONRPCBridge "%>
<%@ include file="localeInfo.jsp" %>

<jsp:useBean id="JSONRPCBridge" scope="session"
     class="com.metaparadigm.jsonrpc.JSONRPCBridge" />
     
<jsp:useBean id="handler" scope="request"
     class="com.cisco.crosstrack.selector.handlers.SalesRegionSelectorHandler" />

<%@ page import="java.math.BigDecimal,java.util.*" %>  

   
<% JSONRPCBridge.registerObject("handler", handler);
String contextPath = request.getContextPath();

 %>
 
<html xmlns="http://www.w3.org/1999/xhtml">

   <head>
      <title><fmt:message key='SalesRegionSelector.title'/></title>

      <!-- component linked resources -->

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

      <link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
      <link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
      <link rel="stylesheet" href="css/crosstrack_styles.css" type="text/css" media="screen" />
      <link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />

	
	<!--  Commented for Defect 7774 - Combining All common JS scripts
		<script type="text/javascript" src="js/genJSON.js"></script>
		<script type="text/javascript" src="js/crosstrackselectors.js"></script>
		<script language="Javascript" src="js/datapersistence.js"></script>
		<script type="text/javascript" src="js/compjs/jsonrpc.js"></script>
	-->    
      
      <script language="javascript">
      <%@ include file="/js/salesRegion.js" %>
      </script>
      <script language="javaScript" src="js/main_lib.js"></script>
      <script type="text/javascript" src="js/popupAlerts.js"></script>
    	
      <script language="Javascript">
      
      function  initilaize(ctxPath,strHname,strHstatus,strNstatus)
      {
      
      jsonLoad(ctxPath);
      populateSuperTheaters(strHname,strHstatus,strNstatus);
      }
      
         var objs = new Array();
         
         function refreshArray(v)
         {
           
            objs = modifyContent(objs, v);
           
         }
         
         function refreshRadioArray(v)
         {
         //alert(v);
            for(var b=0;b<objs.length;b++)
		      {
		           objs.splice(b,1);
		         
		      }
		   //   alert(objs);
		            objs = modifyRadioContent(objs, v);
		     //       alert("length:"+ objs.length);
           
         }

         function printSelectedItems()
         {
            printVal(objs);
         }
         function transferDataToMain()
         {
        // alert(objs.length);
            var salesRegionAlerts = new SalesRegionAlerts();
            if(objs.length==0)
            {
               //alert('XXCSS_CT-650029 : Please select Sales Region(s) from the results section and then click on Select Sales Region(s) button.');
               alert(salesRegionAlerts.XXCSS_CT_650029);
               return false;
            }                
            
            var xStr = makeJSONStr(objs,'SalesRegionSelector','SalesRegionNumber','SalesRegionName');
     		//alert(xStr);
     		self.creator.xtrack_salesregionselector(xStr);

			self.close();
         }
		function clearFilterFields(){
        	document.getElementById('strSuperTheater').value ='-1';
            document.getElementById('strTheater').value = '-1';
            document.getElementById('strConsolidation').value = '-1';
            document.getElementById('strArea').value = '-1';
            document.getElementById('strOperation').value = '-1';
        } 
         
         function validateChar()
         {
            var salesRegionAlerts = new SalesRegionAlerts();
            clearFilterFields();
         	if(document.custChildForm.salesRegSearchStr.value == '')
         	{
         		//alert("XXCSS_CT-650024 : Please enter Sales Region Name.");
         		alert(salesRegionAlerts.XXCSS_CT_650024);
         		return false;
         	}
         	else if(validateLength(document.custChildForm.salesRegSearchStr.value)) {
				//alert ("Minimum 3 characters are required for searching the Sales Region Name. Please modify and resubmit your search.");
				alert(salesRegionAlerts.minThreeCharactersRequired);
				return false;
			}
         	else if (validateLen(document.custChildForm.salesRegSearchStr.value)) {
	         	//alert ("Maximum characters allowed for searching Sales Region Name is limited to 40 characters. Please modify and resubmit your search.");
	         	alert(salesRegionAlerts.maxFortyCharactersRequired);
	         	return false;
	        }
         	else if (charValidations(document.custChildForm.salesRegSearchStr.value) == false) {
	         	//alert ("Special characters not allowed. Please remove them and resubmit your search.");
	         	alert(salesRegionAlerts.specialCharactersNotAllowed);
	         	return false;
	        }
	        else if(validateAscii(document.custChildForm.salesRegSearchStr.value)){
	         	alert(salesRegionAlerts.specialCharactersNotAllowed);
	         	return false;
	        }
	        else {
	        	showSearchPageData(-1,-1,0,'ASC','0','searchbutton'); 	
	        	}
         }
         
         function validateFilters(){
          var salesRegionAlerts = new SalesRegionAlerts();
			document.custChildForm.salesRegSearchStr.value = "";
         	if(document.getElementById('strSuperTheater').value == '-1') {
         		alert(salesRegionAlerts.XXCSS_CT_650025);
         	}
         	else{
    	     	showFilterPageData(-1,-1,0,'ASC','0','searchfilters');
         	}
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
       
  		String strHierarchyName =(String) request.getAttribute("strHeirName");
		String strHierarchyStatus =(String) request.getAttribute("strHeirStatus");
		String strNodeStatus = (String) request.getAttribute("strNodeStatus");
		String strSelectType = (String) request.getAttribute("strSelectType");
		String strStatus= (String) request.getAttribute("strStatus");		
   
   %>

   <body marginheight="0" marginwidth="0" onLoad="initilaize('<%=contextPath%>','<%=strHierarchyName%>','<%=strHierarchyStatus%>','<%=strNodeStatus%>')">
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
                           <td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='SalesRegionSelector.closeWindow'/></a></td>
                           <td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
                        </tr>
                     </tbody>
                  </table>
               </td>
            </tr>
         </tbody>
      </table>
      <!-- screen title -->
      <h1><fmt:message key='SalesRegionSelector.salesRegionSelector'/></h1>
      <!-- modules start -->
      <div id="mod_1" class="mod_pop" style="width:375px">
      <form id="custChildForm"  method="get" action="#" name="custChildForm" class="inline">
      <!--Hidden Values Set here -->
     				 <input type="hidden" name="strHeirName" id="strHeirName" value="<%=strHierarchyName%>"/>
                     <input type="hidden" name="strHeirStatus" id="strHeirStatus" value= "<%=strHierarchyStatus%>"/>
                     <input type="hidden" name="strNodeStatus" id="strNodeStatus" value= "<%=strNodeStatus%>"/>
                     <input type="hidden" name="strSelectType" id="strSelectType" value= "<%=strSelectType%>"/>
                     <input type="hidden" name="strStatus" id="strStatus" value= "<%=strStatus%>"/>
      <!--Hidden Values Set here -->
      
         <div class="marque_grid" style="width:375px">
      <!-- sales region pull down and search button -->
         <div id="sales_region" class="sub_block_hr pop_display_block">
            <table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
               <colgroup>
               <col width="110" />
               </colgroup>
                  <tbody>
                  
                     <tr>
                        <td align="right"><label for="salesRegName"><fmt:message key='SalesRegionSelector.salesRergionNameLabel'/></label></td>
                        <td><input type="text" name="salesRegSearchStr" id="salesRegSearchStr" class="inputTextXLarge" /></td>
                        <td align="right">
                        <!-- button component -->
                           <table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                 <td class="button_left" onclick="document.getElementById('search').click();"></td>
                                 <td style="padding:0"><input id="search" onClick="javascript:validateChar();" class="button" type="button" name="search" value="<fmt:message key='SalesRegionSelector.search'/>"/></td>
                                 <td class="button_right" onclick="document.getElementById('search').click();"></td>
                              </tr>
                           </table>	
                        </td>
                     </tr>
                  </tbody>
            </table>
         </div>                     
      <!-- sales node -->
         <div id="sales_node" class="sub_block">
         <!-- sales node block 1 -->   
            <h3><img src="images/global/buttons_and_icons/icons/white/icn_twirldown_sm.gif" alt="<fmt:message key='SalesRegionSelector.expandCollapse'/>" height="14" width="14" align="absmiddle" border="0" onclick="setImageState(this);toggleElementDisplay('block_2');return" />&nbsp;&nbsp;<fmt:message key='SalesRegionSelector.salesNode'/> </h3>
            
            
          
<!--   Debug for viewing selected sales regions data  
            <input type="button" value="Selected Items" onClick="javascript:printSelectedItems();">
-->

         <!-- sales node block 2 -->
            <div id="block_2" style="display:none">
            <table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
            <col width="110" />
            </colgroup>
               <tbody>
                  <tr>
                     <td align="right"><label for="superTheater"><fmt:message key='SalesRegionSelector.superTheater'/></label></td>
                     <td>                     
                        <select name="strSuperTheater" id="strSuperTheater" class="inputTextXLarge" size="1" onChange="getChildrenOf('<%=strHierarchyName%>','<%=strHierarchyStatus%>',2)">
                           <option value="-1"><fmt:message key='SalesRegionSelector.selectOne'/></option>   
                        </select>                                                   
                     </td>
                  </tr>
                  <tr>
                     <td align="right"><label for="theater"><fmt:message key='SalesRegionSelector.theater'/></label></td>
                     <td>
                        <select name="strTheater" id="strTheater" class="inputTextXLarge" size="1" onChange="getChildrenOf('<%=strHierarchyName%>','<%=strHierarchyStatus%>',3);">
                           <option value="-1"><fmt:message key='SalesRegionSelector.selectOne'/></option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td align="right"><label for="consolidation"><fmt:message key='SalesRegionSelector.consolidation'/></label></td>
                     <td>
                        <select name="strConsolidation" id="strConsolidation" class="inputTextXLarge" size="1" onChange="getChildrenOf('<%=strHierarchyName%>','<%=strHierarchyStatus%>',4);">
                           <option value="-1"><fmt:message key='SalesRegionSelector.selectOne'/></option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td align="right"><label for="area"><fmt:message key='SalesRegionSelector.area'/></label></td>
                     <td>
                        <select name="strArea" id="strArea" class="inputTextXLarge" size="1" onChange="getChildrenOf('<%=strHierarchyName%>','<%=strHierarchyStatus%>',5);">
                           <option value="-1"><fmt:message key='SalesRegionSelector.selectOne'/></option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td align="right"><label for="operation"><fmt:message key='SalesRegionSelector.operation'/></label></td>
                     <td>
                        <select name="strOperation" id="strOperation" class="inputTextXLarge" size="1">
                           <option value="-1"><fmt:message key='SalesRegionSelector.selectOne'/></option>
                        </select>

                     </td>
                  </tr>
               </tbody>
            </table>
            <br />   
               <!-- filter buttons -->
               <div class="sub_button_block" id="buttons_1">
                              
                  <a href="javascript:document.getElementById('custChildForm').reset();" class="inline_button level6indent"><fmt:message key='SalesRegionSelector.clearAllFilters'/> <img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='SalesRegionSelector.clearAllFilters'/>" align="absmiddle" height="13" width="13" border="0" name="clearAllFilters" id="clearAllFilters" /></a>

                  <a href="javascript:validateFilters();" class="inline_button level6indent"><fmt:message key='SalesRegionSelector.setFilters'/> <img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='SalesRegionSelector.setFilters'/>" align="absmiddle" height="13" width="13" border="0" name="setFilters" id="setFilters" /> &nbsp;</a>

               </div>
               <!-- end filter buttons -->

            </div>            
      <!-- end block 2 -->

         </div>            
      <!-- end sales node -->
<!-- regionResults start -->
<div id="regionResults">
<div id="errmessages_m">
</div>
<!-- grid header -->
            <div class="table_mod_header">
            
            <table border=0 cellpadding=0 cellspacing=0 width="100%">
            <tr valign="middle">
               <td align="left" valign="middle">
               <h2 style="color: #ffffff; font-size: 11px; font-weight: bold; line-height: 12px; white-space: nowrap; padding: 0; float: left;"><fmt:message key='SalesRegionSelector.searchResults'/></h2>  
               </td>
               <td align="right" valign="middle">
               &nbsp;
               </td>
            </tr>
            </table>
            
            </div>                  
<!-- grid column header -->
<div class="mod_head">
<table width="355" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
<colgroup>
   <col width="6%" />
   <col width="94%" />
</colgroup>
<thead>
   <tr>
      <th class="first" align="center"></th>
      <th align="left"><a href="#"><fmt:message key='SalesRegionSelector.salesRergionCode'/></a></th>
            <th align="left"><fmt:message key='SalesRegionSelector.salesRergionName'/></th>
   </tr>
</thead> 
</table>
</div>
<!-- grid body -->
<div class="mod_grid_sm " id="pickerSalesRegionsList">

</div> 


</div> 
<!-- regionResults end -->

<!-- body grid end -->


      </div>
      <!-- end marque grid -->
      
         <!-- buttons start -->
         <div id="button_1" class="button_block_sm">
            <!-- button component -->
            <table class="new_primary_enabled" border="0" cellspacing="0" cellpadding="0">
               <tr>
                  <td class="button_left" onclick="document.getElementById('selSalesReg').click();"></td>
                  <td><input id="selSalesReg" class="button" type="button" name="selSalesReg" value="<fmt:message key='SalesRegionSelector.selectSalesRegion'/>" onClick="return transferDataToMain();"/></td>
                  <td class="button_right" onclick="document.getElementById('selSalesReg').click();"></td>
               </tr>
            </table>
            <!-- button component -->
            <table class="new_secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
               <tr>
                  <td class="button_left" onclick="document.getElementById('cancel').click();"></td>
                  <td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='SalesRegionSelector.cancel'/>" /></td>
                  <td class="button_right" onclick="document.getElementById('cancel').click();"></td>
               </tr>
            </table>
         </div> 
         <!-- end buttons  -->
         
      </form>
      </div>   
      <!-- modules end -->

   </body>

</html>