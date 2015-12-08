<%@ page import="com.cisco.crosstrack.common.exception.CrosstrackException" %>

<%
//CrosstrackException exception = (CrosstrackException)request.getAttribute("crosstrackexception");
//String errorMessage= exception.getAdditionalMessage();
String errorMessage = (String) request.getAttribute("crosstrackexception");
%>
 	<div class="header_grey">
                                			<table  width="958"border="0" cellspacing="0" cellpadding="0">
                                				<tr>
                                					<td><h3>Bill To Addresses</h3></td>
                                					<td align="right">
                                						<!-- address book/search results tabs-->
                                                  		<div class="module_tabs" align="right">
                                                  			<table border="0" cellspacing="0" cellpadding="0">
                                                  				<tr>
                                                  					<td class="active">
                                                  					<a href="#" onclick="selectSubTab(this);changeButtonName('search');" id="tab1"><img src="images/global/tabs/ongrey/tab_left_first_selected.gif" alt="" align="absmiddle" border="0" /><span>Address Book</span><img src="images/global/tabs/ongrey/tab_right_selected.gif" alt="" align="absmiddle" border="0" /></a>
                                                  					</td>
                                                  					<td>
                                                  					<a href="#" onclick="selectSubTab(this);changeButtonName('address');" id="tab2"><img src="images/global/tabs/ongrey/tab_left_normal.gif" alt="" align="absmiddle" border="0" /><span>Search Results</span><img src="images/global/tabs/ongrey/tab_right_normal.gif" alt="" align="absmiddle" border="0" /></a>
                                                  					</td>
                                                  				</tr>
                                                  			</table>
                                                  		</div>
                                					</td>
                                				</tr>
                                			</table>
                                			</div>         
    
<!--Table Meta Data-->
<div class="mod_head">
                                                              <table width="940" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0">
                                                              <colgroup>
                                                              	<col width="3%" />
                                            										<col width="12%" />
                                            										<col width="11%" />
                                            										<col width="11%" />
                                            										<col width="11%" />
                                            										<col width="11%" />
                                            										<col width="11%" />
                                            										<col width="11%" />
                                            										<col width="11%" />
                                                              </colgroup>
                                                              <thead>
                                                              	<tr>
                                                              		<th class="first" align="center"></th>
                                                              		<th class="active sort_d_1" align="left"><a href="#">Bill To Name</a></th>
                                            											<th align="left"><a href="#">Country</a></th>		
                                            											<th align="left"><a href="#">Address 1</a></th>
                                            											<th align="left"><a href="#">Address 2</a></th>
                                            											<th align="left"><a href="#">Address 3</a></th>
                                            											<th align="left"><a href="#">City</a></th>
                                            											<th align="left"><a href="#">State</a></th>
                                            											<th align="left"><a href="#">Postal Code</a></th>
                                                              	</tr>
                                                              </thead>	
                                                              </table>
                                                              </div>
              <!-- grid body -->
                                

<!-- Table body -->
<div class="mod_grid_sm" id="dataGrid">

<table width="395" border="0" class="mod_grid_content" cellspacing="0" cellpadding="0">

<tbody>
	<tr>
		<td>
		<%=errorMessage%>
		</td>
    </tr>          
  
</tbody> 
</table>

</div> 