//Global Variables
var contractNumberFlag = "true";
var intallAtSiteSelectorFlag = "true";
var billToIDSelectorFlag = "true";
var fromDate = "true";
var toDate = "true";
var element = null;
var par = new Array();
var warnings = new Array();
var warningsCounter = 0;
var services = new Array();

var field="";
var type="I";

function showCustomerSelectorChild() {
	//alert("In js/contract_mgr.js Customer function ");
    // var custObj = document.getElementsByName("selectedCustomers");
	
    var int_windowLeft = (screen.width - 600) / 2;
    var int_windowTop = (screen.height - 550) / 4;
	
	var userIorE = "I";
 
	//var userIorE = document.getElementById("userIorE").value;
   
    var context = "";
    var withincontext = "N";
    var url = "";
    if (userIorE == "I") {
        context = "";
    } else {
        context = "CONTRACT";
    }
    if (userIorE == "I") {
        withincontext = "N";
    } else {
        withincontext = "Y";
    }
    if (userIorE == "I") {
		
        url = "./custSelectorDispatch.do?methodName=onshowPopup&strWithinContext=" + withincontext + "&strContext=" + context + "&strContextValue=&strSourceSystem=XXCSS_SCM&strSearchHier=CSC&strRequestedData=BOTH&strStatus=ACTIVE&strSelectType=SINGLE";
    } else {
        url = "./custSelectorDispatch.do?methodName=onshowPopup&strWithinContext=" + withincontext + "&strContext=" + context + "&strContextValue=&strSourceSystem=XXCSS_SCM&strSearchHier=&strRequestedData=&strStatus=ACTIVE&strSelectType=SINGLE";
    }
    //alert(url);
    childwindow = window.open(url, "childWin", "width=600,height=470,scrollbars,resizable=yes,top=" + int_windowTop + ",left=" + int_windowLeft);
	//strSearchHier=BOTH&strRequestData=BOTH&&strSourceSystem=XXCSS_POM&strStatus=ACTIVE&strSelectType=MULTIPLE
    childwindow.creator = self;
    return false;
}

// Not working, called showChild instead of this function.
function showUserSelectorChild() {
	
    //var custObj = document.getElementsByName("selectedCustomers");
	
    var int_windowLeft = (screen.width - 600) / 2;
    var int_windowTop = (screen.height - 550) / 4;
	
	var userIorE = type;
 
	//var userIorE = document.getElementById("userIorE").value;
   
    var context = "";
    var withincontext = "N";
    var url = "";
    if (userIorE == "I") {
        context = "";
    } else {
        context = "mcm";
    }
    if (userIorE == "I") {
        withincontext = "N";
    } else {
        withincontext = "Y";
    }
    if (userIorE == "I") {  
		
        url = "./userIdSelector.do?methodName=onshowPopup&" +						
						"withinContext=" + withincontext + "&" +
						"context=" + context + "&contextValue=&" +
						"sourceSystem=XXCSS_CM&searchHier=CSC&" +
						"requestedData=BOTH&" +
						"status=ACTIVE&" +
						"selectionType=SINGLE&" +
						"userType=Internal";
    } else {
        url = "./userIdSelector.do?methodName=onshowPopup&parentElementId=mat_vo_approvername&withinContext=" + withincontext + "&context=" + context + "&contextValue=&sourceSystem=XXCSS_CM&searchHier=&requestedData=&status=ACTIVE&selectionType=SINGLE&userType=Proxy";
		//		userIdSelector.do?methodName=onshowPopup& parentElementId=ccoUserId&strCCOUserId=agundlur&strSourceSystem=SOM&context=CONTRACT&userType=proxy&strAuthLevel=RW&selectionType=Single
    }
	
    childwindow = window.open(url, "childWin", "width=600,height=470,scrollbars,resizable=yes,top=" + int_windowTop + ",left=" + int_windowLeft);
	//strSearchHier=BOTH&strRequestData=BOTH&&strSourceSystem=XXCSS_POM&strStatus=ACTIVE&strSelectType=MULTIPLE
    childwindow.creator = self;
    return false;
	
}

// Added by Rajesh: for user pickers
function showChild() {
	//alert("showChild");
	var int_windowLeft = (screen.width - 600) / 2;
    var int_windowTop = (screen.height - 550) / 4;	
	var userIorE = "I";
	var url = "./userIdSelector.do?methodName=onshowPopup";
	//var url = "/TSTVMZ/userIdSelector.do?methodName=onshowPopup";
	url += "&strCCOUserId=";//+document.getElementById("strCCOUserId").value;
	
	
	if (userIorE == "I") {
		url += "&sourceSystem=XXCSS_MAT";
		url += "&userType=INTERNAL"	;
		url += "&context=CCO_USER";	
	} else {
		url += "&userType=EXTERNAL";
		url += "&context=CONTRACT";
		url += "&sourceSystem=XXCSS_MAT";
	}	
	//url += "&userType="+document.getElementById("userType").value;	
	url += "&strAuthLevel=RW";
	url += "&selectionType=SINGLE";
	//alert("URL : " + url); 
	var childwindow=window.open(url,"UserIdSelector","width=600,height=570, scrollbars, resizable=yes,top=" + int_windowTop + ",left=" + int_windowLeft);
	childwindow.creator=self;  
	return false;  
}

function setUserIdFromPicker(){  
	alert(" setUserIdFromPicker ");	
}

function setField(field_id,type_id)
{	
	field=field_id;
	type=type_id;
}
// call back function for Customer Selector Selector
function xtrack_customerselector(JSONObj) {
    
    var mJSONObj = eval("(" + JSONObj + ")");
    var custSel = document.getElementsByName("selectedCustomers");
    var y = mJSONObj.CustomerSelector.length;
    var chkList = "";
    var chkLstFinal = "";
    var hiddenList = "";
    var found;
	 var ele= eval("document.McmUploadForm."+field);
	
	

    //alert("length of json object===="+y);
    for (var i = 0; i < y; i++) {
//        chkList = chkList + "<input type=\"checkbox\" id=\"selectedCustomerNames\" checked=\"checked\" onclick=\"toggleGrayOuts();\" name=\"selectedCustomerName\" value=\"" + mJSONObj.CustomerSelector[i].CustomerNumber + "%-%-%" + "" + mJSONObj.CustomerSelector[i].CustomerName + "\">" + mJSONObj.CustomerSelector[i].CustomerNumber + " - " + mJSONObj.CustomerSelector[i].CustomerName + "<br>";
		ele.value=mJSONObj.CustomerSelector[i].CustomerName;
    }
    //hkLstFinal = chkList;
	//alert(chkLstFinal);
    //document.getElementById("customerSelector").innerHTML = chkLstFinal;
    //toggleGrayOuts();
}
    


////////////////////////////////////////////////////////////////////////////
//Install Sites
// This Function is used to get Install Sites from Cross-Track Selector
function showInstallSiteChild() {
    //alert("invoking Install site popup,,,,jackinthe box cm");
   	//var context = document.getElementById("context").value;
    var context = "Generic";
    var userIorE = document.getElementById("userIorE").value;
    var withincontext = "Y";
    if (userIorE == "I") {
        context = "";
    } else {
        context = "CONTRACT";
    }
    if (userIorE == "I") {
        withincontext = "N";
    } else {
        withincontext = "Y";
    }
   	
    //var contextvalue = document.getElementById("contextvalue").value;
    var sourcesystem = document.getElementById("sourceSystemStr").value;
    var contextvalue = "";
    var status = document.getElementById("selectorStatus").value;
    var url = "installSiteSelector.do?methodName=onshowPopup&withincontext=" + withincontext + "&context=" + context + "&contextvalue=" + contextvalue + "&sourcesystem=" + sourcesystem + "&pickerselectionvalue=MULTIPLE&status=" + status;

	//var url = "installSiteSelector.do?methodName=onshowPopup&withincontext=Y&context=CONTRACT&contextvalue=2000299&sourcesystem="+sourcesystem+"&pickerselectionvalue=MULTIPLE&status="+status;
	//alert(url);
    childwindow = window.open(url, "childWin", "width=992,height=625, scrollbars, resizable=yes");
    childwindow.creator = self;
    return false;
}


// Call back method for InstallSite selector
function fetchInstallSites(xStr) {
    var mJSONObj = eval("(" + xStr + ")");
    var x = mJSONObj.InstallSiteSelector.length;
	//alert ('Length---    '+x);
    var chkList = "";
    for (var i = 0; i < x; i++) {
        var address = mJSONObj.InstallSiteSelector[i].installedAtSiteName + "  " + mJSONObj.InstallSiteSelector[i].address1 + " " + mJSONObj.InstallSiteSelector[i].address2 + " " + mJSONObj.InstallSiteSelector[i].address3 + " " + mJSONObj.InstallSiteSelector[i].city + " " + mJSONObj.InstallSiteSelector[i].state + " " + mJSONObj.InstallSiteSelector[i].country;
        //alert(address);
        chkList = chkList + "<input type=\"checkbox\" title=\"" + address + " \" id=\"selectedInstalledAtSite\" checked=\"true\" name=\"selectedInstalledAtSite\" value=\"" + mJSONObj.InstallSiteSelector[i].siteId + "%-%-%" + mJSONObj.InstallSiteSelector[i].installedAtSiteName + "%-%-%" + address + " \"> <span title=\"" + address + " \" >" + mJSONObj.InstallSiteSelector[i].installedAtSiteName + "&nbsp;" + mJSONObj.InstallSiteSelector[i].siteId + "</span> <br>";
    }
	//alert (chkList);
    var chkLstFinal = chkList;
    document.getElementById("installedSites").innerHTML = chkLstFinal;
}


//BillTo Selector
// This Function is used to get Bill to Ids from Cross-Track Bill to Selector tool
function showBillToID() {
    //alert("invoking bill to site popup,,,,jackinthe box");
    //alert(document.getElementById('userIorE').value);
    var userIorE = document.getElementById("userIorE").value;
    var url = "./billtoselect.do?methodName=onshowPopup";
	//url += "&withinContext=N";
    if (userIorE == "I") {
        url += "&context=";
    } else {
        url += "&context=CONTRACT";
    }
    if (userIorE == "I") {
        url += "&withinContext=N";
    } else {
        url += "&withinContext=Y";
    }
		
	//url += "&context=";
    url += "&contextValue=";
    url += "&status=" + document.getElementById("selectorStatus").value;
    url += "&pickerSelection=MULTIPLE";
    if (userIorE == "I") {
        url += "&userType=INTERNAL";
    } else {
        url += "&userType=EXTERNAL";
    }
	//url += "&userType="+document.getElementById("userType").value;
	//alert(url);
    childwindow = window.open(url, "BillToSelector", "width=992, height=550, scrollbars , resizable=yes");
    childwindow.creator = self;
    return false;
}

//Call back function for bill tos 
function xtrack_billtoselector(JSONObj) {
    var mJSONObj = eval("(" + JSONObj + ")");
    //alert(JSONObj);
    var x = mJSONObj.BilltoSelector.length;
    var chkList = "";
    for (var i = 0; i < x; i++) {
        var address = mJSONObj.BilltoSelector[i].BilltoName + " " + mJSONObj.BilltoSelector[i].Address1 + " " + mJSONObj.BilltoSelector[i].Address2 + " " + mJSONObj.BilltoSelector[i].Address3 + " " + mJSONObj.BilltoSelector[i].City + " " + mJSONObj.BilltoSelector[i].State + " " + mJSONObj.BilltoSelector[i].PostalCode + " " + mJSONObj.BilltoSelector[i].Country;
        					
        //alert(address);
        chkList = chkList + "<input type=\"checkbox\" title=\"" + address + " \" id=\"selectedBillToID\" onclick=\"toggleGrayOuts();\" checked=\"true\" name=\"selectedBillToID\" value=\"" + mJSONObj.BilltoSelector[i].BilltoID + "%-%-%" + mJSONObj.BilltoSelector[i].BilltoName + "%-%-%" + address + " \">  <span title=\"" + address + " \" >" + mJSONObj.BilltoSelector[i].BilltoID + "</span> <br>";
    }
    var billTo = document.getElementById("billToIds");
    billTo.value = mJSONObj.BilltoSelector[0].BilltoName;
    var chkLstFinal = chkList;
    document.getElementById("billToIds").innerHTML = chkLstFinal;
		//alert(billTo.value);
		////alert('Parent Page');
	//alert(JSONObj);
    toggleGrayOuts();
}
//End of bill to.


//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start
// This Function is used to get ServiceLevels from Cross-Track Selector
function showServiceLevelsChild() {
    //alert("invoking Servicelevel Popup-----");
    var userIorE = document.getElementById("userIorE").value;
    var withinContext = "";
    var context = "";
	//alert(' userIorE '+userIorE);
    if (userIorE == "I") {
        context = "";
    } else {
        context = "CONTRACT";
    }
    if (userIorE == "I") {
		//alert(withinContext);    
        withinContext = "N";
    } else {
		//alert(withinContext);    
        withinContext = "Y";
    }
    //alert("" + withinContext);
    var sourcesystem = document.getElementById("sourceSystemStr").value;
    //alert("sourcesystem" + sourcesystem);
    var contextvalue = "";
    var url ="";
    if(document.getElementById("serviceLevelChange") == null)
    {
     url = "./serviceLevelSelector.do?methodName=onshowPopup&withincontext=" + withinContext + "&context=" + context + "&contextvalue=" + contextvalue + "&sourcesystem=" + sourcesystem + "&pickerselectionvalue=MULTIPLE&status=All";
    }
    else
    {
    url = "./serviceLevelSelector.do?methodName=onshowPopup&withincontext=" + withinContext + "&context=" + context + "&contextvalue=" + contextvalue + "&sourcesystem=" + sourcesystem + "&pickerselectionvalue=SINGLE&status=All";
    }
    //alert(url);
    childwindow = window.open(url, "childWin", "width=992,height=625, scrollbars,  resizable=yes");
    childwindow.creator = self;
    return false;
}
// Call back method for ServiceLevel selector
function fetchServiceLevels(xStr) {
    var chLevel = xStr;
    var len = xStr.length;
    var inx = null;
    chobj = chLevel.substring(53, chLevel.indexOf('-'));
    var mJSONObj = eval("(" + xStr + ")");
    //alert(mJSONObj);
    var x = mJSONObj.ServiceLevelSelector.length;
    var chkList = "";
    var serviceLevelSelectorStr = "";
    for (var i = 0; i < x; i++) {
        chkList = chkList + "<input type=\"checkbox\" id=\"selectedServiceLevels\" checked=\"true\"  onChange=\"removeReqField();\" onClick=\"removeReqField();\" name=\"selectedServiceLevels\" value=\"" + mJSONObj.ServiceLevelSelector[i].ServiceLevelCode + "%-%-%" + mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup + "\"  > " + mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup + "<br>";
        serviceLevelSelectorStr = serviceLevelSelectorStr + mJSONObj.ServiceLevelSelector[i].servicelevelcode + ",";
        //alert("mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup :" + mJSONObj.ServiceLevelSelector[i].ServiceLevelGroup);
    }
    var chkLstFinal = chkList;
    if (document.getElementById("serviceLevelChange") != null) 
    {
     var selStr;
        selStr = document.getElementById("serviceprogram");
        if(element!="serviceLevelChange")
        {
        document.getElementById("serviceLevel"+element).value = chobj
        }
        
        else if(element=="serviceLevelChange")
        {
 document.getElementById(element).value = chobj;
 addText();
    }
   
    } else {
	//end
        document.getElementById("serviceLevel").innerHTML = chkLstFinal;
    }
}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -  End
//End of service level selctor.
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
// Sales Region Selector.
// This Function is used to get Sales Regions from the selectors
function showSalesRegionChild() {
    var url = "./salesRegionSelectorDispatch.do?methodName=onshowPopup";
    url += "&strHeirName=" + document.getElementById("strHeirName").value;
    url += "&strHeirStatus=" + document.getElementById("strHeirStatus").value;
    url += "&strNodeStatus=" + document.getElementById("strNodeStatus").value;
    url += "&opt=MULTIPLE";
    url += "&status=ACTIVE";
   	//alert(url);
    childwindow = window.open(url, "SalesRegionselector", "width=415,height=615,scrollbars,  resizable=yes");
    childwindow.creator = self;
    return false;
}

// call back function for SalesRegion Selector
function xtrack_salesregionselector(xStr) {
	//alert(xStr);
    var mJSONObj = eval("(" + xStr + ")");
    var x = mJSONObj.SalesRegionSelector.length;
    var salesRegionStr = "";
    var chkList = "";
    for (var i = 0; i < x; i++) {
        chkList = chkList + "<input type=\"checkbox\" id=\"selectedSalesRegions\" checked=\"true\" onChange=\"removeReqField();\" onClick=\"removeReqField();\" name=\"selectedSalesRegions\" value=\"" + mJSONObj.SalesRegionSelector[i].SalesRegionNumber + "%-%-%" + mJSONObj.SalesRegionSelector[i].SalesRegionName + "\"> " + mJSONObj.SalesRegionSelector[i].SalesRegionNumber + "<br>";
    }
    var chkLstFinal = chkList;   //divDefBegin + chkList + divDefEnd;
    document.getElementById("salesRegion").innerHTML = chkLstFinal;
}
// End of sales region selector.
////////////////////////////////////////////////////////////////////////////
	
	
// Function used to get BillToId/BillToName
function showBillToIdChild() {  
		// extra params : status=ACTIVE/(A) (null=ALL)
    childwindow = window.open("billtoselect.do?methodName=onshowPopup&context=GENERIC&pickerSelection=single&ccoUserId=&userType=I", "childWin", "width=992,height=550,scrollbars");
    childwindow.creator = self;
	// //alert(objs);
    return false;
}
	

//########################################################
function removeReqIndicators() {
    var spanIds = new Array();
    for (var cp = 1; cp < arguments.length; cp++) {
        spanIds[cp - 1] = arguments[cp];
    }
    for (var i = 0; i < arguments.length; i++) {
        document.getElementById(arguments[i]).innerHTML = "";
    }
	//removeReqFields(spanIds);
}
function removeReqIndicatorsSelector() {
    var spanIds = new Array();
    for (var cp = 1; cp < arguments.length; cp++) {
        spanIds[cp - 1] = arguments[cp];
    }
    var checkBoxes = document.getElementById(arguments[0]);
    //alert(checkBoxes);
    var checkBoxesArray = document.getElementsByName(arguments[0]);
    var countChecked = checkBoxesArray.length;
    for (var i = 0; i < checkBoxesArray.length; i++) {
		////alert(checkBoxesArray[i].checked);
        if (checkBoxesArray[i].checked) {
            countChecked = countChecked - 1;
			////alert(countChecked);
        }
    }
    //alert(countChecked + "  " + checkBoxesArray.length);
    if (countChecked == checkBoxesArray.length) {
        if (arguments[0] == "selectedInstalledAtSite") {
            intallAtSiteSelectorFlag = "false";
            //alert("all unselected install at sites   " + spanIds);
            restoreReqFields(spanIds);
        }
        if (arguments[0] == "selectedBillToID") {
            billToIDSelectorFlag = "false";
            //alert("all unselected bill tos");
            restoreReqFields(spanIds);
        }
    } else {
        if (arguments[0] == "selectedInstalledAtSite") {
            intallAtSiteSelectorFlag = "true";
            //alert("some selected install at sites   " + spanIds);
            removeReqFields(spanIds);
        }
        if (arguments[0] == "selectedBillToID") {
            billToIDSelectorFlag = "true";
            //alert("some selected bill tos");
            removeReqFields(spanIds);
        }
    }
}
function checkValue() {
    var spanIds = new Array();
    var parentDiv = arguments[0];
	
	////alert(document.getElementById(parentDiv).value);
    for (var cp = 0; cp < arguments.length; cp++) {
        spanIds[cp] = arguments[cp];
    }
    if (document.getElementById(parentDiv).value == "") {
        contractNumberFlag = "false";
        restoreReqFields(spanIds);
    } else {
        contractNumberFlag = "true";
    }
}
function restoreReqFields() {
    var spanIds = new Array();
    for (var i = 0; i < arguments.length; i++) {
        //alert(arguments[i]);
    }
    //alert("Inside resotre fields  ************" + contractNumberFlag + "   " + intallAtSiteSelectorFlag + "   " + billToIDSelectorFlag);
    if (contractNumberFlag == "false" && intallAtSiteSelectorFlag == "false" && billToIDSelectorFlag == "false") {
        //alert("Everything is false");
        for (var i = 0; i < arguments[0].length; i++) {
            document.getElementById(arguments[0][i]).innerHTML = "*";
        }
    }
    disableDependentFields();
}
function removeReqFields() {
    var spanIds = new Array();
    for (var i = 0; i < arguments.length; i++) {
        //alert(arguments[i]);
    }
	
	////alert("Inside remove fields  ************"+contractNumberFlag+"   "+intallAtSiteSelectorFlag+"   "+ billToIDSelectorFlag);
    if (contractNumberFlag == "true" || intallAtSiteSelectorFlag == "true" || billToIDSelectorFlag == "true") {
        for (var i = 0; i < arguments[0].length; i++) {
            document.getElementById(arguments[0][i]).innerHTML = "";
        }
    }
}
function verifyBillToContractNumber() {
    if (contractNumberFlag == "false" && billToIDSelectorFlag == "false" && document.getElementById(arguments[2]).value != "") {
        for (var i = 0; i < arguments.length - 1; i++) {
            document.getElementById(arguments[i]).innerHTML = "*";
        }
        warnings[warningsCounter] = "One or more required fields are missing";
        warningsCounter = warningsCounter + 1;
    }
}
function disableDependentFields() {
}




//////////
// Sorting function start
function sort() {
		////alert(arguments[0]);
		////alert(arguments[1]);
		////alert(arguments[2]);
		////alert(arguments[3]);
		//alert(arguments[4]);
    var parameters = new Array();
    parameters[0] = "sortID";
    parameters[1] = arguments[0];
    parameters[2] = "pageID";
    parameters[3] = "";
    parameters[4] = "tableID";
    parameters[5] = arguments[2];
    parameters[6] = "contextID";
    parameters[7] = arguments[3];
    parameters[8] = "method";
    parameters[9] = "sortContracts";
		
		//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
		//queryString = getSelectedCheckBoxes(docuForm);
		
		////alert(docuForm);
    queryString = getSelectedCheckBoxes(docuForm);
		////alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    XMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", arguments[1], parseMessages);
    document.getElementById("presentlySorted").value = arguments[0];
    document.getElementById("pageNumber").value = 1;
}

//CM to DownloadContractList Integration function - Arvind
function saveLastPageSelContracts() {
		//alert(arguments[0]);
		//alert(arguments[1]);
		//alert(arguments[2]);
		//alert(arguments[3]);
		//alert(arguments[4]);
    var parameters = new Array();
    parameters[0] = "sortID";
		//parameters[1]=arguments[0];
    parameters[1] = document.getElementById("presentlySorted").value;
		//alert('Sort id is '+document.getElementById('presentlySorted').value);
    parameters[2] = "pageID";
    parameters[3] = document.getElementById("pageNumber").value;
    parameters[4] = "tableID";
    parameters[5] = document.getElementById("tableIdForActions").value;
    parameters[6] = "contextID";
    parameters[7] = document.getElementById("cmContextForActions").value;
    parameters[8] = "method";
    parameters[9] = "paginateContracts";
		//parameters[10]='mainTableID';
    var mainTableId = document.getElementById("tableIdForActionsMainTable");
		
		//alert("main Table Id"+mainTableId);
    if (mainTableId != null || mainTableId != undefined) {
			//alert('came into group by loop');
        parameters[10] = "mainTableID";
        parameters[11] = mainTableId.value;
        parameters[9] = "paginateContractsGroupBy";
    }
		
		//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
		//queryString = getSelectedCheckBoxes(docuForm);
		
		//alert(docuForm);
    queryString = getSelectedCheckBoxes(docuForm);
		//alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    actionsXMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", "", actionsPopupCallbackFunctionCM, arguments[0]);
								 
		//document.getElementById('presentlySorted').value=arguments[0];
		//document.getElementById('pageNumber').value=1;
}
function actionsPopupCallbackFunctionCM(req, idToChange, actionToCall) {
	//alert('inside actionpopupcallback function ');
    var cmContext = document.getElementById("cmContextForActions").value;
    var tableId = document.getElementById("tableIdForActions").value;
    var mainTableId = document.getElementById("tableIdForActionsMainTable");
    var caseNumber="";
    
    if (mainTableId != null || mainTableId != undefined) {
			//alert('came into group by loop');
        tableId = mainTableId.value;
    }
    
    
     // Added for TD 2515 Change Service Level Start
	if(document.getElementById("caseNumber") !=null)
	{
	caseNumber=document.getElementById("caseNumber").value
	actionToCall = actionToCall + "&TableID=" + tableId + "&cmContext=" + cmContext + "&caseNumber=" + caseNumber;
	}
	else
	{
	//alert(cmContext+'  '+tableId);
    actionToCall = actionToCall + "&TableID=" + tableId + "&cmContext=" + cmContext;
	}
	
	   // Added for TD 2515 Change Service Level End

    window.open(actionToCall, "popup", "width=990,height=900,resizable=yes,scrollbars");
    
}
//Used for Extend Service Coverage action
function saveLastPageSelContractsESC() {
		//alert(arguments[0]);
		//alert(arguments[1]);
		//alert(arguments[2]);
		//alert(arguments[3]);
		//alert(arguments[4]);
    var parameters = new Array();
    parameters[0] = "sortID";
		//parameters[1]=arguments[0];
    parameters[1] = document.getElementById("presentlySorted").value;
		//alert('Sort id is '+document.getElementById('presentlySorted').value);
    parameters[2] = "pageID";
    parameters[3] = document.getElementById("pageNumber").value;
    parameters[4] = "tableID";
    parameters[5] = document.getElementById("tableIdForActions").value;
    parameters[6] = "contextID";
    parameters[7] = document.getElementById("cmContextForActions").value;
    parameters[8] = "method";
    parameters[9] = "paginateContracts";
		//parameters[10]='mainTableID';
    var mainTableId = document.getElementById("tableIdForActionsMainTable");
		
		//alert("main Table Id"+mainTableId);
    if (mainTableId != null || mainTableId != undefined) {
			//alert('came into group by loop');
        parameters[10] = "mainTableID";
        parameters[11] = mainTableId.value;
        parameters[9] = "paginateContractsGroupBy";
    }
		
		//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
		//queryString = getSelectedCheckBoxes(docuForm);
		
		//alert(docuForm);
    queryString = getSelectedCheckBoxes(docuForm);
		//alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    actionsXMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", "", actionsPopupCallbackFunctionESC, arguments[0]);
}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start
function saveLastPageSelContractsESCChangeService() {
		//alert(arguments[0]);
		//alert(arguments[1]);
		//alert(arguments[2]);
		//alert(arguments[3]);
		//alert(arguments[4]);
    var parameters = new Array();
    parameters[0] = "sortID";
		//parameters[1]=arguments[0];
    parameters[1] = document.getElementById("presentlySorted").value;
		//alert('Sort id is '+document.getElementById('presentlySorted').value);
    parameters[2] = "pageID";
    parameters[3] = document.getElementById("pageNumber").value;
    parameters[4] = "tableID";
    parameters[5] = document.getElementById("tableIdForActions").value;
    parameters[6] = "contextID";
    parameters[7] = document.getElementById("cmContextForActions").value;
    parameters[8] = "method";
		//parameters[9]='fromCMPageChangeService';
    parameters[9] = "paginateContracts";
		//parameters[10]='mainTableID';
    var mainTableId = document.getElementById("tableIdForActionsMainTable");
		
		//alert("main Table Id"+mainTableId);
    if (mainTableId != null || mainTableId != undefined) {
			//alert('came into group by loop');
        parameters[10] = "mainTableID";
        parameters[11] = mainTableId.value;
        parameters[9] = "paginateContractsGroupBy";
    }
		
		//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
		//queryString = getSelectedCheckBoxes(docuForm);
		
		//alert(docuForm);
    queryString = getSelectedCheckBoxes(docuForm);
		//alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    actionsXMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", "", actionsPopupCallbackFunctionCM, arguments[0]);
   
}

//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   End
function actionsPopupCallbackFunctionESC(req, idToChange) {
    var parameters = new Array();
	//alert('Inside actionsPopupCallbackFunctionESC');
    var cmContext = document.getElementById("cmContextForActions").value;
    var tableId = document.getElementById("tableIdForActions").value;
    var mainTableId = document.getElementById("tableIdForActionsMainTable");
		
	//alert("main Table Id"+mainTableId);
    if (mainTableId != null || mainTableId != undefined) {
			//alert('came into group by loop');
        tableId = mainTableId.value;
    }
    parameters[0] = "methodName";
    parameters[1] = "fromCMPage";
    parameters[2] = "TableID";
    parameters[3] = tableId;
    parameters[4] = "cmContext";
    parameters[5] = cmContext;
    var abc = "<tr><td><p align=\"center\"><img src=\"images/progressbar.gif\">&nbsp;<font size=\"3\">Processing your request.Please wait ....</font></td></tr>";
    document.getElementById("messageDiv").innerHTML = abc;
    actionsXMLHttpRequestSender("./extendSrvCoverage.do", parameters, "true", "GET", "100000000", "3", "extSrvDiv", actionsPopupCallbackESC_callQUOTE);
}
function actionsPopupCallbackESC_callQUOTE(req, idToChange) {
    var result = req.responseText;
    result = result.trim();
    if (result.indexOf("procId") != -1) {
        document.getElementById("messageDiv").innerHTML = "";
        document.getElementById("extSrvDiv").innerHTML = result;
        var procId = document.getElementById("procId").value;
		//alert('procId '+ procId);
	   //alert('Inside procId not null block');
        var ocmUrl = getOCMBaseURL();
		//alert(ocmUrl);
        window.open(ocmUrl + "/ocmPom.do?methodName=loadPage&procId=" + procId + "&appId=XXCSS_CM&action=extend", "childWin", "width=700,height=600,scrollbars,resizable=yes");
    } else {
        document.getElementById("messageDiv").innerHTML = result;
    }
}




//////////
// Paginate function start
function paginate() {
	////alert(arguments[0]);
	////alert(arguments[1]);
	////alert(arguments[2]);
	////alert(arguments[3]);
	////alert(arguments[4]);
	
	////alert(document.getElementById(arguments[5]).value);
    var selectObj = document.getElementById(arguments[4]).value;
	
	////alert(selectObj);
    var optionsLen = document.getElementById(arguments[4]).length;
    var parameters = new Array();
    parameters[0] = "sortID";
    parameters[1] = document.getElementById(arguments[5]).value;
    parameters[2] = "pageID";
	//parameters[3]=arguments[0];
    parameters[4] = "tableID";
    parameters[5] = arguments[2];
    parameters[6] = "contextID";
    parameters[7] = arguments[3];
    parameters[8] = "method";
    parameters[9] = "paginateContracts";
    if (arguments[0] == "NEXT") {
        parameters[3] = parseInt(selectObj) + 1;
        if (parameters[3] > optionsLen) {
            alert("In Last Page, no next page available");
            return;
        }
        document.getElementById(arguments[4]).value = parameters[3];
    }
    if (arguments[0] == "PREVIOUS") {
        parameters[3] = parseInt(selectObj) - 1;
        if (parameters[3] == 0) {
            alert("Already in First Page");
            return;
        }
        document.getElementById(arguments[4]).value = parameters[3];
    }
    if (arguments[0] == "LAST") {
        parameters[3] = "LAST";
        document.getElementById(arguments[4]).value = optionsLen;
    }
    if (arguments[0] == "FIRST") {
        parameters[3] = "FIRST";
        document.getElementById(arguments[4]).value = 1;
    }
    if (arguments[0] == arguments[4]) {
        parameters[3] = parseInt(selectObj);
    }
	
	//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
    queryString = getSelectedCheckBoxes(docuForm);
	////alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    XMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", arguments[1], parseMessages);
}
function changeClass() {
	//alert(arguments[0]);
	//alert('class style '+document.getElementById(arguments[0]).style);
	//alert('class name '+document.getElementById(arguments[0]).style.className);
}
function sortGroupBy() {

	////alert(arguments[0]);
	////alert(arguments[1]);
	////alert(arguments[2]);
	////alert(arguments[3]);
    var parameters = new Array();
    parameters[0] = "sortID";
    parameters[1] = arguments[0];
    parameters[2] = "pageID";
    parameters[3] = "";
    parameters[4] = "tableID";
    parameters[5] = arguments[2];
    parameters[6] = "contextID";
    parameters[7] = arguments[3];
    parameters[8] = "method";
    parameters[9] = "sortContractsGroupBy";
    parameters[10] = "mainTableID";
    parameters[11] = arguments[4];
	
	//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
    queryString = getSelectedCheckBoxes(docuForm);
	////alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    XMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", arguments[1], parseMessages);
    document.getElementById("presentlySorted").value = arguments[0];
    document.getElementById("pageNumber").value = 1;
}




//////////
// Paginate for group by function start
function paginateContractsGroupBy() {
		////alert(arguments[0]);
		////alert(arguments[1]);
		////alert(arguments[2]);
		////alert(arguments[3]);
		////alert(arguments[4]);
		////alert(arguments[5]);
		////alert(arguments[6]);
		
		////alert(document.getElementById(arguments[5]).value);
    var selectObj = document.getElementById(arguments[4]).value;
		
		////alert(selectObj);
    var optionsLen = document.getElementById(arguments[4]).length;
    var parameters = new Array();
    parameters[0] = "sortID";
    parameters[1] = document.getElementById(arguments[5]).value;
    parameters[2] = "pageID";
		//parameters[3]=arguments[0];
    parameters[4] = "tableID";
    parameters[5] = arguments[2];
    parameters[6] = "contextID";
    parameters[7] = arguments[3];
    parameters[8] = "method";
    parameters[9] = "paginateContractsGroupBy";
    parameters[10] = "mainTableID";
    parameters[11] = arguments[6];
    if (arguments[0] == "NEXT") {
        parameters[3] = parseInt(selectObj) + 1;
        if (parameters[3] > optionsLen) {
				//alert("In Last Page, no next page available");
            return;
        }
        document.getElementById(arguments[4]).value = parameters[3];
    }
    if (arguments[0] == "PREVIOUS") {
        parameters[3] = parseInt(selectObj) - 1;
        if (parameters[3] == 0) {
				//alert("Already in First Page");
            return;
        }
        document.getElementById(arguments[4]).value = parameters[3];
    }
    if (arguments[0] == "LAST") {
        parameters[3] = "LAST";
        document.getElementById(arguments[4]).value = optionsLen;
    }
    if (arguments[0] == "FIRST") {
        parameters[3] = "FIRST";
        document.getElementById(arguments[4]).value = 1;
    }
    if (arguments[0] == arguments[4]) {
        parameters[3] = parseInt(selectObj);
    }
		
		//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
    queryString = getSelectedCheckBoxes(docuForm);
		////alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
        parameters[parameterLength + i] = queryString[i];
    }
    XMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", arguments[1], parseMessages);
}
function changeClass() {
////alert(arguments[0]);
}
function expandGroupBy() {
	//alert(arguments[0]);
	//alert(arguments[1]);
	//alert(arguments[2]);
	//alert(arguments[3]);
	//alert(arguments[4]);
	//alert(arguments[5]);
	//alert(arguments[6]);
    var parameters = new Array();
    parameters[0] = "billToIdUniqueKey";
    parameters[1] = arguments[0];
    parameters[2] = "billToTableId";
    parameters[3] = arguments[1];
    parameters[4] = "mainTableId";
    parameters[5] = arguments[2];
    parameters[8] = "method";
    parameters[9] = "expandCollapseContracts";
    parameters[10] = "billToOrInstSiteLocation";
    parameters[11] = arguments[3];
    parameters[12] = "earliestEndDate";
    parameters[13] = arguments[4];
    parameters[14] = "contextID";
    parameters[15] = arguments[5];
    parameters[16] = "selectedbillToOrInstSiteLocation";
    parameters[18] = "billToOrInstSiteName";
    parameters[19] = arguments[6];
    var idOfCheckBox = arguments[0] + ";" + arguments[3];
	////alert(idOfCheckBox);
    var checkObject = document.getElementById(idOfCheckBox).checked;
	////alert('check box object is'+checkObject);
    parameters[17] = document.getElementById(idOfCheckBox).checked;
    toggleSwitchId = "toggleSwitch-" + arguments[0];
	////alert(toggleSwitchId);
    var switchId = document.getElementById(toggleSwitchId).value;
	////alert(switchId);
    if (switchId == "") {
        XMLHttpRequestSender("./contractMgrActions.do", parameters, "true", "GET", "100000000", "3", arguments[0], parseMessages);
        document.getElementById(toggleSwitchId).value = "expanded";
    } else {
		////alert('inside else'+switchId);
        document.getElementById(arguments[0]).innerHTML = "";
        document.getElementById(toggleSwitchId).value = "";
        return;
    }
}
function verifyRequiredFieldsServiceLevel() {
   // alert(arguments[0] + "            " + arguments[1]);
    //alert(document.getElementById(arguments[0]).value);
    if (verifyContractBillTo(arguments[0], arguments[1]) == "true") {
        showServiceLevelsChild();
    }
}



//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start 
  
function verifyRequiredFieldsChangeServiceLevel() {
    element =arguments[1];
    //alert(arguments[0]);
    //alert(document.getElementById(arguments[0]).value);
    //alert("1--" + arguments[1]);
    //alert("2--" + element);
    showServiceLevelsChild();
    
}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   End
function verifyRequiredFieldsSalesRegion() {
    if (verifyContractBillTo(arguments[0], arguments[1]) == "true") {
        showSalesRegionChild();
    }
}
function isBillToSelected(inputObj) {
    var countChecked = 0;
    var count = inputObj.length;
	//alert(inputObj.length);
    for (var i = 0; i < inputObj.length; i++) {
		//alert(inputObj[i].checked);
        if (inputObj[i].checked) {
            countChecked = countChecked + 1;
			 //alert('cehck field  '+countChecked);
        }
    }
    //alert('# of check fields are  '+countChecked+'  '+count);
    //means selected atleast 1
    if (count > 0 && countChecked > 0) {
        return true;
    } else {
        if (count > 0 && countChecked == 0) {
	    	//alert('insdie false');
	    	//means 0 selected bill tos
            return false;
        }
    }
}

//Function added for customer Selector validation. 
function isCustomerNameSelected(inputObj) {
    var countChecked = 0;
    var count = inputObj.length;
	//alert(inputObj.length);
    for (var i = 0; i < inputObj.length; i++) {
		//alert(inputObj[i].checked);
        if (inputObj[i].checked) {
            countChecked = countChecked + 1;
			 //alert('cehck field  '+countChecked);
        }
    }
    //alert('# of check fields are  '+countChecked+'  '+count);
    //means selected atleast 1
    if (count > 0 && countChecked > 0) {
        return true;
    } else {
        if (count > 0 && countChecked == 0) {
	    	//alert('insdie false');
	    	//means 0 selected bill tos
            return false;
        }
    }
}
function verifyContractBillTo() {
	//alert(arguments[0]+'   '+arguments[1]);
    if (document.getElementById(arguments[0]).value == "" && !isBillToSelected(document.getElementsByName(arguments[1])) && !isCustomerNameSelected(document.getElementsByName("selectedCustomerName"))) {
		//alert('setting filters');
        myErrorDisplay1.show();
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.addError(["Missing either the Contract Number, Bill To ID or Install At Customer Name.", "Please enter the required fields"]);
        if (document.getElementById(arguments[0]).value == "") {
            contractNumberFlag == "false";
        }
        if (!isBillToSelected(document.getElementsByName(arguments[1]))) {
            billToIDSelectorFlag = "false";
        }
        return "false";
    } else {
			//alert('trying to clear all errors');
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.hide();
        if (document.getElementById(arguments[0]).value != "") {
            contractNumberFlag == "true";
        }
        if (isBillToSelected(document.getElementsByName(arguments[1]))) {
            billToIDSelectorFlag = "true";
        }
        return "true";
    }
}
function verifyContractBillToOnlyForStatus() {
    if (document.getElementById(arguments[0]).value == "" && !isBillToSelected(document.getElementsByName(arguments[1])) && !isCustomerNameSelected(document.getElementsByName("selectedCustomerName"))) {
		//alert('setting filters');
        if (document.getElementById(arguments[0]).value == "") {
            contractNumberFlag = "false";
            document.getElementById("ContractIndicator").innerHTML = "*";
        }
        if (!isBillToSelected(document.getElementsByName(arguments[1]))) {
            billToIDSelectorFlag = "false";
            document.getElementById("BillToIdIndicator").innerHTML = "*";
        }
        if (!isCustomerNameSelected(document.getElementsByName("selectedCustomerName"))) {
			//billToIDSelectorFlag="false";
            document.getElementById("CustomerSelectorIndicator").innerHTML = "*";
        }
        return "false";
    } else {
			//alert('trying to clear all errors');
        if (document.getElementById(arguments[0]).value != "") {
            contractNumberFlag = "true";
        }
        if (isBillToSelected(document.getElementsByName(arguments[1]))) {
            billToIDSelectorFlag = "true";
        }
        document.getElementById("BillToIdIndicator").innerHTML = "";
        document.getElementById("ContractIndicator").innerHTML = "";
        document.getElementById("CustomerSelectorIndicator").innerHTML = "";
        return "true";
    }
}
function toggleGrayOuts() {
    if (verifyContractBillToOnlyForStatus("contractNumbers", "selectedBillToID") == "false") {
		//alert('nothing selected so disable status');
        disableAllStatus();
    } else {
		//alert('can enable status');
        enableAllStatus();
    }
}
function enableAllStatus() {
    var statusCheckBoxes = document.getElementsByName("contractStatus");
		//alert(statusCheckBoxes);
    for (var i = 0; i < statusCheckBoxes.length; i++) {
        statusCheckBoxes[i].disabled = false;
    }
    document.getElementById("earliestEndDateFrom").disabled = false;
    document.getElementById("earliestEndDateTo").disabled = false;
}
function disableAllStatus() {
    var statusCheckBoxes = document.getElementsByName("contractStatus");
		//alert(statusCheckBoxes);
    for (var i = 0; i < statusCheckBoxes.length; i++) {
        statusCheckBoxes[i].disabled = true;
    }
    document.getElementById("earliestEndDateFrom").disabled = true;
    document.getElementById("earliestEndDateTo").disabled = true;
}
function verifyDates() {
    fromDate = "true";
    toDate = "true";
    var dateFrom = document.getElementById(arguments[0]).value;
    var dateTo = document.getElementById(arguments[1]).value;
    //validateDates(dateFrom, dateTo);
    
    
	
    //alert(dateFrom+"           "+dateTo);
    if (dateFrom == "" && dateTo != "") {
        ////alert("Please select even the from date");
        warnings[warningsCounter] = "Please select both the corresponding FROM and TO dates";
        warningsCounter = warningsCounter + 1;
        fromDate = "false";
        toDate = "true";
        return "false";
    }
    if (dateTo == "" && dateFrom != "") {
        warnings[warningsCounter] = "Please select both the corresponding FROM and TO dates";
        warningsCounter = warningsCounter + 1;
        fromDate = "true";
        toDate = "false";
        return "false";
    }
    if (dateTo == "" && dateFrom == "") {
        toDate = "true";
        fromDate = "true";
    }
    if (dateTo != "" && dateFrom != "") {
        if (validateDates(dateFrom, dateTo) == null) {
			//alert('null returned');
            return "false";
        }
        toDate = "true";
        fromDate = "true";
    }
}
function submitFilters() {
	//alert("Submitting the filters");
    if (verifyContractNumber("contractNumbers") == "false") {
		//alert('returned false');
        return;
    }
	//if(validateDates('earliestEndDateFrom','earliestEndDateTo') == null){
	//	//alert('null returned');
	//	return;
	//}
    if (verifyDates("earliestEndDateFrom", "earliestEndDateTo") == "false") {
		//alert('false returned'+fromDate+'  '+toDate);
		//return;
    }
    var dateFrom = document.getElementById("earliestEndDateFrom").value;
    var dateTo = document.getElementById("earliestEndDateTo").value;
    if (dateTo != "" && dateFrom != "") {
        if (validateDates(dateFrom, dateTo) == null) {
			//alert('null returned');
            return "false";
        }
        toDate = "true";
        fromDate = "true";
    }
    if (verifyContractBillTo("contractNumbers", "selectedBillToID") == "false") {
		//alert('Nothing entered for search');
        return;
    } else {
        if (fromDate == "false" || toDate == "false") {
            myErrorDisplay1.show();
            myErrorDisplay1.clearAllErrors();
            if (fromDate == "false") {
                myErrorDisplay1.addError(["Please enter \"Earliest End Date From\" ", "Please verify your dates"], 0, 0);
            }
            if (toDate == "false") {
                myErrorDisplay1.addError(["Please enter \"Earliest End Date To\" ", "Please verify your dates"], 0, 0);
            }
        } else {
            myErrorDisplay1.clearAllErrors();
            myErrorDisplay1.hide();
            if (arguments[2] == null || arguments[2] == "") {
					//alert(arguments[2]);
                document.getElementById(arguments[0]).value = "none";
            }
				////alert('Submitting errors');
            submitFilterCriteria_CM(arguments[1], "contact_manager_table");
        }
    }
}
function submitFiltersSave() {
	//alert("Submitting the filters");
	//if(verifyContractNumber('contractNumbers')=='false'){
		//alert('returned false');
	//	return;
	//}
	
	//if(verifyContractBillTo('contractNumbers','selectedBillToID')=="false"){
		//alert('Nothing entered for search');
	//	return;
	//}else{
    if (verifyFilters() == "false") {
		//alert('not doing anything');
        myErrorDisplay1.show();
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.addError(["Filter values must be entered.", ""]);
    } else {
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.hide();
        if (arguments[2] == null || arguments[2] == "") {
			//alert(arguments[2]);
            document.getElementById(arguments[0]).value = "none";
        }
		////alert('Submitting errors');
        submitFilterCriteria_CM(arguments[1], "contact_manager_table_form");
    }
}
function validateDates() {
    var fromDate = arguments[0];
    var toDate = arguments[1];

//alert(fromDate+'  '+toDate);
    if (fromDate == "" && toDate == "") {
        return "Not a problem";
    }
    var d1 = parseDate(fromDate);
    if (d1 == null) {
	//alert('Invalide date');
        myErrorDisplay1.show();
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.addError(["Invalid FROM date entered ", "Please use the calendar. The date format is dd-MMM-yyyy"]);
    } else {
	//alert(d1);
	//alert(formatDate(d1,'MMM dd, yyyy'));
	//alert(formatDate(d1,'d-MM-y'));
    }
    var d2 = parseDate(toDate);
    if (d2 == null) {
	//alert('Invalide date');
        myErrorDisplay1.show();
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.addError(["Invalid TO date entered ", "Please use the calendar. The date format is dd-MMM-yyyy "]);
    } else {
	//alert(d2);
	//alert(formatDate(d2,'MMM dd, yyyy'));
	//alert(formatDate(d1,'d-MM-y'));
    }
    if (d1 == null) {
        return null;
    }
    if (d2 == null) {
        return null;
    }
    compareDatesVar = compareDates(formatDate(d1, "d-MM-y"), "d-MM-y", formatDate(d2, "d-MM-y"), "d-MM-y");
    if (compareDates(formatDate(d1, "d-MM-y"), "d-MM-y", formatDate(d2, "d-MM-y"), "d-MM-y") >= 1) {
	//alert(compareDatesVar+'  dates are values ');
        myErrorDisplay1.show();
        myErrorDisplay1.clearAllErrors();
        myErrorDisplay1.addError(["From Date should be before To Date ", "Please use the calendar to adjust the dates"]);
        return null;
	//alert(compareDatesVar+'  dates are values after');
    }
    return "true";
}
function verifyContractNumber() {
//alert('changed');
    var cNumbers = document.getElementById(arguments[0]).value;
    var splitCNumbers = cNumbers.split(",");
    var NoofContractsEntered = splitCNumbers.length;
    var countWildCards = 0;
    //alert(cNumbers);
    for (var i = 0; i < splitCNumbers.length; i++) {
        countWildCards = splitCNumbers[i].split("~").length;
        countWildCards = splitCNumbers[i].split("`").length + countWildCards;
        countWildCards = splitCNumbers[i].split("!").length + countWildCards;
        countWildCards = splitCNumbers[i].split("@").length + countWildCards;
        countWildCards = splitCNumbers[i].split("#").length + countWildCards;
        countWildCards = splitCNumbers[i].split("$").length + countWildCards;
        countWildCards = splitCNumbers[i].split("%").length + countWildCards;
        countWildCards = splitCNumbers[i].split("^").length + countWildCards;
        countWildCards = splitCNumbers[i].split("&").length + countWildCards;
        countWildCards = splitCNumbers[i].split("*").length + countWildCards;
        countWildCards = splitCNumbers[i].split("(").length + countWildCards;
        countWildCards = splitCNumbers[i].split(")").length + countWildCards;
        countWildCards = splitCNumbers[i].split("-").length + countWildCards;
        countWildCards = splitCNumbers[i].split("_").length + countWildCards;
        countWildCards = splitCNumbers[i].split("+").length + countWildCards;
        countWildCards = splitCNumbers[i].split("=").length + countWildCards;
        countWildCards = splitCNumbers[i].split("{").length + countWildCards;
        countWildCards = splitCNumbers[i].split("}").length + countWildCards;
        countWildCards = splitCNumbers[i].split("[").length + countWildCards;
        countWildCards = splitCNumbers[i].split("]").length + countWildCards;
        countWildCards = splitCNumbers[i].split("'").length + countWildCards;
        countWildCards = splitCNumbers[i].split("\\").length + countWildCards;
        countWildCards = splitCNumbers[i].split("\"").length + countWildCards;
        countWildCards = splitCNumbers[i].split(":").length + countWildCards;
        countWildCards = splitCNumbers[i].split(";").length + countWildCards;
        countWildCards = splitCNumbers[i].split("<").length + countWildCards;
        countWildCards = splitCNumbers[i].split(">").length + countWildCards;
        countWildCards = splitCNumbers[i].split(")").length + countWildCards;
        countWildCards = splitCNumbers[i].split(")").length + countWildCards;
        if (countWildCards > 29) {
		//alert( splitCNumbers[i] +'  comething wrong with cnumber '+countWildCards);
		//NoofContractsEntered = NoofContractsEntered +1;
            if (NoofContractsEntered >= 2) {
		//alert('No of contracts entered  '+splitCNumbers.length);
                myErrorDisplay1.show();
                myErrorDisplay1.clearAllErrors();
                myErrorDisplay1.addError(["A wildcard cannot be used in conjunction with comma separated list", "Please verify the contracts entered."]);
                return "false";
            }
        }
    }
    if (NoofContractsEntered == 1 && countWildCards > 29) {
	//alert(document.getElementById('contractNumbers').value);
        if (cNumbers.length < 5) {
            myErrorDisplay1.show();
            myErrorDisplay1.clearAllErrors();
            myErrorDisplay1.addError(["Enter at least 4 characters for the field which failed this check", "Please verify the contract(s) entered."]);
            return "false";
        }
    }
}
function getCSDPage(id) {

	////alert('Contract number '+id);
    var myform = id;
	////alert('came into '+myform);
	////alert('The hidden field value is '+document.forms[myform]);
    document.forms[myform].submit();
}
function refreshRequest() {
	//alert('document unloaded ');
    var queryString = new Array();
    queryString[0] = "method";
    queryString[1] = "loadContractMgr";
    document.getElementById(arguments[0]).value = "none";
    submitFilterCriteria_CM("setFilters", "contact_manager_table_form");
    XMLHttpRequestSender("./getContractMgr.do", queryString, "true", "GET", "100000000", "3", "", parseMessage);
}
function parseMessage() {
}
function clearFiltersCM() {
	//alert(arguments[0]);
	//alert(arguments[1]);
    document.getElementById("installedSites").innerHTML = "";
    document.getElementById("billToIds").innerHTML = "";
    document.getElementById("customerSelector").innerHTML = "";
    document.getElementById("earliestEndDateFrom").value = "";
    document.getElementById("earliestEndDateTo").value = "";
    document.getElementById("contractNumbers").value = "";
    document.getElementById("serviceLevel").innerHTML = "";
    if (arguments[1] == "I") {
        document.getElementById("salesRegion").innerHTML = "";
        var statusCheckBoxes = document.getElementsByName("contractStatus");
		//alert(statusCheckBoxes);
        for (var i = 0; i < statusCheckBoxes.length; i++) {
            statusCheckBoxes[i].checked = false;
        }
    }
    if (arguments[1] == "E") {
		
		//document.getElementById('salesRegion').innerHTML ="";
		//var statusCheckBoxes = document.getElementsByName('contractStatus');
		//alert(statusCheckBoxes);
		//for(var i = 0; i<statusCheckBoxes.length;i++){
		//	statusCheckBoxes[i].checked =false;
		//}
    }
    document.getElementById("BillToIdIndicator").innerHTML = "*";
    document.getElementById("CustomerSelectorIndicator").innerHTML = "*";
    document.getElementById("ContractIndicator").innerHTML = "*";
}
function verifyFilters() {
    var flag = "false";
    if (document.getElementById("earliestEndDateFrom").value != "") {
        flag = "true";
    }
    if (document.getElementById("earliestEndDateTo").value != "") {
        flag = "true";
    }
    if (document.getElementById("contractNumbers").value != "") {
        flag = "true";
    }
    var statusCheckBoxes = document.getElementsByName("contractStatus");
	//alert(statusCheckBoxes);
    for (var i = 0; i < statusCheckBoxes.length; i++) {
        if (statusCheckBoxes[i].checked == true) {
            flag = "true";
        }
    }
    var installCheckBoxes = document.getElementsByName("selectedInstalledAtSite");
	//alert(installCheckBoxes);
    for (var i = 0; i < installCheckBoxes.length; i++) {
        if (installCheckBoxes[i].checked == true) {
            flag = "true";
        }
    }
    var billToCheckBoxes = document.getElementsByName("selectedBillToID");
	//alert(billToCheckBoxes);
    for (var i = 0; i < billToCheckBoxes.length; i++) {
        if (billToCheckBoxes[i].checked == true) {
            flag = "true";
        }
    }
	
	
	//Adding for defect 5985 successor. for validating customer name field. 
    var customerNameCheckBoxes = document.getElementsByName("selectedCustomerName");
	//alert(billToCheckBoxes);
    for (var i = 0; i < customerNameCheckBoxes.length; i++) {
        if (customerNameCheckBoxes[i].checked == true) {
            flag = "true";
        }
    }
    var serviceCheckBoxes = document.getElementsByName("selectedServiceLevels");
	//alert(serviceCheckBoxes);
    for (var i = 0; i < serviceCheckBoxes.length; i++) {
        if (serviceCheckBoxes[i].checked == true) {
            flag = "true";
        }
    }
    var salesCheckBoxes = document.getElementsByName("selectedSalesRegions");
	//alert(salesCheckBoxes.length);
    for (var i = 0; i < salesCheckBoxes.length; i++) {
		//alert(salesCheckBoxes[i].checked);
        if (salesCheckBoxes[i].checked == true) {
            flag = "true";
        }
    }
	
	
	//alert(flag);
    return flag;
}

//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start
function casenoApplySubmit()
   {
				var caseNumObj=document.getElementById('caseNumber').value;
				if(caseNumObj=="")
				{  
				if(window.showModalDialog){
					window.showModalDialog("jsp/cm/ErrorMess.jsp","","help:no;dialogHeight:200px;dialogWidth:400px;dialogLeft:300px;dialogRight:300px;status:no;scroll:no;");
				}else{
					window.open("jsp/cm/ErrorMess.jsp","","dependent=YES,dialog=YES,modal=YES,resizable=NO,status=0,menubar=0,scrollbar=0,help:no,toolbar=0,dialogHeight:120px,dialogWidth:300px,dialogLeft:300px,dialogRight:300px,status:no")
				}
					//window.showModalDialog("jsp/cm/ErrorMess.jsp","","help:no;dialogHeight:200px;dialogWidth:400px;dialogLeft:300px;dialogRight:300px;status:no;scroll:no;");
					return;
				}
				else
				{
				selectAllAlert();
				//alert(arguments[0]);
				//alert(arguments[1]);
				//alert(arguments[2]);
				toggleCheckboxesInGroupApplySubmit(arguments[0], arguments[1],arguments[2]);
				saveLastPageSelContractsChgServiceLvl('./extendSrvCoverage.do?methodName=fromCMPageChangeService');
				}
	}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   End
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start
function casenoSubmit()
		{
	var caseNumObj=document.getElementById('caseNumber').value;
	if(caseNumObj=="")
				{  
				if(window.showModalDialog){
					window.showModalDialog("jsp/cm/ErrorMess.jsp","","help:no;dialogHeight:200px;dialogWidth:400px;dialogLeft:300px;dialogRight:300px;status:no;scroll:no;");
				}else{
					window.open("jsp/cm/ErrorMess.jsp","","dependent=YES,dialog=YES,modal=YES,resizable=NO,status=0,menubar=0,scrollbar=0,help:no,toolbar=0,dialogHeight:120px,dialogWidth:300px,dialogLeft:300px,dialogRight:300px,status:no")
				}
					//window.showModalDialog("jsp/cm/ErrorMess.jsp","","help:no;dialogHeight:200px;dialogWidth:400px;dialogLeft:300px;dialogRight:300px;status:no;scroll:no;");
					return;
				}
			{
			saveLastPageSelContractsChgServiceLvl('./extendSrvCoverage.do?methodName=fromCMPageChangeService');
			}	
		}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   End

//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start
function  paginateSerLvl() {
	var selectObj = document.getElementById(arguments[4]).value;
    var optionsLen = document.getElementById(arguments[4]).length;
    var parameters = new Array();
    parameters[0] = "sortID";
    parameters[1] = document.getElementById(arguments[5]).value;
    parameters[2] = "pageID";
	//parameters[3]=arguments[0];
    parameters[4] = "tableID";
    parameters[5] = arguments[2];
    parameters[6] = "contextID";
    parameters[7] = arguments[3];
    parameters[8] = "method";
    parameters[9] = "paginateContractsSerLvl";
    if (arguments[0] == "NEXT") {
        parameters[3] = parseInt(selectObj) + 1;
        if (parameters[3] > optionsLen) {
            alert("In Last Page, no next page available");
            return;
        }
        document.getElementById(arguments[4]).value = parameters[3];
    }
    if (arguments[0] == "PREVIOUS") {
        parameters[3] = parseInt(selectObj) - 1;
        if (parameters[3] == 0) {
            alert("Already in First Page");
            return;
        }
        document.getElementById(arguments[4]).value = parameters[3];
    }
    if (arguments[0] == "LAST") {
        parameters[3] = "LAST";
        document.getElementById(arguments[4]).value = optionsLen;
    }
    if (arguments[0] == "FIRST") {
        parameters[3] = "FIRST";
        document.getElementById(arguments[4]).value = 1;
    }
    if (arguments[0] == arguments[4]) {
        parameters[3] = parseInt(selectObj);
    }
	
	//var docuForm = document.forms[3]; //Specific reference to form by sequence for NS
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
   var temp ="true";
    var temp1 ="";
    var temp2 = new Array();
    queryString = getSelectedCheckBoxes(docuForm);
	////alert(queryString);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
   // alert("queryString["+i+"]::"+queryString[i]);
    if(queryString[i].indexOf("-")!=-1)
    {
  temp2=queryString[i].split("-");
    if(document.getElementById("serviceLevel"+queryString[i].substring(0,queryString[i].indexOf("-")))!=null)
    {
    temp1=document.getElementById("serviceLevel"+queryString[i].substring(0,queryString[i].indexOf("-"))).value;
    
    //alert("temp1"+temp1);
    if((temp1=="")&&(temp2[1]=="true"))
    {
    alert("Please Enter The New Service Level For Checked Contracts");
    temp="false";
    break;
    }
    queryString[i]=queryString[i]+","+document.getElementById("serviceLevel"+queryString[i].substring(0,queryString[i].indexOf("-"))).value;
     }
    }
        parameters[parameterLength + i] = queryString[i];
    }
    if(temp=="true")
   {
   //alert("TESTING!@#");
    XMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", arguments[1], parseMessages);
}
}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -  End
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF -   Start
function saveLastPageSelContractsChgServiceLvl() {
		//alert(arguments[0]);
		//alert(arguments[1]);
    var parameters = new Array();
    parameters[0] = "sortID";
		//parameters[1]=arguments[0];
    parameters[1] = document.getElementById("presentlySorted").value;
		//alert('Sort id is '+document.getElementById('presentlySorted').value);
    parameters[2] = "pageID";
    parameters[3] = document.getElementById("pageNumber").value;
    parameters[4] = "tableID";
    parameters[5] = document.getElementById("tableIdForActions").value;
    parameters[6] = "contextID";
    parameters[7] = document.getElementById("cmContextForActions").value;
    parameters[8] = "sessionLocator";
    parameters[9] = document.getElementById("sessionLocator").value;
    
    parameters[10] = "method";
    parameters[11] = "paginateContractsSerLvl";
    var mainTableId = document.getElementById("tableIdForActionsMainTable");
    if (mainTableId != null || mainTableId != undefined) {
        parameters[12] = "mainTableID";
        parameters[13] = mainTableId.value;
        parameters[11] = "paginateContractsGroupBy";
    }
    var docuForm = document.getElementById("presentlySorted").form;
    var queryString = new Array();
	 var temp ="true";
    var temp1 ="";
    var temp2 = new Array();
  
    queryString = getSelectedCheckBoxes(docuForm);
    var parameterLength = parameters.length;
    for (var i = 0; i < queryString.length; i++) {
       
       if(queryString[i].indexOf("-")!=-1)
    {
    
		temp2=queryString[i].split("-");								   	
    if(document.getElementById("serviceLevel"+queryString[i].substring(0,queryString[i].indexOf("-")))!=null)
    {
    temp1=document.getElementById("serviceLevel"+queryString[i].substring(0,queryString[i].indexOf("-"))).value;
    //alert("temp1"+temp1);
    if((temp1=="")&&(temp2[1]=="true"))
    {
    temp="false";
    alert("Please Enter The New Service Level For Checked Contracts");
    break;
    }
    queryString[i]=queryString[i]+","+document.getElementById("serviceLevel"+queryString[i].substring(0,queryString[i].indexOf("-"))).value;
    }
    }
        parameters[parameterLength + i] = queryString[i];
    }
    if(temp=="true")
    
    {
    actionsXMLHttpRequestSender("./performTableActions.do", parameters, "true", "GET", "100000000", "3", "", actionsPopupCallbackFunctionCM, arguments[0]);
   	}
}

function addText()
{

//var start=document.getElementById("changeservicelevel").value;
var end=document.getElementById("changeservicelevelend").value;
var total=null;
var holder=null;
var holder1=null;
for(var i=0;i<end;i++)
{
holder=parseInt(i)+1;
holder="txt"+holder;
holder1=document.getElementById(holder).value;
holder1="serviceLevel"+holder1;
document.getElementById(holder1).value=document.getElementById("serviceLevelChange").value;
}
}
//24-OCt-2007 - Added for TD 2515 Change Service Level Synergy WOF - End

//adding function to enable and disable * sign next to mandatory fields as part of SSO for Q2FY12 -by  vibk

function toggleIndicator_focus(objlbl)
{
  document.getElementById(objlbl).innerHTML = "";
}


function toggleIndicator_blur(objlbl,objtxt)
{
var newHTML;
	var str= document.getElementById(objtxt).value;
	if (str != "") 
	{
		newHTML = "";
	}
	else
	{
		newHTML = "<span style='color:red;font-size:14pt'>*</span>";
	}
	document.getElementById(objlbl).innerHTML = newHTML;
}


function enable()
{
 	
 	var elements = document.getElementsByTagName("*");
 	var elength=elements.length;
 	
 	
 	var flag =false;
	
	
   for (i=0; i<elength; i++)
   {
       
	       var type=elements[i].type;
	       
	       
	       
	      // <!-- Added  as part of Q1FY13 TnC Changes by vibk  Coverage_Duration_Override -->
	       
	       if (type=="checkbox" && elements[i].checked && elements[i].id == "MAT_VO_TYPE_CHK_DURATION_COVE")
	    	{
	    	   	var message="If Coverage Duration override is checked, then Deal ID or Proof of Purchase information must be provided in the Notes field";
	    	   	alert(message);
	    	 }
	       
	       
	       // End of Q1FY13 TnC Changes -->
	       
	       if (type=="checkbox" && elements[i].checked && elements[i].id != "transactLine")
	      	{
	         flag=true;
	      	}
   }
   var newhtml="<span style='color:red;font-size:14pt'>*</span>";
   if (flag)
   {
 
	   	if (document.getElementById("mat_vo_initiator").value == "") 
	   	{
	   	document.getElementById("lblrequestor").innerHTML=newhtml;
	   	}
	   	else
		    {
		    	document.getElementById("lblrequestor").innerHTML="";
		    }
		    
		    if (document.getElementById("mat_vo_approvername").value == "") 
	   	{
	   	document.getElementById("lblapprover").innerHTML=newhtml;
	   	}
	   	else
		    {
		    	document.getElementById("lblapprover").innerHTML="";
		    }
		    
		    
	
			if (document.getElementById("mat_vo_customername").value == "") 
	   	{
	   	document.getElementById("lblcustomer").innerHTML=newhtml;
	   	}
	   	else
		    {
		    	document.getElementById("lblcustomer").innerHTML="";
		    }
		    
		     if (document.getElementById("mat_vo_reasoncode").value == "") 
	   	{
	   	document.getElementById("lblrcode").innerHTML=newhtml;
	   	}
	   	else
		    {
		    	document.getElementById("lblrcode").innerHTML="";
		    }
   }
   else
   {
	   document.getElementById("lblrequestor").innerHTML="";
	   document.getElementById("lblapprover").innerHTML="";
	   document.getElementById("lblcustomer").innerHTML="";
	   document.getElementById("lblrcode").innerHTML="";
   }
   
  
	    
 }

function clearAsterisk()
{
	   document.getElementById("lblrequestor").innerHTML="";
	   document.getElementById("lblapprover").innerHTML="";
	   document.getElementById("lblcustomer").innerHTML="";
	   document.getElementById("lblrcode").innerHTML="";
}

function checkOverrideBiz(objthis)
{
	if (objthis.id =="MAT_VO_TYPE_BID_BIZ_ENTITY" && objthis.checked)
	{
		var message = "Extreme caution must be taken using BID Business Entity Override Feature as incorrect contract access can be assigned.";
		message = message + " Note that this transaction will be saved for audit purpose.";
		message= message + " Click OK to continue or CANCEL to uncheck the checkbox";
		if (!(confirm(message)))
   		{
   				objthis.checked = false;
   		}
	}	
	enable();
}



