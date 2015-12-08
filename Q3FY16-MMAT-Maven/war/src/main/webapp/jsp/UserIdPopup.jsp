<%@ include file="localeInfo.jsp" %>
<head>
<!-- Commented for Defect 7774 - Combining All common JS scripts		
<script type="text/javascript" src="js/datapersistence.js"></script>
-->
<script type="text/javascript" src="js/popupAlerts.js"></script>
<script>
  var userIdObjs = new Array();

        //alert('Page loaded.. Just created a new array : '+objs.length);

        function refreshUserIdArray(v)

        {

          // alert('inside refreshArray for '+v);

           userIdObjs = modifyContent(userIdObjs, v);

           //printVal(objs);

        }
		// Rajesh: Updated to set the selected userid in retainUserId

		function refreshRadioArray(v)

         {
         
        	for(var b=0;b<userIdObjs.length;b++)

		      {
		           userIdObjs.splice(b,1);
     	      }

		            userIdObjs = modifyRadioContent(userIdObjs, v);
		           // alert('---------'+userIdObjs);
			   retainUserId(userIdObjs);
         }
         
         		
function makeUserIdJSONStr(obj,v1,v2)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ '" }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}

function adjustUserIdArray(){
   
   var customersList = document.FormName.selectLineItem;

   for(j=0;j<customersList.length;j++)
   {

 		if (customersList[j].checked == true)
 		{ 			
 			userIdObjs = addVal(userIdObjs,customersList[j].value);
 		}
 		else
 		{
 			userIdObjs = deleteVal(userIdObjs,customersList[j].value);
 		}

   }
}
         function transferDataToMain()

        {
			var userAlerts = new UserAlerts();
           if(userIdObjs.length==0)

           {

              //alert('Please select atleast once userid to continue');
              alert(userAlerts.selectUserId);

              return false;

           }

//           transferData(objs);

			var jsonstr = makeUserIdJSONStr(userIdObjs,'USerIdSelector', 'userId');

			//alert('json string :' + jsonstr); 

			self.creator.setUserIdFromPicker();
			self.creator.xtrackuseridselector(jsonstr);			
			self.close(); 


        }
        
        
</script>
</head>
<%
	String parentElement = (String) request.getAttribute("parentElement");
	String ccouser = (String) request.getAttribute("ccouser");
	String context = (String) request.getAttribute("context");
	String sourcesystem = (String) request.getAttribute("sourcesystem");
	String typeOfUsr = (String) request.getAttribute("userType");
	String selType = (String) request.getAttribute("selectionType");
	String sortid = (String) request.getAttribute("sortId");
	if(sortid == null){
		sortid = "userName";
	}

	//Testing
	//session.setAttribute("USER_TYPE", "External");
	//session.setAttribute("USER_TYPE", "Intenal");

%>


<input type="hidden" name="ccouser" id="ccouser" value="<%= ccouser %>" />
<input type="hidden" name="context" id="context" value="<%= context %>" />
<input type="hidden" name="sourcesystem" id="sourcesystem" value="<%= sourcesystem %>" />
<input type="hidden" name="userType" id="userType" value="<%= typeOfUsr %>" />
<input type="hidden" name="selectionType" id="selectionType" value="<%= selType %>" />
<input type="hidden" name="sortId" id=sortId value="<%= sortid %>" />


<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<title><fmt:message key='UserSelector.popWindow'/></title>
		<script language="JavaScript" src="js/main_lib.js" type="text/javascript"></script>

<%
	String combinedScriptLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedscriptsurl");
	String combinedImagesLocation = request.getScheme() + "://" + request.getServerName() + session.getAttribute("combinedimagesurl");
	
	//System.out.println("combinedScriptLocation in Header.jsp : "+combinedScriptLocation);
	//System.out.println("combinedImagesLocation in Header.jsp : "+combinedImagesLocation);
%>		
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/combinedscripts.js" type="text/javascript"></script>


		<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/pop_styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/print_styles.css" type="text/css" media="print" />
	
	<!--  Commented for Defect 7774 - Combining All common JS scrip		
		<script language="JavaScript" src="js/compjs/calendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="js/crosstrackselectors.js" type="text/javascript"></script>
	-->		
	
</head>
	<!--
	
	Pop windows are in three sizes. These are the WIDTH dimensions of the window it's self. The actual area is about 5px smaller.
	SMALL = 410px (width)
	MED = 620px   (width)
	LARGE = 997px (width)

	-->

	<!-- top banner -->

		<body marginheight="0" marginwidth="0">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<tbody>
				<tr>
					<td align="center" valign="top">
						<img src="<%=combinedImagesLocation%>resources/i/logo.gif" alt="Cisco Systems, Inc.(R)" height="73" width="110" border="0" hspace="10" />
					</td>
					<td bgcolor="#ffffff" valign="top" width="100%">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100">
										<img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="100" border="0" />
									</td>
									<td valign="top" nowrap="nowrap" bgcolor="#336666" width="100%">
										<img src="<%=combinedImagesLocation%>resources/i/s.gif" alt="" height="8" width="1" border="0" />
									</td>
								</tr>
								<tr>
									<td valign="top" nowrap="nowrap" width="100">
										<a class="cisco" href="javascript:self.close();"><fmt:message key='UserSelector.closeWindow'/></a>
									</td>
									<td align="left" valign="top" width="100%" background="<%=combinedImagesLocation%>resources/i/grn_vertlines_top.gif">
										<img src="<%=combinedImagesLocation%>resources/i/whitemask11_botleft.gif" alt="" border="0" hspace="0" vspace="0" />
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- screen title -->
		<!-- 
		<h1>User Lookup</h1>
		-->
		<h1>
			<fmt:message key='UserSelector.userIdSelector'/>
		</h1>
		<!-- modules start -->
		<div id="mod_1" class="mod_pop">
			<div class="marque_grid" style="width:100%">
				<div id="searchFilters" class="sub_block_hr">
					<!-- 
						<h3>User Lookup</h3>
					-->
					<h3>
						<fmt:message key='UserSelector.searchFilters'/>
					</h3>
					<!-- Debug 
					<input type="button" value="Show Selected user" onClick="javascript:printUser();"/>		
					-->
					<table class="vert_pad" border="0" cellspacing="0" cellpadding="0" width="100%">
						<colgroup>
							<col width="160" />
						</colgroup>
						<tbody>
							<form name = "userChildForm" id = "userChildForm" action="javascript:searchUsers('tablediv');">
								<!-- 
								When its of type external user.
							-->
								<c:choose>
									<c:when test="${userType != null && userType eq 'PROXY'}">
										<tr>
											<td align="right"> &nbsp;
											</td>
										</tr>
										<tr>
											<td align="right">
												<font color="#9c0000">* </font>
												<select name="userIdNameSelection" id="userIdNameSelection" size="1" class="inputTextMedium">
													<option value='1'>User ID</option>
													<option value='2' selected>User Name</option>
												</select>
											</td>
											<td align="left">
												<input type="text" name="userIdSearchStr" id="userIdSearchStr" class="inputTextLarge" size="20" />
											</td>
										</tr>
										<tr>
											<td align="right">
												<label for="lookup">
													<font color="#9c0000">* </font><fmt:message key='UserSelector.companyName'/>
												</label>
											</td>
											<td>
												<input type="text" name="compNameSearchStr" id="compNameSearchStr" class="inputTextLarge" />
											</td>
										</tr>
										<tr>
										<td align="right"> &nbsp;
										</td>
											<td align="right">
												<a href="javascript:document.getElementById('userChildForm').reset();" class="inline_button level6indent">
												<fmt:message key='UserSelector.clearAllFilters'/>
												<img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="<fmt:message key='UserSelector.clearAllFilters'/>" align="absmiddle" height="13" width = "13" border="0" name="clearFields3" id="clearFields"/>
												</a>
												<br class="clear_all">
											</td>
											<td align="right">
												<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td class="button_left"></td>
														<th valign="top" nowrap height="100%" align="left">
															<input id="searchUser" class="button" type="submit" name="searchUser" value="<fmt:message key='UserSelector.searchUsers'/>"  />
														</th>
														<td class="button_right"></td>
													</tr>
												</table>
											</td>
										</tr>

									</c:when>
									<c:otherwise>

										<tr>
											<td align="right">
												<label for="lookup">
													<font color="#9c0000">* </font><fmt:message key='UserSelector.cCOUserId_Name'/>												</label>
											</td>
											<td align="Left">
												<input type="text" name="userIdSearchStr" id="userIdSearchStr" class="inputTextLarge" size="20" />
											</td>
										</tr>
										<tr>
											<td align="right"> &nbsp;
											</td>
											<td align="right">
												<a href="javascript:document.getElementById('userChildForm').reset();" class="inline_button level6indent"><fmt:message key='UserSelector.clearAllFilters'/>
												<img src="images/global/buttons_and_icons/icons/icn_action.gif" alt="Clear All Filters" align="absmiddle" border="0" name="clearAllFilters" id="clearAllFilters" /></a>
											</td>
											<td align="Left">
												<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td class="button_left" ></td>
														<th valign="top" nowrap height="100%" align="left">
															<input id="searchUser" class="button" type="submit" name="searchUser" value="<fmt:message key='UserSelector.searchUsers'/>"  />
														</th>
														<td class="button_right"></td>
													</tr>
												</table>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
								<!-- Go button changed to  -->

							</form>
						</tbody>
					</table>
					<!-- When its of type external user -->
					<c:choose>
						<c:when test="${userType != null && userType eq 'PROXY'}">
							<table>
								<tr>
									<td align="right"> &nbsp;
									</td>
								</tr>
								<tr>
									<td style="padding:0">
										<font color="#9c0000">
										<fmt:message key='UserSelector.mandatory'/>
										</font>
									</td>
								</tr>
							</table>
							<table>
								<tr>
									<td style="padding:0">
										<font color="#9c0000">
										<fmt:message key='UserSelector.userNameNote'/>
										</font>
									</td>
								</tr>
							</table>
						</c:when>
					</c:choose>
				</div>
				<form id="FormName" action="#" method="get" name="FormName" class="inline">

					<div id="tablediv">

						<div class="table_mod_header">
							<table border="0" cellspacing="0" cellpadding="0" width="100%">
								<tr valign="middle">
									<td align="left" valign="middle">
										<h2 style="color: #ffffff; font-size: 11px; font-weight: bold; white-space: nowrap; padding: 0; float: left;">
											<fmt:message key='UserSelector.users'/> 
										</h2>
									</td>
								</tr>
							</table>
						</div>



						<!-- grid column header -->
						<div class="mod_head">
							<table width="100%" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="6%" />
									<c:choose>
										<c:when test="${userType != null && userType eq 'PROXY'}">
											<col width="30%" />
											<col width="30%" />
											<col width="34%" />
										</c:when>
										<c:otherwise>										
											<col width="35%" />
											<col width="59%" />
										</c:otherwise>
									</c:choose>
								</colgroup>


								<thead>
									<tr>
										<c:choose>
											<c:when test="${selectionType != null && selectionType eq 'MULTIPLE' }">
											<th align="left">
												<input type="checkbox" name="selectLineItem" value="selectAll" class="checkbox topGroup"
															onclick="toggleCheckboxesInGroup(this,this.form,'topGroup');adjustUserIdArray();">
											</th>
											</c:when>
											<c:otherwise>
												<th align="left"></th>
											</c:otherwise>
										</c:choose>
										<th align="left">
											<a href="#"><fmt:message key='UserSelector.userId'/></a>
										</th>
										<th class="active sort_d_1" align="left">
											<a href="#"><fmt:message key='UserSelector.name'/></a>
										</th>
										<c:choose>
											<c:when test="${userType != null && userType eq 'PROXY'}">
												<th align="left">
													<a href="#"><fmt:message key='UserSelector.companyName'/></a>
												</th>
											</c:when>
										</c:choose>
									</tr>
								</thead>
							</table>
						</div>

						<!-- grid body -->
						<div class="mod_grid_sm" id="dataGrid">

						</div>
						<!-- body grid end -->
					</div>

				</form>

				<div class="sub_block display_false" id="tab2_content" style="height:172px">
					<br />
				</div>
			</div>

			<div style="width:100%">
				<!-- buttons start -->
				<div id="button_1" class="button_block_sm">
					<!-- button component -->
					<table class="primary_enabled" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class="button_left" onclick="document.getElementById('selectUser').click();"></td>
							<td>
<input id="selectUser" class="button" type="button" name="selectUser" value="<fmt:message key='UserSelector.selectUsers'/>" onClick="javascript:transferUserIdToParent();" />
							</td>
							<td class="button_right" onclick="document.getElementById('selectUser').click();"></td>
						</tr>
					</table>
					<!-- button component -->
					<table class="secondary_enabled" border="0" cellspacing="0" cellpadding="0" onclick="javascript:self.close();">
						<tr>
							<td class="button_left" onclick="document.getElementById('cancel').click();"></td>
							<td>
								<input id="cancel" class="button" type="reset" name="cancel" value="<fmt:message key='UserSelector.cancel'/>" />
							</td>
							<td class="button_right" onclick="document.getElementById('cancel').click();"></td>
						</tr>	
					</table>
				</div>
			</div>


		</div>

		<!-- modules end -->
		<!-- *********************** APPLICATION COMPONENT HTML START *************** -->
		<div id="vvvvcalDiv"></div>

		<!-- *********************** APPLICATION COMPONENT HTML END ***************** -->
		<!-- *********************** APPLICATION COMPONENT SCRIPTS START ************ -->

		<!-- *********************** APPLICATION COMPONENT SCRIPTS END ************ -->
	</body>

</html>
