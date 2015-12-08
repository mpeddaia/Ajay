
<%@ page import="java.math.BigDecimal,java.util.*"%>
<%@ include file="localeInfo.jsp" %>
<%@ page import="com.cisco.crosstrack.selector.data.genjava.XxcssCtStatusObjType,com.cisco.crosstrack.selector.data.dto.ContractDTO" %>

<jsp:useBean id="JSONRPCBridge1" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge"/>
<jsp:useBean id="contractHandler" scope="request" class="com.cisco.crosstrack.selector.handlers.ContractSelectorHandler"/>

<%
JSONRPCBridge1.registerObject("contractHandlerRegObj", contractHandler);
String contextPath = request.getContextPath();

 %>
 
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='ContractSelector.contractSelector'/></title>
		
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		<!-- component linked resources -->
<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
%>		
	<SCRIPT src="<%= combinedScriptLocation %>" type="text/javascript"></SCRIPT>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scripts 			
		<script type="text/javascript" src="js/compjs/jsonrpc.js"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="Javascript" src="js/datapersistence.js"></script>
		<script type="text/javascript" src="js/genJSON.js"></script>
	-->	
<script language="javascript" src="js/billtopopup.js"></script>
		<script language="javascript" src="js/contract.js"></script>
		<script type="text/javascript" src="js/popupAlerts.js"></script>
		  <script language="Javascript">
		  

		  function resetServiceLvl()
		  {
		  	document.getElementById('listBoxSm').innerHTML="";
		  }
		  
		  function callXtrackServiceLvl()
		  {
		  
		  	var strCCOUserId=document.getElementById("strCCOUserId").value;
   			var strSourceSystem=document.getElementById("strSourceSystem").value;
			var strAuthLevel=document.getElementById("strAuthLevel").value;
			var strQuoteID=document.getElementById("strQuoteID").value;
			
			var strWithincontext=document.getElementById("strWithincontext").value;
			var strStatus=document.getElementById("strStatus").value;
			var strContextValue=document.getElementById("strContextValue").value;
			//var opt="MULTIPLE"; 
			var opt=document.getElementById("opt").value;			
			if ((document.getElementById("strContext").value) == null) {
				var strContext="GENERIC";				
			}
			else {
				var strContext=document.getElementById("strContext").value;
			}
	
		   	childwindow1 = window.open("serviceLevelSelector.do?methodName=onshowPopup&quoteid="+strQuoteID+"&ccouserid="+strCCOUserId+"&sourcesystem="+strSourceSystem+"&authlevel="+strAuthLevel+"&withincontext="+strWithincontext+"&context="+strContext+"&status="+strStatus+"&contextvalue="+strContextValue+"&pickerselectionvalue="+opt,"childWin1","width=1010,height=625,scrollbars,resizable=yes");
		   	childwindow1.creator=self;
		   
		   return false;
		  }		  

		
		  function searchContracts()
		  {  
				var contractAlerts = new ContractAlerts();
				if(document.getElementById('Contract#').value =='' && document.getElementById('billToName').value =='')
				{
					//alert('XXCSS_CT-650010 : Please enter Contract Number or Bill To ID/Name.');
					alert(contractAlerts.XXCSS_CT_650010);
					return false;
				}
				else if(document.getElementById('Contract#').value !='' && document.getElementById('billToName').value =='')
				{
					if(validateLength(document.getElementById('Contract#').value)) 
					{						
					alert('XXCSS_CT-650067 : Minimum 3 characters are required for searching the Contract Number. Please modify and resubmit your search.');
					document.getElementById('Contract#').value ='';
					return false;						
					}
					else if(validateLen(document.getElementById('Contract#').value)) {
					//alert('XXCSS_CT-650067 : Maximum characters allowed for searching Contract Number is limited to 200 characters. Please modify and resubmit your search.');
					alert(contractAlerts.XXCSS_CT_650067);
					//document.getElementById('Contract#').value ='';
					return false;
					}
				}
				else if(document.getElementById('Contract#').value =='' && document.getElementById('billToName').value !='')
				{
					if(validateLength(document.getElementById('billToName').value)) 
					{						
						alert('XXCSS_CT-650068 : Minimum 3 characters are required for searching the Bill-To . Please modify and resubmit your search.');
						document.getElementById('billToName').value ='';
						return false;						
					}					
					else if(validateLen(document.getElementById('billToName').value)) {
						//alert('XXCSS_CT-650068 : Maximum characters allowed for searching Bill To is limited to 200 characters. Please modify and resubmit your search.');
						alert(contractAlerts.XXCSS_CT_650068);
						//document.getElementById('billToName').value ='';
						return false;
					}
					
				}	
				else if(document.getElementById('Contract#').value !='' && document.getElementById('billToName').value !='')
				{
					if(validateLength(document.getElementById('Contract#').value)) 
					{						
					alert('XXCSS_CT-650067 : Minimum 3 characters are required for searching the Contract Number. Please modify and resubmit your search.');
					document.getElementById('Contract#').value ='';
					return false;						
					}else if(validateLen(document.getElementById('Contract#').value)) {
					//alert('XXCSS_CT-650067 : Maximum characters allowed for searching Contract Number is limited to 200 characters. Please modify and resubmit your search.');
					alert(contractAlerts.XXCSS_CT_650067);
					//document.getElementById('Contract#').value ='';
					return false;
					}				
					if(validateLength(document.getElementById('billToName').value)) 
					{						
						alert('XXCSS_CT-650068 : Minimum 3 characters are required for searching the Bill-To . Please modify and resubmit your search.');
						document.getElementById('billToName').value ='';
						return false;						
					}else if(validateLen(document.getElementById('billToName').value)) {
						//alert('XXCSS_CT-650068 : Maximum characters allowed for searching Bill To is limited to 200 characters. Please modify and resubmit your search.');
						alert(contractAlerts.XXCSS_CT_650068);
						//document.getElementById('billToName').value ='';
						return false;
					}
					
				}																														 
				if(!charValidations(document.getElementById('Contract#').value)){
					//alert ("XXCSS_CT-650077 : Special characters are not allowed. Please remove them and resubmit your search.");
					alert(contractAlerts.XXCSS_CT_650077);
					return false;
				}
				else if(!charValidations(document.getElementById('billToName').value)){
					//alert ("XXCSS_CT-650077 : Special characters are not allowed. Please remove them and resubmit your search.");
					alert(contractAlerts.XXCSS_CT_650077);
					return false;
				}
				else if (validateAscii(document.getElementById('Contract#').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('billToName').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('ContractName').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('from_date').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('to_date').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('from_date2').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('to_date2').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('from_date3').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
	         	else if (validateAscii(document.getElementById('to_date3').value)) {
	         		alert(contractAlerts.XXCSS_CT_650077);
	         		return false;
	         	}
				if((document.getElementById('from_date').value!='' && document.getElementById('to_date').value =='') || (document.getElementById('from_date').value =='' && document.getElementById('to_date').value !='')) {
					//alert("XXCSS_CT-650011 : Please enter both FROM and TO Earliest Begin Dates.");
					alert(contractAlerts.XXCSS_CT_650011);
					return false;
				}
				if(document.getElementById('from_date').value!='' && document.getElementById('to_date').value !='')
				{					
					var result=compareDates(document.getElementById('from_date').value,"d-NNN-yyyy",document.getElementById('to_date').value,"d-NNN-yyyy");
					if(result == 1)	{
//						alert('XXCSS_CT-650076 : From Date is greater than To Date. Please modify and resubmit your search.');
						alert(contractAlerts.XXCSS_CT_650076);
						return false;
					}
				}
				if((document.getElementById('from_date2').value!='' && document.getElementById('to_date2').value=='') || (document.getElementById('from_date2').value=='' && document.getElementById('to_date2').value !='')) {
					//alert("XXCSS_CT-650012 : Please enter both FROM and TO Earliest End Dates.");
					alert(contractAlerts.XXCSS_CT_650012);
					return false;
				}
				if(document.getElementById('from_date2').value!='' && document.getElementById('to_date2').value!='') {
					var result=compareDates(document.getElementById('from_date2').value,"d-NNN-yyyy",document.getElementById('to_date2').value,"d-NNN-yyyy"); 
					if(result == 1)	{
						//alert('XXCSS_CT-650076 : From Date is greater than To Date. Please modify and resubmit your search.');
						alert(contractAlerts.XXCSS_CT_650076);
						return false;
					}
				}
				if((document.getElementById('from_date3').value!='' && document.getElementById('to_date3').value=='') || (document.getElementById('from_date3').value=='' && document.getElementById('to_date3').value!='')) {
					//alert(" XXCSS_CT-650013 : Please enter both FROM and TO Earliest Modified Dates.");
					alert(contractAlerts.XXCSS_CT_650013);
					return false;
				}
				if(document.getElementById('from_date3').value!='' && document.getElementById('to_date3').value!=''){
					var result=compareDates(document.getElementById('from_date3').value,"d-NNN-yyyy",document.getElementById('to_date3').value,"d-NNN-yyyy"); 
					if(result == 1)	{
						//alert('XXCSS_CT-650076 : From Date is greater than To Date. Please modify and resubmit your search.');
						alert(contractAlerts.XXCSS_CT_650076);
						return false;
					}
				}
				//alert('billToName='+document.getElementById('billToName').value);
				//alert('newBillTOID='+document.getElementById("newBillTOID").value);
				var swpbillTo=trim(document.getElementById('billToName').value);
				var newbillTo=trim(document.getElementById('newBillTOID').value);
				var profileValue=trim(document.getElementById('profileValue').value);
				
//if((document.getElementById("newBillTOID").value!=document.getElementById('billToName').value)&&( document.getElementById('billToName').value!=null)||(document.getElementById('billToName').value!=''))

//if(( document.getElementById('billToName').value!=null)||(document.getElementById('billToName').value!=''))
//{
if(profileValue=='YES'&& swpbillTo!=newbillTo && swpbillTo!='')
{
//alert('InSwap')
swapBillTo();
}else
{
document.getElementById('errmsg').innerHTML='';
document.getElementById('contractresults1').innerHTML='';

			 // alert("Here"+document.getElementById("servicelvlCnt").value);
			  var srvCntr=document.getElementById("servicelvlCnt").value;
			  for(var x=0;x<srvCntr;x++)
			  {
			  //	alert("Checked::  "+ eval("document.contactSearchForm.servLvl"+x+".checked"));
			  	if(eval("document.contactSearchForm.selectedServiceLevels"+x+".checked")){
			  		getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
			  		return true;
			  	}
			  }
			 
			// alert("Here"+document.getElementById("statusCnt").value);
			  var statCntr=document.getElementById("statusCnt").value;
			  for(var y=0;y<statCntr;y++)
			  {
			  	//alert("Checked::  "+ eval("document.contactSearchForm.StatusList_"+y+".checked"));
			  	if(eval("document.contactSearchForm.StatusList_"+y+".checked")){
			  		getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
			  		return true;
			  	}
			  }			  
			  
			  
		  	   if (document.getElementById("ContractName").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("from_date").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("from_date2").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("from_date3").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("to_date").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("to_date2").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  	   if (document.getElementById("to_date3").value!=""){
		  	   getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		  	   return true;
		  	   }
		  
		  		/*if((document.getElementById("Contract#").value=="")&&(document.getElementById("billToName").value=="")){
		  		alert("Enter  either contract # or billto to search");
		  		return false;
		  		}*/
		  
		  		getContractSearchValues(-1,-1,-1,'ASC','0','searchbutton');
		}
		  //}
		  }
      
      function  initilaize(ctxPath)
      {
      //alert("here");
      jsonLoad(ctxPath);
      getContractStatus();
      
      }
      
        var objs = new Array();
         
         function refreshArray(v)
         {
           
            objs = modifyContent(objs, v);
           
         }
	function refreshRadioArray(v)
         {
         
            for(var b=0;b<objs.length;b++)
		      {
		           objs.splice(b,1);
		         
		      }
		            objs = modifyRadioContent(objs, v);
           
         }


         function printSelectedItems()
         {
            printVal(objs);
         }
         function transferDataToMain()
         {
         	var valid = false;
         	var contractAlerts = new ContractAlerts();
         	
            if(objs.length==0)
            {
               //alert('XXCSS_CT-650014 : Please select Contract(s) from the results section and then click on Select Contract(s) button.');
               alert(contractAlerts.XXCSS_CT_650014);
               return false;
            }                
            
            var xStr = makeJSONStr(objs,'ContractSelector','ContractNumber','BilltoName');
     		//alert(xStr);
     		self.creator.xtrackselector(xStr,'ContractSelector');

			self.close();
         }
         
         function fetchServiceLevels(jsonstr)
         {
                      	//alert(jsonstr);
		var mJSONObj=eval('(' + jsonstr + ')');
    	//alert ('String from child is ' + mJSONObj);
    	// listBoxSm
		var x=mJSONObj.ServiceLevelSelector.length;
		var chkList = '';
		var chkLstFinal='';
		var hiddenList='';
		var serviceLevStr;
		var serviceLevSubStr;
		var instSiteSel = document.getElementsByName("selectedServiceLevels");
		var y = instSiteSel.length;
		var count=0;
		if(instSiteSel.length!=0){
			for(var i=0; i<x ;i++){
				found="false";
				var selVal;
				selVal = mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup;
				//alert("selVal===="+selVal);
				var storedVal;
				for( var j=0;j<instSiteSel.length;j++) {
					//alert("instSite id ===="+instSiteSel[j].value);
					  storedVal = instSiteSel[j].value;
					  if(storedVal == selVal) {
						 found = 'true';
						 //alert("true");
					  }	
				}
				if(found =='false') {
					//alert("false");
					serviceLevStr = mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup;
					//alert("serviceLevelGrp=="+serviceLevStr);
					serviceLevSubStr = serviceLevStr.substring(0,30);
					//alert("serviceLevelsubstring==="+serviceLevSubStr);
					chkList=chkList + '<input type="checkbox" id="selectedServiceLevels'+count+'" checked="checked" name="selectedServiceLevels" value="'+mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup+'"> '+serviceLevSubStr+'<br>';
					count++;
					//alert (chkList);
				}
			}

			for(var k=0; k<instSiteSel.length; k++) {
				serviceLevStr = instSiteSel[k].value;
				//alert("serviceLevelGrp=="+serviceLevStr);
				serviceLevSubStr = serviceLevStr.substring(0,30);
				//alert("serviceLevelsubstring==="+serviceLevSubStr);
				if(instSiteSel[k].checked==true){
					hiddenList = hiddenList +'<input type="checkbox" id="selectedServiceLevels'+count+'" checked="checked" name="selectedServiceLevels" value="'+instSiteSel[k].value+'"> '+serviceLevSubStr+'<br>';
					count++;
				}else {
					hiddenList = hiddenList +'<input type="checkbox" id="selectedServiceLevels'+count+'" name="selectedServiceLevels" value="'+instSiteSel[k].value+'"> '+serviceLevSubStr+'<br>';
					count++;
				}	
			}
			 chkLstFinal = hiddenList + chkList;
			//alert("chkListFinal==="+chkLstFinal);
		}else { 		
			for(var i=0; i<x ;i++){
				serviceLevStr = mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup;
				//alert("serviceLevelGrp=="+serviceLevStr);
				serviceLevSubStr = serviceLevStr.substring(0,30);
			    //alert("serviceLevelsubstring==="+serviceLevSubStr);
				chkList=chkList + '<input type="checkbox" id="selectedServiceLevels'+count+'" checked="checked" name="selectedServiceLevels" value="'+mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup+'"> '+serviceLevSubStr+'<br>';
				count++;
		}
				//alert (chkList);
		 		chkLstFinal=chkList;
		}
		document.getElementById('listBoxSm').innerHTML=chkLstFinal;
		document.getElementById('servicelvlCnt').value=x;
		//alert(document.getElementById('servicelvlCnt').value);
		//alert(chkLstFinal);
		}
         
        // Checking ASCII characters if not, displaying the alert message ---MLS Changes by kgudipat
	function validateAscii(str) {
	//var str = obj.value;
		for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {			
			return true;
		}
		}
		return false;
	}
	
	//BillTo Selector
	// This Function is used to get Bill to Ids from Cross-Track Bill to Selector tool
	function showBillToID() {
	    //alert("invoking bill to site popup,,,,jackinthe box");
	    //alert(document.getElementById('userIorE').value);
	    //var userIorE = document.getElementById("userIorE").value;
	    
	    var strCCOUserId=document.getElementById("strCCOUserId").value;
   		var strSourceSystem=document.getElementById("strSourceSystem").value;
		var strAuthLevel=document.getElementById("strAuthLevel").value;
		var strQuoteID=document.getElementById("strQuoteID").value;
		var strWithincontext=document.getElementById("strWithincontext").value;
		var strStatus=document.getElementById("strStatus").value;
		var strContextValue=document.getElementById("strContextValue").value;
		//alert("Source system:: "+strSourceSystem+" status::  "+strStatus+" quote id::   "+strQuoteID+" withincontext::  "+ strWithincontext +" contextvalue::  "+ strContextValue );
		
	    var url = "./billtoselect.do?methodName=onshowPopup";
		//url += "&withinContext=N";
	    //if (strAuthLevel == "4") {
	    //    url += "&context=";
	    //} else {
	    //    url += "&context=CONTRACT";
	    //}
	    //if (strAuthLevel == "4") {
	    //    url += "&withinContext=N";
	    //} else {
	    //    url += "&withinContext=Y";
	    //}
	    
	    if ((document.getElementById("strContext").value) == null) {
			var strContext="GENERIC";				
		}
		else {
			var strContext=document.getElementById("strContext").value;
		}
	
	    
	    url+="&context="+strContext;
	    url+="&withinContext="+strWithincontext;
			
		//url += "&context=";
	    url += "&contextValue="+strContextValue;
	    url += "&status="+strStatus;
	    url += "&pickerSelection=MULTIPLE";
	    if (strAuthLevel == "4" ) {
	        url += "&userType=INTERNAL";
	    } else {
	        url += "&userType=EXTERNAL";
	    }
		//url += "&userType="+document.getElementById("userType").value;
		//alert(url);
	    childwindow = window.open(url, "BillToSelector", "width=1050, height=700, scrollbars , resizable=yes");
	    childwindow.creator = self;
	    return false;
	}
	
	//Call back function for bill tos 
	function xtrack_billtoselector(JSONObj) {
	    var mJSONObj = eval("(" + JSONObj + ")");
	    //alert(JSONObj);
	    var x = mJSONObj.BilltoSelector.length;
	    var chkList = "";
	    for (var i = 0; i < x; i++) {
	    	if(i==0)
	    	chkList=mJSONObj.BilltoSelector[i].BilltoID;
	    	else
	        chkList=chkList+","+mJSONObj.BilltoSelector[i].BilltoID;
	    }
	    var billTo = document.getElementById("billToName");
	    
	    var chkLstFinal = chkList;
	    document.getElementById("billToName").value = chkLstFinal;
	    //Added for STC START
	    document.getElementById("BillTOPickerValue").value = chkLstFinal;
		document.getElementById("newBillTOID").value = chkLstFinal;	    
	    //Added for STC END	    
			//alert(billTo.value);
			////alert('Parent Page');
		//alert(JSONObj);
	    //toggleGrayOuts();
	}
	//End of bill to.
      
     </script>
	</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->
	<%
		String strCCOUserId=(String)request.getAttribute("strCCOUserId");
		String strSourceSystem=(String)request.getAttribute("strSourceSystem");
		String strAuthLevel=(String)request.getAttribute("strAuthLevel");
		String strSelectType=(String)request.getAttribute("strSelectType");
		String strQuoteID=(String)request.getAttribute("strQuoteID");
		String strWithincontext = (String) request.getAttribute("strWithincontext");
		String strContext = (String) request.getAttribute("strContext");
		String strContextValue = (String) request.getAttribute("strContextValue");
		String strStatus=(String)request.getAttribute("strStatus");
		String opt=request.getParameter("opt");
		String profileValue=(String)request.getAttribute("profileValue");
		

		//String title = "";
		//	if ("y".equalsIgnoreCase(strWithincontext)) {
		//		if (strContextValue.length() == 0)
		//			title = " - Context to Contracts";
		//		else 
		//			title = " - " + strContext + " # " + strContextValue;
		//	}

			%>
	<!-- top banner -->

	<body marginheight="0" marginwidth="0" >
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
									<td valign="top" nowrap="nowrap" width="100"><a class="cisco" href="javascript:self.close();"><fmt:message key='ContractSelector.closeWindow'/></a></td>
									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif"><img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" /></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- screen title -->

		<%
		if ("y".equalsIgnoreCase(strWithincontext)) {
			if (strContextValue.length() == 0){
			//title = " - Context to Contracts";
		%>
				<h1 style="width:975px">
					<fmt:message key='ContractSelector.contractSelector'/> - <fmt:message key='ContractSelector.context'/>
				</h1>
		<%
			} 
			else {
				if (strContext.equalsIgnoreCase("CONTRACT")){
					//title = " - " + strContext + " # " + contextValue;
		%>
					<h1 style="width:975px">
						<fmt:message key='ContractSelector.contractSelector'/> - <fmt:message key='ContractSelector.contextContract'/> # <%=strContextValue%>
					</h1>
		<%
				}
				else {
		%>
					<h1 style="width:975px">
						<fmt:message key='ContractSelector.contractSelector'/> - <fmt:message key='ContractSelector.contextQuote'/> # <%=strContextValue%>
					</h1>
		<%
				}//inner else closed
			}//outer else closed
		}//outer if closed
		else{
		%>
		<h1 style="width:975px">
			<fmt:message key='ContractSelector.contractSelector'/>
		</h1> 
		<%
		}//outer else is closed
		%>
	
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
			<form id="contactSearchForm" action="#" method="get" name="contactSearchForm" class="inline">
		
		<!--Hidden Values Set here -->
     				 <input type="hidden" name="strCCOUserId" id="strCCOUserId" value="<%=strCCOUserId%>"/>
                     <input type="hidden" name="strSourceSystem" id="strSourceSystem" value= "<%=strSourceSystem%>"/>
                     <input type="hidden" name="strAuthLevel" id="strAuthLevel" value= "<%=strAuthLevel%>"/>
                     <input type="hidden" name="strSelectType" id="strSelectType" value= "<%=strSelectType%>"/>
                     <input type="hidden" name="strQuoteID" id="strQuoteID" value= "<%=strQuoteID%>"/>
                     <input type="hidden" name="strWithincontext" id="strWithincontext" value= "<%=strWithincontext%>"/>
                     <input type="hidden" name="strContext" id="strContext" value= "<%=strContext%>"/>
                     <input type="hidden" name="strContextValue" id="strContextValue" value= "<%=strContextValue%>"/>
                     <input type="hidden" name="strStatus" id="strStatus" value= "<%=strStatus%>"/>
                     <input type="hidden" name="opt" id="opt" value= "<%=strSelectType%>"/>	
                     <input type="hidden" name="newBillTOID" id="newBillTOID" value= "0.00"/>
                     <input type="hidden" name="BillTOPickerValue" id="BillTOPickerValue" value= ""/>
                     <input type="hidden" name="profileValue" id="profileValue" value= "<%=profileValue%>"/>					 
      <!--Hidden Values Set here -->
					<div class="marque_grid">
						<div id="searchFilters" class="sub_block_hr">
							<h3><fmt:message key='ContractSelector.contractSearchFilters'/></h3>
							<table class="vert_pad" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
								<col width="30" />
								<col width="870" />
								</colgroup>
								<tbody>
									<tr>
										
													<td width="100" nowrap="nowrap" align="right">
															<label for="Contract#">
																<font color="#9c0000">* </font><fmt:message key='ContractSelector.contract'/>
															</label>
													</td>
													<td width="210"><input type="text" name="Contract#" id="Contract#" class="inputTextVLarge" />
													</td>
									      			<td width="188" nowrap="nowrap" align="right">
									      					<label for="from_date"><fmt:message key='ContractSelector.earliestBeginDateFrom'/>
									      					</label>
									      			</td>
										    		<td width="272">
										    			<table border="0" cellspacing="0" cellpadding="0">
					                                          <tr>
					                                            	<td><input id="from_date" class="inputTextMedium" type="text" name="from_date" /></td>
					                                            	<td align="right" nowrap>&nbsp;&nbsp;
					                                                	<label for="to_date"><fmt:message key='ContractSelector.to'/></label>
					                                                </td>
					                                            	<td><input id="to_date" class="inputTextMedium" type="text" name="to_date" /></td>
					                                          </tr>
                                       				   </table>
                                       				 </td>
												</tr>
									
												<tr>
													<td align="right">
														<label for="billTo">
															<font color="#9c0000">* </font><fmt:message key='ContractSelector.billTo'/>
														</label>
													</td>
													<td>
														<table border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td align="left">
															<input type="text" name="billToName" id="billToName" class="inputTextLarge" />&nbsp;&nbsp;
															</td>
															<td align="left">
															<img onClick="showBillToID()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt="<fmt:message key='ContractSelector.pickerAlt'/>" height="13" width="13" align="right" border="0" />
															</td>
														</tr>
														</table>
													</td>
													
													
								      				<td align="right" width="188">
								      					<label for="from_date2"><fmt:message key='ContractSelector.earliestEndDateFrom'/>
								      					</label>								      				
								      				</td>
									    			<td>
									    				<table border="0" cellspacing="0" cellpadding="0">
				                                          <tr>
				                                            <td><input id="from_date2" class="inputTextMedium" type="text" name="from_date2" /></td>
				                                            <td align="right" nowrap>&nbsp;&nbsp;
				                                                <label for="to_date2"><fmt:message key='ContractSelector.to'/></label>
				                                               </td>
				                                            <td><input id="to_date2" class="inputTextMedium" type="text" name="to_date2" /></td>
				                                          </tr>
                                        				</table>
                                        			</td>
												</tr>
												<tr>
													<td align="right" valign="top"><label for="ServiceLevelList"><fmt:message key='ContractSelector.serviceLevel'/></label>
													</td>
									  				<td>
														<!-- start multi picker -->
														<table border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td>
																<div class="listBox" style="width:160px;height:70px;" id="listBoxSm">
																	<span id="selectServiceLevelsList">  </span>
																</div>
																	
																</td>  
																<td  valign="top"> <img onClick="callXtrackServiceLvl()" src="images/global/buttons_and_icons/icons/icn_picker.gif" alt="<fmt:message key='ContractSelector.pickerAlt'/>" height="13" width="13" align="right" border="0" />
															    </td>
															</tr>
														</table>
															<!-- end multi picker -->										
													</td>
													<!-- Show the contract selector status only for internal users and hide for externusers --- Start -->
													<% if(strAuthLevel != null && strAuthLevel.equals("4")) { %>
								      				<td align="right" valign="top"><label for="ContractStatusList"><fmt:message key='ContractSelector.contractStatus'/></label>
								      				</td>
									    			<td>
									    				<div class="listBoxSm" style="width: 170px;height: 70px"> 
									    					<span id="StatusList">                                        
                                          
					                                          <!-- input id="StatusList_0" type="checkbox" name="StatusList:0" />
					                                          <label for="StatusList_0">Active</label>
					                                          <br />
					                                          <input id="StatusList_3" type="checkbox" name="StatusList:3" />
					                                          <label for="StatusList_3">QA Hold</label>
					                                          <br />
					                                          <input id="StatusList_4" type="checkbox" name="StatusList:4" />
					                                          <label for="StatusList_4">Expired</label>
					                                          <br />
					                                          <input id="StatusList_5" type="checkbox" name="StatusList:5" />
					                                          <label for="StatusList_5">Overdue</label>
					                                          <br /-->                                          
					                                          <%
					                                          ArrayList alCntrStatus=(ArrayList)request.getAttribute("CONTRACTSTATUSES");
					  										 	for (int cntr=0;cntr<alCntrStatus.size();cntr++){%>
												                
											                     <input type="checkbox" name="StatusList_<%=cntr%>" id="StatusList_<%=cntr%>" value="<%=((XxcssCtStatusObjType)(alCntrStatus.get(cntr))).getStatus()%>"/>
											                     <label for="StatusList<%=cntr%>"><%=((XxcssCtStatusObjType)(alCntrStatus.get(cntr))).getStatus()%>			     <br>
																 <%}%>		                                          
											                     <input type="hidden" id="statusCnt" name="statusCnt" value="<%=alCntrStatus.size()%>" />     
											                     <input type="hidden" id="servicelvlCnt" name="servicelvlCnt" value="0" />                                          
				                                          </span>
				                                       </div>
				                                    </td>
													<%	} else {%>
														<input type="hidden" id="statusCnt" name="statusCnt" value="0" /> 
														<input type="hidden" id="servicelvlCnt" name="servicelvlCnt" value="0" />
													<% } %>
													
													<!-- Show the contract selector status only for internal users and hide for externusers --- End -->
											</tr>
											<tr>
									  			<td align="right" valign="middle"><label for="ContractName"><fmt:message key='ContractSelector.contractName'/></label>
									  			</td>
									  			<td><input type="text" name="ContractName" id="ContractName" class="inputTextXLarge" />
									  			</td>
									  			<td align="right" valign="middle"><label for="from_date3"><fmt:message key='ContractSelector.lastModifiedDate'/></label>
									  			</td>
									  			<td align="left" valign="top">
									  				<table border="0" cellspacing="0" cellpadding="0">
                                        				<tr>
				                                          <td><input id="from_date3" class="inputTextMedium" type="text" name="from_date3" /></td>
				                                          <td align="right" nowrap>&nbsp;&nbsp;
				                                              <label for="label"><fmt:message key='ContractSelector.to'/></label></td>
				                                          <td><input id="to_date3" class="inputTextMedium" type="text" name="to_date3" /></td>
			                                       	   </tr>
	                                      			</table>	                                      			
											    </td>					  
									       </tr>
								     </tbody>
							    </table>
							  <div class="inline_tertiary">
									<!-- button component -->
								<table class="tertiary_enabled" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="button_left" onclick="document.getElementById('searchforContract').click();"></td>
											<td style="padding:0"><input id="searchforContract" class="button" type="button" name="searchforContract" value="<fmt:message key='ContractSelector.searchContracts'/>" onclick="return searchContracts()"/></td>
											<td class="button_right" onclick="document.getElementById('searchforContract').click();"></td>
										</tr>
									</table>
									<a href="javascript:document.getElementById('contactSearchForm').reset(); resetServiceLvl();" class="inline_buttonAlt float_right"><fmt:message key='ContractSelector.clearAllField'/> <img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='ContractSelector.clearFieldsAlt'/>" align="absmiddle" height="13" width="13" border="0" name="ClearFields3" id="ClearFields" /></a>
									<br class="clear_all" />
								</div>
								<table>
									<tr>
										<td style="padding:0">
											<font color="#9c0000">
											<fmt:message key='ContractSelector.oneFieldMandatory'/>
											</font>
										</td>
									</tr>
								</table>
						</div>
			 
			 
			 <div id="contractresults1" style="color: red;">				
								
				</div>
				
				<div id="contractresults">				
					<jsp:include page="/jsp/ContractSelectorSearchResults.jsp" />			
				</div>	
			</div>

			<!-- buttons start -->
			<div id="button_1" class="button_block_med">
				<!-- button component -->
				<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="button_left" onclick="document.getElementById('selectContract').click();"></td>
						<td><input id="selectContract" class="button" type="button" name="selectContract" value="<fmt:message key='ContractSelector.selectContracts'/>" onClick="return transferDataToMain();"/></td>
						<td class="button_right" onclick="document.getElementById('selectContract').click();"></td>
					</tr>
				</table>
				<!-- button component -->
				<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
					<tr>
						<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
						<td><input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='ContractSelector.cancel'/>" /></td>
						<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
		
		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->
		<div id ="vvvvcalDiv"></div>
		
		<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->
		<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->
		<script language="javascript" type="text/javascript">
		/** calendar */
		var cxCalObj = new cxCal('cxCalObj', 'from_date', '');
		cxCalObj.initialize();
		cxCalObj.onClose = function() {
		}
		var cxCalObj1 = new cxCal('cxCalObj1', 'to_date', '');
		cxCalObj1.initialize();
		cxCalObj1.onClose = function() {
		}
		var cxCalObj2 = new cxCal('cxCalObj2', 'from_date2', '');
		cxCalObj2.initialize();
		cxCalObj2.onClose = function() {
		}
		var cxCalObj3 = new cxCal('cxCalObj3', 'to_date2', '');
		cxCalObj3.initialize();
		cxCalObj3.onClose = function() {
		}
		var cxCalObj4 = new cxCal('cxCalObj4', 'from_date3', '');
		cxCalObj4.initialize();
		cxCalObj4.onClose = function() {
		}
		var cxCalObj5 = new cxCal('cxCalObj5', 'to_date3', '');
		cxCalObj5.initialize();
		cxCalObj5.onClose = function() {
		}
		</script>
		<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************** -->
		
	<!-- ********************* APPLICATION AREA END *********************************************** -->
	</body>

</html>