/**
 *  Writes and supports global javascript functions
 *  global.js
 *  $Revision: 1.1.1.1 $
 */

// refresh the page on resize in netscape

function handleResize() {
  if (window.innerWidth != origWidth || window.innerHeight != origHeight) {
    location.href = location.href;
    return false;
  }
}

if ( document.layers ) {
  origWidth = window.innerWidth;
  origHeight = window.innerHeight;
  window.captureEvents(Event.RESIZE);
  window.onresize = handleResize;
}

// Dynamically register functions to be called on page loads

var onloadFA = new Array();

function registerOnloadFunction( func ) {
  onloadFA[ onloadFA.length ] = func;
}
function onloadFunctions() {
  for(var i = 0; i < onloadFA.length; i++ ) {
    onloadFA[i]();
  }
}

// Window Opening / Closing Funcitons 

function openChildWindow( appurl, windowname ) {
  var appwindow = window.open( appurl , windowname, "toolbar=yes,status=yes,top=25,left=0,outerWidth=798,outerHeight=547,width=798,height=547,scrollbars=yes,resizable=yes,menubar=yes,locationbar=no,");
  appwindow.focus();
}

function openLargePopup( url, windowname ) {
  var popup = window.open( url , windowname, "toolbar=yes,status=yes,scrollbars=yes,menubar=yes,locationbar=no,top=50,left=70,outerWidth=643,outerHeight=468,width=643,height=468,resizable=yes");
  popup.focus();
}

function openMediumPopup( url, windowname ) {
  var popup = window.open( url , windowname, "toolbar=no,status=yes,scrollbars=yes,menubar=no,locationbar=no,top=90,left=170,outerWidth=445,outerHeight=390,width=445,height=390,resizable=yes");
  popup.focus();
}

function openSmallPopup( popupurl, windowname ) {
  var popup = window.open( url , windowname, "toolbar=no,status=yes,scrollbars=yes,menubar=no,locationbar=no,top=90,left=290,outerWidth=220,outerHeight=390,width=220,height=390,resizable=yes");
  popup.focus();
}

function closeWindow() {
  self.close();
}

function changeParentUrl( newurl ) {
  var openerClosed = false;
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

// Get the BaseTag, if specified in the current page
function get_baseTag() {
	var baseTag = "";
	if ( document.all ) {	
		var baseTagsCol = document.all.tags("BASE");
		if (baseTagsCol.length!=0){
			baseTag = baseTagsCol[0].href;
		}
	} else if (window.opera) {
		var baseTag
		if (document.getElementById('basehref')){
			baseTag = document.getElementById('basehref').href;
			baseTag = baseTag.substring(0, baseTag.length-1);
		}
	}
	return baseTag;
}

// Drop-down location.href redirection
function dropdown_redirect(select_name,reset) {
	if (reset == null) { reset = true };
	var theselect=eval(select_name);
	var tmp=theselect.selectedIndex;
	if (reset) { theselect.options[0].selected=true; }
	if(theselect.options[tmp].value != "") {
		location.href=get_baseTag()+theselect.options[tmp].value;
	}
}

// Area drop-down redirection
var areanav_current = 0;
function set_areanav_current( index ) {
	// xsl position starts at 1, array index starts at 0
	areanav_current = index-1;
}
function areanav_redirect(select_name) {	
  var theselect=eval(select_name);
  var tmp=theselect.selectedIndex;
  if(theselect.options[tmp].value != "") {
	 theselect.options[areanav_current].selected=true;
	 location.href=get_baseTag()+theselect.options[tmp].value;
  }
}
