<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<%@ taglib uri="/tags/jstl-c" prefix="c"%> 
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="com.cisco.servicesales.list.EnhancedList" %> 
<%@ page import="com.cisco.servicesales.list.engine.Column" %> 
<%@ page import="com.cisco.mcm.genJava.XxcssMatStcMigType" %> 
<%@ page import="com.cisco.mcm.bo.McmStatusDetailContext" %> 
<%@ page import="com.cisco.servicesales.list.Paginator" %> 
<%@ page import="com.cisco.servicesales.session.UserSession" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.util.List" %> 

<script language="JavaScript" src="<%=request.getContextPath()%>/js/contract_mgr.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/combinedscripts.js" type="text/javascript"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <style type="text/css">    
	.divScroll-1 {     height:200px;     width:1215px;     overflow:scroll;     }  
	.divScroll-2 {     height:100px;     width:200px;     overflow:scroll;     white-space:nowrap;     }          
	.divScroll-3 {     height:100px;     width:200px;     overflow:scroll;     white-space:nowrap;     }          
	.divScrollAuto {     height:100px;     width:200px;     overflow:auto;     white-space:nowrap;     }          
	.divScrollHidden {     height:100px;     width:200px;     overflow:hidden;     white-space:nowrap;     }     
</style>
  
   
    <title><bean:message key="STC.TITLE"/></title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

	<STYLE type=text/css>
	THEAD TR {
		POSITION: relative; ; TOP: expression(offsetParent.scrollTop)
	}
	</STYLE>
	<script language=javascript> 
var numb = '0123456789';
var lwr = 'abcdefghijklmnopqrstuvwxyz';
var upr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
var space = '" "';
function exportToExcel() 
{ 
	window.open("./jsp/tiles/searchResults.jsp");

}

function searchData(){
	var customerName = document.SearchMigratedContractsForm.customerName.value;
	var contractNumber = document.SearchMigratedContractsForm.contractNumber.value;
	var billToId = document.SearchMigratedContractsForm.billToId.value;
	//var migrationCompleted = document.SearchMigratedContractsForm.migrationCompleted.options[document.SearchMigratedContractsForm.migrationCompleted.selectedIndex].value;
	//alert('migrationCompleted'+migrationCompleted);

	
	
	if(customerName ==''&& contractNumber == ''&& billToId ==''){
	alert('Please enter the mandatory values')

	}else{

	if(contractNumber!=''&& !isNumber(contractNumber)){
		alert('Please Enter A Valid Contract Number');
	}else if(billToId!=''&& !isNumber(billToId)){
			alert('Please Enter a Bill To ID');
		} else if(customerName!=''&& !isAlphanum(customerName))
		{
				alert('Please Enter A Valid Customer Name');
		}else{

            
			var url = "<%=request.getContextPath()%>/searchContracts.do?"+"search=1";	
			document.SearchMigratedContractsForm.action= url;
			document.SearchMigratedContractsForm.submit();
	}
	}
}
function isValid(parm,val) {
	if (parm == "") return true;
		for (i=0; i<parm.length; i++) {
			if (val.indexOf(parm.charAt(i),0) == -1) 
				return false;
		}
	return true;
}
function isNumber(parm) {
	return isValid(parm,numb);
	}
function isAlphanum(parm) {
	return isValid(parm,lwr+upr+numb+space);
} 


function LTrim(str) {
for (var i=0; ((str.charAt(i)<=" ")&&(str.charAt(i)!="")); i++);
return str.substring(i,str.length);
}
function RTrim(str) {
for (var i=str.length-1; ((str.charAt(i)<=" ")&&(str.charAt(i)!="")); i--);
return str.substring(0,i+1);
}

function Trim(str) {
return LTrim(RTrim(str));
}

</script> 
<link rel="stylesheet" href="css/main_styles.css" type="text/css" media="screen" />

  </head>


<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0" onload="">
<div id="application_area">

<table height="16"><tr><td></td></tr></table>

	<div id="mod_1" class="mod_header" style="width:99%">
			<h2 class="mh_title" style="margin-left:15px;">
					Search & View CI Impacted Contracts
			</h2>	
	 </div>

<form  action='searchContracts.do' name="SearchMigratedContractsForm" id="SearchMigratedContractsForm"  method="post" enctype="multipart/form-data">
	

 <table align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" width="100%">
     <tr><td height="10"></td></tr>
     <tr><TD class=contentbold colspan="2" align="center"><font size="2" color="red">
						</font>
                            </TD></tr>
     
        <tr>
           <td width="5"></td>
            <td >


<div id="body" align="center" bgcolor="white" width="80%" border="1">
			<TABLE>
			<TR>
			
				<TD><!-- <bean:message key="STC.MAIN.CONTRACTNUMBER"/> -->
				<label> <bean:message key="STC.MAIN.CONTRACTNUMBER"/> </label>
				</TD>
				<% if(session.getAttribute("contractNum")!=null){
				String contNum = (String)session.getAttribute("contractNum");
				%>
					<TD><input type="text" name="contractNumber" value = "<%= contNum %>"/></TD>
					<%}else	{%>	
					<TD><input type="text" name="contractNumber"/></TD>
					<%}%>
				<TD><span style="color:red">*</span></TD>
			</TR>
			
			<TR>
				<TD><label><bean:message key="STC.MAIN.CUSTOMERNAME"/></label> </TD>
				
				<% if(session.getAttribute("custName")!=null){ 
						String customer = (String)session.getAttribute("custName");
				%>
				<TD><input type="text" name="customerName" value="<%= customer %>"/></TD>
				<%}else{%>
				<TD><input type="text" name="customerName"/></td>
				<%}%>
				<TD><span style="color:red">*</span></TD>
			</TR>
			<TR>
				<TD><label><bean:message key="STC.MAIN.BILLTOID"/></label></TD>
				<% if(session.getAttribute("billTo")!=null){
						String billtoes = (String)session.getAttribute("billTo");
				%>
				<TD><input type="text" name="billToId" value="<%= billtoes %>"/></TD>
				<% }else{%>
				<TD><input type="text" name="billToId"/></TD>
				<%}%>
				<TD><span style="color:red">*</span></TD>
			</TR>
			<TR>
				<TD><label><bean:message key="STC.MAIN.MIGRATIONSTATUS"/></label></TD>
				<TD><select name="migrationStatus">
				<% if(session.getAttribute("migratStatus")!=null && (((String)session.getAttribute("migratStatus")).equalsIgnoreCase("ALL"))){
				%>
				<option value ="ALL" selected>ALL</option>equalsIgnoreCase
				<%
				 }else{%>
				
				 <option value ="ALL">ALL</option>
				 <%}%>
				<% if(session.getAttribute("migratStatus")!=null && (((String)session.getAttribute("migratStatus")).equalsIgnoreCase("Y"))){
				%>
				<option value ="Y" selected>YES</option>
				<%
				 }else{
				%>
				<option value ="Y">YES</option>
				<% }%>
				<%if(session.getAttribute("migratStatus")!=null && (((String)session.getAttribute("migratStatus")).equalsIgnoreCase("N"))){
				%>
				<option value ="N" selected>No</option>
				<%
				 }else{
				%>
				<option value ="N">No</option>
				<% }%>
				</TD>
			</TR>
			<TR height="5">
				<TD></TD>
				<TD></TD>
				<TD></TD>
			</TR>
				<TR height="5">
				<TD></TD>
				<TD></TD>
				<TD></TD>
			</TR>
			<TR height="5">
				<TD><span style="color:red">* Indicates Either of them is a Mandatory Field</span></TD>
				<TD></TD>
				<TD></TD>
			</TR>
		
			<TR>
				<TD><input type="button" value="Search" onclick="searchData();"/></TD>
				<% List resultList1 = null;
					if(session.getAttribute("searchResults")!=null){
					resultList1 = (List)session.getAttribute("searchResults");
					}
					if(resultList1!= null && resultList1.size() > 0){
					%>
				
				<TD><input type="button" class="button" value="Export To Excel" onclick="exportToExcel();"/></TD>
				<% } else {%>
				<TD><input type="button" class="button" value="Export To Excel"  disabled /></TD>
				<% } %>
				<TD></TD>
			</TR>
			</TABLE>
	</div>
			</td>
		</tr>

<tr height="6" >
<td>
</td>
</tr>
   </table>

  <br>
<br>
<TABLE width="100%" border="0">
<TR>
	<TD></TD>
	<TD></TD>
	<TD></TD>

</TR>
<TR>
	<TD></TD>
	<TD align ="Center"><B><span style="color:red">Search Results <span></b></TD>
	<TD></TD>

</TR>

</TABLE>
<BR>


<% List resultList = null;
	if(session.getAttribute("searchResults")!=null){
		resultList = (List)session.getAttribute("searchResults");
	}
	if(resultList!= null && resultList.size() > 0){
%>
   <div id="content" align="justify" bgcolor="white" class="divScroll-1" width="100%" height="50">
<TABLE  align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" width="130%" scrolling="true" id="detailsTable">


<TR valign="top" align="left" bgcolor="#A1A1A1" height="6">

<!--start changes added by sarhv for CR split contracts Q2FY14 -->
<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Source Contract Number&nbsp;</b></TD>
<!--end changes added by sarhv for CR split contracts Q2FY14 -->
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Contract Number&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Contract Status&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>CI Migration Completed?&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Customer Name&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Old Customer Id&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>New Customer Id&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Old Business Entity&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>New Business Entity&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Old Bill To Id&nbsp;</b></TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>New Bill To Id&nbsp;</b></TD>
	<TD nowrap align="center" width="<%=((130/13)*3)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Bill To Address&nbsp;</b>
	<TABLE align="center" border="1" cellspacing="0" cellpadding="0" bgcolor="#ffffff" width="100%" scrolling="true">
	<TR valign="top" align="left" bgcolor="#A1A1A1" border="0">
		<TD nowrap align="center" width="130" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Address</b> </TD>
		<TD nowrap align="center" width="130" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>City</b></TD>
		<TD nowrap align="center" width="130" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Country</b></TD>
		
	</TR>
	</TABLE>
	</TD>
	<TD nowrap width="<%=(130/13)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;"><b>Contract Migration Type&nbsp;</b></TD>
</TR>

<%  for(int i=0;i<resultList.size();i++){
	XxcssMatStcMigType migrationRecType = (XxcssMatStcMigType)resultList.get(i);
	
	if( i%2 ==0){ 
	%>
<TR bgcolor=#ffffff>
<% }else{%>
<tr bgcolor=#e7e7e7>
<% }%>
<!-- start changes by sarhv for CR split contracts Q2FY14 -->
<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
<% if(migrationRecType.getSourceContractNumber()!=null)
out.print(migrationRecType.getSourceContractNumber());
 %>


</TD>
<!-- end changes by sarhv for CR split contracts Q2FY14 -->
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getContractNumber()!=null)
out.print(migrationRecType.getContractNumber());
System.out.println("In JSP"+migrationRecType.getContractNumber());
 %>
	
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getContractStatus()!=null)
    {
    out.print(migrationRecType.getContractStatus());
    System.out.println("It says Not equals null");
    System.out.println("In JSP"+migrationRecType.getContractStatus());
   
	}
	%>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getStcMigCompleted()!=null) 
	    { 
	    out.print(migrationRecType.getStcMigCompleted());
	 System.out.println("In JSP says not null "+migrationRecType.getStcMigCompleted());
	 }
	%>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getCustomerName()!=null)
   out.print(migrationRecType.getCustomerName());
    System.out.println("In JSP"+migrationRecType.getCustomerName());
    %>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getOldCustomerId()!=null)
     out.print(migrationRecType.getOldCustomerId());
      System.out.println("In JSP"+migrationRecType.getOldCustomerId());
   
   %>
     
</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getNewCustomerId()!=null)
     out.print(migrationRecType.getNewCustomerId());
     System.out.println("In JSP"+migrationRecType.getNewCustomerId());
    
     %>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getOldBusinessEntity()!=null) 
      out.print(migrationRecType.getOldBusinessEntity());
      System.out.println("In JSP"+migrationRecType.getOldBusinessEntity());
     
	%>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getNewBusinessEntity()!=null) 
     out.print(migrationRecType.getNewBusinessEntity());
	 System.out.println("In JSP"+migrationRecType.getNewBusinessEntity());
     %>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getOldBillToSiteId()!=null)
     out.print(migrationRecType.getOldBillToSiteId());
     System.out.println("In JSP"+migrationRecType.getOldBillToSiteId());
     %>
	
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	 <% if(migrationRecType.getNewBillToSiteId()!=null)
      out.print(migrationRecType.getNewBillToSiteId());
	System.out.println("In JSP"+migrationRecType.getNewBillToSiteId());
	%>
	</TD>
	<TD nowrap width="<%=((130/13)*3)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">  
	<TABLE align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff" width="100%" scrolling="true" id="subtable">
	<%if( i%2 ==0){ %>
	<TR bgcolor=#ffffff>
		<% }else{%>
	<tr bgcolor=#e7e7e7>
		<% }%>
		<TD nowrap width="130" style="BORDER-LEFT: #d8d8d8 1px solid;">
		 <% if(migrationRecType.getBillToAddress()!=null)
            out.print(migrationRecType.getBillToAddress());
            System.out.println("In JSP"+migrationRecType.getBillToAddress());
		%>
		</TD>
		<TD nowrap width="130" style="BORDER-LEFT: #d8d8d8 1px solid;">
		<% if(migrationRecType.getBillToCity()!=null)
           out.print(migrationRecType.getBillToCity());
           System.out.println("In JSP"+migrationRecType.getBillToCity());
		%>
		</TD>
		<TD nowrap width="130" style="BORDER-LEFT: #d8d8d8 1px solid;">
		<% if(migrationRecType.getBillToCountry()!=null)
            out.print(migrationRecType.getBillToCountry());
            System.out.println("In JSP"+migrationRecType.getBillToCountry());
		%>
		</TD>
		
	</TR>
	
	</Table>
	</TD>
	<TD nowrap style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getContractMigrationType()!=null)
            out.print(migrationRecType.getContractMigrationType());
    %>       
	</TD>
	
</TR>
<% }%>
</TABLE>
</div>

<%
}else if(session.getAttribute("NodataFound")!=null) { 
	String nodataValue = (String)session.getAttribute("NodataFound");
	if(nodataValue!=null&&nodataValue.equalsIgnoreCase("nodataFound")){	%>

	<table>
	<tr>
	<td>
<B><span style="color:red">No Data Found <span>

	</td>


	</tr>
</table>

<% }
} %>



</form>
</div>
  </body>
</html>
<% // Commenting as static analysis showed these variables are never used - C3T / Q3FY12 - Vijay
					//String custName = null;
					//String contractNum = null;
					//String billTo = null;
					//String migratStatus = null;
					//if(session.getAttribute("custName")!=null)
					  // custName = (String)session.getAttribute("custName");
					// if(session.getAttribute("contractNum")!=null)
					  //contractNum = (String)session.getAttribute("contractNum");
					//if(session.getAttribute("billTo")!=null)
					  //  billTo = (String)session.getAttribute("billTo");
					// if(session.getAttribute("migratStatus")!=null)
						//migratStatus=(String)session.getAttribute("migratStatus");
%>