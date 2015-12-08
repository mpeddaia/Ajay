/**
 *  Applications User Interface Utilities
 *  appsui.js
 *  see global.js
 **/

if ( document.layers ) {
    window.releaseEvents(Event.RESIZE);
    window.onresize = null;
}

var appsuiWinRef = new Array();

function openChildWindow( appurl, windowname ) {
  var appwindow = window.open( appurl , windowname, "toolbar=yes,status=yes,top=25,left=0,outerWidth=798,outerHeight=547,width=798,height=547,scrollbars=yes,resizable=yes,menubar=yes,locationbar=no,");
  setWinRef(windowname, appwindow);
  appwindow.focus();
}

function closeWindow() {
	self.close();
}

function openSmallPopup( popupurl, windowname ) {
  var popup = window.open( url , windowname, "toolbar=no,status=yes,scrollbars=yes,menubar=no,locationbar=no,top=90,left=290,outerWidth=220,outerHeight=390,width=220,height=390,resizable=yes");
  popup.focus();
}

function openPopup( popupurl, windowname ) {
	openSmallPopup( popupurl, windowname);
}

function openLargePopup( url, windowname ) {
  var popup = window.open( url , windowname, "toolbar=yes,status=yes,scrollbars=yes,menubar=yes,locationbar=no,top=50,left=70,outerWidth=643,outerHeight=468,width=643,height=468,resizable=yes");
  popup.focus();
}

function openMediumPopup( url, windowname ) {
  var popup = window.open( url , windowname, "toolbar=no,status=yes,scrollbars=yes,menubar=no,locationbar=no,top=90,left=170,outerWidth=445,outerHeight=390,width=445,height=390,resizable=yes");
  popup.focus();
}

function openWhatsChangedPopup( windowname ) {
	var popup = window.open( "/apps-ui/WhatsChanged.html", windowname, "toolbar=yes,status=yes,top=50,left=100,width=631,height=497,resizable=1,menubar=1");
	popup.focus();
}

function changeParentUrl( newurl ) {
	
	var openerClosed = false;
	var bName = navigator.appName;
	var bVersion = navigator.appVersion;
	//if( document.all && !document.getElementById() ) {
	if ((bName == "Microsoft Internet Explorer") && (bVersion.indexOf("MSIE 5.0") != -1)) {
		// opener.closed always returns false in IE ... makes sense, right?
		// let's roll our own function in VB, where we can trap errors...
		openerClosed = isOpenerClosed();
	} else {
		if( top.opener ) {
			openerClosed = top.opener.closed;
		} else {
			openerClosed = true;
		}
	}
	if( openerClosed ) {
		var newwin = window.open( newurl);
		newwin.focus();
	} else {
		top.opener.location.href = newurl;
		top.opener.focus();	
	}
}

// Creates a browser-generated alert or message box
// note:
// this was abstracted just in case we ever want to do anything
// with the string or send to non-pcs devices
function openMessage(str) {
	alert(str);
}

// Grabs a parameter from the URL.  Returns an empty
// string if parameter does not exist.
function getParameter(param) {

        var val = "";
        var qs = window.location.search;
        var start = qs.indexOf(param);

        if (start != -1) {
                start += param.length + 1;
                var end = qs.indexOf("&", start);
                if (end == -1) {
                        end = qs.length
                }
                val = qs.substring(start,end);
        }
        return val;
}

// Drop-down location.href redirection
function dropdown_redirect(select_name) {
        var theselect=eval(select_name);
        var tmp=theselect.selectedIndex;
        theselect.options[0].selected=true;
        location.href=theselect.options[tmp].value;
}

//set window reference
function setWinRef(windowname, windowref) {
	appsuiWinRef[windowname] = windowref;
}

//get window reference: recommended for users than to directly access appsuiWinRef as implementation may change in future.
function getWinRef(windowname) {
	var windowref = appsuiWinRef[windowname];
	if (windowref) 
		return windowref;
	else 
		return 0;
}
