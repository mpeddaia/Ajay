/**
 * Constructor for the progress bar.
 *
 * @param {String} objName Instance name for this object, should be the same as the name of the object created
 * @param {String} barID  The unique id of the containing DIV for this instance of the progress bar. 
 */
psBar = function(obj, barID) {
	// set up object props
	this.instanceName = obj
	this.barID = barID;
	this.pCurrent = 0;
	this.timeOut = null;
}
/**
 * Initialize and display the progress bar.  
 * @param {String} psType  The type of progress bar. Either progress or looping.
 * @param {String} msg  The headline message for the progress bar.
 * @param {Integer} start  The starting value.
 * @param {Integer} end  The ending value used complete the slider.
 */
psBar.prototype.initialize = function(psType, msg, start, end) {
if ((msg == undefined) || (msg == '')) { 
	msg = ''; 
}
this.msg = msg;
// init the type of progress bar we want.
if (psType == "progress") {
	// set up object props
	this.start = start;
	this.end = end;
	this.setMessage(this.msg);
	var barType = this.getNodeByAttributeValue(this.barID, "class", "progress");
	removeClassName(barType, "display_false");
	addCSSClass (barType, "display_true");
	removeClassName(getRawObject(this.barID), "display_false");
	addCSSClass (getRawObject(this.barID), "display_true");
} else if (psType == "looping") {
	this.setMessage(this.msg);
	var barType = this.getNodeByAttributeValue(this.barID, "class", "looping");
	removeClassName(barType, "display_false");
	addCSSClass (barType, "display_true");
	removeClassName(getRawObject(this.barID), "display_false");
	addCSSClass (getRawObject(this.barID), "display_true");
}
}
// testing function used to simulate an ongoing process.
psBar.prototype.move = function(obj) {
this.update(this.pCurrent += Math.random());
this.timeOut = setTimeout(this.instanceName + ".move()", 600);
}
/**
* Calculate the percent complete.
* @param {Integer} progess  The new value of the process being monitored.
*/
psBar.prototype.update = function(progress) {
if (this.pCurrent <= this.end) {
        this.progress(this.pCurrent, this.end);
        this.pCurrent = progress;
    } else {
        this.progress(this.end, this.end);
        this.pCurrent = 0;
        setImageState(this.getNodeByAttributeValue(this.barID, "class", "progressBar_rt"), "on");
        setTimeout(this.instanceName + ".closeProgressBar()", 500);
    }
}
/**
* Move the slider and update the percentage completed message.
* @param {Integer} current  The current value of the process.
* @param {Integer} total  The value of the total process.
*/
psBar.prototype.progress = function(current, total) {
if (current <= total) {
var factor = current/total;
var pct = Math.ceil(factor * 100);
this.getNodeByAttributeValue(this.barID, "class", "progressValue").firstChild.nodeValue = pct + "%";
this.getNodeByAttributeValue(this.barID, "class", "slider").style.clip = "rect(0px " + parseInt(factor * 200) + "px 16px 0px)";
}
}
/**
* Close and hide the progress bar.
* 
*/
psBar.prototype.closeProgressBar = function() {
	clearTimeout(this.timeOut);
	removeClassName(getRawObject(this.barID), "display_true");
	addCSSClass (getRawObject(this.barID), "display_false");
}
/**
* Set a headline message above the progress bar.
* @param {String} msg  The new message to display. The message may contain HTML.
*/
psBar.prototype.setMessage = function(msg) {
if ((msg == undefined) || (msg == '')) { msg = ''; }
this.msg = msg;
var pNode = this.getNodeByAttributeValue(this.barID, "class", "progressMsg");
pNode.innerHTML = msg;
}
/**
* Get the element that has a specific attribute and value combination.
* @param {String || Object} n  The starting point for our tranversal of the DOM.
* @param {String} attName  The attribute to look for.
* @param {String} attValue  The value of the attribute we're looking for.
*/
psBar.prototype.getNodeByAttributeValue = function(n, attName, attValue) {
var tNode = null;
var node = getRawObject(n);
if (node.nodeType == 1) { // special case for classes. They may have more than one space delimited value.
	if (attName == "class" && node.className && (' ' + node.className + ' ').indexOf(' ' + attValue + ' ') != -1) {
		return node;
		}
	if (node.getAttribute(attName) == attValue) {
		return node;
	}
}
for (var n = node.firstChild; n != null && !tNode; n = n.nextSibling) {
	tNode = this.getNodeByAttributeValue(n, attName, attValue);
}
return tNode;
}

//********************************* shared fucntions part of the main_lib.js

/**
 * Generic rollover script for all icons or buttons. Requires specific graphic file namiing.
 * @param {String || Object} id The the element object or element id.
 * @param {String} state The required state. (on = highlight state, off = standard state, undefined = toggle (on, off) state)
 */
function setImageState(id, state) {
var img_tag = getRawObject(id);
var onState = (img_tag.src.search(/_o./) == -1) ? false : true;
	if ((state == "on" && arguments.length > 1) || !onState) {
		if (onState) { return; }
		img_tag.src = img_tag.src.replace(/(\.[^.]+)$/, '_o$1');
	} else if ((state == "off" && arguments.length >1) || onState) {
		if (!onState) { return; }
		img_tag.src = img_tag.src.replace(/_o(\.[^.]+)$/, '$1');
	}
}

/**
  * Remove ALL matching classes from an element.
  * @param {String||Node} elem The element to remove the class from.
  * @param {String} className The name of the class to be removed.
  */
function removeClassName (elem, className) {
if (elem.className && (' ' + elem.className + ' ').indexOf(' ' + className + ' ') != -1) {
	var classNamePattern = new RegExp("\\b ?" + className + "\\b", "g");
	elem.className = elem.className.replace(classNamePattern, '').trim();
	}
}
/**
  * Add a class to an element. 
  * @param {String||Node} elem The element to add the class to.
  * @param {String} className The name of the class to add.
  */
function addCSSClass (elem, className) {
	removeClassName (elem, className);
	elem.className = (elem.className + " " + className).trim();
}
/**
  * Strip leading and trailing spaces from a string. 
  */
String.prototype.trim = function() {
	return this.replace( /^\s+|\s+$/, "" );
}

/**
  * Convert object name string or object reference into a valid element object reference.
  * @param {String || Object} obj The element object or element id string.
  * @return {Object} A valid element object reference
  */
function getRawObject(obj) {
var theObj;
	if (typeof obj == "string") {
		theObj = document.getElementById(obj);
	} else {
	// pass on object reference
	theObj = obj;
	}
return theObj;	
}
