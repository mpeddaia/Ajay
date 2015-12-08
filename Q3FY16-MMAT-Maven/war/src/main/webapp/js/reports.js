
NS4 = (document.layers) ? true : false;
ie4 = (document.all) ? true : false;
function show(id) {
    if (NS4) {
        document.layers[id].visibility = "show";
    } else {
        if (ie4) {
            document.all[id].style.visibility = "visible";
        } else {
            document.getElementById(id).style.display = "";
        }
    }
}
function hide(id) {
    if (NS4) {
        document.layers[id].visibility = "hide";
    } else {
        if (ie4) {
            document.all[id].style.visibility = "hidden";
        } else {
            document.getElementById(id).style.display = "none";
        }
    }
}
function assignDate(dateObject, contextStr) {

		//alert(contextStr);
    var thefield = eval("document.matReport." + contextStr);
        //alert(dateObect);
    thefield.value = dateObect;//formatDate( dateObject );
}
function stat() {
    window.status = document.matReport.VAL_ALL.value;
}
function dateCompare(fromDateStr, toDateStr) {
    var lt = false;
    var temArr = fromDateStr.split("-");
    var day1 = temArr[0];
    var month1 = getMonth(temArr[1]);
    var year1 = temArr[2];
    var date1 = new Date(year1, month1, day1);
    temArr = toDateStr.split("-");
    var day2 = temArr[0];
    var month2 = getMonth(temArr[1]);
    var year2 = temArr[2];
    var date2 = new Date(year2, month2, day2);
			//alert(date2);
    if (date2 < date1) {
        return false;
    } else {
        return true;
    }
}
function getMonth(month) {
    switch (month) {
      case "JAN":
        return 0;
        break;
      case "FEB":
        return 1;
        break;
      case "MAR":
        return 2;
        break;
      case "APR":
        return 3;
        break;
      case "MAY":
        return 4;
        break;
      case "JUN":
        return 5;
        break;
      case "JUL":
        return 6;
        break;
      case "AUG":
        return 7;
        break;
      case "SEP":
        return 8;
        break;
      case "OCT":
        return 9;
        break;
      case "NOV":
        return 10;
        break;
      case "DEC":
        return 11;
        break;
      default:
        break;
    }
}
function IsNumeric(sText) {
    var ValidChars = "0123456789";
    var IsNumber = true;
    var Char;
    for (i = 0; i < sText.length && IsNumber == true; i++) {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) == -1) {
            IsNumber = false;
        }
    }
    return IsNumber;
}
var repType = -1;  // -1 indicates "no report type"
var mcmUBU = -1; // for MCMUBU REPORT
var mcmRCR = -1; // for MCMRCR REPORT
var mcmSUM = -1; // for MCMSUM REPORT
var mcmFBT = -1; // for MCMFBT REPORT
var mcmPTR = -1; // for MCMPTR REPORT
var mcmRCRRID = -1;
var mcmVAOR = -1;
function assignMcmVAOR(value) {
    mcmVAOR = value;
}
function assignMcmPTR(value) {
    mcmPTR = value;
}
function assignRepType(value) {
    repType = value;
}
function assignMcmUBU(val) {
    mcmUBU = val;
}
function assignMcmRCR(value) {
    mcmRCR = value;
}
function assignMcmSUM(value) {
    mcmSUM = value;
}
function assignMcmRCRRID(value) {
    mcmRCRRID = value;
}
function assignMcmFBT(value) {
    mcmFBT = value;
}
function validateForm() {
    var stDate = document.matReport.MAT_RPT_START_DATE.value;
    var endDate = document.matReport.MAT_RPT_END_DATE.value;
//    alert(mcmPTR);
    
   // 	if (mcmVAOR==1)
    //	{
    //	document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value=document.matReport.processingMoveRequestTypeVAOR.value;
    //	}
    	
    
	//    if(mcmPTR==1)
	 //   {
	 //   document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value=document.matReport.processingMoveRequestType.value;
	//    }
    
	//    if (mcmSUM==1)
	//    {
	//  	  document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value=document.matReport.utilSummaryMoveRequestType.value;
	//    }
	   
	//    if (mcmFBT==1)
	//    {
	//  	  document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value=document.matReport.failureMoveRequestType.value;
	//    }
    	//window.status=document.matReport.MAT_REPORT_TYPE.value;
    if (repType != 2) {
        if ("" == stDate) {
            alert("Enter the start date");
            return false;
        }
        if ("" == endDate) {
            alert("Enter the end date");
            return false;
        }
    }
    if (!(dateCompare(stDate, endDate))) {
        alert("Start date is not prior to the end date!");
        return false;
    }
    var parameters = "MAT_RPT_START_DATE=" + encodeURI(stDate) + "&MAT_RPT_END_DATE=" + encodeURI(endDate);
    if (repType == -1) {
        alert("Select report type");
        return false;
    }
    if (repType == 3 && mcmUBU == -1) {
        document.matReport.MAT_RPT_UBU_CCO_USER_ID.value = "ALL";
        parameters = parameters + "&MAT_RPT_UBU_CCO_USER_ID=" + encodeURI("ALL");
        parameters = parameters + "&MAT_RPT_UBU_REQUEST_TYPE=" + encodeURI(document.matReport.MAT_RPT_UBU_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_UBU_STATUS=" + encodeURI(document.matReport.MAT_RPT_UBU_STATUS.value);
    }
    if (repType == 3 && mcmUBU == 2) {
        if ("" == document.matReport.MAT_RPT_UBU_CCO_USER_ID.value) {
            alert("Enter CCO USER ID FOR Utilization By User Report");
            return false;
        } else {
            parameters = parameters + "&MAT_RPT_UBU_CCO_USER_ID=" + encodeURI(document.matReport.MAT_RPT_UBU_CCO_USER_ID.value);
            parameters = parameters + "&MAT_RPT_UBU_REQUEST_TYPE=" + encodeURI(document.matReport.MAT_RPT_UBU_REQUEST_TYPE.value);
            parameters = parameters + "&MAT_RPT_UBU_STATUS=" + encodeURI(document.matReport.MAT_RPT_UBU_STATUS.value);
        }
    }
    if (repType == 4 && mcmSUM == 1) {
        var vPTR = "MAT_ADD";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_SUM_REQUEST_TYPE=" + encodeURI(vPTR);
			//alert("IN VALIDATOR  "+parameters);
    }
    if (repType == 4 && mcmSUM == 2) {
        var vPTR = "MAT_TERMINATE";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_SUM_REQUEST_TYPE=" + encodeURI(vPTR);
			//alert("IN VALIDATOR  "+parameters);
    }
    if (repType == 4 && mcmSUM == 3) {
        var vPTR = document.matReport.utilSummaryMoveRequestType.value;
	    	//alert(vPTR);
        document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_SUM_REQUEST_TYPE=" + encodeURI(vPTR);
			//alert("IN VALIDATOR  "+parameters);
    }
    if (repType == 4 && mcmSUM == 4) {
        var vPTR = "MAT_SITES_ALL";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_SUM_REQUEST_TYPE=" + encodeURI(vPTR);
			//alert("IN VALIDATOR  "+parameters); 
    }
    if (repType == 4 && mcmSUM == -1) {
        var vPTR = "ALL";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_SUM_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_SUM_REQUEST_TYPE=" + encodeURI(vPTR);
			//alert("IN VALIDATOR  "+parameters);
    }
    if (repType == 5 && mcmFBT == -1) {
        var vPTR = "MAT_ADD";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_FBT_REQUEST_TYPE=" + encodeURI(vPTR);
			//alert("IN VALIDATOR  "+parameters);  
    }
    if (repType == 5 && mcmFBT == 2) {
        var vPTR = "MAT_TERMINATE";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_FBT_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 5 && mcmFBT == 3) {
        var vPTR = document.matReport.failureMoveRequestType.value;
	    	//alert(vPTR);
        document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_FBT_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 5 && mcmFBT == 4) {
        var vPTR = "MAT_SITES_ALL";
	    //	alert(vPTR);
        document.matReport.MAT_RPT_FBT_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_FBT_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 6 && mcmPTR == 1) {
        var vPTR = "MAT_ADD";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_PTR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 6 && mcmPTR == 2) {
        var vPTR = "MAT_TERMINATE";
	    //	alert(vPTR);
        document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value = vPTR;
	    //	alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_PTR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 6 && mcmPTR == 3) {
        var vPTR = document.matReport.processingMoveRequestType.value;
	    	//alert(vPTR);
        document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_PTR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 6 && mcmPTR == 4) {
        var vPTR = "MAT_SITES_ALL";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_PTR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 6 && mcmPTR == -1) {
        var vPTR = "ALL";
	    	//alert(vPTR);
        document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_PTR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_PTR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 7 && mcmRCR == -1) {
        document.matReport.MAT_RPT_RCR_CCO_USER_ID.value = "ALL";
    }
    if (repType == 7 && mcmRCR == 2) {
        if ("" == document.matReport.MAT_RPT_RCR_CCO_USER_ID.value) {
            alert("Enter CCO USER ID FOR Reason Code Report");
            return false;
        }
    }
    if (repType == 7 && mcmRCRRID == -1) {
        document.matReport.MAT_RPT_TRN_REQUEST_ID.value = "ALL";
        parameters = parameters + "&MAT_RPT_TRN_REQUEST_ID=" + encodeURI("ALL");
        parameters = parameters + "&MAT_RPT_RCR_REQUEST_TYPE=" + encodeURI(document.matReport.MAT_RPT_RCR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_RCR_CCO_USER_ID=" + encodeURI(document.matReport.MAT_RPT_RCR_CCO_USER_ID.value);
        parameters = parameters + "&MAT_RPT_RCR_REASONCODE=" + encodeURI(document.matReport.MAT_RPT_RCR_REASONCODE.value);
    }
    if (repType == 7 && mcmRCRRID == 2) {
        if ("" == document.matReport.MAT_RPT_TRN_REQUEST_ID.value) {
            alert("Enter Request Id FOR Reason Code Report");
            return false;
        }
        if (!(IsNumeric(document.matReport.MAT_RPT_TRN_REQUEST_ID.value))) {
            alert("Enter numeric value for request id");
            return false;
        }
        parameters = parameters + "&MAT_RPT_TRN_REQUEST_ID=" + encodeURI(document.matReport.MAT_RPT_TRN_REQUEST_ID.value);
        parameters = parameters + "&MAT_RPT_RCR_REQUEST_TYPE=" + encodeURI(document.matReport.MAT_RPT_RCR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_RCR_CCO_USER_ID=" + encodeURI(document.matReport.MAT_RPT_RCR_CCO_USER_ID.value);
        parameters = parameters + "&MAT_RPT_RCR_REASONCODE=" + encodeURI(document.matReport.MAT_RPT_RCR_REASONCODE.value);
    }
    /*	 if(repType == 8 && mcmVAOR == 1)
    	{
	    	var vPTR="MAT_ADD";
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value);
    	}
    	 
    	  if(repType == 8 && mcmVAOR == 2)
    	{
	    	var vPTR=document.matReport.voauditreport.value;
	    	//alert(vPTR);
	    	document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value=vPTR;
	    	//alert(document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value);
    	}
    	*/
    if (repType == 8 && mcmVAOR == -1) {
        var vPTR = "ALL";
        document.matReport.MAT_RPT_VOAR_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_VOAR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    document.matReport.event.value = "reportSubmit";
    parameters = parameters + "&event=" + encodeURI("reportSubmit");
    parameters = parameters + "&MAT_REPORT_TYPE=" + encodeURI(repType);
        //document.matReport.submit();
		//alert("IN VALIDATOR  "+parameters);
    url = "mcmprocessreports.do";
    inProgress();
    makePOSTRequest(url, parameters);
    return true;
}
    
    // TD -26738 Added by Rajkumar 
function validateFormRep() {
    var stDate = document.matReport.MAT_RPT_START_DATE.value;
    var endDate = document.matReport.MAT_RPT_END_DATE.value;

    if ("" == stDate && endDate == "") {
        alert("Please  proceed by Selecting StartDate and End Date");
        return false;
    }
    if ("" == stDate && endDate != "") {
        alert("Enter the start date");
        return false;
    }
    if (("" != stDate && "" == endDate)) {
        alert("Enter the end date");
        return false;
    }
    if (!(dateCompare(stDate, endDate))) {
        alert("Start date is not prior to the end date!");
        return false;
    }

    var parameters = "MAT_RPT_START_DATE=" + encodeURI(stDate) + "&MAT_RPT_END_DATE=" + encodeURI(endDate);
    var vPTR = document.matReport.MAT_RPT_EXT_REQUEST_TYPE.value;
    document.matReport.MAT_RPT_EXT_REQUEST_TYPE.value = vPTR;
            //parameters = parameters + "&MAT_RPT_FBT_REQUEST_TYPE="+encodeURI(vPTR);
    if (repType == 9) {
        document.matReport.MAT_RPT_VOR_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_VOR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 10) {
        document.matReport.MAT_RPT_MPR_REQUEST_TYPE.value = vPTR;
        parameters = parameters + "&MAT_RPT_MPR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    if (repType == 11) {
        document.matReport.MAT_RPT_MRTR_REQUEST_TYPE.value = vPTR;
	    	//alert(document.matReport.MAT_RPT_VAOR_REQUEST_TYPE.value);
        parameters = parameters + "&MAT_RPT_MRTR_REQUEST_TYPE=" + encodeURI(vPTR);
    }
    document.matReport.event.value = "reportSubmit";
    parameters = parameters + "&event=" + encodeURI("reportSubmit");
    parameters = parameters + "&MAT_REPORT_TYPE=" + encodeURI(repType);
        //document.matReport.submit();
		//alert("IN VALIDATOR  "+parameters);
    url = "mcmprocessreports.do";
    inProgress();
    makePOSTRequest(url, parameters);
}
var contextPath = "";
function setContextPath(path) {
    contextPath = path;
}
function inProgress() {		
		//alert("In inProgress contextPath --> "+contextPath);
    var progressMsg = "<table width='100%' style='border: 1px solid #7f7f7f;' bgcolor='#E9E9E9' >" + "<tbody>" + "<tr>" + "<td style='border-right: 1px solid #7f7f7f; height: 45px; width:20' align='center'>" + "<img id='success' onClick=\"\" src=\"" + contextPath + "/images/global/buttons_and_icons/icons/grey/icn_warning_green.gif\" alt=\"success\" height=\"20\" width=\"20\" border=\"0\"/>" + "</td>" + "<td>" + "<label><b>" + "<img src='" + contextPath + "/images/wait.gif' alt=''></b>" + "</label>" + "</td>" + "</tr>" + "</tbody>" + "</table>";
    /*var progressMsg = "<TABLE cellSpacing=0 cellPadding=0 width='100%' border='0' bgcolor='#ffffff'>" +
		                    "<TBODY><tr>	<td width='100%' colspan='4'>" +
								"<hr color='#7f7f7f'> </td> </tr> " +       
							" <TR> <td width='5'></td> <TD class=contentbold colspan='2' > " + 
							" <font size='2' color='red'>In Progress...." +
								" </font> <img src='"+contextPath+"/images/wait.gif' alt=''> </TD> </TR> </TBODY> </TABLE>" ;
		*/
    document.getElementById("reportRes").innerHTML = progressMsg;
}
function checkEnter(event) {
    var code = 0;
    if (NS4) {
        code = event.which;
    } else {
        code = event.keyCode;
    }
    if (code == 13) {
        return true;
    }
    return false;
}
var vMandatoryFields = ["FuncType", "Number"];
var vMandatoryFieldLabels = ["Query Criteria", "Number"];
function goToMultipage(page) {
    self.location = page;
}
function doCommonValidations(formObject) {
    for (i = 0; i < formObject.length; i++) {
        vElement = formObject.elements[i];
        vThisIsMandatory = false;
        for (j = 0; j < vMandatoryFields.length; j++) {
            if (vElement.name == vMandatoryFields[j]) {
                vThisIsMandatory = true;
                break;
            }
        }
        if (vThisIsMandatory == true) {
            if (vElement.type == "text") {
                vValue = vElement.value;
            } else {
                if (vElement.type == "select-one") {
                    vValue = vElement.options[vElement.selectedIndex].value;
                } else {
                    vValue = vElement.value;
                }
            }
            if ((vValue == null) || (vValue == "")) {
                alert(vMandatoryFieldLabels[j] + " must be entered.");
                return false;
            }
        }
    }
    return true;
}
/***AJAX-BEGIN***************************/
var http_request = false;

   // Functiojn to post the request
function makePOSTRequest(url, parameters) {
    http_request = false;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
        if (http_request.overrideMimeType) {
         	// set type accordingly to anticipated content type
            //http_request.overrideMimeType('text/xml');
            http_request.overrideMimeType("text/html");
        }
    } else {
        if (window.ActiveXObject) { // IE
            try {
                http_request = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (e) {
                try {
                    http_request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (e) {
                }
            }
        }
    }
    if (!http_request) {
        alert("Cannot create XMLHTTP instance");
        return false;
    }
    http_request.onreadystatechange = alertContents;
    http_request.open("POST", url, true);
    http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http_request.setRequestHeader("Content-length", parameters.length);
    http_request.setRequestHeader("Connection", "close");
    http_request.send(parameters);
}
	
	// Function to handle the response
function alertContents() 
{

         if (http_request.readyState == 4) {
        if (http_request.status == 200) {
            result = http_request.responseText;
            document.getElementById("reportRes").innerHTML = result;            
				//document.getElementById('reportRes').innerHTML = "RESULT DISPLAYED HERE";
        } else {
            alert("There was a problem with the request.");
        }
    }
}

   // Function to build the parameters: Not used here
function get(obj) {
    var poststr = "mytextarea1=" + encodeURI(document.getElementById("mytextarea1").value) + "&mytextarea2=" + encodeURI(document.getElementById("mytextarea2").value);
    makePOSTRequest("post.jsp", poststr);
}
/***AJAX-END*******************************/

