/**
 *  Flyout Menus Utilities
 *  flyouts.js
 *
 */
 
// Global Variables
var num_flyouts = 0;
var flyout_ceiling = 150;
var curr_flyout = 0;
var isDefHome = false;

// Images for Rollovers
var imageSpacerOff = new Image(1,181);  imageSpacerOff.src = "/swa/i/s.gif";
var imageSpacerOn = new Image(1,181);  imageSpacerOn.src = "/swa/i/spacer_dkgreen.gif";
var imageSpacerOver = new Image(1,181);  imageSpacerOver.src = "/swa/i/spacer_grey.gif";

var defhomeImageSpacerOff = new Image(1, 179); defhomeImageSpacerOff.src = "/swa/i/spacer_defhome_off.gif";
var defhomeImageSpacerOn = new Image(1, 179); defhomeImageSpacerOn.src = "/swa/i/spacer_defhome_on.gif";
var defhomeImageSpacerOver = new Image(1, 179); defhomeImageSpacerOver.src = "/swa/i/spacer_defhome_on.gif";

// dynamically set the number of flyouts
function set_num_flyouts( i ) {
	num_flyouts = i;
}
// make this the default home page
function set_def_home( bool ) {
	isDefHome = bool;
}
 
var imageSpacerOff = new Image(1,181);  imageSpacerOff.src = "/swa/i/s.gif";
var imageSpacerOn = new Image(1,181);  imageSpacerOn.src = "/swa/i/spacer_dkgreen.gif";
var imageSpacerOver = new Image(1,181);  imageSpacerOver.src = "/swa/i/spacer_grey.gif";

// Rollover functions
function flyout_over( index ) {
	// make sure not to change the lines above and below the current flyout link
	if( (curr_flyout == 0) || ((curr_flyout != (index-1)) && (curr_flyout != index)) ) {
		if( isDefHome ) {
			document.images[ "flyroll"+(index-1) ].src = defhomeImageSpacerOver.src;
		} else {
			document.images[ "flyroll"+(index-1) ].src = imageSpacerOver.src;
		}
	}
	if( (curr_flyout != index) && (curr_flyout != (index+1)) ) {
		if( isDefHome ) {
			document.images[ "flyroll"+(index) ].src = defhomeImageSpacerOver.src;
		} else {
	 		document.images[ "flyroll"+(index) ].src = imageSpacerOver.src;
		}
	}
}
function flyout_out( index ) {
	// make sure not to turn off the lines above and below the current flyout link
	if( curr_flyout != index ) {
		if( (curr_flyout == 0) || ((curr_flyout != (index-1)) && (curr_flyout != index)) ) {
			if( isDefHome ) {
				if( (index-1) == 0) {
					document.images[ "flyroll"+(index-1) ].src = imageSpacerOff.src;
				} else {
					document.images[ "flyroll"+(index-1) ].src = defhomeImageSpacerOff.src;
				}
			} else {
				document.images[ "flyroll"+(index-1) ].src = imageSpacerOff.src;
			}
		}
		if( (curr_flyout != index) && (curr_flyout != (index+1)) ) {
			if( isDefHome ) {
				if( (index) == num_flyouts) {
					document.images[ "flyroll"+(index) ].src = imageSpacerOff.src;
				} else {
					document.images[ "flyroll"+(index) ].src = defhomeImageSpacerOff.src;
				}
			} else {
				document.images[ "flyroll"+(index) ].src = imageSpacerOff.src;
			}
		}
	}
}

// Open a flyout
function open_flyout( e, index ) {

	// toggle off if this flyout is already open
	if( curr_flyout == index ) {
		close_flyout( curr_flyout );
		return;
	}

	// close the current flyout, if there is one 
	if( curr_flyout > 0 ) { close_flyout( curr_flyout); }

	curr_flyout = index;
	// turn on the lines above and below
	if( isDefHome ) {
		document.images[ "flyroll"+(index-1) ].src = defhomeImageSpacerOn.src;
		document.images[ "flyroll"+(index) ].src = defhomeImageSpacerOn.src;
	} else {
		document.images[ "flyroll"+(index-1) ].src = imageSpacerOn.src;
		document.images[ "flyroll"+(index) ].src = imageSpacerOn.src;
	}

	// get the current mouse Y position  
	var mouseY = 0;
	if( document.all ) {
		mouseY = event.clientY+document.body.scrollTop;
	} else if( document.getElementById ) {
		mouseY = e.pageY;
	} else if( document.layers ) {
		mouseY = e.pageY;
	}

	// loop through to close any open flyouts
	for(var i = 1; i < (num_flyouts+1); i++ ) {
		// IE
		if( document.all ) {
			var flyout = eval( "document.all.flyout"+i );
			if( index == i ) {
				// reposition
				var flyoutTop = mouseY - (flyout.clientHeight/2);
				if( flyoutTop < flyout_ceiling ) { flyoutTop = flyout_ceiling; }
				flyout.style.pixelTop = flyoutTop;
				// make it visible
				flyout.style.visibility = "visible";
			} else {
				flyout.style.visibility = "hidden";
			}
		// Netscape 6+
		} else if( document.getElementById ) {
			var flyout = document.getElementById( "flyout"+i );
			if( index == i ) {
				// reposition
				var flyoutTop = mouseY - (flyout.offsetHeight/2);
				if( flyoutTop < flyout_ceiling ) { flyoutTop = flyout_ceiling; }
				flyout.style.top = flyoutTop;
				// make it visible
				flyout.style.visibility = "visible";
			} else {
				flyout.style.visibility = "hidden";
			}
		// Netscape
		} else if( document.layers ) {
			var flyout = eval( "document.layers.flyout"+i );
			if( index == i ) {
				// reposition
				var flyoutTop = mouseY - (flyout.document.height/2);
				if( flyoutTop < flyout_ceiling ) { flyoutTop = flyout_ceiling; }
				flyout.top = flyoutTop;
				// make it visible
				flyout.visibility = "show";
			} else {
				flyout.visibility = "hide";
			}
		}
	}
}

// Close a flyout
function close_flyout( index ) {
	// turn off lines above and below
	if( isDefHome ) {
		if( (index-1) == 0 ) {
			document.images[ "flyroll"+(index-1) ].src = imageSpacerOff.src;
		} else {
			document.images[ "flyroll"+(index-1) ].src = defhomeImageSpacerOff.src;
		}
		if( index == num_flyouts ) {
			document.images[ "flyroll"+(index) ].src = imageSpacerOff.src;
		} else {
			document.images[ "flyroll"+(index) ].src = defhomeImageSpacerOff.src;
		}
	} else {
		document.images[ "flyroll"+(index-1) ].src = imageSpacerOff.src;
		document.images[ "flyroll"+(index) ].src = imageSpacerOff.src;
	}
	// hide the flyout
	if( document.all ) {
		var flyout = eval( "document.all.flyout"+index );
		flyout.style.visibility = "hidden";
	} else if( document.getElementById ) {
		var flyout = document.getElementById( "flyout"+index );
		flyout.style.visibility = "hidden";
	} else if( document.layers ) {
		var flyout = eval( "document.layers.flyout"+index );
		flyout.visibility = "hide";
	}
	curr_flyout = 0;
}
