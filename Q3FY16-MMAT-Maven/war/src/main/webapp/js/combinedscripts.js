//----------------------------------
//		appsui.js
//----------------------------------

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


//----------------------------------
//		appsui_detect.js
//----------------------------------

/**
 *  Browser specific detection and printing of application Style Sheets
 *
 *  john.george@razorfish.com
 *  november 13, 2001
 *  spandav@cisco.com
 *  january 1, 2002
 */
 
/* will use later when supported browsers are confirmed

error = "support_error.html"
bName = navigator.appName;
bVer = parseInt(navigator.appVersion);
if (bName == "Netscape" && bVer >=4) {
}
else if (bName == "Netscape" && bVer >=3) {
window.location=error;
}
else if (bName == "Netscape" && bVer >=1) {
window.location=error;
}
else if (bName == "Microsoft Internet Explorer" && bVer >=4) {
}
else if (bName == "Microsoft Internet Explorer" && bVer >=2) {
window.location=error;
}
else 
window.location=error;
*/

function isUnix() {
    var Unixes = new Array("SunOS", "HP", "Linux"); 
    var $flag = false;
    for (var i=0; i < Unixes.length; i++) {
    	if (navigator.appVersion.indexOf(Unixes[i]) != -1) {
	    $flag=true;
	    break;
    	}
    }
    return $flag;
}

if (isUnix()) {
    document.write ("<link rel='stylesheet' type='text/css' href='resources/c/appsUnix.css'>")
}
else if (navigator.appName == "Netscape") {
//if (!document.all && document.getElementById) {
    document.write ("<link rel='stylesheet' type='text/css' href='resources/c/appsNs.css'>")
}
else document.write ("<link rel='stylesheet' type='text/css' href='resources/c/apps.css'>")



//----------------------------------
//		autocomplete.js
//----------------------------------

/**
 * Constructor for the auto-complete object. This sets up the default
 * values for all parameters. The instance name parameter should always
 * be set to the same as the actual name of the object thats created.
 * <p>
 * To look up data locally from a JS array the URL parameter should be
 * an empty string.
 *
 * @param   n        instance name for a particluar instance
 * @param   tid      ID of the input field associated with the object
 * @param   u        URL for XML file with the search results
 *
 * @param   minval   The minimum number of character which is required to trigger
 * 					 the AutoComplete dropdown. Component will initate the autocomplete 
 *					 process only if user has enter this many character in the input box. 
 * 					 
 * @param   timeout  time to wait before aborting the call to the server
 * @param   maxcount maximum number of results to be displayed at one time
 * @param	w		 Minimum width of autocompelte drop down box, will be used 
 * 					 only if the results width is less then the textfield	
 * @param   s        name of skin to be applied to the object
 */
cxAcmpt = function(n, tid, u, minval, timeout, maxcount, w, s){
    if (s == undefined)s="default";  //setting skin ID as default if not defined
    this.isJSCall = false;
    this.jsArray = []
    this.enabled =true;
    this.minChar = minval ;

    this.requestURL = u;
    this.timeOut = timeout;
    this.timeR = true;
    this.maxResultCount = maxcount;

    this.input = document.getElementById(tid);
    this.skinID = s;
    this.resultArr = [];
    this.status = 0; // 0 - no results, 1 - waiting for result, 2 - contain result, 3-contain error
    this.keyword = "";
    this.instanceName = n;
    this.focus = false;
    this.minWidth = w;
    document.write('<link href="images/autocomplete/' + this.skinID + '/auto_css.css" rel="stylesheet" type="text/css">');
};


// adds "fade" effect to the autocomplete object
with( { p: cxAcmpt.prototype } ){
    (p.constructor.fadeAway = function( o ){
        o instanceof Object ? ( this.trash = this.trash || [] ).push( o ) && setTimeout( this.fadeAway, 200 ) : arguments.callee.c.trash.pop().hide();
    }).c = p.constructor;
}


////////////////////////////////////////////////////////////////////////////

/**
 * This adds the various event handlers to the input field to trigger the
 * autocomplete object with.
 */
cxAcmpt.prototype.initialize = function() {
    var i, o = ( o = this, o.l = [], o.i = this.input, o.c = null, o.s = { e: null, i: -1 }, o.f = o.searchJSArray || function(){}, o.n = "autocomplete" || "", o );
    for( i in { keydown: 0, focus: 0, blur: 0, keyup: 0, keypress: 0 } )
        addEvent( o.i, i, function( e ){ o.handler.call( o, e ); } );
        addEvent( o.i, i, function( e ){ o.handler.call( o, e ); } );
};


/**
 * Triggers an event with any extra parameters specified
 *
 * @param e Name of event to be created/triggered
 */
cxAcmpt.prototype.callEvent = function(e){
    this[e] && this[e].apply( this, [].slice.call( arguments, 1 ) );
};


/**
 * Toggles the highlight for the text in the DD box. It also triggers
 * the "onhighlite" event.
 *
 * @param e Div which contain the selected item in the dropdown
 */
cxAcmpt.prototype.highlite = function(e){	
 
( this.s.e && ( this.s.e.className = "normal" ), ( this.s = { e: e, i: e.listindex } ).e.className += " highlited", this.callEvent( "onhighlite", this.l[ this.s.i ], this.s.e.d ) );
};


/**
 * This method is get called when user select an item from the dropdown 
 * and it will set the selected item as text of main textField. It also triggers
 * the "onItemSelected" event.
 */
cxAcmpt.prototype.select = function(){
    this.s.i + 1 && ( this.i.value = this.l[ this.s.i], this.callEvent( "onItemSelected", this.i.value), this.hide() );
};


/**
 * Hides the autocomplete object and triggers the "onhide" event.
 */
cxAcmpt.prototype.hide = function(){
    ( this.c && this.c.parentNode.removeChild( this.c ), this.c = null, this.l = [], this.s = { e: null, i: -1 }, this.callEvent( "onhide" ) );
};


/**
 * display the dropdown list with suggest values for the textfield
 * In this function there are two section one for scenario where result need to be 
 * picked from the JS array and second where it need to pick result from a xml call * 
 */
cxAcmpt.prototype.show = function(){
    this.focus = true;

    var cS, found = 0, o = this, i = o.i, iV = i.value; d = document, c = ( o.hide(), o.c = d.body.appendChild( d.createElement( "div" ) ) );
    (c.className = o.n, cS = c.style, cS.display = "none", cS.position = "absolute", o.callEvent( "onshow" ));

    if(this.isJSCall) { // if result need to picked from JS array
        this.resultArr = [];
        o.searchJSArray.call( function( s, x, data ){
            if( !( x.length == undefined ? ( x = [x] ) : x ).length)
                return;

            var j, l = 0, i = o.l.length, e = c.appendChild( d.createElement( "div" ) );
            e.style.width = 'auto';

            for( j in ( o.l[i] = s, e.className = "normal", e.d = data, e.listindex = i, !found && i == o.s.i && ++found && o.highlite( e ), x ) )
                e.appendChild( d.createTextNode( s.substring( l, x[j] ) ) ).parentNode.appendChild( d.createElement( "span" ) ).appendChild( d.createTextNode( s.substring( x[j], l = x[j] + iV.length ) ) ).parentNode.className = "matchingText";
            for( x in ( e.appendChild( d.createTextNode( s.substr( l ) ) ), { click: 0, mouseover: 0 } ) )
                addEvent( e, x, function(e){ o.handler.call( o, e ); } );
            }, iV,  this);

    } else { // if result need to be picked from a xml request

        if(this.keyword != iV){
            this.keyword = iV;
            if(this.keyword.length >= this.minChar) {
                delete xLoader2;
                clearInterval(this.setXLoaderInterval);
                this.requestID = new Date();
                this.requestID = this.requestID.toString();
				// setting the timeout for 500 ms , if user for that long this will raise the xml Request
				this.setXLoaderInterval =  setTimeout( "raiseXmlLoader('"+ this.instanceName +"')", 500); 
				
            }

        }

    }

    if( !c.childNodes.length )
        return o.hide();
    for( var x = i.offsetLeft, y = i.offsetTop + i.offsetHeight; i = i.offsetParent; x += i.offsetLeft, y += i.offsetTop );
    (cS.display = "block", cS.left = x + "px", cS.top = y + "px" , !found && o.highlite( c.firstChild) );

   // adding an extra 1 pixel line to set a minimum width for the dropdown
   var e1 = c.appendChild( d.createElement( "div" ) );
    e1.style.width =o.minWidth + "px";
    e1.className = "autoempty";
};


/**
 * Selects the next result and highlights it. This is used to respond to
 * the user pressing the down arrow on the keyboard.
 */
cxAcmpt.prototype.next = function(){
    var e = ( e = this.s.e ) ? e.nextSibling || e.parentNode.firstChild : null; e && this.highlite( e );
};


/**
 * Selects the previous result and highlights it. This is used to respond to
 * the user pressing the up arrow on the keyboard.
 */
cxAcmpt.prototype.previous = function(){
    var e = ( e = this.s.e ) ? e.previousSibling || e.parentNode.lastChild : null; e && this.highlite( e );
};


/**
 * This is the main event handler. It checks the type of event that
 * was passed to it and calls the appropriate methods
 *
 * @param   evt   event
 */
cxAcmpt.prototype.handler = function( evt ){
    // only process if this object is enabled.
    if(this.enabled) {
        // set up temporary variables
        var o = this, t = evt.type, k = evt.key, e = /span/i.test( ( e = evt.target ).tagName ) ? e.parentNode : e;

        // call methods based on event type.
        t == "keyup" ? k != 40 && k != 38 && k != 13 && o.show()
        : t == "keydown" ? ( k == 40 && o.next() ) || ( k == 38 && o.previous() )
        : t == "keypress" ? k == 13 && !evt.preventDefault() && o.select()
        : t == "blur" ? o.constructor.fadeAway(o)
        : t == "click" ? o.select()
        : t == "focus" ? o.show()
        : o.highlite( e );

        // if the blur event was triggered, change the focus property of object is set to false 
		// this property is used to check if textfield is still in focus after get result from xml request
		if(t == "blur")o.focus=false;
    }
};


/**
 * This method is called once object recevie the result from the xml from given url. 
 * this will render the all the result and in dropdown and display them underneath 
 * the main textfield.
 * This also trigger an event call onReceivedResult
 */
 cxAcmpt.prototype.setListFomServer = function() {
    this.callEvent( "onReceivedResult");

    var cS, found = 0, o = this, i = o.i, iV = this.keyword;
    d = document, c = ( o.hide(), o.c = d.body.appendChild( d.createElement( "div" ) ) );

    (c.className = o.n, cS = c.style, cS.display = "none", cS.position = "absolute", o.callEvent( "onshow" ));

    o.searchJSArray.call( function( s, x, data ){
            if( !( x.length == undefined ? ( x = [x] ) : x ).length)
                return;
            var j, l = 0, i = o.l.length, e = c.appendChild( d.createElement( "div" ) );

            for( j in ( o.l[i] = s, e.className = "normal", e.d = data, e.listindex = i, !found && i == o.s.i && ++found && o.highlite( e ), x ) )
                e.appendChild( d.createTextNode( s.substring( l, x[j] ) ) ).parentNode.appendChild( d.createElement( "span" ) ).appendChild( d.createTextNode( s.substring( x[j], l = x[j] + iV.length ) ) ).parentNode.className = "selectedText";
            for( x in ( e.appendChild( d.createTextNode( s.substr( l ) ) ), { click: 0, mouseover: 0 } ) )
                addEvent( e, x, function(e){ o.handler.call( o, e ); } );
        }, iV,  this);

    if( !c.childNodes.length ) {
        o.status = 0
        return o.hide();
    }
    o.status = 2;

    for( var x = i.offsetLeft, y = i.offsetTop + i.offsetHeight; i = i.offsetParent; x += i.offsetLeft, y += i.offsetTop );

    (cS.display = "block", cS.left = x + "px", cS.top = y + "px" , !found && o.highlite( c.firstChild) );

    var e1 = c.appendChild( d.createElement( "div" ) );

    e1.style.width =o.minWidth + "px";
    e1.className = "autoempty";
}


/**
 * Searches through a javascript array and returns a list of matching
 * Items for the search string.
 *
 * @param   search String token to match
 * @param   t      String in which token need to match
 */
cxAcmpt.prototype.searchJSArray = function(search, t){
    search = search.toLowerCase();
    for ( var i in t.jsArray ){
        if ( search.length > t.minChar ) {
            if( t.jsArray[i].toLowerCase().indexOf(search, 0) == 0 || !t.isJSCall) {
                this( t.jsArray[i], 0 );
                t.resultArr.push(t.jsArray[i])
            }
        }
    }
}


/**
 * raiseXmlLoader is called after a timeout set in show function
 * this will create an instance of xmlDataLoader object and set the URL and 
 * other required parameter and event for that object
 * This also trigger the onSendRequest
 * 
 * @param   s	instanceName of component
 */
raiseXmlLoader = function(s) {
    var t = this[s]
    delete xLoader
    t.status = 1
    t.resultArr = [];
    delete xLoader
	t
	var  xLoader = new xmlDataLoader(t.requestURL, t.keyword, t.timeOut, t.maxResultCount);
	var rid = t.requestID	
    t.callEvent( "onSendRequest", {"requestURL": t.requestURL, "valueSend":t.keyword, "maxResultCount":t.maxResultCount}) 
	
	/**
	 * setting up event to recieve result array onLoadFinish of 
	 * xmlDataLoader object
	 * @param   rArr Result array from the response for xml request
	 */
	xLoader.onLoadFinish = function(rArr){ 
		if(t.timeR && t.focus && (rid == t.requestID )) {
			t.jsArray = rArr;
			t.setListFomServer();
			t.requestPending = 0;
		
		}
	}

	/**
	 * setting up event to get notified 
	 * incase the xmlDataLoader is not able load the xml file.
	 */
	xLoader.onError = function(){ 
		t.status = 3
	}
    clearInterval(t.timeOutInterval);
    t.timeR = true
    t.timeOutInterval = setTimeout( "cancelRequest('"+ t.instanceName +"')", t.timeOut);
}


/**
 * Cancels the request to the server. cancelRequest gets called up when 
 * a xmlRequest pending and user type something more which raise a new request
 * 
 * @param   s	instanceName of component
 */
cancelRequest = function(s) {
    var t = this[s]
    t.timeR = false;
    t.status = 3
}


////////////////// events ////////////////////////////////////////

addEvent = function(o, e, f){
    var a, r = o[r = "_" + (e = "on" + e)] = (o[r] || (o[e] ? [o[e]] : []));
    r[r.length] = f, o[e] = function(e){
        try{
            (e = e || event).preventDefault || (e.preventDefault = function(){e.returnValue = false;});
            e.stopPropagation || (e.stopPropagation = function(){e.cancelBubble = true;});
            e.target || (e.target = e.srcElement || null);
            e.key = (e.which + 1 || e.keyCode + 1) - 1 || 0;
        }catch(f){}
        for(f in r)
            a = r[f], a.call ? a.call(o, e) : (o._ = a, o._(e), o._ = null);
        e = null;
    }
};

removeEvent = function(o, e, f){
    for(var i in e = o["_on" + e])
        if(e[i] == f)
            return delete e[i];
    return false;
};



////////////////////////  /////////////////////////////

/**
 * Sets the enabled property of the object to the passed value
 *
 * @param   b boolean value to assign to the enabled property.
 */
cxAcmpt.prototype.setEnabled = function(b) {
    this.enabled = b
}


/**
 * Returns the list of matching items from the last search as an array
 *
 * @return  array of matching items from last search
 */
cxAcmpt.prototype.getResultItems = function() {
    return this.resultArr;
}


/**
 * Returns current status of the object
 *
 * @return  current status of the autocomplete object
 */
cxAcmpt.prototype.getStatus = function() {
    return this.status;
}


/**
 * Purges the result array from the last set of matches
 */
cxAcmpt.prototype.clearResults = function() {
    this.resultArr = []
}


//----------------------------------
//		calendar.js
//----------------------------------

uPrint = function(s) {
	if(document.getElementById("debugArea")) {
		document.getElementById("debugArea").innerHTML = document.getElementById("debugArea").innerHTML + '<br>' + s; 
	}
}

getViewPortDetails = function()
{
	var viewportwidth;
	var viewportheight;	
	if (typeof window.innerWidth != 'undefined')
	{
	  viewportwidth = window.innerWidth,
	  viewportheight = window.innerHeight
	}
	else if (typeof document.documentElement != 'undefined'
	 && typeof document.documentElement.clientWidth !=
	 'undefined' && document.documentElement.clientWidth != 0)
	{
		viewportwidth = document.documentElement.clientWidth,
		viewportheight = document.documentElement.clientHeight
	}
	else
	{
		viewportwidth = document.getElementsByTagName('body')[0].clientWidth,
		viewportheight = document.getElementsByTagName('body')[0].clientHeight
	}

	var viewPort = new Array()
	viewPort["x"]=viewportwidth;
	viewPort["y"]=viewportheight;
	return viewPort;
}


/**
 * Constructor for the calendar object. It sets the initial values for the object and creates the
 * default values for optional parameters that have been omitted.
 * It has to be followed with a call to the initialize() method to make the calendar available.
 * Before the initialize method is called, default values such as date profile etc can be
 * changed.
 * <p>
 * The n (instance name) argument must <b>always</b> be the same
 * as the name of that particular instance.
 *
 * @param  n    instance name for this object, should be the same as the name of the object created
 * @param  tid  id of the input tag that this calendar object will be associated with
 * @param  sd  optional start date, format to be same as specified format for this instance
 * @param  ed  optional end date, format to be same as specified format for this instance
 * @param  s    optional skin name
 */
cxCal = function(n, tid, sd, ed, s){
	this.dateProfiles = new Object();

	// create default date profile
	this.dateProfiles.defaultProfile = {"label":"default"};
	this.dateProfiles.defaultProfile.days = Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday',
								    'SUN','MON','TUE','WED','THU','FRI','SAT');
	this.dateProfiles.defaultProfile.months = Array('January', 'February', 'March', 'April', 'May', 'June',
								       'July', 'August', 'September', 'October', 'November', 'December',
								       'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
								       'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC');
	this.dateProfiles.defaultProfile.dateFormat = "d-NNN-yyyy";
	this.dateProfileName = "defaultProfile";

	// setting start date as far back as possible if not defined
	if ((sd == undefined) || (sd == '')) {
		var tDate = new Date("1/1/1900");
		sd=formatDate(tDate, this.dateProfiles[this.dateProfileName].dateFormat,
					       this.dateProfiles[this.dateProfileName].months,
					       this.dateProfiles[this.dateProfileName].days);
	}

	// setting end date as far ahead as possible if not defined
	if ((ed == undefined) || (ed == '')) {
		var tDate = new Date("1/1/2100");
		ed=formatDate(tDate, this.dateProfiles[this.dateProfileName].dateFormat);
	}

	// setting skin ID as default if not defined
	if ((s == undefined) || (s == '')) {
		s="default";
	}

	// set up calendar object properties
	this.skinID = s
	this.instanceName = n
	this.inputID = tid;

	this.displayMonth = -1;
	this.displayYear = -1;

	this.startDate = sd;
	this.endDate = ed;

	this.calDiv = this.instanceName + "calDiv";

	// write calendar css to document
	document.write('<link href="images/components/calendar/' + this.skinID + '/calendar_css.css" rel="stylesheet" type="text/css">')
	
}


/**
 * Initializes the calendar object and adds the icon for it.
 * If the date profile has been changed from default, it also adjusts
 * the format of the start date and end date
 */
cxCal.prototype.initialize = function() {
	uPrint(this.instanceName+ " - " + "Initializing Calendar instance for "+this.inputID);
	// if the dateprofile is different from the default profile, change the
	// start and end date values formatting to match the new format.
	if (this.dateProfileName != "defaultProfile") {
		// first get original values
		var sd = new Date(getDateFromFormat(this.startDate,
								       this.dateProfiles.defaultProfile.dateFormat,
								       this.dateProfiles.defaultProfile.months,
								       this.dateProfiles.defaultProfile.days)
					  );

		var ed = new Date(getDateFromFormat(this.endDate,
								       this.dateProfiles.defaultProfile.dateFormat,
								       this.dateProfiles.defaultProfile.months,
								       this.dateProfiles.defaultProfile.days)
					   );

		// next, convert to the new format
		this.startDate = formatDate(sd, this.dateProfiles[this.dateProfileName].dateFormat,
							     this.dateProfiles[this.dateProfileName].months,
							     this.dateProfiles[this.dateProfileName].days);

		this.endDate = formatDate(ed, this.dateProfiles[this.dateProfileName].dateFormat,
							   this.dateProfiles[this.dateProfileName].months,
							   this.dateProfiles[this.dateProfileName].days);
	}

	// create calendar icon next to the text field
	var e = document.getElementById(this.inputID).parentNode.appendChild( document.createElement( "img" ) );
	e.src = 'images/components/calendar/' + this.skinID + '/cal_icon_btn.gif';
	e.className = "cal_imageIcon";
	e.align ="absmiddle";

	// add the link to the show() function.
	if (e.outerHTML) {
		e.outerHTML = "<a href='javascript:" + this.instanceName + ".show();'>" + e.outerHTML + "</a>";
	} else {
		e.setAttribute("onClick" , this.instanceName + ".show();");
	}

/*
	// create calendar icon next to the text field
	 var parentNode = document.getElementById(this.inputID).parentNode;
	 var instanceName = this.instanceName;
	 uPrint(instanceName + " - "+ "Before imgIcon creation");
	 var imgIcon = document.createElement("img");
 	 uPrint(instanceName + " - "+ "After imgIcon creation");
	 imgIcon.src = 'images/components/calendar/' + this.skinID + '/cal_icon_btn.gif';	 
 	 uPrint(instanceName + " - "+ "imgIcon src set to "+imgIcon.src);
	 imgIcon.className = "cal_imageIcon";
	 imgIcon.align ="absmiddle";
	 
	 var tempImg = new Image();
	 tempImg.src = 'images/components/calendar/' + this.skinID + '/cal_icon_btn.gif';	 
	 tempImg.onload = function() {
	 	uPrint(instanceName + " - "+"IMAGE LOADED");
	 }
	 imgIcon.onload = function() {
		  uPrint("Calendar icon loaded completely..");
		  e = parentNode.appendChild(imgIcon);
		  
		  if (e.outerHTML) {
		  	  e.outerHTML = "<a href='javascript:" + instanceName + ".show();'>" + e.outerHTML + "</a>";
		  } else {
		  	  e.setAttribute("onClick" , instanceName + ".show();");
		  }
	 }
	 uPrint(instanceName + " - "+ "imgIcon properties set : "+imgIcon.src);
*/

	// create an empty div for the calendar
	document.write('<div id="' + this.calDiv + '" style="position:absolute; left:0px; top:0px; z-index:1; visibility: hidden;"></div>');
}


/**
 * Displays the calendar object.
 * Resets position, redraws contents and then makes it visible.
 *
 * @see close
 */
cxCal.prototype.show = function() {
	this.resetPosition();
	this.reDraw();
	MM_showHideLayers(this.calDiv, '', 'show');	
}


/**
 * Hides the calendar object.
 * Hides the calendar objecr, shifts focus to the associated
 * input field and resets calendar values. Also triggers the
 * onClose event.
 *
 * @see onClose
 * @see show
 */
cxCal.prototype.close = function() {
	MM_showHideLayers(this.calDiv, '', 'hide');

	document.getElementById(this.inputID).focus();

	this.displayMonth = -1;
	this.displayYear = -1;
	sDate = "";

	this.callEvent("onClose");
}


/**
 * Repositions the calendar object.
 * Resets the calendar objects position based on the associated icon
 * position. This is used by the show() method.
 * <p>
 * The image dimensions and offset from the image are factored into
 * hardcoded hGap and vGap variables. If the calendar icon is altered
 * these may need to be modified to suit the new image.
 *
 * @see show
 */
cxCal.prototype.resetPosition = function() {
	var hGap = 27; // hardcoded x offset.
	var vGap = 20; // hardcoded y offset.

	// calculate position for image
	var x1 = getPositionLeft(this.inputID) + MM_findObj(this.inputID).clientWidth + hGap;
	var y1 = getPositionTop(this.inputID) + vGap;

	//uPrint("getPositionLeft(this.inputID) : "+getPositionLeft(this.inputID));
	//uPrint("MM_findObj(this.inputID).clientWidth : "+MM_findObj(this.inputID).clientWidth);
	//uPrint("hGap : "+hGap);

	//uPrint("getPositionTop(this.inputID) : "+getPositionTop(this.inputID));
	//uPrint("vGap : "+vGap);
	
	//this.close();
	
	var viewPort = getViewPortDetails();
	uPrint("document width : "+viewPort["x"]);
	uPrint("document height : "+viewPort["y"]);
	
	uPrint("Document scrolled to the top by "+document.body.scrollTop+" pixels");
	uPrint("Document scrolled to the left by "+document.body.scrollLeft+" pixels");
	
	var addOffset = false;	
	uPrint("X position : "+x1);
	if(document.body.scrollLeft>0) {
		x1 = x1-document.body.scrollLeft;
		addOffset = true;
		uPrint("addOffset is true - new X position : "+x1);
	}	
	uPrint("X position Plus 165 : "+(x1+165));
	
	
	if((x1+165)>viewPort["x"])	{
		uPrint("X-position adjustment by "+((x1+165)-viewPort["x"])+" pixels");
		x1 = x1-((x1+165)-viewPort["x"]);
	} 	
	if(addOffset)
		x1 = x1+document.body.scrollLeft;
	
		
	addOffset = false;		
	uPrint("Y position : "+y1);	
	if(document.body.scrollTop>0) {
		y1 = y1-document.body.scrollTop;
		addOffset = true;
		uPrint("addOffset is true - new Y position : "+y1);
	}
	uPrint("Y position Plus 170 : "+(y1+170));			
	if((y1+170)>viewPort["y"])	{
		uPrint("Y-position adjustment by "+((y1+170)-viewPort["y"])+" pixels");
		y1 = y1-((y1+170)-viewPort["y"]);	
	} 
	if(addOffset)
		y1 = y1+document.body.scrollTop;	
	
			
	// set image position
	setX(	this.calDiv, x1);
	setY(	this.calDiv, y1);
	
}


/**
 * Creates the HTML string that represents the entire calendar.
 *
 * @return String with HTML representing the entire calendar
 */
cxCal.prototype.writeCalendar = function() {
	// if sDate has not been set, i.e. if this is the first call to the calendar, then pick the date
	// to be displayed from the text field.
	if ((typeof(sDate) == "undefined") || (sDate == "")) { sDate = document.getElementById(this.inputID).value; }

	// test to see if the date is in the valid format, if yes, use it as the selected date, else set
	// the selected date to today.
	if (isDate(sDate, this.dateProfiles[this.dateProfileName].dateFormat)) {
		this.selectedDate = new Date(getDateFromFormat(sDate,
										      this.dateProfiles[this.dateProfileName].dateFormat,
										      this.dateProfiles[this.dateProfileName].months,
										      this.dateProfiles[this.dateProfileName].days)
							  );
	} else {
		this.selectedDate = new Date();
	}

	// if display month is an invalid number i.e. the calendar is not being redrawn due to a prev/next
	// then get initial values for display month and year from the selected date.
	if (this.displayMonth < 0) {
		this.displayMonth = this.selectedDate.getMonth();
		this.displayYear = this.selectedDate.getFullYear();
	}

	// if the displayed year is a leap year, adjust the number of days in Feb to 29, else set them to 28
	if (parseInt(this.displayYear, 10) % 4 == 0){
		daysInMonth[1] = 29;
	} else {
		daysInMonth[1] = 28;
	}

	// create a date object for the 1st of the displayed month in the displayed year
	var currentCalendar = new Date();
	currentCalendar.setFullYear(this.displayYear,this.displayMonth,1);

	// calculate the starting offset based on which day of the week applies the 1st
	// of that month
	var startOffset = currentCalendar.getDay();

	// initialize the calendar string which will be returned later
	var calString = '';
	if(navigator.appName.indexOf('Microsoft') != -1){
		//var calString = calString+'<IFRAME style="Z-INDEX:-1;WIDTH:100%;POSITION:absolute;HEIGHT:100%" src="" frameborder="0"></IFRAME>';
		var calString = calString+'<IFRAME style="Z-INDEX:-1;WIDTH:100%;POSITION:absolute;HEIGHT:100%" frameborder="0" src="resources/i/pixel.gif"></IFRAME>';
	}

	// formatting html for the calendar
	calString += '<table class="cal_base" cellpadding="0" cellspacing="0">';
	calString += '<tr class="firstRow">';
	calString += '	<td colspan="7">';

	// close icon
	calString += '		<div style="float:right;">';
	calString += '			<a href="javascript:' + this.instanceName + '.close();"><img src="images/components/calendar/' + this.skinID + '/cal_close_normal_btn.gif" width="10" height="11" border="0"></a>';
	calString += '		</div>';

	// display the month and year
	calString += this.dateProfiles[this.dateProfileName].months[this.displayMonth]+', '+this.displayYear;

	// formatting html for the calendar
	calString += '	</td>';
	calString += '</tr>';

	// header row with day of the week headers
	calString += '<tr class="header">';
	calString += '	<td>S</td>';
	calString += '	<td>M</td>';
	calString += '	<td>T</td>';
	calString += '	<td>W</td>';
	calString += '	<td>T</td>';
	calString += '	<td>F</td>';
	calString += '	<td>S</td>';
	calString += '</tr>';

	// calendar rows start - always displayed with 6 rows
	for (i=0;i<6;i++) {
		calString += '<tr class="dataRow">';

			// calendar columns within each row - 7 columns total
			for(j=1;j<8;j++) {
				// create a temporary variable that will be used for the calculation
				var displayDate = i*7+j-startOffset;

				// check if its a valid date
				if ((displayDate > 0) && (displayDate <= daysInMonth[this.displayMonth])) {

					// format the date into a date string in the d/M/yyyy format for comparison
					var CalendarDate = displayDate+"/"+(this.displayMonth+1)+"/"+this.displayYear;

					// check if the date is within the bounds of start date and end date
					if (
						(compareDates(this.startDate, this.dateProfiles[this.dateProfileName].dateFormat, CalendarDate, "d/M/yyyy") == 0)
						&&
						(compareDates(CalendarDate, "d/M/yyyy", this.endDate, this.dateProfiles[this.dateProfileName].dateFormat) == 0)
					) {

						// check if the date is the SELECTED date
						if ((this.displayYear == this.selectedDate.getFullYear()) && (this.displayMonth == this.selectedDate.getMonth()) && (displayDate == this.selectedDate.getDate())) {
							// selected date. format differently and make it non-clickable
							//calString += '<td class="selected">'+displayDate+'</td>';
							calString += '<td class="selected"><a href="javascript:' + this.instanceName + '.setSelectedDate('+displayDate+');"><font style="color:#800000;font-weight:bold;">'+displayDate+'</font></a></td>';
							
						} else {
							// ordinary date within start and end bouds - make normal link
							calString += '<td><a href="javascript:' + this.instanceName + '.setSelectedDate('+displayDate+');">'+displayDate+'</a></td>';
						}

					} else {
						// date outside start/end bounds - disabled/non-clickable date
						calString += '<td class="disabled">'+displayDate+'</td>';
					}
				} else {
					// invalid date (date<1 or date>daysInMonth) - empty cell
					calString += '<td class="inactive">&nbsp;</td>';
				}
			}
			// calendar columns end

		calString += '</tr>';
	}
	// calendar rows end

	// formatting HTML
	calString += '<tr class="lastRow">';
	calString += '<td colspan="3" class="backLinks">';

	// create start date as a date object
	var sDate = new Date(getDateFromFormat(this.startDate,
								    this.dateProfiles[this.dateProfileName].dateFormat,
								    this.dateProfiles[this.dateProfileName].months,
								    this.dateProfiles[this.dateProfileName].days)
					);

	// create end date as a date object
	var eDate = new Date(getDateFromFormat(this.endDate,
								    this.dateProfiles[this.dateProfileName].dateFormat,
								    this.dateProfiles[this.dateProfileName].months,
								    this.dateProfiles[this.dateProfileName].days)
					);

	// if previous year is a valid year to display, display the previous year link
	if (this.displayYear > sDate.getFullYear()) {
		calString += '<a href="javascript:' + this.instanceName + '.prevYear();"><img src="images/components/calendar/' + this.skinID + '/cal_prev_year_normal.gif" width="12" height="12" border="0"></a>';
	} else {
		calString += '<img src="images/components/calendar/' + this.skinID + '/cal_prev_year_disabled.gif" width="12" height="12" border="0">';
	}

	// if previous month is a valid month to display, display the previous month link
	if ((this.displayYear == sDate.getFullYear()) && (this.displayMonth <= sDate.getMonth())) {
		calString += '<img src="images/components/calendar/' + this.skinID + '/cal_prev_month_disabled.gif" width="12" height="12" border="0">';
	} else {
		calString += '<a href="javascript:' + this.instanceName + '.prevMonth();"><img src="images/components/calendar/' + this.skinID + '/cal_prev_month_normal.gif" width="12" height="12" border="0"></a>';
	}

	// formatting HTML
	calString += '</td><td>&nbsp;</td><td colspan="3" class="fwdLinks">';

	// if next month is a valid month to display, display the next month link
	if ((this.displayYear == eDate.getFullYear()) && (this.displayMonth >= eDate.getMonth())) {
		calString += '<img src="images/components/calendar/' + this.skinID + '/cal_next_month_disabled.gif" width="12" height="12" border="0">';
	} else {
		calString += '<a href="javascript:' + this.instanceName + '.nextMonth();"><img src="images/components/calendar/' + this.skinID + '/cal_next_month_normal.gif" width="12" height="12" border="0"></a>';
	}

	// if next year is a valid year to display, display the next year link
	if (this.displayYear < eDate.getFullYear()) {
		calString += '<a href="javascript:' + this.instanceName + '.nextYear();"><img src="images/components/calendar/' + this.skinID + '/cal_next_year_normal.gif" width="12" height="12" border="0"></a>';
	} else {
		calString += '<img src="images/components/calendar/' + this.skinID + '/cal_next_year_disabled.gif" width="12" height="12" border="0">';
	}

	// formatting HTML
	calString += '</td>';
	calString += '</tr>';
	calString += '</table>';

	// return the calendar string
	return calString;
}


/**
 * Changes the displayed month to the next month.
 * Changes the displayed month to the next month and changes the
 * year if neccessary (Dec changing to Jan).
 * <p>
 * After making the changes it redraws the calendar.
 * <p>
 * Since the next month link is not available unless the next
 * month is a valid selection, we do not need to do any validation
 * against the end date here.
 *
 * @see prevMonth
 * @see nextYear
 * @see prevYear
 */
cxCal.prototype.nextMonth = function() {
	// If the current month is december we reset the month to january
	// and increment the year instead. Otherwise we simply increment
	// the month.
	if (++this.displayMonth > 11) {
		this.displayYear += 1;
		this.displayMonth = 0;
	}

	this.reDraw();
}


/**
 * Changes the displayed month to the previous month.
 * Changes the displayed month to the previous month and changes the
 * year if neccessary (Jan changing to Dec).
 * <p>
 * After making the changes it redraws the calendar.
 * <p>
 * Since the previous month link is not available unless the previous
 * month is a valid selection, we do not need to do any validation
 * against the start date here.
 *
 * @see nextMonth
 * @see nextYear
 * @see prevYear
 */
cxCal.prototype.prevMonth = function() {
	// If the current month is january we reset the month to december
	// and decrement the year instead. Otherwise we simply decrement
	// the month.
	if (--this.displayMonth < 0) {
		this.displayYear -= 1;
		this.displayMonth = 11;
	}

	this.reDraw();
}


/**
 * Changes the displayed year to the next year.
 * Changes the displayed year to the next year and changes the
 * month if it goes beyond the last allowed month.
 * <p>
 * After making the changes it redraws the calendar.
 *
 * @see nextMonth
 * @see prevMonth
 * @see prevYear
 */
cxCal.prototype.nextYear = function() {
	// get end date - for comparison
	var eDate = new Date(getDateFromFormat(this.endDate,
								    this.dateProfiles[this.dateProfileName].dateFormat,
								    this.dateProfiles[this.dateProfileName].months,
								    this.dateProfiles[this.dateProfileName].days)
					);

	// increment the year.
	this.displayYear++;

	// if the year is the same as the last allowed year, check for the month vaildity and reset if invalid.
	if ((this.displayYear == eDate.getFullYear()) && (this.displayMonth > eDate.getMonth())) {
		this.displayMonth = eDate.getMonth();
	}

	this.reDraw();
}


/**
 * Changes the displayed year to the previous year.
 * Changes the displayed year to the previous year and changes the
 * month if it falls behind the first allowed month.
 * <p>
 * After making the changes it redraws the calendar.
 *
 * @see nextMonth
 * @see prevMonth
 * @see nextYear
 */
cxCal.prototype.prevYear = function() {
	// get start date - for comparison
	var sDate = new Date(getDateFromFormat(this.startDate,
								    this.dateProfiles[this.dateProfileName].dateFormat,
								    this.dateProfiles[this.dateProfileName].months,
								    this.dateProfiles[this.dateProfileName].days)
					);

	// decrement the year.
	this.displayYear--;

	// if the year is the same as the first allowed year, check for the month vaildity and reset if invalid.
	if ((this.displayYear == sDate.getFullYear()) && (this.displayMonth < sDate.getMonth())) {
		this.displayMonth = sDate.getMonth();
	}

	this.reDraw();
}


/**
 * Redraws the calendar and sets layer z-index to top.
 * This redraws the calendar and resets all open calendars
 * z-index to 1 after which it raises current calendars z-index
 * to 10
 */
cxCal.prototype.reDraw = function() {
	// rewrite content
	document.getElementById(this.calDiv).innerHTML = this.writeCalendar();

	// lower all existing calendars
	var allDivs = document.getElementsByTagName('div');
	var calDivs = new Array(); // array of all DIVs that match the calendar DIV naming pattern
	var calDivRegExp = /\S+calDiv$/; // regular expression to match calendar div name against

	// identify all DIV's that match our calendar naming convention
	var dl = allDivs.length;
	for (var i=0; i<dl; i++) {
		if (allDivs[i].id.match(calDivRegExp) != null) {
			calDivs[calDivs.length] = allDivs[i];
		}
	}

	// work backwards to identify object name from the DIV name and test if its a real calendar
	// object. if it exists - set its z-index to 1 to lower it.
	var dl = calDivs.length;
	for (var i=0; i<dl; i++) {
		var objName = calDivs[i].id.substring(0, (calDivs[i].id.length - 6));
		if (typeof(window[objName]) != "undefined") {
			document.getElementById(window[objName].calDiv).style.zIndex=1;
		}
	}

	// raise current calendar z-index to 10 to ensure its on top.
	document.getElementById(this.calDiv).style.zIndex=10;
}


/**
 * Sets the selected date in the text field and triggers the onDateSelected event.
 * Since the parameter is generated by us we can skip validation as it will always
 * be a valid (1-31) number.
 *
 * @param  selectedDay  Day selected. Month and Year are picked from the displayed month information.
 */
cxCal.prototype.setSelectedDate = function(selectedDay) {
	// generate date object with the passed value for further handling
	this.selectedDate = new Date(getDateFromFormat((this.displayMonth+1)+'/'+selectedDay+'/'+this.displayYear, "M/d/yyyy"));

	// format the date and store it in a temp variable
	var dt = formatDate(this.selectedDate,
				     this.dateProfiles[this.dateProfileName].dateFormat,
				     this.dateProfiles[this.dateProfileName].months,
				     this.dateProfiles[this.dateProfileName].days);

	// display the selected date in the text field
	document.getElementById(this.inputID).value = dt;

	//  trigger the onDateSelected event with the selected date
	this.callEvent("onDateSelected", dt);

	// call the close() method to hide/reset the calendar
	this.close();
}


/**
 * Returns the last selected date as a string in the Raw format (MM/dd/yyyy).
 * If the calendar has not been initialised then it returns an empty string.
 *
 * @return  last selected date as a string in the Raw format (MM/dd/yyyy)
 * @see getCurrentDateFormatted
 */
cxCal.prototype.getCurrentDateRaw = function() {
	if (this.selectedDate != undefined) {
		return formatDate(this.selectedDate, "MM/dd/yyyy",
					  this.dateProfiles[this.dateProfileName].months,
					  this.dateProfiles[this.dateProfileName].days);
	} else {
		return "";
	}
}


/**
 * Returns the last selected date as a string in the objects date format as
 * specified by the date profile.
 * If the calendar has not been initialised then it returns an empty string.
 *
 * @return  last selected date as a string in the format specified in the date profile
 * @see getCurrentDateRaw
 */
cxCal.prototype.getCurrentDateFormatted = function() {
	if (this.selectedDate != undefined) {
		return formatDate(this.selectedDate, this.dateProfiles[this.dateProfileName].dateFormat,
					  this.dateProfiles[this.dateProfileName].months,
					  this.dateProfiles[this.dateProfileName].days);
	} else {
		return "";
	}
}


/**
 * Triggers an event with any extra parameters specified
 *
 * @param e Name of event to be created/triggered
 */
cxCal.prototype.callEvent = function(e){
	this[e] && this[e].apply( this, [].slice.call( arguments, 1 ) );
};





///////////////////// get / set position support functions ////////////////////////

// the following functions returns the X, Y offsets in pixels for the passed object
function getPositionLeft(t){
	var el = MM_findObj(t); var pL = 0;
	while(el){pL+=el.offsetLeft;el=el.offsetParent;}
	return pL
}
function getPositionTop(t){
	var el = MM_findObj(t); var pT = 0;
	while(el){pT+=el.offsetTop;el=el.offsetParent;}
	return pT
}

// the following functions set the X,Y offsets of the passed object
setX = function(el, x) {document.getElementById(el).style.left = x + "px"}
setY = function(el, y) {MM_findObj(el).style.top = y + "px"}

// the following functions set the width, height in pixels of the passed object
setW = function(el, w) {MM_findObj(el).style.width = w + 'px'}
setH = function(el, h) {MM_findObj(el).style.height =h + 'px'}


///////////////////////// date handling support functions ////////////////////

// ------------------------------------------------------------------
// These functions use the same 'format' strings as the
// java.text.SimpleDateFormat class, with minor exceptions.
// The format string consists of the following abbreviations:
//
// Field        | Full Form          | Short Form
// -------------+--------------------+-----------------------
// Year         | yyyy (4 digits)    | yy (2 digits), y (2 or 4 digits)
// Month        | MMM (name or abbr.)| MM (2 digits), M (1 or 2 digits)
//              | NNN (abbr.)        |
// Day of Month | dd (2 digits)      | d (1 or 2 digits)
// Day of Week  | EE (name)          | E (abbr)
// Hour (1-12)  | hh (2 digits)      | h (1 or 2 digits)
// Hour (0-23)  | HH (2 digits)      | H (1 or 2 digits)
// Hour (0-11)  | KK (2 digits)      | K (1 or 2 digits)
// Hour (1-24)  | kk (2 digits)      | k (1 or 2 digits)
// Minute       | mm (2 digits)      | m (1 or 2 digits)
// Second       | ss (2 digits)      | s (1 or 2 digits)
// AM/PM        | a                  |
//
// NOTE THE DIFFERENCE BETWEEN MM and mm! Month=MM, not mm!
// Examples:
//  "MMM d, y" matches: January 01, 2000
//                      Dec 1, 1900
//                      Nov 20, 00
//  "M/d/yy"   matches: 01/20/00
//                      9/2/00
//  "MMM dd, yyyy hh:mm:ssa" matches: "January 01, 2000 12:30:45AM"
// ------------------------------------------------------------------

// default arrays for calculation
var daysInMonth = new Array(31,28,31,30,31,30,31,31,30,31,30,31); // days in month is adjusted repeatedly for february
var MONTH_NAMES=new Array('January','February','March','April','May','June','July','August','September','October','November','December','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
var DAY_NAMES=new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sun','Mon','Tue','Wed','Thu','Fri','Sat');

// appends a leading zero for numbers 0 to 9
function LZ(x) {return(x<0||x>9?"":"0")+x}


/**
 * Returns true if date string matches format of format string and
 * is a valid date. Else returns false.
 * It is recommended that you trim whitespace around the value before
 * passing it to this function, as whitespace is NOT ignored!
 *
 * @param val        date string to be tested
 * @param format date format string, similar to java.text.SimpleDateFormat
 *
 * @return boolean value indicating wether the date was valid or not
 */
function isDate(val,format) {
	var date=getDateFromFormat(val,format);
	if (date==0) { return false; }
	return true;
}


/**
 *  Compare two date strings to see which is greater.
 *
 * @return 1 if date1 is greater than date2,  0 if date2 is greater than date1 of if they are the same and -1 if either of the dates is in an invalid format
 */
function compareDates(date1,dateformat1,date2,dateformat2) {
	var d1=getDateFromFormat(date1,dateformat1);
	var d2=getDateFromFormat(date2,dateformat2);
	if (d1==0 || d2==0) {
		return -1;
		}
	else if (d1 > d2) {
		return 1;
		}
	return 0;
}


/**
 * Returns a date string in the output format specified.
 * The format string uses similar syntax to java.text.SimpleDateFormat.
 * <p>
 * The Months and Days parameters are optional. They are used to pass the Month
 * and Day names to be used in preparing the formatted string.
 *
 * @param date      date object to be formatted
 * @param format  string with the format to apply to the date object
 * @param Months array of month names to be used in formatting
 * @param Days     array of day names to be used in formatting
 *
 * @return formatted string containing the date
 */
function formatDate(date,format,Months,Days) {
	// if no month/day names were passed use default values
	if (Months == null) {Months = MONTH_NAMES}
	if (Days == null) {Days = DAY_NAMES}

	format=format+"";
	var result="";
	var i_format=0;
	var c="";
	var token="";

	// calculate initial values
	var y=date.getYear()+"";
	var M=date.getMonth()+1;
	var d=date.getDate();
	var E=date.getDay();
	var H=date.getHours();
	var m=date.getMinutes();
	var s=date.getSeconds();

	var yyyy,yy,MMM,MM,dd,hh,h,mm,ss,ampm,HH,H,KK,K,kk,k;
	// Convert real date parts into formatted versions

	var value=new Object();
	if (y.length < 4) {y=""+(y-0+1900);}

	// create all token values
	value["y"]=""+y;
	value["yyyy"]=y;
	value["yy"]=y.substring(2,4);
	value["M"]=M;
	value["MM"]=LZ(M);
	value["MMM"]=Months[M-1];
	value["NNN"]=Months[M+11];
	value["d"]=d;
	value["dd"]=LZ(d);
	value["E"]=Days[E+7];
	value["EE"]=Days[E];
	value["H"]=H;
	value["HH"]=LZ(H);

	if (H==0){value["h"]=12;}
	else if (H>12){value["h"]=H-12;}
	else {value["h"]=H;}

	value["hh"]=LZ(value["h"]);

	if (H>11){value["K"]=H-12;} else {value["K"]=H;}

	value["k"]=H+1;
	value["KK"]=LZ(value["K"]);
	value["kk"]=LZ(value["k"]);

	if (H > 11) { value["a"]="PM"; }
	else { value["a"]="AM"; }

	value["m"]=m;
	value["mm"]=LZ(m);
	value["s"]=s;
	value["ss"]=LZ(s);

	// create formatted string using the tokens
	while (i_format < format.length) {
		c=format.charAt(i_format);
		token="";

		// create each token
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}

		// use token to build string
		if (value[token] != null) { result=result + value[token]; } // if its a valid token use its value
		else { result=result + token; } // else treat is as part of the formatting string and simply insert
		}

	// return formatted string
	return result;
	}


// Utility functions for parsing in getDateFromFormat()
function _isInteger(val) {
	var digits="1234567890";
	for (var i=0; i < val.length; i++) {
		if (digits.indexOf(val.charAt(i))==-1) { return false; }
		}
	return true;
	}
function _getInt(str,i,minlength,maxlength) {
	for (var x=maxlength; x>=minlength; x--) {
		var token=str.substring(i,i+x);
		if (token.length < minlength) { return null; }
		if (_isInteger(token)) { return token; }
		}
	return null;
}


/**
 * This function takes a date string and a format string.
 * If the date string matches the format string, it returns the
 * getTime() of the date. If it does not match, it returns 0.
 * Optional parameters for custom Month/Day names are also
 * passed to it.
 *
 * @param val         date string to be converted
 * @param format  string with the format to apply to the date object
 * @param Months array of month names to be used in formatting
 * @param Days     array of day names to be used in formatting
 *
 * @return getTime() of the date passes as a date string
*/
function getDateFromFormat(val,format,Months,Days) {
	// if no month/day names were passed use default values
	if (Months == null) {Months = MONTH_NAMES}
	if (Days == null) {Days = DAY_NAMES}

	val=val+"";
	format=format+"";

	var i_val=0;
	var i_format=0;
	var c="";
	var token="";
	var token2="";
	var x,y;

	var now=new Date();
	var year=now.getYear();
	var month=now.getMonth()+1;

	var date=1;

	var hh=now.getHours();
	var mm=now.getMinutes();
	var ss=now.getSeconds();

	var ampm="";

	while (i_format < format.length) {
		// Get next token from format string
		c=format.charAt(i_format);
		token="";
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
			}
		// Extract contents of value based on format token
		if (token=="yyyy" || token=="yy" || token=="y") {
			if (token=="yyyy") { x=4;y=4; }
			if (token=="yy")   { x=2;y=2; }
			if (token=="y")    { x=2;y=4; }
			year=_getInt(val,i_val,x,y);
			if (year==null) { return 0; }
			i_val += year.length;
			if (year.length==2) {
				if (year > 70) { year=1900+(year-0); }
				else { year=2000+(year-0); }
				}
			}
		else if (token=="MMM"||token=="NNN"){
			month=0;
			for (var i=0; i<Months.length; i++) {
				var month_name=Months[i];
				if (val.substring(i_val,i_val+month_name.length).toLowerCase()==month_name.toLowerCase()) {
					if (token=="MMM"||(token=="NNN"&&i>11)) {
						month=i+1;
						if (month>12) { month -= 12; }
						i_val += month_name.length;
						break;
						}
					}
				}
			if ((month < 1)||(month>12)){return 0;}
			}
		else if (token=="EE"||token=="E"){
			for (var i=0; i<Days.length; i++) {
				var day_name=Days[i];
				if (val.substring(i_val,i_val+day_name.length).toLowerCase()==day_name.toLowerCase()) {
					i_val += day_name.length;
					break;
					}
				}
			}
		else if (token=="MM"||token=="M") {
			month=_getInt(val,i_val,token.length,2);
			if(month==null||(month<1)||(month>12)){return 0;}
			i_val+=month.length;}
		else if (token=="dd"||token=="d") {
			date=_getInt(val,i_val,token.length,2);
			if(date==null||(date<1)||(date>31)){return 0;}
			i_val+=date.length;}
		else if (token=="hh"||token=="h") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>12)){return 0;}
			i_val+=hh.length;}
		else if (token=="HH"||token=="H") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>23)){return 0;}
			i_val+=hh.length;}
		else if (token=="KK"||token=="K") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<0)||(hh>11)){return 0;}
			i_val+=hh.length;}
		else if (token=="kk"||token=="k") {
			hh=_getInt(val,i_val,token.length,2);
			if(hh==null||(hh<1)||(hh>24)){return 0;}
			i_val+=hh.length;hh--;}
		else if (token=="mm"||token=="m") {
			mm=_getInt(val,i_val,token.length,2);
			if(mm==null||(mm<0)||(mm>59)){return 0;}
			i_val+=mm.length;}
		else if (token=="ss"||token=="s") {
			ss=_getInt(val,i_val,token.length,2);
			if(ss==null||(ss<0)||(ss>59)){return 0;}
			i_val+=ss.length;}
		else if (token=="a") {
			if (val.substring(i_val,i_val+2).toLowerCase()=="am") {ampm="AM";}
			else if (val.substring(i_val,i_val+2).toLowerCase()=="pm") {ampm="PM";}
			else {return 0;}
			i_val+=2;}
		else {
			if (val.substring(i_val,i_val+token.length)!=token) {return 0;}
			else {i_val+=token.length;}
			}
		}
	// If there are any trailing characters left in the value, it doesn't match
	if (i_val != val.length) { return 0; }
	// Is date valid for month?
	if (month==2) {
		// Check for leap year
		if ( ( (year%4==0)&&(year%100 != 0) ) || (year%400==0) ) { // leap year
			if (date > 29){ return 0; }
			}
		else { if (date > 28) { return 0; } }
		}
	if ((month==4)||(month==6)||(month==9)||(month==11)) {
		if (date > 30) { return 0; }
		}
	// Correct hours value
	if (hh<12 && ampm=="PM") { hh=hh-0+12; }
	else if (hh>11 && ampm=="AM") { hh-=12; }
	var newdate=new Date(year,month-1,date,hh,mm,ss);
	return newdate.getTime();
	}



////////////////////// MM hide/show support function //////////////////////////

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	obj.visibility=v; }
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

//----------------------------------
//		cisco_detect.js
//----------------------------------

/**
 *  Browser specific detection and printing of Cisco.com Style Sheets
 *  cisco_detect.js
 */

/* will use later when supported browsers are confirmed

error = "support_error.html"
bName = navigator.appName;
bVer = parseInt(navigator.appVersion);
if (bName == "Netscape" && bVer >=4) {
}
else if (bName == "Netscape" && bVer >=3) {
window.location=error;
}
else if (bName == "Netscape" && bVer >=1) {
window.location=error;
}
else if (bName == "Microsoft Internet Explorer" && bVer >=4) {
}
else if (bName == "Microsoft Internet Explorer" && bVer >=2) {
window.location=error;
}
else 
window.location=error;
*/

function isUnix() {
    var Unixes = new Array("SunOS", "HP", "Linux"); 
    var $flag = false;
    for (var i=0; i < Unixes.length; i++) {
    	if (navigator.appVersion.indexOf(Unixes[i]) != -1) {
	    $flag=true;
	    break;
    	}
    }
    return $flag;
}

if (isUnix()) {
    document.write ("<link rel='stylesheet' type='text/css' href='resources/c/cdcUnix.css'>")
}
else if (navigator.appName == "Netscape") {
//if (!document.all && document.getElementById) {
    document.write ("<link rel='stylesheet' type='text/css' href='resources/c/cdcNs.css'>")
}
else 
    document.write ("<link rel='stylesheet' type='text/css' href='resources/c/cdc.css'>")


//----------------------------------
//		crosstrackselectors.js
//----------------------------------

var xmlHttp = null;
var requestType="";
var selectedUserId=null;
var parentElementId = null;

function setParentElement(element){
	parentElementId = element;
	//alert('Parent element id set to : '+parentElementId);
}

function searchUsersPagDD(divname, sortid){	
	var pageNum =  document.getElementById('userIdPageNumber').value;
	searchItems(divname, pageNum, sortid,'ASC','0');
}

function searchUsers(divname){
	//Hasthi
	var searchStr =	document.getElementById('userIdSearchStr').value;
	var sortid =	document.getElementById('sortId').value;
	if(validateMinLength(document.getElementById('userIdSearchStr').value,1) && document.getElementById('compNameSearchStr')==null){
		alert ("XXCSS_CT-650038 : Please enter User ID or User Name.");
		return;
	}
	else if(validateMinLength(document.getElementById('userIdSearchStr').value,1) && document.getElementById('compNameSearchStr')!=null && validateMinLength(document.getElementById('compNameSearchStr').value,1)){
		alert ("XXCSS_CT-651025: Please enter User ID/User Name or Company Name");
		return;
	}
	else if(document.getElementById('userIdSearchStr') !=null && document.getElementById('userIdSearchStr').value !='' && validateMinLength(document.getElementById('userIdSearchStr').value,3)){
		alert ("XXCSS_CT-650040 : Minimum 3 characters are required for searching the User ID/User Name. Please modify and resubmit your search.");
		return;

	}else if (document.getElementById('userIdSearchStr') !=null && document.getElementById('userIdSearchStr').value !='' && validateMaxLength(document.getElementById('userIdSearchStr').value,100)){
		alert ("XXCSS_CT-650041 : Maximum of 100 characters allowed for searching User ID/User Name . Please modify and resubmit your search.");
		return;
	}
	else if (document.getElementById('userIdSearchStr') !=null && document.getElementById('userIdSearchStr').value !='' && validateAscii(document.getElementById('userIdSearchStr').value)) {
		alert("Entry has special characters that are not allowed.\nPlease remove them and try again.");
		return;
	}
	else if(document.getElementById('userType').value != null
				&& document.getElementById('userType').value != "INTERNAL"){
		if(document.getElementById('compNameSearchStr') !=null && document.getElementById('compNameSearchStr').value !='') {
			if(validateMinLength(document.getElementById('compNameSearchStr').value,3)){
				alert ("XXCSS_CT-650042 : Minimum 3 characters are required for searching the CompanyName. Please modify and resubmit your search.");
				return;
			}
			else if (validateMaxLength(document.getElementById('compNameSearchStr').value,40)){
				alert ("XXCSS_CT-650043 : Maximum of 40 characters allowed for searching Company Name. Please modify and resubmit your search.");
				return;
			}
			else
				searchItems(divname, -1, sortid,'ASC','0');
		}
		else
			searchItems(divname, -1, sortid,'ASC','0');
	}
	else{
		searchItems(divname, -1, sortid,'ASC','0');
	}
}


function searchItems(divname, pageNo, sortId,sortOrder,prevSortId){


	if(pageNo=="-1"&&sortId=="-1")
     selectedUserId=null;

   if(pageNo=="1"&&sortId!="-1")
     selectedUserId=null;
      
   var parameters= new Array();
   var i=0;
     
     parameters[i++] = 'methodName';
     parameters[i++] = 'getUserIdSearchFilterList';
     
     
	 
	 if ((document.getElementById('userIdNameSelection') != null) && (document.getElementById('userIdNameSelection').value ==2)) {
	 	parameters[i++]='userIdSearchStr';
	 	parameters[i++]="";
	 	parameters[i++]='userName';
	 	parameters[i++]=trim(document.getElementById('userIdSearchStr').value);
	 }
	 else {
		parameters[i++]='userIdSearchStr';
		parameters[i++]=trim(document.getElementById('userIdSearchStr').value);
	 	parameters[i++]='userName';
	 	parameters[i++]="";
	 }
	 
	if(document.getElementById('compNameSearchStr') != null){
	
	    parameters[i++]='compNameSearchStr';
	 	parameters[i++]=trim(document.getElementById('compNameSearchStr').value);

	 }
	 parameters[i++]='ccouser';
     parameters[i++]=document.getElementById('ccouser').value;
     
     parameters[i++]='context';
     parameters[i++]=document.getElementById('context').value;
     
     parameters[i++]='sourcesystem';
     parameters[i++]=document.getElementById('sourcesystem').value;	

     parameters[i++]='userType';
     parameters[i++]=document.getElementById('userType').value;	
	
     parameters[i++]='selectionType';
     parameters[i++]=document.getElementById('selectionType').value;
	 parameters[i++]='sortOrder';
	 parameters[i++]=sortOrder;
	 parameters[i++]='prevSortId';
	 parameters[i++]=prevSortId;

   if(pageNo!="-1")
   {   
      parameters[i++]='pageNo';
      parameters[i++]=pageNo;  
   }
   
   if(sortId!="-1")
   {
      //alert("sortId is not -1 "+sortId);
      parameters[i++]='sortId';
      parameters[i++]=sortId;   

   }
	
	actionurl = "./userIdSelector.do";
	
	var response = XMLHttpRequestSender(actionurl, parameters, 'true', 'GET',  
									'1000000', '3', divname, displayResults);
									
	document.getElementById('dataGrid').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   									
}

function displayResults(req, divToChange) 
{
   //alert('Inside displayResults into '+divToChange);
   var result = req.responseText;
   //alert(result);
   //alert('divToChange :' + divToChange);
   document.getElementById(divToChange).innerHTML=result;
}

function XMLHttpRequestSender()
{
	//alert('in XMLHttpRequestSender');
      var serverResponse,url,URL,Encode,requestType,timeOut,maxResults,idToChange;
      var timer,UrlParameters="";
      var i,j=0,k=1,x=0,y=0,m;
      var Names = new Array();
      var Values = new Array();
      var Parameters = new Array(); 
      URL = arguments[0];
      Parameters = arguments[1];
      Encode = arguments[2];
      requestType = arguments[3];
      timeOut = arguments[4];
      maxResults = arguments[5];
      idToChange = arguments[6];
      callBackFunction = arguments[7];
      
      var XMLHttpReq = createXMLHttpReq();
      
      function createXMLHttpReq()
      {
         try { 
            return new ActiveXObject("Msxml2.XMLHTTP");
         }catch (e) {}
         try { 
            return new ActiveXObject("Microsoft.XMLHTTP");
         }catch (e) {}
         try {
            return new XMLHttpRequest();
         }catch (e) {}  
      }
      if(Encode = "true")
      {  
         for(i=0; i < Parameters.length/2; i++)
         {
            if(j+i < Parameters.length)
            {        
               Names[x++] = escape(Parameters[j+i]);
               j++;     
            }
            if(k+i < Parameters.length)
            {        
               Values[y++] = escape(Parameters[k+i]); 
               k++;     
            }
         }
         for(m in Names)
         {
            UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"&";      
         }
         
      }
      else
      {
         for(i in Parameters)
         {
            if(j+i < Parameters.length){
               Names[x++] = Parameters[j+i];
               j++;           
            }
            if(k+i < Parameters.length){        
               Values[y++] = Parameters[k+i];
               k++;                    
            }  
         }

         for(m in Names)
         {
            UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"\&";     
         }     
      }

      if( requestType == "GET")
      {
         url = URL+"?"+UrlParameters;
         XMLHttpReq.open("GET",url,true);
         timer = setTimeout( function() {
               XMLHttpReq.abort();
                },timeOut);      
         XMLHttpReq.onreadystatechange = function()
         {
            //alert('readyState : '+XMLHttpReq.readyState);
            
            if (XMLHttpReq.readyState == 4) 
            {
            	//alert('Status : '+XMLHttpReq.status);
               clearTimeout(timer);               
               if (XMLHttpReq.status == 200) 
               {
                   callBackFunction(XMLHttpReq,idToChange);             
               }
               else{
              	// alert('in else alert');
				callBackFunction(XMLHttpReq,idToChange);                
	        	}
            }     
         }     
         XMLHttpReq.send('');
      }

      else if( requestType == "POST")
      {
         url = URL;  
         XMLHttpReq.open("POST",url,true);
         XMLHttpReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
         
         timer = setTimeout( function() {
               XMLHttpReq.abort();
                },timeOut);
         XMLHttpReq.onreadystatechange = function()
         {
               if (XMLHttpReq.readyState == 4) 
               {
                  clearTimeout(timer);
                  if (XMLHttpReq.status == 200) 
                  {
                         callBackFunction(XMLHttpReq,idToChange);             
                   }
               }
         }
         XMLHttpReq.send(UrlParameters);
      } 
}


function retainUserId(userId){
	selectedUserId = userId;
}

function transferUserIdToParent(){
	
	//Hasthi
	//alert('parentElementId : '+ parentElementId);	
	//alert('selectedUserId : '+ selectedUserId);
	var temp="";
	var seletedUsrsstr="";
	if(selectedUserId == null){
		alert('No user selected');
	} else{
		for(var i=0; i<document.getElementById('FormName').elements.length; i++){
			var elem = document.FormName.elements[i];
		    if(elem.type=='checkbox'){
		      if (elem.checked==true) {
		      	temp= elem.value;
		      	temp=temp+",";
		      	seletedUsrsstr=seletedUsrsstr+temp;
			  }
		    } else if(elem.type=='radio'){
		       if (elem.checked==true) {
			      	seletedUsrsstr=elem.value;
			  }
		    } 
		  }		
		  alert('Selected list of users: '+seletedUsrsstr);
			//alert('parentElementId current value : '+ self.creator.document.getElementById(parentElementId).value);		
			self.creator.document.getElementById(parentElementId).value = seletedUsrsstr;
			self.close();		
	}
}

function printUser(){
	var alertMessage = '';
	if(selectedUserId == null){
		alertMessage = 'No user selected';
	}
	else {
		alertMessage = 'Selected USer is : '+selectedUserId;
	}		
	//alert(alertMessage);	
}


function adjustCustArray()
{

   var customersList = document.FormName.selectLineItem;

   for(j=0;j<customersList.length;j++)
   {
 		if (customersList[j].checked == true)
 		{
 			objs = addVal(objs,customersList[j].value);
 		}
 		else
 		{
 			objs = deleteVal(objs,customersList[j].value);
 		}
   }

}
//Validation for minimum length
function validateMinLength(value,pLenght){
		if(!trim(value) || trim(value).length<pLenght )
				 return true;
	
	return false;
}

//Validataion maximum for length > 40

function validateMaxLength(value,pLenght){

	if(value.length>pLenght )
		 return true;
	
	return false;
}

//Special characters validations

function charValidations(value){
	 var iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?";
	  trimvalue = trim(value);
	  for (var i = 0; i < trimvalue.length; i++) {
	  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
		  	return false;
	  	}
	  }
	return true;
}


// Removes leading whitespaces
function LTrim( value ) {
	
	var re = /\s*((\S+\s*)*)/;
	return value.replace(re, "$1");
	
}

// Removes ending whitespaces
function RTrim( value ) {
	
	var re = /((\s*\S+)*)\s*/;
	return value.replace(re, "$1");
	
}

// Removes leading and ending whitespaces
function trim( value ) {
	
	return LTrim(RTrim(value));
	
}


function commaValidation(value){
		 var iChars = ",";
		  trimvalue = trim(value);
		  for (var i = 0; i < trimvalue.length; i++) {
		  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
			  	return false;
		  	}
		  }
		return true;
		}
		
		function extCharValidations(value,categorySearchVal){
			//Q1FY15-CR#386667-gdushyan
			var iChars;
			if((categorySearchVal != null || categorySearchVal != undefined) && ( categorySearchVal == 'Host Id')){
				iChars = "!@$%^*()+=[]\\\;,/{}|\"<>?&#";	
			}
			else{
				iChars = "!@$%^*()+=[]\\\;,./{}|\":<>?&#";
			}
			//End-Q1FY15-CR#386667-gdushyan
		  trimvalue = trim(value);
		 if (trimvalue.indexOf(" ") != -1) {
		  		return false;
	  	 }
		  for (var i = 0; i < trimvalue.length; i++) {
		  	if (iChars.indexOf(trimvalue.charAt(i)) != -1) {
			  	return false;
		  	}		  	
		  }
		  
		return true;
	}

// Checking ASCII characters if not, displaying the alert message ---MLS Changes by kgudipat
function validateAscii(str) {
	//var str = obj.value;
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {			
			return true;
		}
	}
	return false;
}
	

//----------------------------------
//		cxDHTMLMenu.js
//----------------------------------

/**
 * Constructor for the dhtml menu object. Sets the default values
 *
 * @param   n instance name
 * @param   d target Div ID
 * @param   s skinID
 * @param   l location where the images need to be loaded from
 */
cxDHTMLMenu = function(n, d, s, l) {
    if (s == undefined) s="default";  //setting skin ID as default if not defined
	if (l == undefined) l=""; //default it to null so it uses the current track's JVM
    this.skinID = s;
    this.instanceName = n;
    this.divID = d;
    this.location = l;

    // preload image for the add icon
    this.images = new Object();
    this.preLoadImage('mtab_left_first', true, true, false);
    this.preLoadImage('mtab_left', true, true, true);
    this.preLoadImage('mtab_middle', true, true, false);
    this.preLoadImage('mtab_right', true, true, false);
    this.preLoadImage('mtab_right_last', true, true, false);

    document.write('<link href="'+this.location+'images/dNav/' + this.skinID + '/cxDHTMLMenu.css" rel="stylesheet" type="text/css">') // linking the css file
}


/**
 * (Re)Draws the dhtml navigation object
 */
cxDHTMLMenu.prototype.reDraw = function(){
    var t = this;

    // temp var to hold the HTML String representing the object
    var s = '';

    // formatting HTML
    s += '<div class="menu_container">';
    s +=   '<div class="tabs">';
    s +=     '<table class="menu" cellSpacing="0" cellPadding="0" border="0">';
    s +=     '<tr>';

    //create Tabs
    var ml = t.menuItems.length;

    // make each TD element
    for (i=0; i<ml; i++) {
      var mItem = t.menuItems[i];

      s += '<td'
      if (mItem.disabled) {
        s +=     ' class="disabledLink"';
      }
      s += '>';
      s +=   '<a';
      if (!mItem.disabled) {
        s +=     ' onmouseover="over(event)" onmouseout="out(event)"';
      }
      s +=       ' id="tab'+i+'"';
      // if url/target are specified put them else put in "#" and onclick="return false"
      // note: target is not checked unless url is specified.
      if ((mItem.url != null)&&(mItem.url != "")&&(!mItem.disabled)) {
        s +=     ' href="'+t.menuItems[i].url+'"';
        if ((mItem.target != null)&&(mItem.target != "")) {
          s +=   ' target="'+mItem.target+'"';
        }
        s +=     ' onclick="'+t.instanceName+'.callEvent(\'onClick\', '+i+');"';
      } else {
        s +=     ' href="#"';
        s +=     ' onclick="'+t.instanceName+'.callEvent(\'onClick\', '+i+'); return false;"';
      }
      s +=   '>';

      // add left image (special case for first tab
      s +=   '<img alt="" src="'+t.location+'images/dNav/'+t.skinID+'/';
      s += (i == 0) ? 'mtab_left_first_normal.gif' : 'mtab_left_normal.gif';
      s +=       '" align="absMiddle" border="0">';

      // add title text
      s +=   '<span>'+mItem.title+'</span>';

      // add right image (special case for last tab
      s +=   '<img alt="" src="'+t.location+'images/dNav/'+t.skinID+'/';
      s += (i == (ml-1)) ? 'mtab_right_last_normal.gif' : 'mtab_right_normal.gif';
      s +=       '" align="absMiddle" border="0">';

      s +=   '</a>';
      s += '</td>';
    }

    s +=     '</tr>';
    s +=     '</table>';
    s +=   '</div>';
    // tabs div closed

    // create sub menu div's
    s +=   '<div class="level_two">';

    // loop through all menu's
    for (i=0; i<ml; i++) {
      var sml = t.menuItems[i].subMenuItems.length;

      // if this menu has child menu's proceed as normal, else change the class to show no bar 
      if (sml > 0) {
        s +=   '<div id="tab'+i+'_submenu" class="subMenu" onmouseover="divover(\'tab'+i+'\')" onmouseout="divout(\'tab'+i+'\')">';
        s +=     '<ul>';
  
        // loop through and create all sub-menu items
        for (j=0; j<sml; j++) {
          var subItem = t.menuItems[i].subMenuItems[j];
          // attach class for first sub menu item so that the divider is not rendered
          s +=     '<li';
          if (j == 0) {
            s +=       ' class="first"';
          }
          s +=     '>';
  
          // create link around the text
          s +=       '<a';
//alert(subItem.display);
          if (!(!subItem.disabled)) {
            s +=         ' class="disabledSubLink"';
            s +=         ' href="#"';
            s +=         ' onclick="return false;"';
          } else {
            
            //added for sept-release 2007 ,if submenu is distribution (or distributor) then only we are adding title
            if(subItem.display == 'Distribution' || subItem.display== 'DISTRIBUTION' ){
                s +=         ' href="'+subItem.url+'" title="'+subItem.DistributionMessage+'"';
            }
            else{
            	s +=         ' href="'+subItem.url+'"';
            }
            // only attach target attribute if it exists
            if ((subItem.target != null) && (subItem.target != "")) {
              s +=       ' target="'+subItem.target+'"';
            }
            // attach onclick event
            s +=         ' onclick="'+t.instanceName+'.callEvent(\'onClick\', '+i+', '+j+');"';
          }

          s +=       '>';
          s +=       subItem.title;
          s +=       '</a>';
          s +=     '</li>';
  
          delete subItem;
        }
  
        s +=     '</ul>';
        s +=   '</div>';
      } else {
        s +=   '<div id="tab'+i+'_submenu" class="subMenuEmpty"></div>';
      }

      delete sml
    }

    s += '  </div>';
    // sub menus div closed
	//Added for tertiary menus...to temporarily prevent the menu movement
	//Will dig into deep to resolve it properly aftre discusing with crosstrack and vikram
    s +=   '<div id="ttab'+'_submenu" class="subMenuEmpty"></div>';
    s += '</div>';
    // close base div

    // write HTML String to the container Div
    MM_setTextOfLayer(t.divID, '' , s);
}


/**
 * Adds a new top-level menu item at the specified index position.
 *
 * @param   d display text (title) for the menu item
 * @param   i index position at which the new menu item will be added (optional)
 * @param   u url to link menu item to (optional)
 * @param   g target to use for url (optional)
 */
cxDHTMLMenu.prototype.addMenuItem = function (d, i, u, g) {
    var t = this;

    // if position is not specified - set it to last element
    if ((i == undefined) || (i == null) || (i == "")) {
      i = t.menuItems.length;
    }

    // create menu item object
    var o = new Object();
    o.title = d;
    o.url = u;
    o.target = g;
    o.subMenuItems = new Array();

    // splice new menu item into array
    t.menuItems.splice(i, 0, o);

    // redraw menu
    t.reDraw();
}


/**
 * Removes a top-level menu item at the specified index position. All sub menu items are also
 * destroyed by this.
 *
 * @param   i index position of the menu item to remove
 */
cxDHTMLMenu.prototype.removeMenuItem = function (i) {
    var t = this;

    // splice menu item out of array
    t.menuItems.splice(i, 1);

    // redraw menu
    t.reDraw();
}


/**
 * Adds a new sub menu item at the specified index position into a parent menu item.
 *
 * @param   d display text (title) for the menu item
 * @param   i index position at which the new menu item will be added
 * @param   si index position at which the new menu item will be added (optional)
 * @param   u url to link menu item to
 * @param   g target to use for url (optional)
 */
cxDHTMLMenu.prototype.addSubMenuItem = function (d, i, si, u, g, z, y) {
    var t = this;

    // if position is not specified - set it to last element
    if ((si == undefined) || (si == null) || (si == "")) {
      si = t.menuItems[i].subMenuItems.length;
    }

    // create submenu item object
    var o = new Object();
    o.title = d;
    o.url = u;
    o.target = g;
    o.display = z;
    o.DistributionMessage=y;

    // splice new menu item into array
    t.menuItems[i].subMenuItems.splice(si, 0, o);

    // redraw menu
    t.reDraw();
}


/**
 * Removes a submenu item at the specified index position. Parent needs to be specified
 *
 * @param   i  index of parent menu item
 * @param   is index of sub menu item to be removed
 */
cxDHTMLMenu.prototype.removeSubMenuItem = function (i, is) {
    var t = this;

    // splice sub menu item out of array
    t.menuItems[i].subMenuItems.splice(is, 1);

    // redraw menu
    t.reDraw();
}


/**
 * Enables a menu item component at the index position specified by i and si.
 * If si is not passed, it enables the top level menu item at "i" else it works
 * on the sub menu item at "si".
 *
 * @param   i  index of the top level menuItem in the component to be enabled
 * @param   si index of the sub menu item in the component to be enabled (optional)
 */
cxDHTMLMenu.prototype.setItemEnable = function (i, si) {
    var t = this;
    // if subitem is specified, enable subitem
    if((si != undefined)&&(si != null)&&(si != "")){
      var subItem = t.menuItems[i].subMenuItems[si];
      if (subItem.disabled) {
        subItem.disabled = false;
        t.reDraw();
      }
    } else {
    // if subitem is not passed, enable the top level item
      var mItem = t.menuItems[i];
      if (mItem.disabled) {
        mItem.disabled = false;
        t.reDraw();
      }
    }
}


/**
 * Disables a menu item component at the index position specified by i and si.
 * If si is not passed, it disables the top level menu item at "i" else it works
 * on the sub menu item at "si".
 *
 * @param   i  index of the top level menuItem in the component to be disabled
 * @param   si index of the sub menu item in the component to be disabled (optional)
 */
cxDHTMLMenu.prototype.setItemDisable = function (i, si) {
    var t = this;
    // if subitem is specified, disable subitem
    if((si != undefined)&&(si != null)&&(si != "")){
      var subItem = t.menuItems[i].subMenuItems[si];
      if (!subItem.disabled) {
        subItem.disabled = true;
        t.reDraw();
      }
    } else {
    // if subitem is not passed, disable the top level item
      var mItem = t.menuItems[i];
      if (!mItem.disabled) {
        mItem.disabled = true;
        t.reDraw();
      }
    }
}


/**
 * Triggers an event with any extra parameters specified
 *
 * @param e Name of event to be created/triggered
 */
cxDHTMLMenu.prototype.callEvent = function(e){
    this[e] && this[e].apply( this, [].slice.call( arguments, 1 ) );
};


/**
 * Preloads a given image
 * @param   imgID Name of image
 * @param   n     flag for "normal" state
 * @param   se    flag for "selected" state
 * @param   su    flag for "suport" state
 */
cxDHTMLMenu.prototype.preLoadImage = function(imgID, n, se, su) {
	var t = this;

  if (n) {
  	t.images[imgID] =  new Image();
  	t.images[imgID].src = t.location + "images/mPick/" + t.skinID + "/" + imgID + "_normal.gif";
  }
  if (se) {
  	t.images[imgID] =  new Image();
  	t.images[imgID].src = t.location + "images/mPick/" + t.skinID + "/" + imgID + "_selected.gif";
  }
  if (su) {
  	t.images[imgID] =  new Image();
  	t.images[imgID].src = t.location + "images/mPick/" + t.skinID + "/" + imgID + "_support.gif";
  }
}



// Macromedia helper function to get a reference to an object by its ID
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}


// Macromedia helper function to set text/innerHTML of a layer
function MM_setTextOfLayer(objName,x,newText) { //v4.01
if ((obj=MM_findObj(objName))!=null) with (obj)
    if (document.layers) {document.write(unescape(newText)); document.close();}
    else innerHTML = unescape(newText);
}


// Supporting menu handling functions


/**
 * Event handler for a mouseout event on a particular sub menu div
 *
 * @param   id id of sub menu item's div (that triggered the event)
 */
function divout(id) {
	requestHide(document.getElementById(id));
}


/**
 * Dets a timeout to give a slight delay between the mouse exiting a
 * div and the menu visually disappearing
 *
 * @param   elem id of sub menu item's div (that triggered the event)
 */
function requestHide(elem) {
	elem.outTimeout = setTimeout(function() { out2(elem); }, 300);
}


/**
 * Event handler for a mouseover event on a particular sub menu div
 * This cancels the call to any pending hide requests.
 *
 * @param   id id of sub menu item's div (that triggered the event)
 */
function divover(id) {	
	clearTimeout(document.getElementById(id).outTimeout);
}


/**
 * Event handler for a mouseover event on a particular top level tab
 *
 * @param   evt event pointer (will have reference to the tab that triggered the onmouseover)
 */
function over(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;

  // clear any pending hide timer for this tab
	clearTimeout(elem.outTimeout);
  // set the current active tab to this one
	activeTab(elem);
  // display the sub menu
	document.getElementById(elem.id + "_submenu").style.display = 'block';
	}	
}
}


/**
 * Event handler for a mouseout event on a particular top level tab
 *
 * @param   evt event pointer (will have reference to the tab that triggered the onmouseout)
 */
function out(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;
  // set an interval before the menu is hidden
	requestHide(elem);
	}	
}
}


/**
 * This function does the real hiding/disabling for any tab+submenu
 *
 * @param   elem div id for the menu+submenu to be deactivated
 */
function out2(elem) {
 // hide the submenu
 document.getElementById(elem.id + "_submenu").style.display = 'none';
 // change the tab back
 inActiveTab (elem);
}


/**
 * This function visually returns the specified tab to "normal" state
 *
 * @param   elem div id for the menu to be deactivated
 */
function inActiveTab(elem) {
elem.active = false;
var tdCollection = elem.parentNode.parentNode.getElementsByTagName("td");
// change the tab images and background class
var imgs = elem.getElementsByTagName("img");
for (var i = 0; i < imgs.length; i++) {
	if (i == 0 && elem.parentNode.cellIndex > 0 && tdCollection[elem.parentNode.cellIndex - 1].getElementsByTagName('a')[0].active) {
continue;
	}
	var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
	imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_normal$1');;
} 
if (elem.nodeName.toLowerCase() == 'a') {
	elem.parentNode.className = "";
}
// Change the supporting tab's (the tab on the right) left image.
if (elem.parentNode.cellIndex < tdCollection.length - 1) {
if (tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName('a')[0].active) {
	return;
}
	var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_normal$1');
}
}


/**
 * This function visually sets the specified tab to "active" state
 *
 * @param   elem div id for the menu to be activated
 */
function activeTab(elem) {
// turn all tabs off before turning this one on
allTabsOff(elem);
elem.active = true;
var imgs = elem.getElementsByTagName("img");
// change the tab images and background class
for (var i = 0; i < imgs.length; i++) {
	var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
	imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_selected$1');
} 
if (elem.nodeName.toLowerCase() == 'a') {
	elem.parentNode.className = 'active';
}
// change the supporting tab's left image
var tdCollection = elem.parentNode.parentNode.getElementsByTagName("td");
if (elem.parentNode.cellIndex < tdCollection.length - 1) { 
	var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_support$1');
}
}


/**
 * This function visually returns all tabs to "normal" state
 *
 * @param   elem div id for the menu (used to get pointer to parent td object
 * which tab we pass is immaterial.
 */
function allTabsOff(elem) {
var tds = elem.parentNode.parentNode.getElementsByTagName("td");
for (var td = 0; td < tds.length; td++) {
	var as = tds[td].getElementsByTagName("a");
	for (var a = 0; as < as.length; a++) {
clearTimeout(as[a].outTimeout);
as[a].active = false;
	}
	var imgs = tds[td].getElementsByTagName("img");
	for (img = 0; img < imgs.length; img++) {
var image = imgs[img].src.replace(/_normal|_selected|_support/g, '');
imgs[img].src = image.replace(/(\.[^.]+)$/, '_normal$1');
	}
}
}

//----------------------------------
//		datapersistence.js
//----------------------------------

function addVal(obj, v)
{
   if(!containsVal(obj, v))
   {
      var addObj = [v];
      obj = obj.concat(addObj);
   }
   return obj;
}


function deleteVal(obj, v)
{
   if(containsVal(obj, v))
   {
      for(var b=0;b<obj.length;b++)
      {
         if(obj[b]==v)
         {
            obj.splice(b,1);
            return obj;
         }
      }
   }
   return obj;
}

function printVal(obj)
{
   var outStr = '';
   for(var c=0; c<obj.length; c++)
   {
      outStr += obj[c]+'\n';
   }
   alert('Number of elements : '+obj.length+'\n'+outStr);
}

function modifyContent(obj, v)
{
   if(containsVal(obj, v))
   {
      obj = deleteVal(obj, v);
   }
   else
   {
      obj = addVal(obj, v);
   }
   return obj;
}

function modifyRadioContent(obj, v)
{

      obj = addVal(obj, v);
 	  return obj;
}

function containsVal(obj, v)
{
   for(var b=0;b<obj.length;b++)
   {
      if(obj[b]==v)
         return true;
   }
   return false;
}


//----------------------------------
//		HashTable.js
//----------------------------------

/** Author : Uday Kumar Pyda
 *  Creation Date : 07/18/2006
 *  Description : This is a custom-made HashTable which is a simulation of
 *       		Java's default HashTable. The intention is to accomodate
 *				any requirements in Quoting and Ordering to store Javascript
 *				objects in page scope.
 */

HashTable.prototype.values    = null;
HashTable.prototype.keys      = null;

function HashTable()
{
   this.values = new Array();
   this.keys = new Array();
}

HashTable.prototype.count = function ()
{
	return this.keys.length;
}

HashTable.prototype.get = function (key)
{
   if(key==null)
      return null;
      
   for (var i = 0; i < this.keys.length; i++)
      if (key == this.keys[i])
         return this.values[i];
   
}

HashTable.prototype.put = function (key, value)
{
   if (value == null)
      return;

   if (!this.contains(key))
   {
      this.keys[this.keys.length] = key;
      this.values[this.values.length] = value;
      //alert('Added new entry in hashtable : '+key + '->'+ value + ' total : '+this.keys.length);
   }
   else
   {
   	//Overwrite the obj if it is already present
   	for (var i = 0; i < this.keys.length; i++)
    	if (key == this.keys[i])
    		this.values[i] = value;
   
   }
}

HashTable.prototype.contains = function (key)
{
   for (var i = 0; i < this.keys.length; i++)
      if (key == this.keys[i])
         return true;
   
   return false;
}

HashTable.prototype.toString = function ()
{
   var s = '';

   try 
   {
      s += "{";

      for (var i = 0; i < this.keys.length; i++)
      {
         s += this.keys[i];
       	 s += "->";
         s += this.values[i];
         
         if (i != this.keys.length-1)
            s += ", ";
      }
      
      s += "}";
   } 
   catch(e) 
   {
     //What to do here???
   }
   finally
   {
      s[s.length] = "}";
   }

   return s;
}

//----------------------------------
//		jsonrpc.js
//----------------------------------

/*
 * JSON-RPC JavaScript client
 *
 *
 * Copyright (c) 2003-2004 Jan-Klaas Kollhof
 * Copyright (c) 2005 Michael Clark, Metaparadigm Pte Ltd
 *
 * This code is based on Jan-Klaas' JavaScript o lait library (jsolait).
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public (LGPL)
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details: http://www.gnu.org/
 *
 */


/* escape a character */

escapeJSONChar =
function escapeJSONChar(c)
{
    if(c == "\"" || c == "\\") return "\\" + c;
    else if (c == "\b") return "\\b";
    else if (c == "\f") return "\\f";
    else if (c == "\n") return "\\n";
    else if (c == "\r") return "\\r";
    else if (c == "\t") return "\\t";
    var hex = c.charCodeAt(0).toString(16);
    if(hex.length == 1) return "\\u000" + hex;
    else if(hex.length == 2) return "\\u00" + hex;
    else if(hex.length == 3) return "\\u0" + hex;
    else return "\\u" + hex;
};


/* encode a string into JSON format */

escapeJSONString =
function escapeJSONString(s)
{
    /* The following should suffice but Safari's regex is b0rken
       (doesn't support callback substitutions)
       return "\"" + s.replace(/([^\u0020-\u007f]|[\\\"])/g,
       escapeJSONChar) + "\"";
    */

    /* Rather inefficient way to do it */
    var parts = s.split("");
    for(var i=0; i < parts.length; i++) {
	var c =parts[i];
	if(c == '"' ||
	   c == '\\' ||
	   c.charCodeAt(0) < 32 ||
	   c.charCodeAt(0) >= 128)
	    parts[i] = escapeJSONChar(parts[i]);
    }
    return "\"" + parts.join("") + "\"";
};


/* Marshall objects to JSON format */

toJSON = function toJSON(o)
{
    if(o == null) {
	return "null";
    } else if(o.constructor == String) {
	return escapeJSONString(o);
    } else if(o.constructor == Number) {
	return o.toString();
    } else if(o.constructor == Boolean) {
	return o.toString();
    } else if(o.constructor == Date) {
	return '{javaClass: "java.util.Date", time: ' + o.valueOf() +'}';
    } else if(o.constructor == Array) {
	var v = [];
	for(var i = 0; i < o.length; i++) v.push(toJSON(o[i]));
	return "[" + v.join(", ") + "]";
    } else {
	var v = [];
	for(attr in o) {
	    if(o[attr] == null) v.push("\"" + attr + "\": null");
	    else if(typeof o[attr] == "function"); /* skip */
	    else v.push(escapeJSONString(attr) + ": " + toJSON(o[attr]));
	}
	return "{" + v.join(", ") + "}";
    }
};


/* JSONRpcClient constructor */

JSONRpcClient =
function JSONRpcClient_ctor(serverURL, user, pass, objectID)
{
    this.serverURL = serverURL;
    this.user = user;
    this.pass = pass;
    this.objectID = objectID;

    /* Add standard methods */
    if(this.objectID) {
	this._addMethods(["listMethods"]);
	var req = this._makeRequest("listMethods", []);
    } else {
	this._addMethods(["system.listMethods"]);
	var req = this._makeRequest("system.listMethods", []);
    }
    var m = this._sendRequest(req);
    this._addMethods(m);
};


/* JSONRpcCLient.Exception */

JSONRpcClient.Exception =
function JSONRpcClient_Exception_ctor(code, message, javaStack)
{
    this.code = code;
    var name;
    if(javaStack) {
	this.javaStack = javaStack;
	var m = javaStack.match(/^([^:]*)/);
	if(m) name = m[0];
    }
    if(name) this.name = name;
    else this.name = "JSONRpcClientException";
    this.message = message;
};

JSONRpcClient.Exception.CODE_REMOTE_EXCEPTION = 490;
JSONRpcClient.Exception.CODE_ERR_CLIENT = 550;
JSONRpcClient.Exception.CODE_ERR_PARSE = 590;
JSONRpcClient.Exception.CODE_ERR_NOMETHOD = 591;
JSONRpcClient.Exception.CODE_ERR_UNMARSHALL = 592;
JSONRpcClient.Exception.CODE_ERR_MARSHALL = 593;

JSONRpcClient.Exception.prototype = new Error();

JSONRpcClient.Exception.prototype.toString =
function JSONRpcClient_Exception_toString(code, msg)
{
    return this.name + ": " + this.message;
};


/* Default top level exception handler */

JSONRpcClient.default_ex_handler =
function JSONRpcClient_default_ex_handler(e) { alert(e); };


/* Client settable variables */

JSONRpcClient.toplevel_ex_handler = JSONRpcClient.default_ex_handler;
JSONRpcClient.profile_async = false;
JSONRpcClient.max_req_active = 1;
JSONRpcClient.requestId = 1;


/* JSONRpcClient implementation */

JSONRpcClient.prototype._createMethod =
function JSONRpcClient_createMethod(methodName)
{
    var fn=function()
    {
	var args = [];
	var callback = null;
	for(var i=0;i<arguments.length;i++) args.push(arguments[i]);
	if(typeof args[0] == "function") callback = args.shift();
	var req = fn.client._makeRequest.call(fn.client, fn.methodName,
					      args, callback);
	if(callback == null) {
	    return fn.client._sendRequest.call(fn.client, req);
	} else {
	    JSONRpcClient.async_requests.push(req);
	    JSONRpcClient.kick_async();
	    return req.requestId;
	}
    };
    fn.client = this;
    fn.methodName = methodName;
    return fn;
};

JSONRpcClient.prototype._addMethods =
function JSONRpcClient_addMethods(methodNames)
{
    for(var i=0; i<methodNames.length; i++) {
	var obj = this;
	var names = methodNames[i].split(".");
	for(var n=0; n<names.length-1; n++) {
	    var name = names[n];
	    if(obj[name]) {
		obj = obj[name];
	    } else {
		obj[name]  = new Object();
		obj = obj[name];
	    }
	}
	var name = names[names.length-1];
	if(!obj[name]) {
	    var method = this._createMethod(methodNames[i]);
	    obj[name] = method;
	}
    }
};

JSONRpcClient._getCharsetFromHeaders =
function JSONRpcClient_getCharsetFromHeaders(http)
{
    try {
	var contentType = http.getResponseHeader("Content-type");
	var parts = contentType.split(/\s*;\s*/);
	for(var i =0; i < parts.length; i++) {
	    if(parts[i].substring(0, 8) == "charset=")
		return parts[i].substring(8, parts[i].length);
	}
    } catch (e) {}
    return "UTF-8"; /* default */
};

/* Async queue globals */
JSONRpcClient.async_requests = [];
JSONRpcClient.async_inflight = {};
JSONRpcClient.async_responses = [];
JSONRpcClient.async_timeout = null;
JSONRpcClient.num_req_active = 0;

JSONRpcClient._async_handler =
function JSONRpcClient_async_handler()
{
    JSONRpcClient.async_timeout = null;

    while(JSONRpcClient.async_responses.length > 0) {
	var res = JSONRpcClient.async_responses.shift();
	if(res.canceled) continue;
	if(res.profile) res.profile.dispatch = new Date();
	try {
	    res.cb(res.result, res.ex, res.profile);
	} catch(e) {
	    JSONRpcClient.toplevel_ex_handler(e);
	}
    }

    while(JSONRpcClient.async_requests.length > 0 &&
	  JSONRpcClient.num_req_active < JSONRpcClient.max_req_active) {
	var req = JSONRpcClient.async_requests.shift();
	if(req.canceled) continue;
	req.client._sendRequest.call(req.client, req);
    }
};

JSONRpcClient.kick_async =
function JSONRpcClient_kick_async()
{
    if(JSONRpcClient.async_timeout == null)
	JSONRpcClient.async_timeout =
	    setTimeout(JSONRpcClient._async_handler, 0);
};

JSONRpcClient.cancelRequest =
function JSONRpcClient_cancelRequest(requestId)
{
    /* If it is in flight then mark it as canceled in the inflight map
       and the XMLHttpRequest callback will discard the reply. */
    if(JSONRpcClient.async_inflight[requestId]) {
	JSONRpcClient.async_inflight[requestId].canceled = true;
	return true;
    }

    /* If its not in flight yet then we can just mark it as canceled in
       the the request queue and it will get discarded before being sent. */
    for(var i in JSONRpcClient.async_requests) {
	if(JSONRpcClient.async_requests[i].requestId == requestId) {
	    JSONRpcClient.async_requests[i].canceled = true;
	    return true;
	}
    }

    /* It may have returned from the network and be waiting for its callback
       to be dispatched, so mark it as canceled in the response queue
       and the response will get discarded before calling the callback. */
    for(var i in JSONRpcClient.async_responses) {
	if(JSONRpcClient.async_responses[i].requestId == requestId) {
	    JSONRpcClient.async_responses[i].canceled = true;
	    return true;
	}
    }

    return false;
};

JSONRpcClient.prototype._makeRequest =
function JSONRpcClient_makeRequest(methodName, args, cb)
{
    var req = {};
    req.client = this;
    req.requestId = JSONRpcClient.requestId++;

    var obj = {};
    obj.id = req.requestId;
    if (this.objectID)
	obj.method = ".obj#" + this.objectID + "." + methodName;
    else
	obj.method = methodName;
    obj.params = args;

    if (cb) req.cb = cb;
    if (JSONRpcClient.profile_async)
	req.profile = { "submit": new Date() };
    req.data = toJSON(obj);

    return req;
};

JSONRpcClient.prototype._sendRequest =
function JSONRpcClient_sendRequest(req)
{
    if(req.profile) req.profile.start = new Date();

    /* Get free http object from the pool */
    var http = JSONRpcClient.poolGetHTTPRequest();
    JSONRpcClient.num_req_active++;

    /* Send the request */
    http.open("POST", this.serverURL, (req.cb != null), this.user, this.pass);

    /* setRequestHeader is missing in Opera 8 Beta */
    try { http.setRequestHeader("Content-type", "text/plain"); } catch(e) {}

    /* Construct call back if we have one */
    if(req.cb) {
	var self = this;
	http.onreadystatechange = function() {
	    if(http.readyState == 4) {
		http.onreadystatechange = function () {};
		var res = { "cb": req.cb, "result": null, "ex": null};
		if (req.profile) {
		    res.profile = req.profile;
		    res.profile.end = new Date();
		}
		try { res.result = self._handleResponse(http); }
		catch(e) { res.ex = e; }
		if(!JSONRpcClient.async_inflight[req.requestId].canceled)
		    JSONRpcClient.async_responses.push(res);
		delete JSONRpcClient.async_inflight[req.requestId];
		JSONRpcClient.kick_async();
	    }
	};
    } else {
	http.onreadystatechange = function() {};
    }

    JSONRpcClient.async_inflight[req.requestId] = req;
	
    try {
	http.send(req.data);
    } catch(e) {
	JSONRpcClient.poolReturnHTTPRequest(http);
	JSONRpcClient.num_req_active--;
	throw new JSONRpcClient.Exception
	    (JSONRpcClient.Exception.CODE_ERR_CLIENT, "Connection failed");
    }

    if(!req.cb) return this._handleResponse(http);
};

JSONRpcClient.prototype._handleResponse =
function JSONRpcClient_handleResponse(http)
{
    /* Get the charset */
    if(!this.charset) {
	this.charset = JSONRpcClient._getCharsetFromHeaders(http);
    }

    /* Get request results */
    var status, statusText, data;
    try {
	status = http.status;
	statusText = http.statusText;
	data = http.responseText;
    } catch(e) {
	JSONRpcClient.poolReturnHTTPRequest(http);
	JSONRpcClient.num_req_active--;
	JSONRpcClient.kick_async();
	throw new JSONRpcClient.Exception
	    (JSONRpcClient.Exception.CODE_ERR_CLIENT, "Connection failed");
    }

    /* Return http object to the pool; */
    JSONRpcClient.poolReturnHTTPRequest(http);
    JSONRpcClient.num_req_active--;

    /* Unmarshall the response */
    if(status != 200) {
	throw new JSONRpcClient.Exception(status, statusText);
    }
    var obj;
    try {
	eval("obj = " + data);
    } catch(e) {
	throw new JSONRpcClient.Exception(550, "error parsing result");
    }
    if(obj.error)
	throw new JSONRpcClient.Exception(obj.error.code, obj.error.msg,
					  obj.error.trace);
    var res = obj.result;

    /* Handle CallableProxy */
    if(res && res.objectID && res.JSONRPCType == "CallableReference")
	return new JSONRpcClient(this.serverURL, this.user,
				 this.pass, res.objectID);

    return res;
};


/* XMLHttpRequest wrapper code */

/* XMLHttpRequest pool globals */
JSONRpcClient.http_spare = [];
JSONRpcClient.http_max_spare = 8;

JSONRpcClient.poolGetHTTPRequest =
function JSONRpcClient_pool_getHTTPRequest()
{
    if(JSONRpcClient.http_spare.length > 0) {
	return JSONRpcClient.http_spare.pop();
    }
    return JSONRpcClient.getHTTPRequest();
};

JSONRpcClient.poolReturnHTTPRequest =
function JSONRpcClient_poolReturnHTTPRequest(http)
{
    if(JSONRpcClient.http_spare.length >= JSONRpcClient.http_max_spare)
	delete http;
    else
	JSONRpcClient.http_spare.push(http);
};

JSONRpcClient.msxmlNames = [ "MSXML2.XMLHTTP.5.0",
			     "MSXML2.XMLHTTP.4.0",
			     "MSXML2.XMLHTTP.3.0",
			     "MSXML2.XMLHTTP",
			     "Microsoft.XMLHTTP" ];

JSONRpcClient.getHTTPRequest =
function JSONRpcClient_getHTTPRequest()
{
    /* Mozilla XMLHttpRequest */
    try {
	JSONRpcClient.httpObjectName = "XMLHttpRequest";
	return new XMLHttpRequest();
    } catch(e) {}

    /* Microsoft MSXML ActiveX */
    for (var i=0;i < JSONRpcClient.msxmlNames.length; i++) {
	try {
	    JSONRpcClient.httpObjectName = JSONRpcClient.msxmlNames[i];
	    return new ActiveXObject(JSONRpcClient.msxmlNames[i]);
	} catch (e) {}
    }

    /* None found */
    JSONRpcClient.httpObjectName = null;
    throw new JSONRpcClient.Exception(0, "Can't create XMLHttpRequest object");
};


//----------------------------------
//		main_lib.js
//----------------------------------
//----------------------------------
//		menu.js
//----------------------------------

/*
 * Multi image Tab Menu 
 * @supported (IE, Net, Moz)
 * @version 1.1
 *
 **/
 
/*
ToDoList
* Remove the timed roll out stuff, for the support tabs. On tab to tab mouse movement. It's not be needed anymore.

* Add comments and function descriptions.

*/
// ---------------------------------------------------------- //
function divout(id) {
	requestHide(document.getElementById(id));
}
// ---------------------------------------------------------- //

function requestHide(elem) {
	elem.outTimeout = setTimeout(function() { out2(elem); }, 1000);
}

// ---------------------------------------------------------- //
function divover(id) {	
	clearTimeout(document.getElementById(id).outTimeout);
}
// ---------------------------------------------------------- //
function over(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;
	clearTimeout(elem.outTimeout);
	activeTab(elem);
	document.getElementById(elem.id + "_submenu").style.display = 'block';
	}	
}
}
// ---------------------------------------------------------- //
function out(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;
	requestHide(elem);
	}	
}
}
// ---------------------------------------------------------- //
function out2(elem) {
 document.getElementById(elem.id + "_submenu").style.display = 'none';
 // change the tab back
 inActiveTab (elem);
}
// ---------------------------------------------------------- //
function inActiveTab(elem) {
elem.active = false;
var tdCollection = elem.parentNode.parentNode.getElementsByTagName("td");
// change the tab images and background class
var imgs = elem.getElementsByTagName("img");
for (var i = 0; i < imgs.length; i++) {
	if (i == 0 && elem.parentNode.cellIndex > 0 && tdCollection[elem.parentNode.cellIndex - 1].getElementsByTagName('a')[0].active) {
continue;
	}
	var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
	imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_normal$1');;
} 
if (elem.nodeName.toLowerCase() == 'a') {
	elem.parentNode.className = "";
}
// Change the supporting tab's (the tab on the right) left image.
if (elem.parentNode.cellIndex < tdCollection.length - 1) {
if (tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName('a')[0].active) {
	return;
}
	var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_normal$1');
}
}
// ---------------------------------------------------------- //

function activeTab(elem) {
allTabsOff(elem);
elem.active = true;
var imgs = elem.getElementsByTagName("img");
// change the tab images and background class
for (var i = 0; i < imgs.length; i++) {
	var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
	imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_selected$1');
} 
if (elem.nodeName.toLowerCase() == 'a') {
	elem.parentNode.className = 'active';
}
// change the supporting tab's left image
var tdCollection = elem.parentNode.parentNode.getElementsByTagName("td");
if (elem.parentNode.cellIndex < tdCollection.length - 1) { 
	var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_support$1');
}
}


// ---------------------------------------------------------- //
function allTabsOff(elem) {
var tds = elem.parentNode.parentNode.getElementsByTagName("td");
for (var td = 0; td < tds.length; td++) {
	tds[td].className = '';
	var as = tds[td].getElementsByTagName("a");
	for (var a = 0; as < as.length; a++) {
clearTimeout(as[a].outTimeout);
as[a].active = false;
	}
	var imgs = tds[td].getElementsByTagName("img");
	for (img = 0; img < imgs.length; img++) {
var image = imgs[img].src.replace(/_normal|_selected|_support/g, '');
imgs[img].src = image.replace(/(\.[^.]+)$/, '_normal$1');
	}
}
}


//----------------------------------
//		mlsValidations.js
//----------------------------------

// Checking ASCII characters if not, displaying the alert message
function checkAscii(obj) {
	var str = obj.value;
	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 127) {
			alert("Please Enter Valid Data");
			obj.value = "";
			obj.focus();
			break;
		}
	}
}

//----------------------------------
//		sitewide_tools.js
//----------------------------------

/**
 *  Sitewide Tools Rollover Functions  
 *  sitewide_tools.js
 */
 
// Window opening script for Sitewide Toolkit only
function sitewide_toolkit_window(url,winName) {
	
	if(!winName) { winName = "swtwin"; }
//commented as specification has been changed for the window size
//	var swtwin = window.open(url, winName, 'width=614,height=400,top=50,left=50,resizable=1,scrollbars=1,toolbar=0,menubar=1,status=1');
        var swtwin = window.open(url, winName, 'width=643,height=492,outerWidth=643,outerHeight=492,top=50,left=70,resizable=yes,scrollbars=yes,toolbar=yes,menubar=yes,status=yes,location=yes');

	swtwin.focus();
	//alert(" site window Opened");
	}

var Imgs = new Array();
var imgPath = "resources/i/";

function precache_imgs( theimgs, lang, country ) {
        //added for  globalization.
        if( (lang!=null && country != null) && !(lang.toLowerCase()=="en" && country.toUpperCase()=="US") ) { 
            imgPath = "resources" + "/" + lang + "/" + country + "/i/";
        }
	for(var i=0; i<theimgs.length; i++) {
		var j = Imgs.length;
		var tmp = { id: theimgs[i], on:null,off:null,text:null }
		tmp.on = new Image(); tmp.on.src = "resources/i/sitewide_"+theimgs[i]+"_on.gif";
		tmp.off = new Image(); tmp.off.src = "resources/i/sitewide_"+theimgs[i]+"_off.gif";
		tmp.text = new Image(); tmp.text.src = imgPath+"sitewide_"+theimgs[i]+"_text.gif";
		Imgs[j] = tmp;
	}
}

// called on mouseover, swaps icon and site_wide_text.gif images 
function img_over( name ) {
	var img = null;
	for(var i=0; i<Imgs.length; i++) {
		if( Imgs[i].id == name ) {
			img = Imgs[i]
		}
	}
	if( img != null ) {
		document.images[ name+"img" ].src = img.on.src;
		document.images[ "sitewide_text" ].src = img.text.src;
	}
}

// called on mouseout, Replaces icon and site_wide_text.gif images 
function img_out( name ) {
	var img = null;
	for(var i=0; i<Imgs.length; i++) {
		if( Imgs[i].id == name ) {
			img = Imgs[i]
		}
	}
	if( img != null ) {
		document.images[ name+"img" ].src = img.off.src;
		document.images[ "sitewide_text" ].src = imgPath+"sitewide_text_start.gif"; 
	}
}

// Print Function
function printit(){  
if (window.print) {
    window.print() ;  
} else {
    var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
    document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
    WebBrowser1.ExecWB(6, 2);
// Use a 1 vs. a 2 for a prompting dialog box    WebBrowser1.outerHTML = "";  
}
}

// POP UP A PREFORMATTED EMAIL MESSAGE WINDOW
function sitewide_email_this_page() {
  // SET MESSAGE VALUES
  var to = "";
//  var cc = "";
//  var bcc = "";
//  var subject = "";
  var body = document.location.href
  // BUILD MAIL MESSAGE COMPONENTS 
  var doc = "mailto:" + to + "?" +
 //     "cc=" + cc + "&" +
 //     "bcc=" + bcc + "&" +
 //     "subject=" + escape(subject) + "&" +
      "body=" + escape(body); 
  // POP UP EMAIL MESSAGE WINDOW
  window.location.href = doc;
}

//----------------------------------
//		xmlLoader.js
//----------------------------------

/**
 * xmlDataLoader object will load the xml from the given URL 
 * and after parsing it set all the item node value to a Array 
 * it throw an event name onLoadFinish with that result Array as param 
 * 
 * @param   u  URL to be called for loading XML
 * @param   k  String value which user has typed in the Input box
 * @param   t  timeout value for the request
 * @param   m  maximum number of results to be displayed at one time
 * 
 * "onLoadFinish" Trigger this event with result Array after loading and
 * parsing the XML file. 
 * 
 * "onError" Trigger this even if xml file is not loaded successfuly
 * 
 */
xmlDataLoader = function (u, k, t, m)
{
	//	Constructing the final URL with all the parameter
	var url = u + 'token=' + k + '&max=' + m + '&timeout=' + t
	
	this.requester
	this.url = url
	var se = this
	this.loadData = function ()
	{
		/* Check for running connections */
		try
		{
			se.requester = new XMLHttpRequest (); 
		}
		catch (error)
		{
			try
			{
				se.requester = new ActiveXObject ("Microsoft.XMLHTTP");
			}
			catch (error)
			{
				se.requester = null;
				return false;
			}
		}
		// setting method for readyStateChange
		se.requester.onreadystatechange = se.onreadystateCheck;
		se.requester.open ("GET", se.url);
		se.requester.send (null);
		
		return true;
	}
	
	this.onreadystateCheck = function ()
	{
		/* If XMLHR object has finished retrieving the data */
		if (se.requester.readyState == 4)
		{
			/* If the data was retrieved successfully */
			if (se.requester.status == 200)
			{
				se.writeResult ();
			}
			/* IE returns a status code of 0 on some occasions, so ignore this case */
			else if (se.requester.status != 0)
			{
				se.callEvent("onError");
			}
		}
		return true;
	}
	
	
	/* once the xml data is loaded writeResult will parse the item values 
	 * and set them in result Array 
	 */
	this.writeResult = function ()
	{
		if (se.requester.responseText.charAt (0) == "<")
		{
			var x1 = se.requester.responseXML.getElementsByTagName ("item");
			var rArr = new Array ()
			if (x1.length > m)
			{
				var c = m
			} else
			{
				var c = x1.length;
			}
			for (var i = 0; i < c; i ++)
			{
				rArr.push (x1 [i].firstChild.nodeValue);
			}
			se.callEvent ("onLoadFinish", rArr); 
		} else
		{
			se.callEvent ("onError");
		}
	}
	
	this.callEvent = function (e)
	{
		this [e] && this [e].apply (this, [].slice.call (arguments, 1 ));
	};
	
	this.loadData ();
}

//----------------------------------
//		genJSON.js
//----------------------------------

// This function take 4 parameters
// obj- array object  having the result set in the string format as  "id|value" ex: 123|nicholas
//		"123" is id and "nicholas" is the value.. relating to customer selector 
//		  "123" would be the customer ID and "nicholas" would be the customer name
// v1- is the String for type of selector ex:"CustomerSelector"
// v2- is the String for name of the first field ex:"CustomerID"
// v3- is the String for name of the second field ex:"CustomerName"
// returns JSON String
// valid only for selectors having to pass name-value pairs to the parent form
// ex: billto and customer selector


function makeJSONStr(obj,v1,v2,v3)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ '","'+v3+'" : "'+sl[1]+'" }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}


//sample code  for customer selector
function callParent()
{ 
var objs = new Array();
objs[0]="123|test ac";
objs[1]="223|aest ac";
objs[2]="323|best ac";
objs[3]="423|cest ac";
objs[4]="523|dest ac";
var v1='CustomerSelector';
var v2='CustomerID';
var v3='CustomerName';

var xSTR=makeJSONStr(objs,v1,v2,v3);
self.creator.xtrack_customerselector(xSTR);
self.close();
}
