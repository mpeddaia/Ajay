/**
 *  Applications User Interface Utilities
 *  see global.js
 *  spandav@cisco.com 3/12/2002
 **/

function openChildWindow( appurl, windowname ) {
	var appwindow = window.open( appurl , windowname, "toolbar=yes,status=yes,top=10,left=10,width=796,height=500,scrollbars=yes,resizable=yes,menubar=yes");
	appwindow.focus();
}

function closeWindow() {
	self.close();
}

function openPopup( popupurl, windowname ) {
	var popup = window.open( popupurl , windowname, "toolbar=no,status=yes,top=100,left=200,width=300,height=190,resizable=no");
	popup.focus();
}

function openLargePopup( popupurl, windowname ) {
	var popup = window.open( popupurl , windowname, "toolbar=no,status=yes,top=50,left=100,width=631,height=497,resizable=yes,scrollbars=yes,menubar=yes");
	popup.focus();
}

function openWhatsChangedPopup( windowname ) {
	var popup = window.open( "/apps-ui/WhatsChanged.html", windowname, "toolbar=yes,status=yes,top=50,left=100,width=631,height=497,resizable=1,menubar=1");
	popup.focus();
}

function changeParentUrl( newurl ) {
	
	var openerClosed = false;
	document.domain = "cisco.com";

	if( document.all && !document.getElementById() ) {
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

