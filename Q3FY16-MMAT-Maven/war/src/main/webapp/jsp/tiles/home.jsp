<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>

<html:html>
   

    <html:form  name="mcmupload" method="POST" action="/UPLOADPAGE"  type="org.apache.struts.validator.DynaValidatorForm">
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
                                <bean:message key="MCM.MAIN.HEADER"/>
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
                        <TD class=contentbold colspan="2"><font size="2"><a href='$link.setAction("MatReportAction").addQueryData("usersource", "scc")'><bean:message  key="MCM.MAIN.REPORTING.LINKTXT"/></a></font>
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
                                            <select  name="selectTemplate">
                                              <option value="pleaseSelect"><bean:message  key="MCM.MAIN.LOAD.DEFAULTVALUE"/></option>
                                              <option value="ADD"><bean:message  key="MCM.MAIN.LOAD.ADD"/></option>
                                              <option value="TERMINATION"> <bean:message  key="MCM.MAIN.LOAD.TERMINATE"/></option>
                                              <option value="CONTRACT_TO_CONTRACT_MOVE_PRODUCT_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_AT_PRODUCT"/></option>
                                              <option value="CONTRACT_TO_CONTRACT_MOVE_SITE_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_AT_SITE"/></option>
                                              <option value="CONTRACT_TO_CONTRACT_MOVE_CONTRACT_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_AT_CONTRACT"/></option>
                                              <option value="C2C_AND_S2S_MOVE_PRODUCT_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_S2S_AT_PRODUCT"/></option>
                                              <option value="C2C_AND_S2S_MOVE_SITE_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_S2S_AT_SITE"/></option>
                                              <option value="SITE_TO_SITE_MOVE_AT_SITE_LEVEL"><bean:message  key="MCM.MAIN.LOAD.S2S_AT_SITE"/></option>
                                              <option value="SEARCH_SITES"><bean:message  key="MCM.MAIN.LOAD.SEARCH_SITES"/></option>
                                              <option value="CREATE_SITES"><bean:message  key="MCM.MAIN.LOAD.CREATE_SITES"/></option>
                                              <option value="IBCFG_EXP"><bean:message  key="MCM.MAIN.LOAD.IBCFG_EXP"/></option>
                                            </select>
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
                                <select  property="requestType">
                                  <option value="pleaseSelect"><bean:message  key="MCM.MAIN.LOAD.DEFAULTVALUE"/></option>
                                           <% //if ($accessMgmt.allowMatAdd())%>
                                              <option value="ADD"><bean:message  key="MCM.MAIN.LOAD.ADD"/></option>
                                              <option value="TERMINATION"><bean:message  key="MCM.MAIN.LOAD.TERMINATE"/></option>
                                              <option value="CONTRACT_TO_CONTRACT_MOVE_PRODUCT_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_AT_PRODUCT"/></option>
                                              <option value="CONTRACT_TO_CONTRACT_MOVE_SITE_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_AT_SITE"/></option>
                                              <option value="CONTRACT_TO_CONTRACT_MOVE_CONTRACT_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_AT_CONTRACT"/></option>
                                              <option value="C2C_AND_S2S_MOVE_PRODUCT_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_S2S_AT_PRODUCT"/></option>
                                              <option value="C2C_AND_S2S_MOVE_SITE_LEVEL"><bean:message  key="MCM.MAIN.LOAD.C2C_S2S_AT_SITE"/></option>
                                              <option value="SITE_TO_SITE_MOVE_AT_SITE_LEVEL"><bean:message  key="MCM.MAIN.LOAD.S2S_AT_SITE"/></option>
                                              <option value="SEARCH_SITES"><bean:message  key="MCM.MAIN.LOAD.SEARCH_SITES"/></option>
                                              <option value="CREATE_SITES"><bean:message  key="MCM.MAIN.LOAD.CREATE_SITES"/></option>
                                              <option value="IBCFG_EXP"><bean:message  key="MCM.MAIN.LOAD.IBCFG_EXP"/></option>
                                            </select>

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
                            <TD class=content noWrap> <html:text maxlength="80" size="30" property="mat_request_name" value=""/> </TD>
                        </TR>
                        <TR>
                            <TD align=right colSpan=2><IMG height=5 src="https://www.cisco.com/apps-ui/generic/interim/images/spacer.gif" width=1></TD>
                        </TR>
                        <TR>
                            <TD class=contentbold noWrap>
                                <bean:message  key="MCM.MAIN.UPLOAD.LOCATEFILE"/>
                            </TD>
                            <td><!---->
                                <input type=file    maxlength="80" size="35" name="fileName" MAXFILESIZE='10240000'/>
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
                                <textarea cols="30" name="notes" rows="2"></textarea>
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
                                    <html:text  size="30" maxlength="256"  property="email" value=""/>

                                    <!-- input type="text" class="content" size="30"  maxlength="256" name="email" value="accessMgmt.getEmail()"-->
                               
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
      
       
    </html:form>



    </html:html>

<script language=javascript>
function submitFrm()
{

document.mcmupload.submit();
}
</script>

<script language='javascript'>

function downloadTemplate() {


    var selectedTemplate = document.mcmupload.selectTemplate.options[document.mcmupload.selectTemplate.selectedIndex].value; //document.mcmupload.selectTemplate.value;
   
    if (selectedTemplate == null || selectedTemplate == "pleaseSelect") {
  	    alert ("Please select appropriate template to download");
  	    return false;
    }
    var filepath = '$htmlRenderer.imagePath()' + "/xlstemplates/MassMAC_" + selectedTemplate +"_Template.xls";
    window.open(filepath, "template_window");

}

function validateForm(thisobj) {
    var requestFlag = getRequestType(document.mcmupload.requestType.value);
	if (requestFlag == false) {
		return false;
	}
	extFlag = getExtension(document.mcmupload.fileName.value);
	if (extFlag == false) {
		return false;
	}
	var emailFlag = validateSingleEmail(document.mcmupload.email);
	if (emailFlag == false) {
		return false;
	}

	if (extFlag == true && emailFlag == true && requestFlag == true) {
        document.mcmupload.uploadDefinitionName.value = document.mcmupload.requestType.value;
	    document.mcmupload.uploadButton.disabled=true;
		document.mcmupload.submit();
	}
}

function getExtension(value) {
  extString = value.substring(value.lastIndexOf('.') + 1,value.length);

  if (extString==null || extString=="") {
  	alert ("Locate File is a required field");
  	return false;
  }
  if (extString!="xls") {
  	alert ("Please load only an Excel file");
  	return false;
  }
  return true;
}

function getRequestType(value) {
  if (value ==null || value=="pleaseSelect") {
  	alert ("Request Type is a required field");
  	return false;
  }
  return true;
}

function validateSingleEmail(fld)
{
    if( (fld.value==null) || (fld.value=="") || (fld.length==0) ) {
		alert ("Email is a required field");
		return false;
	}
	if(!fld.value)
	{
		return true;
	}
	regExp = new RegExp(" ", "g");
	var emailValue = fld.value.replace(regExp, ""); //fld.value;

    var emailArray = emailValue.split(",");
    for(i=0; i<emailArray.length; i++) {
        if(!validateEmail(emailArray[i]) ) {
            fld.focus();
            return false;
        }
    }
    return true;
}

function validateEmail(val) {
	var wordchar= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_,';
        var char1= val.charAt(0);
        var charN= val.charAt(val.length-1);
        var at= val.indexOf('@');
        var dot= val.indexOf('.',at+2);
        if(val.indexOf(' ') != -1 || at == -1 || dot == -1 || wordchar.indexOf(char1) == -1 || wordchar.indexOf(charN) == -1)
        {
            alert('The Email address entered field must contain a valid email address. ' );
            return false;
        }
    //     alert ("at: " + at);
    //     alert("dot: " + dot);
        var pre_at= val.charAt(at-1);
    //     alert ("pre_at: " + pre_at);
        var post_at= val.charAt(at+1);
    //     alert ("post_at: " + post_at);
        var pre_dot= val.charAt(dot-1);
    //     alert ("pre_dot: " + pre_dot);
        var post_dot= val.charAt(dot+1);
    //     alert ("post_dot: " + post_dot);
    //     alert ("fld.value.indexOf('@',at+2): " + fld.value.indexOf('@',at+2));
    //	if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 || fld.value.indexOf('@',at+2) != -1)
        if(wordchar.indexOf(pre_at) == -1 || wordchar.indexOf(post_at) == -1 ||  wordchar.indexOf(pre_dot) == -1 || wordchar.indexOf(post_dot) == -1 )
        {
            alert('The Email address field must contain a valid email address.'  );
            fld.focus();
            return	 false;
        }
        return true;
}

</script>
