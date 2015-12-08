/**
 * @fileoverview Main LEAP JavaScript Library 
 * @supported (IE, Net, Moz)
 *
 * @author Tristream
 * @version 2.00
 */

/**
* Generic rollover script for all icons or buttons. Requires specific graphic file namiing.
* @param {String || Object} id The the element object or element id.
* @param {String} state The required state. (on = highlight state, off = standard state, undefined = toggle (on, off) state)
*/
//Created a function to diable Action drop down button in OpptySumDetail - Seema
function setImageStateOpptySumDet(id, state) {
    var img_tag = getRawObject(id);
    var onState = (img_tag.src.search(/_o./) == -1) ? false : true;
    if ((state == "on" && arguments.length > 1) || !onState) {
        if (onState) {
          return;
        }
        img_tag.src = img_tag.src.replace(/(\.[^.]+)$/, '_o$1');
        document.getElementById('action').disabled=false;
        document.getElementById('img_go').disabled=false;
    } else if ((state == "off" && arguments.length > 1) || onState) {
        if (!onState) {
            return;
        }
        img_tag.src = img_tag.src.replace(/_o(\.[^.]+)$/, '$1');
        document.getElementById('action').disabled=true;      
        document.getElementById('img_go').disabled=true;
        
    }
}
function setImageState(id, state) {
    var img_tag = getRawObject(id);
    var onState = (img_tag.src.search(/_o./) == -1) ? false : true;
    if ((state == "on" && arguments.length > 1) || !onState) {
        if (onState) {
          return;
        }
        img_tag.src = img_tag.src.replace(/(\.[^.]+)$/, '_o$1');
           } else if ((state == "off" && arguments.length > 1) || onState) {
        if (!onState) {
            return;
        }
        img_tag.src = img_tag.src.replace(/_o(\.[^.]+)$/, '$1');        
    }
}
/** 
 * Toggle the style display property of an element.  
 * @param {String || Object} id The element object or element id.
 * @return {Boolean} false
 */
function toggleElementDisplay(id) {
    var elem = getRawObject(id);
    var displayStyle = getElementStyle(id, "display", "display")
    if (document.all) { // code block for IE
        if (displayStyle == 'none') {
            elem.style.display = '';
        } else {
            elem.style.display = 'none';
        }
        return false;
    } else if (document.getElementById) {
        if (displayStyle == 'none') { // code block for Netscape
            elem.style.display = 'block';
        } else {
            elem.style.display = 'none';
        }
        return false;
    }
}
/** 
 * Set the display property of an element so that it is showing.
 */
function showElement(id) {
    var elem = getRawObject(id);
    if (document.all) { // code block for IE
        elem.style.display = '';
    } else if (document.getElementById) {
        elem.style.display = 'block';
    }
    return false;
}
/** 
 * Set the display property of an element to hide it.
 */
function hideElement(id) {
    var elem = getRawObject(id);
    elem.style.display = 'none';
    return false;
}
/**
 * From all options in a select element show a selected element and hide the others.
 * @param {String || Object} elem The element object or element id.
 */
function displayOneChoice(elem) {
    var obj = getRawObject(elem);
    if (obj.type == 'select-one') {
        for (var i = 0; i < obj.options.length; i++) {
            getRawObject(obj.options[i].value).style.display = 'none';
        }
        var divID = obj.options[obj.selectedIndex].value;
        if (divID) {
            getRawObject(divID).style.display = 'block';
        }
    }
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

/** 
  * Toggle the active class for the containing <tr> element.
  * Toggle the display class for the containing <tr>'s sibling table-row containing nested tables. 
  * @param {String || Object} elem The <tr> element object or element id string.
  * @return {Boolean} false
  */
function toggleRowDisplay(elem) {
    var tr = getContainingNode(getRawObject(elem), 'tr');
    var trSib = getSiblingNode(tr, 'tr', 'NEXT');
    if (!trSib) { return false; }
    if (trSib.className && (' ' + trSib.className + ' ').indexOf(' display_false ') != -1) {
        trSib.className = trSib.className.replace(/\b ?display_false\b/g, 'display_true');
        if ((' ' + tr.className + ' ').indexOf(' active ') == -1) {
            tr.className += ' active';
        }
    } else {
        trSib.className = trSib.className.replace(/\b ?display_true\b/, 'display_false');
        tr.className = tr.className.replace(/\b ?active\b/g, '');
    }
    return false;
}

/** 
  * Simple expand row with no active state.  (for the dashboard)
  * Toggle the display class for the containing <tr>'s sibling table-row containing nested tables. 
  * @param {String || Object} elem The <tr> element object or element id string.
  * @return {Boolean} false
  */
function SimpleToggleRowDisplay(elem) {
    var tr = getContainingNode(getRawObject(elem), 'tr');
    var trSib = getSiblingNode(tr, 'tr', 'NEXT');
    if (trSib.className && (' ' + trSib.className + ' ').indexOf(' display_false ') != -1) {
        trSib.className = trSib.className.replace(/\b ?display_false\b/g, 'display_true');
    } else {
        trSib.className = trSib.className.replace(/\b ?display_true\b/, 'display_false');
    }
    return false;
}


/** 
  * Return an elements current style.
  * Typical use = getElementStyle("myDiv", "backgroundColor", "background-color")
  * @param {String||Object} elem The elememnt ID or element.
  * @param {String} IEStyleProp The Style property for IE
  * @param {String} CSSStyleProp The WC3 Style Property
  * return Style Value
  */
function getElementStyle(elemID, IEStyleProp, CSSStyleProp) {
    var elem = document.getElementById(elemID);
    if (elem.currentStyle) {
        return elem.currentStyle[IEStyleProp];
    } else if (window.getComputedStyle) {
        var compStyle = window.getComputedStyle(elem, "");
        return compStyle.getPropertyValue(CSSStyleProp);
    }
    return "";
}
/**
  * Determine whether a node has an ancestor of a given tag type. If true return the ancestor node.
  * @param {String||Node} elem The starting point node.
  * @param {String} tagName The containing tag we are testing for.
  * return {Node||False}
  */
function getContainingNode(elem, tagName) {
    var testNode = getRawObject(elem).parentNode;
    while (testNode && testNode.tagName.toLowerCase() != 'body') {
        if (testNode.nodeType == 1 && testNode.tagName.toLowerCase() == tagName.toLowerCase()) {
            return testNode;
        } else {
            testNode = testNode.parentNode;
        }
    }
    return false;
}
/**
  * Determine whether a node has a Sibling of a given tag type. If true return the next or previous sibling node.
  * @param {String||Node} elem The starting point node.
  * @param {String} tagName The Sibling tag we are testing for.
  * @param {String} (NEXT PREVIOUS) direction The direction to search.
  * return {Node||False}
  */
function getSiblingNode(elem, tagName, direction) {
    var testDirection = direction.toUpperCase();
    var testNode = (testDirection == "NEXT") ? getRawObject(elem).nextSibling : getRawObject(elem).previousSibling;
    while (testNode) {
        if (testNode.nodeType == 1 && testNode.tagName.toLowerCase() == tagName.toLowerCase()) {
            return testNode;
        } else {
            testNode = (testDirection == "NEXT") ? testNode.nextSibling : testNode.previousSibling;
        }
    }
    return false;
}
/**
  * Function to select all grouped checkboxes in a form. Groups are determined by a classname.
  * @param {String||Node} form The form element or form element id.
  * @param {String} groupName The group name we are testing for.
  */
function selectAllCheckboxesInGroup(form, groupName) {
    var formObj = getRawObject(form);
    for (var i = 0; i < formObj.elements.length; i++) {
        if (formObj.elements[i].type == "checkbox" && (' ' + formObj.elements[i].className + ' ').indexOf(' ' + groupName + ' ') != -1) {
            formObj.elements[i].checked = true;
        }
    }
}
/**
  * Function to deselect all grouped checkboxes in a form. Groups are determined by a classname.
  * @param {String||Node} form The form element or form element id.
  * @param {String} groupName The group name we are testing for.
  */
function deselectAllCheckboxesInGroup(form, groupName) {
    var formObj = getRawObject(form);
    for (var i = 0; i < formObj.elements.length; i++) {
        if (formObj.elements[i].type == "checkbox" && (' ' + formObj.elements[i].className + ' ').indexOf(' ' + groupName + ' ') != -1) {
            formObj.elements[i].checked = false;
        }
    }
}
/**
  * Function to toggle (checked||unchecked) all grouped checkboxes in a form. Groups are determined by a classname.
  * @param {String||Node} elem The checkbox elem that is acting as the group switch.
  * @param {String||Node} form The form element or form element id.
  * @param {String} groupName The group name we are testing for.
  */
function toggleCheckboxesInGroup(elem, form, groupName) {
    var elemObj = getRawObject(elem);
    if (elemObj.checked) {
        selectAllCheckboxesInGroup(form, groupName);
    } else {
        deselectAllCheckboxesInGroup(form, groupName);
    }
}
/**
  * Function to strip the alernating rows of a table. 
  * Only strip visible (display_true) rows. Does NOT strip nested tables.
  * Use the first ansestor table element if no TABLE param exist.
  * @param {String||Node} elem The element.
  * @param {String||Node} table The table element that will get changed.
  */
function stripedTable(elem, table) {
    if (!table) {
        var tableObj = getContainingNode(getRawObject(elem), 'table');
    } else {
        var tableObj = getRawObject(table);
    }
    var tbody = tableObj.getElementsByTagName("tbody");
    if (!tbody[0]) {
        return;
    }
    var trs = new Array();
    var testNodes = tbody[0].childNodes;
    for (var i = 0; i < testNodes.length; i++) {
        if (testNodes[i].nodeType == 1 &&
            testNodes[i].tagName.toLowerCase() == 'tr' &&
            (' ' + testNodes[i].className + ' ').indexOf(' display_false ') == -1)
        {
            trs[trs.length] = testNodes[i];
        }
    }
    for (var j = 0; j < trs.length; j++) {
        trs[j].className = trs[j].className.replace(/\b ?watermelon\b/g, '');
    }
    for (var k = 1; k < trs.length; k += 2) {
        trs[k].className += ' watermelon';
    }
}
/**
  * Function for module and inline tab UI. 
  * This will change the tabs visual state.
  * This will change the display class for related DIVs. 
  * @param {String||Node} elem The click on A tag in the tab.
  * @param {String||Node} direction The direction the tags run. Left to right is the primary direction.
  */
function selectSubTab(elm, direction) {
    var elem = getRawObject(elm);
    allSubTabsOff(elem);
    var imgs = elem.getElementsByTagName("img");
    // change the tab images and background class
    for (var i = 0; i < imgs.length; i++) {
        var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
        imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_selected$1');
    }
    if (elem.nodeName.toLowerCase() == 'a') {
        elem.parentNode.className = 'active';
        var tabContent = getRawObject(elem.id + "_content");
        removeClassName(tabContent, 'display_false');
        addCSSClass(tabContent, 'display_true');
    }
    
    if (direction == 'primary') {
    // change teh supporting tab's left image
    var tdCollection = getContainingNode(elem, 'tbody').getElementsByTagName("td");
	    if (elem.parentNode.cellIndex < tdCollection.length - 1) {
	        var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	        var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	        supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_support$1');
	    }
    } else {
    // change the supporting tab's right image
    var tdCollection = getContainingNode(elem, 'tbody').getElementsByTagName("td");
	    if (elem.parentNode.cellIndex >= 1) {
	        var supportImage = tdCollection[elem.parentNode.cellIndex - 1].getElementsByTagName("img")[1];
	        var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	        supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_support$1');
	    }
    }
}
/**
  * Function for module and inline tab UI. 
  * Change all tabs and related DIVs to their non Active state. 
  * @param {String||Node} elem The click on A tag in the tab.
  */
function allSubTabsOff(elem) {
    var tds = getContainingNode(elem, 'tbody').getElementsByTagName("td");
    for (var td = 0; td < tds.length; td++) {
        tds[td].className = '';
        var as = tds[td].getElementsByTagName("a");
        for (var a = 0; a < as.length; a++) {
            var tabContent = getRawObject(as[a].id + "_content");
            removeClassName(tabContent, 'display_true');
            addCSSClass(tabContent, 'display_false');
        }
        var imgs = tds[td].getElementsByTagName("img");
        for (img = 0; img < imgs.length; img++) {
            var image = imgs[img].src.replace(/_normal|_selected|_support/g, '');
            imgs[img].src = image.replace(/(\.[^.]+)$/, '_normal$1');
        }
    }
}
/**
  * Remove ALL matching classes from an element.
  * @param {String||Node} elem The element to remove the class from.
  * @param {String} className The name of the class to be removed.
  */
function removeClassName(elem, className) {
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
function addCSSClass(elem, className) {
    removeClassName(elem, className);
    elem.className = (elem.className + " " + className).trim();
}
/**
  * Strip leading and trailing spaces from a string. 
  */
String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/, "");
}
/**
* An array of our window objects
*/
var arrWindowObjRef = new Array();

/**
* THIS IS THE FUNCTION THAT SHOULD BE CALLED TO OPEN UP A POPUP WINDOW IN LEAP
* Utility Function to open up a popup window
* When a popup window is created, a refernce to that window object is
* created in the array arrWindowObj in the parent
* param: winurl - the url of the popup to be opened
* param: winname - the name of the window to be opened
* param: winwidth - width of the popup window
* param: winheight - height of the popup window
* param: winModal - if window is a simulated modal window.
*/
function showWindow(winurl, winname, winwidth, winheight, winX, winY, screenX, screenY, toolbar, location, directories, menuBar, status, scrollBars, resizable) {
    // set window x and y coordinates
    if (showWindow.arguments.length == 4) {
        winX = 5;
        winY = 5;
    }
    else if (showWindow.arguments.length >= 6) {
        // figure out if the X and Y coords of the window
        // will allow the window to fit into the screen
        // alter the X and Y if not
        var screenW = screen.availWidth;
        var screenH = screen.availHeight - 30;
        // height minus windows task bar height

        var winBotX = parseInt(winX) + parseInt(winwidth) + 10;
        // allow 10 px for scroll bars
        var winBotY = parseInt(winY) + parseInt(winheight) + 60;
        // allow 60 px for title and status bars

        if (winBotX > screenW) {
            winX = screenW - winwidth - 30;
        }
        if (winBotY > screenH) {
            winY = winY - winheight - 60 - 30;
        }
    }
    /*
    * Business logic regarding how many windows or what types are to be opened. Goes here.
    */
    arrWindowObjRef[arrWindowObjRef.length] = new windowObject(winurl, winname, winwidth, winheight, winX, winY, screenX, screenY, toolbar, location, directories, menuBar, status, scrollBars, resizable);
    arrWindowObjRef[arrWindowObjRef.length - 1].openWindow();
     if(arrWindowObjRef[arrWindowObjRef.length - 1].winRef)arrWindowObjRef[arrWindowObjRef.length - 1].winRef.focus();
    return;

}
// Constructor function for a Window Object
// This windowObject object was created due to the inconsistency with which IE handles window names
// The windowName is now a property of the windowObject and not a property of the window.
// The window name of the window.open method will be left blank
// So when we want to check the name of the window we will check the name property of the windowObject
function windowObject(winurl, winname, winwidth, winheight, winX, winY, screenX, screenY, toolbar, location, directories, menuBar, status, scrollBars, resizable) {
    this.windowURL = winurl;
    this.windowName = winname;
    this.isOpen = false;
    this.openWindow = openWindow;
    this.winRef = "";
	
    // window properties
    this.windowWidth = winwidth;
    this.windowHeight = winheight;
    this.windowX = (winX != null) ? winX : "";
    this.windowY = (winY != null) ? winY : "";
    this.screenX = (screenX != null) ? screenX : winX;
    this.screenY = (screenY != null) ? screenY : winY;
    this.toolbar = (toolbar != null) ? toolbar : 0;
    this.location = (location != null) ? location : 0;
    this.directories = (directories != null) ? directories : 0;
    this.menuBar = (menuBar != null) ? menuBar : 0;
    this.status = (status != null) ? status : 1;
    this.scrollBars = (scrollBars != null) ? scrollBars : 0;
    this.resizable = (resizable != null) ? resizable : 0;
	
}
/**
* openWindow method of the windowObject
* the the showWindow method calls the window.open method to create the reference for the popup window.
*/
function openWindow() {
    this.isOpen = true;

window.open(this.windowURL, '', "toolbar=" + this.toolbar + ",location=" + this.location + ",directories=" + this.directories + ",status=" + this.status + ",scrollBars=" + this.scrollBars + ",resizable=" + this.resizable + ",width=" + this.windowWidth + ",height=" + this.windowHeight + ",left=" + this.windowX + ",top=" + this.windowY + ",screenX=" + this.windowX + ",screenY=" + this.windowY);

}

/**
* When user submits "Action" form, option value opens in appropriately sized popwin
* Or, if a parameter only is specified in the select option html - like "publish" - just submits the form
*/

function actionHandler() {
    var popURL_width_height = module_action.selectName.options[module_action.selectName.options.selectedIndex].value;
    popURL_width_height = popURL_width_height.split(",");
    if (popURL_width_height[2]) {
        var popURL = popURL_width_height[0];
        var popWidth = popURL_width_height[1];
        var popHeight = popURL_width_height[2];
        var popName = popURL;
        showWindow(popURL, popName, popWidth, popHeight);
    }
    else if (popURL_width_height[0] == "#") {
        return false;
    }
    else {
        module_action.Submit()
    }
    ;
}
/**
* Standard add event function.
*/
function addEvent(elm, evType, fn, useCapture) {
    if (elm.addEventListener) {
        elm.addEventListener(evType, fn, useCapture);
        return true;
    } else if (elm.attachEvent) {
        var r = elm.attachEvent('on' + evType, fn);
        return r;
    } else {
        elm['on' + evType] = fn;
    }
}

/**
* Handles enable/disable of form elements
*/
// Creates the object to contain the sets of triggers and fields to disable
var setNameList = new Array();
fields = new Object;
fields.trigger = {"label":"default"};
fields.disabled = {"label":"default"};

// Popluates the "trigger" property of the fields object with an array of object id's
function setTriggerFieldParams() {
    var setName = setTriggerFieldParams.arguments[0];
    setNameList.push(setName);
    fields.trigger[setName] = new Array();
    for (x = 1; x < setTriggerFieldParams.arguments.length; x++)
    {
        fields.trigger[setName][x] = setTriggerFieldParams.arguments[x];
    }
}

// Popluates the "disabled" property of the fields object with an array of object id's
function setDisabledFieldParams() {

    var setName = setDisabledFieldParams.arguments[0];
    fields.disabled[setName] = new Array();

    for (x = 1; x < setDisabledFieldParams.arguments.length; x++)
    {
        fields.disabled[setName][x] = setDisabledFieldParams.arguments[x];
    }
    initTriggers(setName);
}

// Initiates event listener attachment function and fires the disable() function just in case
function initTriggers(setName) {

    for (x = 1; x < fields.trigger[setName].length; x++)
    {
        theObj = getRawObject(fields.trigger[setName][x]);
        addEvent(theObj, "keyup", findWhichSet);
        disable(setName, theObj);
    }
}

// When a listener is fired, this goes through the "registered" field sets to see what set to disable, then send it to the disable function
function findWhichSet(event) {

    var theSet;

    if (event.currentTarget) {
        var eventOrigin = event.currentTarget
    }
    else if (event.srcElement) {
        var eventOrigin = event.srcElement
    }

    for (x = 0; x < setNameList.length; x++)
    {
        var currentSetLength = fields.trigger[setNameList[x]].length;
        for (i = 1; i < currentSetLength; i++)
        {
            if (fields.trigger[setNameList[x]][i] == eventOrigin.id)
            {
                theSet = setNameList[x];
                disable(theSet, eventOrigin);
            }
        }
    }
}


// disables the fields, or reenables them
function disable(theSet, eventOrigin) {
    for (x = 1; x < fields.disabled[theSet].length; x++)
    {

        var theObj = getRawObject(fields.disabled[theSet][x]);

        // sometimes on refresh, Firefox keeps a disabled set disabled, yet reverts the className. This deals with that.
        if (theObj.disabled == true && eventOrigin.value && (' ' + theObj.className + ' ').indexOf(' ' + 'disabled' + ' ') == -1)
        {
            addCSSClass(theObj, 'disabled');
        }
        // disables the fields in the fields.disabled object that belong to the triggered set
        else if (theObj.disabled == false && eventOrigin.value)
        {
            theObj.disabled = true;
            addCSSClass(theObj, 'disabled');
        }
        // reenables them if the conditions are right
        else if (!eventOrigin.value)
        {
            theObj.disabled = false;
            removeClassName(theObj, 'disabled');
        }
    }
}
/** 
* preferences secondary navagation.
* This will change the active class for all <li> tags in a <ul> group.
* @param {Object || String} elem The clicked <a> tag.
*/
function changeMenus(elem) {
var containingUL = getContainingNode(elem, 'ul');
	if (containingUL) {
		var elems = containingUL.getElementsByTagName('a');
		for (var i=0; i < elems.length; i++) {
			removeClassName(elems[i], 'active');
			hideElement(elems[i].id + '_block'); // hide the blocks that are linked to the nav
		}
		addCSSClass(elem, 'active');
		showElement(elem.id + '_block');
	}
}

/** 
* advance search pop-up launching.
* This is a common function used globally in portal to launch an Advanced Search pop-up.
*/
function launchAdvancedSearch()
{
	showWindow('oppAdvSearch.do?method=loadPage', 'AdvancedSearch', 1000, 750, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);
}