jsonurl = "/JSON-RPC";
jsonrpc = null;
var nameArray = new Array();

function jsonLoad(appctx){
    try {
      jsonrpc = new JSONRpcClient(appctx+jsonurl);
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}

function createSavedSetNameArray(v) {

	//alert('set name is ' + v);
	//alert('Array length is ' + nameArray.length);
	nameArray = modifyContent(nameArray, v);
	//alert('Array length is ' + nameArray.length);
}

function confirmDialog(alertMessage) {
	execScript('num=msgbox("'+alertMessage+'","4132")',"vbscript");
	return(num==6);
}

function deleteSavedSetNames(appctx,sourceSystem,ccouserid,cont) {

	var selRow = document.getElementsByName('selectLineItem');
	var length = selRow.length;
	var selSets = '';
	var checked = 0;
	for(var i=0;i<selRow.length;i++){
		if(selRow[i].checked){
			checked = 1;
			selSets+=selRow[i].value+",";
		}
	}
	//alert('selSets ==> '+selSets);
	if (checked == 1){
		jsonLoad(appctx);
		try {
			var sourceSys = sourceSystem;
			var userId    = ccouserid;
			var context   = cont;
			//alert('sourceSystem ==> '+sourceSys);
			//alert('userId ==> '+userId);
			//alert('context ==> '+context);
			
			var flag = confirmDialog("XXCSS_CT-650054 : Are you sure you want to delete the selected saved search set(s)?");
			var result = false;
			if(flag) {
				result = jsonrpc.handler.deleteSavedSet(sourceSys,userId,context,selSets);
				//result = true;
				if(result) {
					self.creator.updateAdvSearchLOV(result);
					self.close();
				}
				else
					alert("Error while deleting the selected Search sets!");
			}
		} 
	    catch(e) {
	      if(e.message) 
	      	alert(e.message);
	      else 
	      	alert(e);
	    }
		
	} else {
		alert("please select atleast one set name to delete");
		return false;
	}
	
	return true;   
}

