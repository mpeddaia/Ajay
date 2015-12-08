<%@ page language="java"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
  <head>
    <html:base />
    
    <title><bean:message key="MCM.TITLE"/></title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
  </head>
  
  <script language="javascript">
 /* function getObj(name) {
  if (document.getElementById)
      { return document.getElementById(name); }
  else if (document.all)
      { return document.all[name]; }
  else if (document.layers)
      { return document.layers[name]; } }
  */
  function downloadTemplate()
  {
  var selectedTemplate=document.McmUploadForm.selectTemplate.value
  if (""==selectedTemplate)
  {
  alert("Select the template to download");
  return false;
  }
  else
  {
  //needs to be changed later..

 	var filepath = "/MCM/images/contractmgmt/xlstemplates/MassMAC_" + selectedTemplate +"_Template.xls";
    window.open(filepath, "template_window");
  }
 	//alert("here"+document.McmUploadForm.selectTemplate.value);
  } 
  
  
</script>
  <%//=request.getAttribute("loadattribs") %>
  <%//=request.getAttribute("emailid") %>
  <body>
    <html:form  action="/mcmupload" method="post" enctype="multipart/form-data" onsubmit="return validateMcmUploadForm(this);">
    <!-- Body Starts from here -->
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
        <tr>
            <td width="6" valign="bottom"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="6" height="8"></td>
            <td valign="top">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                      <tr bgcolor="#FFFFFF">
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr bgcolor="#CCCCCC">
                                  <td height="1"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="1" height="1"></td>
                                </tr>
                                <tr>
                                  <td height="5"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="1" height="1"></td>
                                </tr>
                             </table>
                        </td>
                      </tr>
                      <tr bgcolor="#FFFFFF">
                        <td height="6"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="1" height="1">
                            <span class="contenttitlealt">
                                <bean:message key="MCM.MAIN.HEADER" />
                            </span>
                          <br>
                        </td>
                      </tr>
                </table>
            </td>
            <td height="25"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="1" height="1"></td>
        </tr>
        <tr>
          <td width="6" valign="bottom"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="6" height="1"></td>
          <td><br> </td>
          <td width="6"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" height="1" width="6"></td>
        </tr>
        <tr>
            <!--td height="5"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="1" height="5"></td -->
                            <TD class=contentbold>&nbsp;</TD>
            <td>
                <TABLE cellSpacing=0 cellPadding=0 width="60%" border=0>
                    <TBODY>
                    <TR>
                        <TD class=contentbold colspan="2" bgcolor="#CCCCCC"><font size="2">
                        <bean:message key="MCM.MAIN.REPORTING.HEADER"/></font>
                        </TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                        <TD class=contentbold colspan="2">&nbsp;</TD>
                    </TR>
                    <TR>
                        <TD class=contentbold colspan="2"><font size="2"><a href=''><bean:message  key="MCM.MAIN.REPORTING.LINKTXT"/></a></font>
                        </TD>
                    </TR>
                    <TR bgcolor="#FFFFFF">
                        <TD class=contentbold colspan="2">&nbsp;</TD>
                    </TR>
                        <TR>
                            <TD class=contentbold colspan="2" bgcolor="#CCCCCC"><font size="2"><bean:message  key="MCM.MAIN.DOWNLOADTEMPLATE"/></font>
                            </TD>
                        </TR>
                        <TR bgcolor="#FFFFFF">
                            <TD class=contentbold colspan="2">&nbsp;</TD>
                        </TR>
                        <TR>
                            <TD colspan="2" class=contentbold><table width="75%" border="0" cellspacing="1" cellpadding="2">
                                <table>
                                    <tr>
                                        <td width="51%">
                                        <html:select name="McmUploadForm" property="selectTemplate" >
	                                           <html:options collection="loadattribs1" property="id" labelProperty="description"/>
									    </html:select>
									    </td>
                                        <td width="49%">
                                            <html:button value="Download" property="DownloadTemplate" onclick="javascript:downloadTemplate()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </TR>
                        <TR>
                            <TD class=contentbold>&nbsp;</TD>
                            <TD class=content>&nbsp;</TD>
                        </TR>
                        <TR>
                            <TD class=contentbold colspan="2" bgcolor="#CCCCCC"><font size="2"><bean:message  key="MCM.MAIN.UPLOAD.HEADER"/></font>
                            </TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>&nbsp;</TD>
                            <TD class=content noWrap>&nbsp;</TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>
                                <bean:message  key="MCM.MAIN.UPLOAD.REQUESTTYPE"/>
                            </TD>
                            <TD class=content noWrap>
                            
                           				 <html:select name="McmUploadForm" property="requestType" >
	                                           <html:options collection="loadattribs" property="id" labelProperty="description"/>
									    </html:select>
                            
                               

                                    <img src="https://www.cisco.com/apps-ui/generic/interim/images/Required_Alert.gif" width="60" height="9">
                            </TD>
                        </TR>
                        <TR>
                            <TD align=right colSpan=2><IMG height=5 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>
                                <bean:message  key="MCM.MAIN.UPLOAD.REQUESTNAME"/>
                            </TD>
                            <TD class=content noWrap> 
                            <html:text maxlength="80" size="30" property="mat_request_name" /> </TD>
                        </TR>
                        <TR>
                            <TD align=right colSpan=2><IMG height=5 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>
                                <bean:message  key="MCM.MAIN.UPLOAD.LOCATEFILE"/>
                            </TD>
                            <td><!---->
                            <html:file property="fileLocate" maxlength="80"/>
                                <!--input type=file   maxlength="80" size="35" name="fileName" MAXFILESIZE='10240000'/-->
                                    <span><img src="https://www.cisco.com/apps-ui/generic/interim/images/Required_Alert.gif" width="60" height="9"></span>
                            </td>
                        </TR>
                        <TR>
                            <TD align=right colSpan=2><IMG height=5 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>
                                <bean:message  key="MCM.MAIN.UPLOAD.NOTES"/>
                            </TD>
                            <TD class=content noWrap>
                            <html:textarea property="notes" cols="30" rows="2"/>
                            
                                <!--textarea cols="30" name="notes" rows="2"></textarea-->
                            </TD>
                        </TR>
                        <TR>
                            <TD align=right colSpan=2><IMG height=5 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>
                                <bean:message  key="MCM.MAIN.UPLOAD.EMAIL"/>
                            </TD>
                            <TD class=content noWrap>
                                <% // some  condition here %>
                                    <html:text  size="30" maxlength="256"  property="email"/>

                                     
                               
                                    <span><img src="https://www.cisco.com/apps-ui/generic/interim/images/Required_Alert.gif" width="60" height="9"></span>
                            </TD>
                        </TR>
                        <TR>
                            <td class=content noWrap>&nbsp;</td>
                            <td class=content noWrap>&nbsp;</td>
                        </TR>
                        <TR>
                            <td colspan="2" noWrap class=caption>
                                <bean:message  key="MCM.MAIN.UPLOAD.TIP"/>
                            </td>
                        </TR>
                        <TR>
                            <td class=content noWrap>&nbsp;</td>
                            <td class=content noWrap>&nbsp;</td>
                        </TR>
                        <TR>
                            <TD class=content align=left colSpan=2>
                                <html:submit value="Submit" onclick="javascript:submitFrm()"/>
                            </TD>
                        </TR>
                        <TR>
                            <TD align=right colSpan=2><IMG height=5 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
                        </TR>
                        <TR>
                            <TD class=caption align=left colSpan=2>&nbsp;</TD>
                        </TR>
                        
                    </TABLE>
                </td>
          <td>&nbsp;</td>
            </tr>
        <tr>
          <td width="6" valign="bottom"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width="6" height="1"></td>
          <td><br> </td>
          <td width="6"><img src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" height="1" width="6"></td>
        </tr>
      </table>
     <html:javascript formName="McmUploadForm"/>
    </html:form>
  </body>
</html:html>

