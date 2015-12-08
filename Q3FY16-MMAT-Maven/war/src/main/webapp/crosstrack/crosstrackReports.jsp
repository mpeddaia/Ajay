<%@ page language = "java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cisco.crosstrack.data.dto.PortletDTO" %>
<%@ include file="localeInfo.jsp" %>


<script type="text/javascript">
            function switchReport(dd) {
            	var selectedValue = dd.options[dd.selectedIndex].value;
            	if (selectedValue != "") {
                //    alert("Selected Value is : " + selectedValue);
                    var hiddenObjStr = "hidden" + selectedValue;
                 //   alert("Hidden str Value is : " + hiddenObjStr);
                    hiddenObj = document.getElementById(hiddenObjStr);
                  //  alert("Selected object is : " + hiddenObj.name);
                    var urlString = hiddenObj.value;
                   // alert("Selected URL is : " + urlString);

                    iframeObj = document.getElementById("reportportlet");
                    if (iframeObj != null && iframeObj != "") {
                    	//iframeObj.src = "crosstrack/crosstrackReports.jsp"
                    	iframeObj.height=800;
                    	iframeObj.width="100%";
                    //	step2portlet.style.height = "100%";
                    //	step2portlet.style.width = "100%";
                    	iframeObj.src = urlString;
                    }
                } else {
                    iframeObj = document.getElementById("reportportlet");
                    if (iframeObj != null && iframeObj != "") {
                    	//iframeObj.src = "crosstrack/crosstrackReports.jsp"
                    	iframeObj.height="0%";
                    	iframeObj.width="0%";
                    	//step2portlet.style.height = "0%";
                    	//step2portlet.style.width = "0%";
                    	iframeObj.src = "";
                    }
                }
            }
</script>

<noscript>
<link rel="Stylesheet" href="http://www.cisco.com/swa/c/cdc.css" type="text/css">
<link rel="Stylesheet" href="http://www.cisco.com/swa/c/apps.css" type="text/css">
</noscript>


<!-- Common Header -->
<!-- END BOTTOM HEADER TEMPLATE -->

	<!-- Sitewide Tools -->
<script language="JavaScript"> //var tmp = new Array("print","email","glossary");precache_imgs( tmp );</script>

<!-- End App-Specific Header -->
<!-- END APPTITLE TEMPLATE -->
<!-- DO NOT TOUCH ABOVE ******************************************************************************** -->

		<!-- ********************* APPLICATION AREA START *********************************************** -->
		<!-- linked resources added by Tristream Start -->
		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>


		<!-- component linked resources -->
		<!-- Commented for Defect 7774 - Combining All common JS scripts 
		<script language="JavaScript" src="js/compjs/menu.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/xmlLoader.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/compjs/autocomplete.js" type="text/javascript"></script>
		-->
      	<script language="JavaScript" src="js/combinedscripts.js" type="text/javascript"></script>
		<link rel="stylesheet" href="css/menu_styles.css" type="text/css" media="screen" />

		<!-- linked resources added by Tristream End -->

		<!-- APPLICATION BANNER -->
		<!-- APPLICATION NAVAGATION -->
		<!-- APPLICATION WORK SPACE AREA -->
	
		<div id="application_area">
		<br clear="all" />
		<br clear="all" />			
		<!-- container for all modules -->
		<div id="moduleContainerId">
		<!-- *********************** APPLICATION MODULES START ********************** -->
		<!-- module header -->
		<div id="mod_1" class="mod_header">
			<!-- module header title -->
			<h2 class="mh_title"><fmt:message key='Reports.title'/></h2>
		</div>
		<form name ="reportsForm" id="import_export" class="inline" action="#" method="get" name="import_export">
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
								<td align="right"><label for="reportType"><fmt:message key='Reports.reportType'/></label></td>
								<td>
									<%
										List portletList = (List)request.getAttribute("portletlist");
										if (portletList != null && portletList.size() > 0) {
											for (int i=0; i < portletList.size(); i++) {
												PortletDTO portDTO = (PortletDTO)portletList.get(i);
												if (portDTO != null ) {
									%>
													<input type="hidden" name="<%=portDTO.getFunctionName() %>" id="hidden<%=portDTO.getFunctionName() %>" value="<%=portDTO.getUrl()%>" >
													<!-- input type="hidden" name="<!--%=portDTO.getPortlet() %>" id="hidden<!--%=portDTO.getPortlet() %>" value="http://wwwin.cisco.com" -->
									<%			
												}
											}
										}
									%>

									<select name="reportType" id="reportType" class="inputTextFile" size="1" onChange="switchReport(this)">
										<option value="" selected="selected"><fmt:message key='Common.selectOne'/></option>
									<%
										portletList = (List)request.getAttribute("portletlist");
										if (portletList != null && portletList.size() > 0) {
											for (int i=0; i < portletList.size(); i++) {
												PortletDTO portDTO = (PortletDTO)portletList.get(i);
												if (portDTO != null ) {
									%>
													<option value="<%=portDTO.getFunctionName() %>" id="<%=portDTO.getFunctionName() %>" ><%=portDTO.getFunctionDesc() %></option>
									<%			
												}
											}
										}
									%>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
					<%	
						String erMsg = (String)request.getAttribute("Report_error_message");
						if (erMsg == null) erMsg = "";
					%>
					<div id="errorResults">		
						<font color="red"><%=erMsg%></font>
					</div>


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
			<IFRAME id="reportportlet" width="0%" height="0%" scrolling="no" src="" frameborder="0">
			</IFRAME>
			
		</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
	
		</div><!-- app area -->
			
			
		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->


		<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->
		<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->
		<!-- script language="javascript" type="text/javascript">
		/** auto complete */
		var acmptObj = new cxAcmpt('acmptObj', 'search_text', 'http://www.pundreek.com/comp/ac/data.xml?',  0 , 2000, 10,178);
		acmptObj.initialize();

		</script -->
		<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************** -->

	<!-- ********************* APPLICATION AREA END *********************************************** -->




<!-- DO NOT TOUCH BELOW ******************************************************************************** -->
<!-- End Main Content Table Cells -->
<!-- BEGIN FOOTER TABLE -->

<!-- END FOOTER TABLE -->