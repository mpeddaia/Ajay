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
	document.write('<link href="images/calendar/' + this.skinID + '/calendar_css.css" rel="stylesheet" type="text/css">')
}


/**
 * Initializes the calendar object and adds the icon for it.
 * If the date profile has been changed from default, it also adjusts
 * the format of the start date and end date
 */
cxCal.prototype.initialize = function() {
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
	e.src = 'images/calendar/' + this.skinID + '/cal_icon_btn.gif';
	e.className = "cal_imageIcon";
	e.align ="absmiddle";

	// add the link to the show() function.
	if (e.outerHTML) {
		e.outerHTML = "<a href='javascript:" + this.instanceName + ".show();'>" + e.outerHTML + "</a>";
	} else {
		e.setAttribute("onClick" , this.instanceName + ".show();");
	}

	// create an empty div for the calendar
	var sDivStr = '<div id="' + this.calDiv + '" style="position:absolute; left:0px; top:0px; z-index:10; visibility: hidden;">';
    sDivStr    += '<iframe name="' + this.calDiv + 'F" style="width:162px;height:176px;" frameborder="0" src="about:blank"></iframe>';
    sDivStr    += '</div>';
    
    document.write(sDivStr);
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

	// set image position
	setX(this.calDiv, x1);
	setY(this.calDiv, y1);
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
	var calString = '<html>';
	calString += '<head>';
	calString += '<link href="images/calendar/' + this.skinID + '/calendar_css.css" rel="stylesheet" type="text/css">'
	calString += '</head>';
	calString += '<body style="padding:0; margin:0">';

	// formatting html for the calendar
	calString += '<table class="cal_base" cellpadding="0" cellspacing="0">';
	calString += '<tr class="firstRow">';
	calString += '	<td colspan="7">';

	// close icon
	calString += '		<div style="float:right;">';
	calString += '			<a href="javascript:parent.' + this.instanceName + '.close();"><img src="images/Calendar/' + this.skinID + '/cal_close_normal_btn.gif" width="10" height="11" border="0"></a>';
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
							calString += '<td class="selected">'+displayDate+'</td>';
						} else {
							// ordinary date within start and end bouds - make normal link
							calString += '<td><a href="javascript:parent.' + this.instanceName + '.setSelectedDate('+displayDate+');">'+displayDate+'</a></td>';
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
		calString += '<a href="javascript:parent.' + this.instanceName + '.prevYear();"><img src="images/Calendar/' + this.skinID + '/cal_prev_year_normal.gif" width="12" height="12" border="0"></a>';
	} else {
		calString += '<img src="images/Calendar/' + this.skinID + '/cal_prev_year_disabled.gif" width="12" height="12" border="0">';
	}

	// if previous month is a valid month to display, display the previous month link
	if ((this.displayYear == sDate.getFullYear()) && (this.displayMonth <= sDate.getMonth())) {
		calString += '<img src="images/Calendar/' + this.skinID + '/cal_prev_month_disabled.gif" width="12" height="12" border="0">';
	} else {
		calString += '<a href="javascript:parent.' + this.instanceName + '.prevMonth();"><img src="images/Calendar/' + this.skinID + '/cal_prev_month_normal.gif" width="12" height="12" border="0"></a>';
	}

	// formatting HTML
	calString += '</td><td>&nbsp;</td><td colspan="3" class="fwdLinks">';

	// if next month is a valid month to display, display the next month link
	if ((this.displayYear == eDate.getFullYear()) && (this.displayMonth >= eDate.getMonth())) {
		calString += '<img src="images/Calendar/' + this.skinID + '/cal_next_month_disabled.gif" width="12" height="12" border="0">';
	} else {
		calString += '<a href="javascript:parent.' + this.instanceName + '.nextMonth();"><img src="images/Calendar/' + this.skinID + '/cal_next_month_normal.gif" width="12" height="12" border="0"></a>';
	}

	// if next year is a valid year to display, display the next year link
	if (this.displayYear < eDate.getFullYear()) {
		calString += '<a href="javascript:parent.' + this.instanceName + '.nextYear();"><img src="images/Calendar/' + this.skinID + '/cal_next_year_normal.gif" width="12" height="12" border="0"></a>';
	} else {
		calString += '<img src="images/Calendar/' + this.skinID + '/cal_next_year_disabled.gif" width="12" height="12" border="0">';
	}

	// formatting HTML
	calString += '</td>';
	calString += '</tr>';
	calString += '</table>';

	calString += '</body>';
	calString += '</html>';

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
    if (document.frames) {
        var calHandle = document.frames[this.calDiv+"F"];
        calHandle.document.open();
        calHandle.document.write(this.writeCalendar());
        calHandle.document.close();
    } else {
        document.getElementById(this.calDiv).innerHTML = this.writeCalendar();
    }
    
	// lower all existing calendars
	var allDivs = document.getElementsByTagName('div');
	var calDivs = new Array(); // array of all divs that match the calendar div naming pattern
	var calDivRegExp = /\S+calDiv$/; // regular expression to match calendar div name against

	// identify all div's that match our calendar naming convention
	var dl = allDivs.length;
	for (var i=0; i<dl; i++) {
		if (allDivs[i].id.match(calDivRegExp) != null) {
			calDivs[calDivs.length] = allDivs[i];
		}
	}

	// work backwards to identify object name from the iFrame name and test if its a real calendar
	// object. if it exists - set its z-index to 1 to lower it.
	var dl = calDivs.length;
	for (var i=0; i<dl; i++) {
		var objName = calDivs[i].id.substring(0, (calDivs[i].id.length - 6));
		if (typeof(window[objName]) != "undefined") {
			calDivs[i].style.zIndex=1;
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
