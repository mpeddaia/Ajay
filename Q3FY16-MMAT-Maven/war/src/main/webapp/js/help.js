
function getHelp(fieldName,screenName,appName) {

	var url = 'helpPop.do?field=' + fieldName+'&screen='+screenName+'&appName='+appName;	
	window.open(url, 'popupwindow', "width=500,height=600,top=3,left=20");
	
}
function setHelpImageById(fieldName,screenName,appName,sessionScreenName) {		
	if(sessionScreenName==screenName){		
		try { 
			var helpImg = document.getElementById(fieldName+'Img');
			helpImg.innerHTML='<img class="help"  src="images/global/buttons_and_icons/icons/help_0008_12_gray.gif" onclick=getHelp("' + fieldName + '","'+screenName+'","'+appName+'")>&nbsp';
		  //  helpImg.innerHTML='<INPUT TYPE="image" SRC="images/global/buttons_and_icons/icons/help_0007_12_transparent.gif" onclick=getHelp("' + fieldName + '","'+screenName+'","'+appName+'") >&nbsp'; 
		}catch (e) {}
	}
}

function setHelpImageByIdDymanic(fieldName,screenName,appName) {		
		try { 
			var helpImg = document.getElementById(fieldName+'Img');
			helpImg.innerHTML='<img class="help" src="images/global/buttons_and_icons/icons/help_0008_12_gray.gif" align="middle" onclick=getHelp("' + fieldName + '","'+screenName+'","'+appName+'")>&nbsp';
		   
		}catch (e) {}
}
