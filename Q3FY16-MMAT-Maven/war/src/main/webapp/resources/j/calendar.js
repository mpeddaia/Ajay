/**
 *  Cisco.com Calendar Component
 *  calendar.js
 *  $Revision: 1.1.1.1 $
 */

/**
 * Global string for CDC month names
 */
var cdcMonthNames = new Array ("JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC");
 
 
/**
 * formats a JavaScript date object to CDC date string standards
 */
function formatDate( dateObject ) {
	var thedate;
	var theday = dateObject.getDate();
	if ( theday < 10 ) {
		theday = "0"+theday;
	}
	thedate = theday+'/'+cdcMonthNames[dateObject.getMonth()]+'/'+dateObject.getFullYear();
    return thedate;
}
 
/**
 * opens a calendar at the specified screen coordinates
 * NOT A SUPPORTED API
 */ 
function openCalendarAtPosition( xpos, ypos, contextString, dateString ) {

  if( dateString == null ) { dateString = ""; }

  var calwindow = window.open( "/ciscodotcom/toolkit/calendar.html?context="+contextString+"&amp;date="+dateString , "cdccalendar", "toolbar=no,status=yes,top="+ypos+",left="+xpos+",outerWidth=203,outerHeight=236,width=190,height=183,scrollbars=auto,resizable=yes,menubar=no,locationbar=no");
  calwindow.focus();
}

/**
 * opens a calendar at the current mouse position
 */
function openCalendarAtMousePosition(e, contextString, dateString ) {

	// get the current mouse position  
	var mouseY = 0;
	var mouseX = 0;
	if( document.all ) {
		mouseY = event.screenY;
		mouseX = event.screenX;
	} else if( document.getElementById ) {
		mouseY = e.screenY;
		mouseX = e.screenX;
	} else if( document.layers ) {
		mouseY = e.screenY;
		mouseX = e.screenX;
	}
	openCalendarAtPosition( mouseX, mouseY, contextString, dateString );
}
 
/**
 * opens a calendar at the default position
 */
function openCalendar( contextString, dateString ) {
	
	openCalendarAtPosition( 290, 90, contextString, dateString );
}

