<%@ page import="com.cisco.crosstrack.menu.*, com.cisco.crosstrack.user.User, com.cisco.crosstrack.data.dto.ErrorDTO, com.cisco.crosstrack.data.dto.PortletDTO" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>

<%@ include file="../localeInfo.jsp" %>

<%
	String combinedScriptLocation2 = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation2 = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
	javax.servlet.http.HttpSession aSession = request.getSession();
 	String userSessionID = aSession.getId();
	userSessionID = userSessionID.replace('-', '_');
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><fmt:message key='TabMenu.title'/></title>

<!--  Commented for Defect 7774 - Combining All common JS scripts 
<script type="text/javascript" src="js/compjs/cxDHTMLMenu.js"></script>
<script type="text/javascript" src="images/cscc/sitewide_tools.js" ></script>
<script type="text/javascript" src="js/crosstrackselectors.js"></script>
-->

<script type="text/javascript">
function goDistribution(distributionURL){

//alert(distributionURL);
//window.open(distributionURL);
window.open(distributionURL, 'DistributionURL', "width=992, height=625, scrollbars=yes, resizable=1");
//window.location=distributionURL;
//showWindow(distributionURL, 'distributionURL', 650, 400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);
}
//abnj added May Scope Q4FY13 TD 78593
function logOut(){		
		var answer = confirm("You have unsaved changes. Do you wish to lose them?");
		if(answer)				
		window.location='logOut.do';
}
//end
function goToDestination(targetUrl)
	{		
	
		//Begin Q1FY13 - 2TNG Changes - Back Button - Resmi
		<%
		//session.setAttribute("SSSS",targetUrl);
		//Setting a counter to identify back button behavior
		String tabClick = "0";
		if (null != session.getAttribute("tabClick")) {
			tabClick = (String)session.getAttribute("tabClick"); 
		} 
		%>
		
		var count = <%=tabClick%>;
		count++;
		if (targetUrl != null && targetUrl.indexOf('?') != -1) {
			targetUrl += "&tabClick=" + count;
		} else {
			targetUrl += "?tabClick=" + count;
		}
		//End Q1FY13 - 2TNG Changes - Back Button - Resmi
	
		//alert(targetUrl);
		var change = 'no';
		var procid = 'procid';
		
		if(document.getElementById("TabSwitchPage")!=null )
		{		    
			change = document.getElementById("TabSwitchPage");
		}
				
		if(document.getElementById("TabSwitchProcId")!=null ){
			procid = document.getElementById("TabSwitchProcId").value;}
		
		//alert('----change'+change +'---procid is '+procid  );
		
		if(change=="yes")
		{
			showPopUp(targetUrl);
		}
		else
		{
		    if(procid!='procid'){
		    	var unsavedChanges = validateUnsavedChanges(procid);
				if(unsavedChanges){
					showPopUp(targetUrl)
		    	}
		    }
			else{
				//alert('----at change =no and procid=no');
				window.location=targetUrl;
				}
		}

	}
	
	function showPopUp(targetUrl)
	{		
		var answer = confirm("You have unsaved changes. Do you wish to lose them?");
		
		if(answer)
			window.location=targetUrl;
		//else
			//alert('Thanks for staying with us :)');	
	}
	
	function validateUnsavedChanges(procid)
	{
		//Make a JSON-RPC call here to the database to figure out if there are any unsaved changes for this proc_id
		//Returns a boolean - Yes if there are unsaved changes and No if there aren't any
		
		//alert('Calling the database for changes on procid : '+procid);
		return true;
	}
	
	
	function validateSCCSearch(categorySearch){
		//alert('------invalidate');
		if(categorySearch == ""){
			alert('XXCSS_CT-650062 : Please select Search Category ');
			return false;
		}
		else{
		    return true;
		}
		return false;
	}
	
	
	
	function validateSearchText(searchText,categorySearchVal){//Added parameter categorySearchVal for  TD242440 by gnarapar
	//alert(searchText);
		//alert("---- "+ searchText);
		if(searchText.length ==0 ){
			alert('XXCSS_CT-650061 : Please enter search value ');
			return false;
		}
		
		if(searchText.length >40 ){
			alert('XXCSS_CT-650060 : Maximum of 40 characters allowed for this search. Please modify and resubmit your search.');
			return false;
		}
		
		if(validateAscii(searchText)){
			alert('Entry has special characters that are not allowed.\nPlease remove them and try again.');
			return false;
		}
		//changes for TD#42894-sramigan
		//if(!commaValidation(searchText)){
			//alert('XXCSS_CT-650058 : Comma separated values are not allowed. Please modify and resubmit your search ');
			//return false;
		//}
		//changes end for TD#42894
		//Start changes for TD242440 by gnarapar added PO Number field  characters check
		if(categorySearchVal =='Product PO' ){
		if(specialCharValidation(searchText)){
			return true;
		}
		else{
		alert('XXCSS_CT-650059 : Wild cards are not allowed in the search. Please modify and resubmit your search ');
		return false;
		}
		
		}
		//added for TD#42894-sramigan
		else if(categorySearchVal =='Serial Number / PAK Number' ||categorySearchVal =='License and Subscription Data' ){
			//alert('enmtering into the serial number');
			if(extCharacterValidations(searchText)){
			return true;
			}
			else{
			alert('XXCSS_CT-650059 : Wild cards are not allowed in the search. Please modify and resubmit your search ');
			return false;
			}
		}
		else if(categorySearchVal =='License and Subscription Data' ){
			//alert('enmtering into the serial number');
			if(extCharacterValidations(searchText)){
			return true;
			}
			else{
			alert('XXCSS_CT-650059 : Wild cards are not allowed in the search. Please modify and resubmit your search ');
			return false;
			}
		}
		//ended for TD#42894-sramigan 
		else{//End of  changes for TD242440 by gnarapar  PO Number field check
		if(extCharValidations(searchText,categorySearchVal)){//Q1FY15-CR#386667-added categorySearchVal-gdushyan
			return true;
		}
		else{
		alert('XXCSS_CT-650059 : Wild cards are not allowed in the search. Please modify and resubmit your search ');
		return false;
		}
		}
		return false;
	}
    /* New method written  for checking special characters for  PO Number restriction for TD242440 by gnarapar */
		function specialCharValidation(searchText){
		 var iChars = "%*,<>'";
		 var  searchTextValue = trim(searchText);
		 var searchTextLength=searchTextValue.length;

		 for (var i = 0; i <searchTextLength; i++) {
		  	if (iChars.indexOf(searchTextValue.charAt(i)) != -1) {
			  	return false;
		  	}		  	
		  }
		  
		return true;
	}
	 /*  End of method  for  PO Number restriction for TD242440  by gnarapar  */  
	//added for TD#42894-sramigan
	function extCharacterValidations(value){
	//alert('entering into the our validation');
		 var iChars = "!@$%^*()+=[]\\\;{}|\":<>?&#";
		 var iChars1 = "!@$%^*()+=[]\\\;,./{}|\":<>?&#~";
		  trimvalue = trim(value);
		 if (trimvalue.indexOf(" ") != -1) {
		  		return false;
	  	 }
	  	 if(iChars1.indexOf(trimvalue.charAt(0)) != -1){
	  	 //alert('XXCSS_CT-650059 : Wild cards are not allowed in the starting of search text. Please modify and resubmit your search ');
	  	 return false;
	  	 }
		  for (var i = 0; i < trimvalue.length; i++) {
		  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
			  	return false;
		  	}		  	
		  }
		  
		return true;
	} 
	//end for TD#42894-sramigan
	function scc_popup_window(){	
	var category_search = document.getElementById("category_search").value; 	
		if(validateSCCSearch(category_search)){
			var search_text = document.getElementById("search_text").value;
  			var finalurl=category_search+"?search_text="+search_text;
			childwindow = window.open(finalurl,"childWin","width=992,height=625, scrollbars");
    		//childwindow.creator=self;
   			//return false;
		}  	
	}

	function getQueryParameters(category_search){
		var parameters = category_search.split("?");
		//alert("Only parameters are ::::::  "+parameters[1]);
		var parametersQuery = parameters[1].split("&");
		var outParams = new Array();
		var paramsNameValue = new Array();
			for(var i=0, j=0;i<parametersQuery.length;i++,j++){
				//alert(parametersQuery[i]);
				paramsNameValue=parametersQuery[i].split('=');
				outParams[j++]=paramsNameValue[0];
				outParams[j]=paramsNameValue[1];	
				//alert("outParams is ::::::::  "+outParams);
			}
		return outParams;
	}

	function getQuery(category_search){
		var parameters = category_search.split("?");
		return parameters[0];
	}
	
	 // krkarnat start  TD # 227010
	function searchSCCGo(){
	var category_search = document.getElementById("category_search").value;
	if(category_search == "" || category_search == null){
		alert('XXCSS_CT-650062 : Please select Search Category ');
			return false;
		}
		
	var search_text = trim(document.getElementById("search_text").value);
	if(search_text == "" ||search_text == null ){
		alert('XXCSS_CT-650061 : Please enter search value ');
			return false;
		}
		 
	var queryParameters = getQueryParameters(category_search);
	var query = getQuery(category_search);
	var finalurl=query;
  	queryParameters[queryParameters.length-1]=escape(search_text);
  	var parametersQuery =queryParameters;
	var category_search_val = document.getElementById("category_search");
	category_search_val = category_search_val.options[category_search_val.selectedIndex].text;  	
		if(validateSCCSearch(category_search) && validateSearchText(search_text,category_search_val)){	//Added parameter 
			  if(category_search_val=='Serial Number / PAK Number' ||category_search_val=='License and Subscription Data'){  			    
  			    //Begin Q3fy12 Tnc 			    
  			
  			  //  finalurl="/CM/submitAdvancedSearch.do?method=loadAdvSrchResults&serialNumbers="+escape(search_text); //uncomment this line for local env  			      			    
  			    if (category_search_val == 'License and Subscription Data'){
  			     finalurl =category_search+"Y&serialNumbers="+ escape(search_text);	      			    
  			    }
  			    else 			    {  			    
  			    finalurl=category_search+escape(search_text);  			    
  			   // alert('else' + finalurl);  			    
  			    }  			   
  			    //End Q3fy12 Tnc  			
  			         
                XMLHttpRequestSend(finalurl,'GET','1000000');
  			}else{	
  	  				//alert('in else loop');
  					var escfinalurl=query;
  					var isIE = false;
  					var browser=navigator.appName;
  					var b_version=navigator.appVersion;
  					var version=parseFloat(b_version);
  					//alert(browser);
  					if(browser=='Microsoft Internet Explorer'){
  	  					isIE = true;
  	  				}
  					if(!isIE){
  						//escfinalurl="/CMMayRelease/submitAdvancedSearch.do";
  	  					//alert('inside non ie loop '+escfinalurl);
  						var myForm = document.createElement('FORM');
  						myForm.setAttribute('METHOD', 'POST');
  						myForm.setAttribute('ACTION', escfinalurl);
  						myForm.setAttribute('NAME', 'newform');
  						for(i=0;i<parametersQuery.length; i++){
  							var inputElement = document.createElement('INPUT');
  							inputElement.setAttribute('TYPE', 'HIDDEN');
  							//alert("Name "+parametersQuery[i]);
  							inputElement.setAttribute('NAME', parametersQuery[i]);
  							inputElement.setAttribute('ID', parametersQuery[i++]);
  							//alert("Value "+parametersQuery[i]);
  							inputElement.setAttribute('VALUE', parametersQuery[i]);
  							myForm.appendChild(inputElement);
  						}
  		
  						document.body.appendChild(myForm);
  						myForm.submit();
  					}else{
  						//code changes done for June MR TD 25585 in Q4FY14 - starts
  							var myForm = document.createElement("form");
							document.body.appendChild(myForm);
							myForm.name = "newform";
							myForm.id = "csccSubmitForm";
							myForm.method = "POST";
							myForm.action = escfinalurl;
							var toAddFormRef = document.getElementById("csccSubmitForm" );
	  						for(i=0;i<parametersQuery.length; i++){
	  							var newField=document.createElement('input');
								newField.type='hidden';
								newField.name=parametersQuery[i];
								newField.id=parametersQuery[i++];
								newField.value=parametersQuery[i];
								myForm.appendChild(newField);
	  						}
	  						toAddFormRef.submit();  						
  					}
  					//code changes done for June MR TD 25585 in Q4FY14 - ends
					//var escfinalurl=category_search+escape(search_text);
					//window.location=escfinalurl;
				// End of Fix for the QC Defect:268979 by gnarapar 
  			}
		}
		else{			
			return false;
		}
		return false;	  	
	}
	
	function betaSearchSCCGo(){
	var category_search = document.getElementById("category_search_beta").value; 
	var search_text = document.getElementById("search_text_beta").value;   	
	category_search = category_search.replace('submitAdvancedSearch.do','submitAdvancedSearchLucene.do');	
	var category_search_val = document.getElementById("category_search_beta");

	var queryParameters = getQueryParameters(category_search);
	var query = getQuery(category_search);
	var finalurl=query;
  	queryParameters[queryParameters.length-1]=escape(search_text);
  	var parametersQuery =queryParameters;
  	
	category_search_val = category_search_val.options[category_search_val.selectedIndex].text;  
	if(validateSCCSearch(category_search) && validateSearchText(search_text,category_search_val)){	//Added parameter 	
		var finalurl=category_search+escape(search_text);
		  	if(category_search_val=='Serial Number / PAK Number' ){
  			    //finalurl="/CMMayRelease/submitAdvancedSearch.do?method=loadAdvSrchResults&serialNumbers="+search_text;
  			    finalurl=category_search+escape(search_text);    
  			    XMLHttpRequestSend(finalurl,'GET','1000000','isBeta');
  			}else{
  					var escfinalurl=query;
					var isIE = false;
					var browser=navigator.appName;
					var b_version=navigator.appVersion;
					var version=parseFloat(b_version);
					
					if(browser=='Microsoft Internet Explorer'){
	  					isIE = true;
	  				}
					if(!isIE){
						//escfinalurl="/CMMayRelease/submitAdvancedSearch.do";
	  					//alert('inside non ie loop '+escfinalurl);
						var myForm = document.createElement('FORM');
						myForm.setAttribute('METHOD', 'POST');
						myForm.setAttribute('ACTION', escfinalurl);
						myForm.setAttribute('NAME', 'newform');
						for(i=0;i<parametersQuery.length; i++){
							var inputElement = document.createElement('INPUT');
							inputElement.setAttribute('TYPE', 'HIDDEN');
							//alert("Name "+parametersQuery[i]);
							inputElement.setAttribute('NAME', parametersQuery[i]);
							inputElement.setAttribute('ID', parametersQuery[i++]);
							//alert("Value "+parametersQuery[i]);
							inputElement.setAttribute('VALUE', parametersQuery[i]);
							myForm.appendChild(inputElement);
						}
		
						document.body.appendChild(myForm);
						myForm.submit();
					}else{
						//code changes done for June MR TD 25585 in Q4FY14 - starts
  							var myForm = document.createElement("form");
							document.body.appendChild(myForm);
							myForm.name = "newform";
							myForm.id = "csccSubmitForm";
							myForm.method = "POST";
							myForm.action = escfinalurl;
							var toAddFormRef = document.getElementById("csccSubmitForm" );
	  						for(i=0;i<parametersQuery.length; i++){
	  							var newField=document.createElement('input');
								newField.type='hidden';
								newField.name=parametersQuery[i];
								newField.id=parametersQuery[i++];
								newField.value=parametersQuery[i];
								myForm.appendChild(newField);
	  						}
	  						toAddFormRef.submit();
  						}
  					//code changes done for June MR TD 25585 in Q4FY14 - ends
				//var escfinalurl=category_search+escape(search_text);
				//window.location=escfinalurl;
			// End of Fix for the QC Defect:268979 by gnarapar 
  			}
		}
		else{			
			return false;
		}
		return false;	  	
	}	
	
	
	
	
  function XMLHttpRequestSend(finalurl,requestType,timeOut, isBeta)
{
    var URL=finalurl+"&callFrom=Ajax";
    var url,timer;
    var XMLHttpReq = createXMLHttpReq();
      
      function createXMLHttpReq()
      {
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

      if( requestType == "GET")
      {
          url = URL;
          // alert('get'+url);
         XMLHttpReq.open("GET",url,true);
       
          timer = setTimeout( function() {
               XMLHttpReq.abort();
               },timeOut); 
                 
              
         XMLHttpReq.onreadystatechange = function()
         {
         
            if (XMLHttpReq.readyState == 4) 
            {
                clearTimeout(timer);               
               if (XMLHttpReq.status == 200) 
               {
                     document.getElementById("commentForm").style.display = 'none';
                     displayPopupResults(XMLHttpReq,finalurl,isBeta);
        
               }
            }else{
            
                          
              document.getElementById("commentForm").style.display = 'block'; 
            
            }     
         }     
         XMLHttpReq.send('');
      }

    
      
}
	
	function displayPopupResults(req,finalurl,isBeta) 
    {
		var queryParameters = getQueryParameters(finalurl);
		var query = getQuery(finalurl);
		var finalurl=query;
	  	//queryParameters[queryParameters.length-1]=escape(search_text);
	  	var parametersQuery =queryParameters;
	  	 var result = req.responseText;
         var resultArray=result.split('__');
         if(result.indexOf("__")>0 && resultArray[0].trim()=="true"){
                 if(resultArray[0].trim()=="true"){
                   finalurl=resultArray[1].trim();
                   randomNum = Math.floor(Math.random()*1001);
                   //alert("display popup   "+finalurl);
                   childwindow = window.open(finalurl,randomNum,"width=992,height=625, scrollbars, resizable");
			     }
         }else{
         	if(isBeta=='isBeta'){
	         	if(resultArray[0].trim()=="false"){
	               finalurl=resultArray[1].trim();
	            }
	            //alert('inside else firing request again.........   '+finalurl);  
             }  
         	
				var escfinalurl=query;
				var isIE = false;
				var browser=navigator.appName;
				var b_version=navigator.appVersion;
				var version=parseFloat(b_version);
				//alert(browser);
				if(browser=='Microsoft Internet Explorer'){
					isIE = true;
				}
				if(!isIE){
					//escfinalurl="/CMMayRelease/submitAdvancedSearch.do";
					//alert('inside non ie loop '+escfinalurl);
					var myForm = document.createElement('FORM');
					myForm.setAttribute('METHOD', 'POST');
					myForm.setAttribute('ACTION', escfinalurl);
					myForm.setAttribute('NAME', 'newform');
					for(i=0;i<parametersQuery.length; i++){
						var inputElement = document.createElement('INPUT');
						inputElement.setAttribute('TYPE', 'HIDDEN');
						//alert("Name "+parametersQuery[i]);
						inputElement.setAttribute('NAME', parametersQuery[i]);
						inputElement.setAttribute('ID', parametersQuery[i++]);
						//alert("Value "+parametersQuery[i]);
						inputElement.setAttribute('VALUE', parametersQuery[i]);
						myForm.appendChild(inputElement);
					}
	
					document.body.appendChild(myForm);
					myForm.submit();
				}else{
					//escfinalurl="/CMMayRelease/submitAdvancedSearch.do";
					var formElement = '<form name="newform" id="csccSubmitForm" METHOD=POST ACTION="'+escfinalurl+'">';
					var myForm = document.createElement(formElement);
					document.body.appendChild(myForm);
					var toAddFormRef = document.getElementById("csccSubmitForm" );
					for(i=0;i<parametersQuery.length; i++){
						//alert('inside for loop');
						var stringNewEle = '<input type="hidden" name="'+parametersQuery[i]+'" ID="'+parametersQuery[i++]+'" value="'+parametersQuery[i]+'" />' ;
						//alert(stringNewEle);
						var newField = document.createElement(stringNewEle);
						myForm.appendChild(newField);
					}
					toAddFormRef.submit();
				}
			//var escfinalurl=category_search+escape(search_text);
			//window.location=escfinalurl;
		// End of Fix for the QC Defect:268979 by gnarapar 
        }
	     
	}
	// krkarnat end  TD # 227010
</script>

<!-- ********************* APPLICATION AREA START *********************************************** -->
<!-- linked resources added by Tristream Start -->
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>
		<link rel="stylesheet" href="css/coomnJQuery.css" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="js/reminderJQuery.js"></script>
	
<!-- component linked resources -->
<!--  Commented for Defect 7774 - Combining All common JS scripts 
<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>
-->


</head>

<body>
<%! 
int breadCrubsLength;
%>
				
<%

String strSrvrName=request.getServerName();
String hlpCTX = (String)request.getAttribute("XtrackHelpContext");
String advSrchURL= "";

if (hlpCTX != null)
	advSrchURL= request.getScheme() + "://" + request.getServerName() + session.getAttribute("Xtrack_Adv_Search_URL")  +"&XtrackHelpContext="+hlpCTX;
else
	advSrchURL= request.getScheme() + "://" + request.getServerName() + session.getAttribute("Xtrack_Adv_Search_URL");

String rolepermissionURL= request.getScheme() + "://" + request.getServerName() + session.getAttribute("Xtrack_Role_Permission_URL");
String preferanceURL= request.getScheme() + "://" + request.getServerName() + session.getAttribute("Xtrack_User_Pref_URL");

  // 222328 start
  String distributionURL= "https://tools.cisco.com/scc";
  // String distributionURL= "https://www.cisco.com/cgi-bin/front.x/sms3c3dispatch?AppName=ContractAgent";
if(strSrvrName.indexOf("dev")!=-1){
	 //distributionURL= "https://tools-dev.cisco.com/scc";
	 distributionURL="https://tools-dev.cisco.com/ys1sms";
	// distributionURL= "https://cco-dev.cisco.com/cgi-bin/front.x/sms3c3dispatch?AppName=ContractAgent";
}
if(strSrvrName.indexOf("stage")!=-1){
	 //distributionURL= "https://tools-stage.cisco.com/scc";
	 distributionURL="https://tools-stage.cisco.com/ys1sms";
	// distributionURL= "https://cco-stage.cisco.com/cgi-bin/front.x/sms3c3dispatch?AppName=ContractAgent";
}
//  222328 end
ErrorDTO edto = (ErrorDTO)session.getAttribute("Request_menu_error_message");
String menuErrorMsg = edto.getErrorMessage();//"we have a MENU error here";//edto.getErrorMessage();//
boolean errorInMenu = false;
if (menuErrorMsg.length() > 0){
errorInMenu = true;
} 
%>
<% 
					//Menu m1= (Menu)session.getAttribute("TabMenu");
					User user=(User)session.getAttribute("User");
					String givenname = user.getUserAttributes().getGivenName();
					String authlevel = user.getUserAttributes().getAccessLevel()+"";
					String roleType = user.getChkRoleType();
%>
<%//vtiruvee Q1FY13 ICPA CHANGES	
if((roleType.equalsIgnoreCase("2-TIER RESELLER")) || (roleType.equalsIgnoreCase("Distributor"))){
%>
<div id="boxes">
							  <div id="mask"></div>
						    <div id="maskAlert"></div>
							<div id="reminderAgreement" class="reminderwindow"  style="border:1px solid black ;">
                                 <div id="mod_2" class="table_mod_header" style="border-bottom: none;">
				<strong><font color="white">&nbsp;&nbsp;&nbsp;Partner Agreement </font> </strong>
			</div>
                                 <div style="padding-left:10px;background-color:white">
                                 <center><table border="0" cellspacing="0" cellpadding="0" align="center">
							<colgroup>
								<col width="100" />
								<col width="20" />
								<col width="800" />
							</colgroup>
							<tbody>
								<tr>
									<td align="" colspan="3">
									</td><font size="3" color="#669999">By Using this Web Ordering Tool,partner acknowledges and agrees that</font>
									<td>
									</td>
								</tr>
								<tr>
								    <td></td>
									<td align="center" valign="top">
									<img src="<%= combinedImagesLocation2 %>images/cscc/icn_black_plus.gif" height="6"  width="6" align="absmiddle" border="0" />
									</td>
									<td>
									<!-- <font size="3" color="#669999">Distributor's use of this tool is subject to its distribution agreement, as applicable.	</font>  -->
									<font size="3" color="#669999">Partner's use of this tool is subject to its ICPA or distributor's use of this tool is subject to its distribution agreement, as applicable. </font> 
									</td>
								</tr>
								<tr>
									<td></td>
									<td align="center" valign="top">
									<img src="<%= combinedImagesLocation2 %>images/cscc/icn_black_plus.gif" height="6"  width="6" align="absmiddle" border="0" />
									</td>
									<td>
									<!-- <font size="3" color="#669999">Partner, if applicable, has received express authorization from the end user customer to sell the services <br>to such customer, that partner seeks through this tool.	</font> -->
									<font size="3" color="#669999">Partner has a valid, existing indirect channel partner agreement ("ICPA") with Cisco or distributor has a  valid, existing distribution agreement with Cisco, as applicable. </font>
									</td>
								</tr>
								<tr>
									<td></td>
									<td align="center" valign="top">
									<img src="<%= combinedImagesLocation2 %>images/cscc/icn_black_plus.gif" height="6"  width="6" align="absmiddle" border="0" />
									</td>
									<td>
									<font size="3" color="#669999">Partner, if applicable, has received express authorization from the end user customer to sell the services to such customer, that partner seeks through this tool.	</font> 
									</td>
								</tr>
								
								<tr>
									<td></td>
									<td align="center" valign="top">
									<img src="<%= combinedImagesLocation2 %>images/cscc/icn_black_plus.gif" height="6"  width="6" align="absmiddle" border="0" />
									</td>
									<td>
									<font size="3" color="#669999">Distributor, if applicable, has received express authorization from the partner to sell the services to such authorized partner, that distributor seeks to quote through this tool. 	</font>
									</td>
								</tr>
								<tr>
									<td></td>
									<td align="center" valign="top">
									<img src="<%= combinedImagesLocation2 %>images/cscc/icn_black_plus.gif" height="6"  width="6" align="absmiddle" border="0" />
									</td>
									<td>
									<font size="3" color="#669999">Cisco retains the right to suspend or terminate partner's access to this tool at any time; and 	</font>
									</td>
								</tr>
								<tr>
									<td></td>
									<td align="center" valign="top">
									<img src="<%= combinedImagesLocation2 %>images/cscc/icn_black_plus.gif" height="6"  width="6" align="absmiddle" border="0" />
									</td>
									<td>
									<font size="3" color="#669999">Cisco retains the right to enforce the <a href="javascript:goDistribution('<c:out value="${distiInspectReqPath}"/>')">Inspection & Licensing Requirement</a> for <a href="javascript:goDistribution('<c:out value="${distiSecondaryProductsPath}"/>')">Secondary Market Products</a>.	</font>
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
									<td colspan="3"><font size="3" color="#669999">Please note:</font></td>
									<td>						
									</td>
									<td>
									
									</td>
								</tr>								
								<tr>
									<td colspan="3"><font size="3" color="#669999">Submitting an electronic purchase order in CSCC requires you to sign an <a href="javascript:goDistribution('<c:out value="${distiInternetCommerceAgreePath}"/>')">Internet Commerce Agreement</a></font></td>
									<td>						
									</td>
									<td>
									
									</td>
								</tr>								
								
							</tbody>
							</table></center>
									</div>	
                                 
                                 </div>
                              </div>
<%}%> 
<div id="application_top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr bgcolor="#ffffff">
					<td colspan="3">
						<table width="100%" height="0%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<% if(authlevel.equalsIgnoreCase("4")){%>
									<td width="33%"><span class="user"><fmt:message key='TabMenu.welcome'/>  <a href="#" onclick="launchRolepermSearch('<%=rolepermissionURL%>');">
									<%=givenname%>  </a> | <a href="javascript:logOut();"><fmt:message key='TabMenu.logout'/></a> | <c:out value="${CurrentDate}"/> </span></td>
								<%}else{%>
									<td width="33%"><span class="user"><fmt:message key='TabMenu.welcome'/> 
									<%=givenname%> | <a href="javascript:logOut();"><fmt:message key='TabMenu.logout'/></a> | <c:out value="${CurrentDate}"/> </span></td>
								<%}%>
								<td align="center" width="33%">
								<% if(roleType.equalsIgnoreCase("Distributor") || roleType.equalsIgnoreCase("2-TIER RESELLER")){%>
									<a href="javascript:goDistribution('jsp/DistiSigningPopupPage.jsp');" onmouseout="hideReminderAgreementFlyOver('#reminderAgreement');" onmouseover="showReminderAgreementFlyOverAfter('#reminderAgreement',this);">Reminder:&nbsp;&nbsp;Partner Agreement Acknowledgement</a>
								<%}%>
								</td>
								<td align="right" width="33%"><a href="javascript:launchAdvSearch('<%=advSrchURL%>');"><fmt:message key='TabMenu.advanceSearch'/></a>  | 
									<a href="javascript:launchPreferences('<%=preferanceURL%>');"><fmt:message key='TabMenu.preferences'/></a>
								</td>			
							</tr>
						</table>
					</td>
				</tr>
				
				</table> <!-- Q3FY13 -2TNG Changes - B2BPUnchout - nshakya -->	
				
				<!--Begin Q3FY13 - 2TNG Changes - B2B Punchout - nshakya -->
	
				<c:if test="${sessionScope.userInPunchOutSession == 'Y' }">
	            <div id="PunchOutBarDiv">
				<jsp:include page="/WEB-INF/jsp/layout/PunchOutBar.jsp" />
				</div>
	            </c:if>
									
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="3">
						
				<!--End Q3FY13 - 2TNG Changes - B2B Punchout - nshakya -->	
				
						<%if(!errorInMenu){%>
						<h1><c:out value="${TabMenu.headerName}"/></h1>
						<%}%>
					</td>
					<td></td>	
					<td align="right">
								
				<%
				ErrorDTO sccEdto = (ErrorDTO)session.getAttribute("Request_scc_error_message");
				String sccErrorMsg = sccEdto.getErrorMessage();//"we have an scc error here";//sccEdto.getErrorMessage();//
				
				if (sccErrorMsg.length() > 0){
				%>
				<font color="red" size="2">&nbsp;&nbsp;<%=sccErrorMsg %> </font>
				<%
				} else {
				%>
					<form id="search_scc" class="inline" action="" method="post" name="search_scc">
					<div id="commentForm" style="display:none;"> Please Wait .....</div>
							<label ><fmt:message key='TabMenu.searchCSCC'/></label> 
							<select id="category_search" name="category_search" size="1">
								<option value=""><fmt:message key='TabMenu.searchCategory'/></option>								
									<c:forEach var="row" items="${SCCurlList}">									
										<option value="<c:out value="${row.url}"/>"><c:out value="${row.functionDesc}"/></option>											
									</c:forEach>
							</select> 							
					<input id="search_text" class="inputTextLarge" type="text" name="search_text" />
					<input onclick="return searchSCCGo();" type="image" name="" src="<%= combinedImagesLocation2 %>images/global/buttons_and_icons/icons/grey/icn_go.gif" alt="<fmt:message key='Common.goButtonAlt'/>" align="absmiddle" border="0" height="17" width="17" /> &nbsp;
				<!--	<input onclick="javascript:scc_popup_window(); return false;" type="image" name="" src="images/global/buttons_and_icons/icons/grey/icn_popnew.gif" alt="New Window" align="absmiddle" border="0" height="17" width="17" />		-->								
					</form>
				
				<!--  start TD # 238018 -->
				
				<BR>
				<form id="search_scc" class="inline" action="" method="post" name="search_scc">
					<div id="commentForm" style="display:none;"> Please Wait .....</div>
							<!-- <label><fmt:message key='TabMenu.betaSearchCSCC'/></label> 
							<select id="category_search_beta" name="category_search_beta" size="1">
								<option value=""><fmt:message key='TabMenu.searchCategory'/></option>	
															
									<c:forEach var="row" items="${SCCurlList}">		
									
									<c:if test='${row.functionDesc=="Serial Number / PAK Number"}'>							
										<option value="<c:out value="${row.url}"/>"><c:out value="${row.functionDesc}"/></option>
									</c:if>	
									<c:if test='${row.functionDesc=="Product PO"}'>							
										<option value="<c:out value="${row.url}"/>"><c:out value="${row.functionDesc}"/></option>
									</c:if>		
									<c:if test='${row.functionDesc=="Product SO"}'>							
										<option value="<c:out value="${row.url}"/>"><c:out value="${row.functionDesc}"/></option>
									</c:if>												
									</c:forEach>
							</select> 							
					<input id="search_text_beta" class="inputTextLarge" type="text" name="search_text_beta" />
					<input onclick="return betaSearchSCCGo();" type="image" name="" src="<%= combinedImagesLocation2 %>images/global/buttons_and_icons/icons/grey/icn_go.gif" alt="<fmt:message key='Common.goButtonAlt'/>" align="absmiddle" border="0" height="17" width="17" /> &nbsp;
					-->
					<!--<input onclick="javascript:scc_popup_window(); return false;" type="image" name="" src="images/global/buttons_and_icons/icons/grey/icn_popnew.gif" alt="New Window" align="absmiddle" border="0" height="17" width="17" />-->
					</form>
				
				<!--  end TD # 238018 -->
				
				
				<%}%>	
				</td>
				</tr>
				<tr>					
				<% if (!errorInMenu) {
				breadCrubsLength = ((Menu)(session.getAttribute("TabMenu"))).getBreadCrumbs().size();
				request.setAttribute("breadCrubsLength",breadCrubsLength+"");													 
				}%>
				
			
					<td colspan="2">
						<ul id="breadcrumbs">
						<!-- ******************************* -->						
						<!-- Loop to set the bread crumbs -->
							<c:set var="breadCrubsLength" value="${breadCrubsLength}" scope="page" />							
							<c:set var="counter" value="0"/> 
							<c:set var="flag" value="true" scope="page" />
							<% if (!errorInMenu) {%>
							<c:forEach var="row" items="${TabMenu.breadCrumbs}">
							<c:set var="counter" value="${counter+1}"/>
							<c:choose>								
								<c:when test='${counter != breadCrubsLength}'>
									<c:choose>
									<c:when test='${flag == "true"}'>
										<li class="first"><a href=<c:out value="${row.bdUrl}"/>><c:out value="${row.bdName}"/></a></li>
										<c:set var="flag" value="false" scope="page" />									
									</c:when>
									<c:otherwise>
										<li><a href=<c:out value="${row.bdUrl}"/>><c:out value="${row.bdName}"/></a></li>									
									</c:otherwise>
									</c:choose>
								</c:when>
							 	<c:otherwise>
							 		<li><a><c:out value="${row.bdName}"/></a></li>
							 	</c:otherwise>	
							</c:choose>
							</c:forEach>
							<%}%>
						</ul>
					</td>
				</tr>
				
			</table>
			
		</div>
		
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <% if (!errorInMenu) {%>
  <tr >
    <td >
    
    <div id="tDiv"></div>
   
    </td>
  </tr>
  <%} else {%>
  <tr >
    <td bgcolor = "#7f7f7f"> 
   <font color="red" size="2">&nbsp;&nbsp;<%=menuErrorMsg %> </font>
			
    </td>
  </tr>
<% }%> 

</table>


<script type="text/javascript">

//Script to create the actual DHTML object
var navObj = document.navObj = new cxDHTMLMenu("navObj", "tDiv", "default", "<%= combinedImagesLocation2 %>");



navObj.menuItems = new Array();

<% int i=0; %>
<% int j=0; %>

<c:forEach var="row" items="${TabMenu.parentMenuBeans}">
		
		 navObj.addMenuItem('<c:out value="${row.tabName}"/>','<c:out value="${row.tabIndex}"/>','<c:out value="${row.targetURL}"/>','<c:out value="${row.targetPage}"/>');
		 disableParentMenuTab('<c:out value="${row.enable}"/>', <%=i%>);
		 
	//	 <c:forEach var="subRow" items="${row.children}">
	//	  	navObj.addSubMenuItem('<c:out value="${subRow.tabName}"/>','<c:out value="${subRow.parentTabIndex}"/>','<c:out value="${subRow.tabIndex}"/>','<c:out value="${subRow.targetURL}"/>','<c:out value="${subRow.targetPage}"/>');	
	//		disableChildMenuTab('<c:out value="${subRow.enable}"/>', <%=i%>, <%=j%>);
	//	    <% j++; %>
	//	 </c:forEach>
		 
		 <c:forEach var="subRow" items="${row.children}">
		  	//navObj.addSubMenuItem('<c:out value="${subRow.tabName}"/>','<c:out value="${subRow.parentTabIndex}"/>','<c:out value="${subRow.tabIndex}"/>','javascript:goToDestination(\'<c:out value="${subRow.targetURL}"/>\');','<c:out value="${subRow.targetPage}"/>');	
		  	<c:choose>
				<c:when test='${subRow.secondaryDisplayMenu == "Distribution"}'>
						navObj.addSubMenuItem('<c:out value="${subRow.tabName}"/>','<c:out value="${subRow.parentTabIndex}"/>','<c:out value="${subRow.tabIndex}"/>','javascript:goDistribution(\'<%=distributionURL%>\');','<c:out value="${subRow.targetPage}"/>','<c:out value="${subRow.secondaryDisplayMenu}"/>','<fmt:message key='TabMenu.DistributionMessage'/>');	
				</c:when>
				<c:otherwise>
						navObj.addSubMenuItem('<c:out value="${subRow.tabName}"/>','<c:out value="${subRow.parentTabIndex}"/>','<c:out value="${subRow.tabIndex}"/>','javascript:goToDestination(\'<c:out value="${subRow.targetURL}"/>\');','<c:out value="${subRow.targetPage}"/>','<c:out value="${subRow.secondaryDisplayMenu}"/>','<fmt:message key='TabMenu.DistributionMessage'/>');	
				</c:otherwise>
			</c:choose>
	
			disableChildMenuTab('<c:out value="${subRow.enable}"/>', <%=i%>, <%=j%>);
		    <% j++; %>
		 </c:forEach>
		 
		 <% j=0; %>
		 <% i++; %>
</c:forEach>

navObj.reDraw();
function disableParentMenuTab(value, index) 
{
	if(value=='false'){
		navObj.setItemDisable(index,'');
	}
	return;
}

function disableChildMenuTab(value, pindex, cindex) 
{
	if(value=='false'){
		navObj.setItemDisable(pindex,cindex);
	}
	return;
}

function launchAdvSearch(strAdvSrchUrl)
{
	//TD#221546
	//showWindow(strAdvSrchUrl, 'AdvancedSearch', 992, 625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);
	// Added by Kishore to make the popup resizable
	//window.open(strAdvSrchUrl, "<%=userSessionID%>", "width=992, height=625, scrollbars=yes, resizable=1");
	randomNum = Math.floor(Math.random()*1001);
    window.open(strAdvSrchUrl, randomNum, "width=992, height=625, scrollbars=yes, resizable=1");
}

function launchPreferences(strPreferenceUrl)
{
	showWindow(strPreferenceUrl, 'Preferences', 650, 400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);
}
function launchRolepermSearch(strRolepermUrl)
{
	//showWindow(strRolepermUrl, 'RolePermissions', 650, 400, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);
	window.location=strRolepermUrl;
	
}
</script>

</body>

</html>
