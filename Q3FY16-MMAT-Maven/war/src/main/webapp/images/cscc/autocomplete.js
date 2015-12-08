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
