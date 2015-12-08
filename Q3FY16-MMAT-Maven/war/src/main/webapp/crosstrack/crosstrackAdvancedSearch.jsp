
<%@ page import="java.util.List" %>
<%@ page import="com.cisco.crosstrack.filters.dao.PortletDTO" %>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%@ include file="localeInfo.jsp"%>

<jsp:useBean id="JSONRPCBridge" scope="session" class="com.metaparadigm.jsonrpc.JSONRPCBridge" />

<jsp:useBean id="handler" scope="request" class="com.cisco.crosstrack.filters.FilterHandler" />

<% JSONRPCBridge.registerObject("handler", handler); %>
<%	
	String appContext   = request.getContextPath();
	String sourceSystem = (String)request.getAttribute("sourceSystem");
	String ccouserid    = (String)request.getAttribute("ccouserid");
	String context      = (String)request.getAttribute("context");
	String searchFor    = (String)request.getAttribute("searchFor");
	System.out.println("appContext................."+appContext);
	System.out.println("sourceSystem..............."+ sourceSystem);
	System.out.println("ccouserid................."+ccouserid);
	System.out.println("context................."+context);
	System.out.println("searchFor................."+searchFor);
	
%>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='AdvanceSearch.title'/></title>
		
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

		<!--  Commented for Defect 7774 - Combining All common JS scripts 
		<script type="text/javascript" src="js/datapersistence.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jsonrpc.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		-->
		
		<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>

		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
				
		<script language="javascript">
		        function switchAdvSearch(dd,callingApp) {
		            
		            var appName = callingApp.value;
	            	if(appName == null)
		            	var selectedValue = dd.options[dd.selectedIndex].value;
		            else
		            	var selectedValue = appName;
		            //alert("selectedValue --> "+selectedValue);
	            	
	            	if (selectedValue != "") {
	            	/*
	                //alert("Selected Value is : " + selectedValue);
	                var hiddenObjStr = "hidden" + selectedValue;
	                //alert("Hidden str Value is : " + hiddenObjStr);
	                hiddenObj = document.getElementById(hiddenObjStr);
	                //alert("Selected object is : " + hiddenObj.name);
                    var urlString = hiddenObj.value;
                    //alert("Selected URL is : " + urlString);
					*/
                    iframeObj = document.getElementById("advancedSearchportlet");
                    if (iframeObj != null && iframeObj != "") {
                    	//iframeObj.src = "crosstrack/crosstrackAdvancedSearch.jsp"
                    	iframeObj.height=950;
                    	iframeObj.width=1125;
                    //	step2portlet.style.height = "100%";
                    //	step2portlet.style.width = "100%";
                    	//iframeObj.src = urlString;
                    	iframeObj.src = selectedValue;
                    
                    }
                } else {
                    iframeObj = document.getElementById("advancedSearchportlet");
                    if (iframeObj != null && iframeObj != "") {
                    	//iframeObj.src = "crosstrack/crosstrackAdvancedSearch.jsp"
                    	iframeObj.height="0%";
                    	iframeObj.width="0%";
                    	//step2portlet.style.height = "0%";
                    	//step2portlet.style.width = "0%";
                    	iframeObj.src = "";
                    }
                }
            }
	function jsonLoad(appctx){
		jsonurl = "/JSON-RPC";
		jsonrpc = null;
	    try {
	      jsonrpc = new JSONRpcClient(appctx+jsonurl);
	    } 
	    catch(e) {
	      if(e.message) alert(e.message);
	      else alert(e);
	    }
	}
	function updateAdvSearchLOV() {
	 
		appctx='<%=appContext%>';
		sourceSystem='<%=sourceSystem%>';
		ccouserid='<%=ccouserid%>';
		context='<%=context%>';
		searchFor='<%=searchFor%>';
		
	 	var searchForObj = document.getElementById('searchFor');    
		searchForObj.options.length=0;        
		searchForObj.options[0]= new Option('Select One','');
		count = 1;
		jsonLoad(appctx);
	 	functionNameURL = jsonrpc.handler.getFunctionNameURL(sourceSystem,ccouserid,context,appctx);
	 	//alert('functions size is ' + functionNameURL["list"].length);
	 	if (functionNameURL != null) {
		 	if(functionNameURL != null || functionNameURL["list"] != null) {
		 		for (i=0; i<functionNameURL["list"].length; i=i+2) {
		 			funcName = functionNameURL["list"][i];
		 			funcURL = functionNameURL["list"][i+1];
		 			//alert('function name is ' + funcName);
		 			//alert('function url is ' + funcURL);
		 			searchForObj.options[count]= new Option(funcName,funcURL);
		 			if (funcName == searchFor)
		 				searchForObj.options[count].selected = "selected";
		 			count++;
		 			subFunctionNames = jsonrpc.handler.getSubFunctionNames(sourceSystem,ccouserid,funcName);
		 			//alert('subFunctionNames are ' + subFunctionNames["list"]);
		 			if(subFunctionNames != null || subFunctionNames["list"] != null) {
			 			for (j=0; j<subFunctionNames["list"].length; j=j+1) {
			 				subFuncName = subFunctionNames["list"][j];
			 				subFuncURL = funcURL + "&savedSetName=" + subFuncName;
			 				//alert('sub function name is ' + subFuncName);
			 				//alert('sub function url is ' + subFuncURL);
			 				searchForObj.options[count]= new Option("          "+subFuncName, subFuncURL);
			 				count++;
			 			} 
			 		}
		 		}
		 	}
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

	<body marginheight="0" marginwidth="0" onload="switchAdvSearch('',<%=request.getAttribute("searchFor")%>)">
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
		<!-- screen title -->
		<h1><fmt:message key='AdvanceSearch.title'/></h1>
		<!-- APPLICATION WORK SPACE AREA -->
		<div id="application_area">
		<!-- container for all modules -->
		<div id="moduleContainerId"><br>
		<!-- *********************** APPLICATION MODULES START ********************** -->
		<form name ="advSearchForm" id="import_export" class="inline" action="#" method="get" name="import_export">
		<!--  for local testing, uncomment following line -->
		<!-- input type = "button" name="button" value="Go" onclick="javascript:updateAdvSearchLOV(); return false;"/ -->

		<!-- module header -->
		<div id="mod_1" class="mod_header">
			<!-- module header title -->
			<h2 class="mh_title"><fmt:message key='AdvanceSearch.searchFor'/></h2>
		</div>
		
			<!-- colasp/expand block -->
			<div id="mod_1block" class="moduleDisplayBlock">
				<!-- marque block -->
				<div id="marque_1" class="marque">
				<!-- START SUB MODULE BLOCKS **************** -->
					<table  class="vert_pad" border="0" cellspacing="5" cellpadding="0">
						<colgroup>
							<col width="80" />
						</colgroup>
						<tbody>
							<tr>
								<td align="right" valign="top"><label for="searchFor"><fmt:message key='AdvanceSearch.searchFor'/></label></td>
								<td>									
									<%  
										Object savedSetNamesObj = request.getAttribute("savedSetNames");      
										if(savedSetNamesObj != null)  { 				           		
											java.util.HashMap savedSetNames = (java.util.HashMap)savedSetNamesObj;
										   	java.util.Set s;
	            							s = savedSetNames.keySet();
	            							Object[] keys = s.toArray(); 
	            							List valuesList;
            				         %>
            				         
									<select name="searchFor" id="searchFor" class="inputTextXLarge" size="1" onChange="switchAdvSearch(this,'')" > <!-- alert(options[selectedIndex].value); -->
									<option value="" selected="selected"><fmt:message key='Common.selectOne'/></option>
									
									<%            							
		            					for (int i=0; i<keys.length; i++) {
            				           		PortletDTO portDTO = (PortletDTO) keys[i];
            				           		if (portDTO != null) {
            				           		if((portDTO.getFunctionDesc()).equals(searchFor)){            				           		
            						%>
										<option value="<%=portDTO.getUrl() %>" id="<%=portDTO.getFunctionDesc() %>" selected="selected" ><%=portDTO.getFunctionName() %></option>
										
									<% }else{	%>
            				         
            				         <option value="<%=portDTO.getUrl()%>" id="<%=portDTO.getFunctionDesc() %>" ><%=portDTO.getFunctionName() %></option>
            				         
            						<%
		            						}
		            						valuesList = (List) savedSetNames.get(keys[i]);
							            	for (int j=0; j<valuesList.size(); j++) {
							            	String childURL = portDTO.getUrl() + "&savedSetName=" + valuesList.get(j);
							            	System.out.println("Child URL is : " + childURL);							            	
									%>
										<option value="<%=childURL%>" id="<%=valuesList.get(j) %>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=valuesList.get(j) %></option>
									<%
           								}
            						  }
            						}	
            						%>
            						</select>
            						<%	
            						}else{								
									%>
									<select name="searchFor" id="searchFor" class="inputTextXLarge" size="1"> 
									<option value="" selected="selected"><fmt:message key='Common.selectOne'/></option>
									<%}%>
									</select>
									<br><font color="red">
									<%Object errmsgobj = request.getAttribute("CTERREXMSG");
							           if (errmsgobj != null){
							        	   String errStr = (String)errmsgobj;
							        	   out.println(errStr);
							           }
							         %>
							         </font>
								</td>
							</tr>
						</tbody>
					</table>


				</div><!-- module display container -->

			</div><!-- module container -->

		</form>

		</div>
		<br clear="all" />
		<!-- END SUB MODULE BLOCKS ****************** -->
		<!-- *********************** APPLICATION MODULES END ************************ -->
		<br clear="all" />
		<!-- div id="step2portlet" style="height:300px; background:red; overflow:auto" -->
		<div id="step2portlet">
			<IFRAME id="advancedSearchportlet" width="0%" height="0%" scrolling="no" src="" frameborder="0">
			</IFRAME>
			
		</div>
	
		</div><!-- app area -->
	</body>

</html>





