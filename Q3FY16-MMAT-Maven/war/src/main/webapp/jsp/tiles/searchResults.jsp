<%@ page import="com.cisco.mcm.genJava.XxcssMatStcMigType" %> 
<%@ page import="com.cisco.servicesales.session.UserSession" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.util.List" %> 

<%@ page contentType="application/vnd.ms-excel"%>.

<%response.setContentType("application/vnd.ms-excel;charset=windows-1251");%>
<%response.setHeader("Content-Disposition", "attachment; filename=searchResults.xls" );%>

<html>
<head></head>
<body>

<TABLE  align="center" border="0" cellspacing="0" cellpadding="0" id="detailsTable">
<TR valign="top" align="left" bgcolor="#A1A1A1" height="6">
<TD nowrap width="<%=(100/12)%>%" ><b>Source Contract Number</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>Contract Number</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>Contract Status</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>CI Migration Completed?</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>Customer Name</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>Old Customer Id</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>New Customer Id</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>Old Business Entity</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>New Business Entity</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>Old Bill To Site Id</b></TD>
	<TD nowrap width="<%=(100/12)%>%" ><b>New Bill To Site </b></TD>
	<TD nowrap align="center" width="<%=(100/12)%>%"><b>Bill To Address</b>
	<TABLE align="center" border="0" cellspacing="0" cellpadding="0">
	<TR valign="top" align="left" bgcolor="#A1A1A1">
		<TD nowrap width="175" align="center" width="<%=(100/12)%>%" ><b>Address</b> </TD>
		<TD nowrap width="175" align="center" width="<%=(100/12)%>%" ><b>State</b></TD>
		<TD nowrap width="175" align="center" width="<%=(100/12)%>%" ><b>Country</b></TD>
		
	</TR>

	</TABLE>
	
</TD>
<TD nowrap width="<%=(100/12)%>%" ><b>Contract Migration Type</b></TD>
</TR>
<%  List resultList = null;
	if(session.getAttribute("searchResults")!=null){
		resultList = (List)session.getAttribute("searchResults");
	}
	
	if(resultList!= null && resultList.size() > 0){
	for(int i=0;i<resultList.size();i++){
		System.out.println("This is the Record Count :::\t"+i);
	XxcssMatStcMigType migrationRecType = (XxcssMatStcMigType)resultList.get(i);
	%>
<TR>
<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
<% if(migrationRecType.getSourceContractNumber()!=null)
out.print(migrationRecType.getSourceContractNumber());
 %>
</TD>
	
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getContractNumber()!=null)
out.print(migrationRecType.getContractNumber());
System.out.println("In JSP"+migrationRecType.getContractNumber());
 %>
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getContractStatus()!=null)
    {
    out.print(migrationRecType.getContractStatus());
    System.out.println("It says Not equals null");
    System.out.println("In JSP"+migrationRecType.getContractStatus());
   
	}
	%>
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getStcMigCompleted()!=null) 
	    { 
	    out.print(migrationRecType.getStcMigCompleted());
	 System.out.println("In JSP says not null "+migrationRecType.getStcMigCompleted());
	 }
	%>
    </TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getCustomerName()!=null)
   out.print(migrationRecType.getCustomerName());
    System.out.println("In JSP"+migrationRecType.getCustomerName());
    %>
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
		<% if(migrationRecType.getOldCustomerId()!=null)
     out.print(migrationRecType.getOldCustomerId());
      System.out.println("In JSP"+migrationRecType.getOldCustomerId());
   
   %>
     
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getNewCustomerId()!=null)
     out.print(migrationRecType.getNewCustomerId());
     System.out.println("In JSP"+migrationRecType.getNewCustomerId());
    
     %>
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getOldBusinessEntity()!=null) 
      out.print(migrationRecType.getOldBusinessEntity());
      System.out.println("In JSP"+migrationRecType.getOldBusinessEntity());
     
	%>
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getNewBusinessEntity()!=null) 
     out.print(migrationRecType.getNewBusinessEntity());
	 System.out.println("In JSP"+migrationRecType.getNewBusinessEntity());
     %>
    </TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	<% if(migrationRecType.getOldBillToSiteId()!=null)
     out.print(migrationRecType.getOldBillToSiteId());
     System.out.println("In JSP"+migrationRecType.getOldBillToSiteId());
     %>
    </TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
	 <% if(migrationRecType.getNewBillToSiteId()!=null)
      out.print(migrationRecType.getNewBillToSiteId());
	System.out.println("In JSP"+migrationRecType.getNewBillToSiteId());
	%>
	</TD>
	<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">  
		<TABLE align="center" border="0" cellspacing="0" cellpadding="0" width="100%" id="subtable">
			<TR>
				<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
				 <% if(migrationRecType.getBillToAddress()!=null)
            out.print(migrationRecType.getBillToAddress());
            System.out.println("In JSP"+migrationRecType.getBillToAddress());
		%>
				</TD>
				<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
				<% if(migrationRecType.getBillToCity()!=null)
           out.print(migrationRecType.getBillToCity());
           System.out.println("In JSP"+migrationRecType.getBillToCity());
		%>
				</TD>
				<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
				<% if(migrationRecType.getBillToCountry()!=null)
            out.print(migrationRecType.getBillToCountry());
            System.out.println("In JSP"+migrationRecType.getBillToCountry());
		%>
				</TD>
				
			</TR>
		</TABLE>
</td>
<TD nowrap width="<%=(100/12)%>%" style="BORDER-LEFT: #d8d8d8 1px solid;">
<% if(migrationRecType.getContractMigrationType()!=null)
            out.print(migrationRecType.getContractMigrationType());
    %> 
            </TD>
	
</tr>
<% }
	}%>
</table>
</body>
</html>
