/**
 * @fileoverview Dirty Form Control JavaScript Object 
 * @supported (IE, Net, Moz)
 *
 * @author Tristream
 * @version 1.0
 */

/**
* Dirty form control object
* Just adding this script to a page, creates the object and adds the init to the onLoad event of the page.
* There is no need to create a new instance of this object. Each form element with the class of monitor_changes.
* Will have it's form controls added to the object's list of monitored controls. 
*
*/
var dF = {

// property - has the vales changed or not
    pChanged: false,
// the list of controls were monitoring
    pControls: [],
// submit buttons
    pSubmitControls: [],

/**
* Standard add event function.
*/
    addEvent: function(elm, evType, fn, useCapture) {
        if (elm.addEventListener) {
            elm.addEventListener(evType, fn, useCapture);
            return true;
        } else if (elm.attachEvent) {
            var r = elm.attachEvent('on' + evType, fn);
            return r;
        } else {
            elm['on' + evType] = fn;
        }
    },

/**
* Initialize the object function.
* Get all form control elements that have a form element with the class monitor_changes.
* 
*/
    init: function() {
        if (!document.getElementsByTagName || !document.getElementById) {
            return;
        }
        var formList = document.getElementsByTagName('form');
        if (!formList) {
            return;
        }
        // loop over all the forms
        for (var i = 0; i < formList.length; i++) {
            var form = formList[i];
            if (form.className && (' ' + form.className + ' ').indexOf(' ' + 'monitor_changes' + ' ') != -1) {
                dF.assignControlEvent(form);
            }
        }
        //attach to all A tags
        var aList = document.getElementsByTagName('a');
        for (var i = 0; i < aList.length; i++) {
            var a = aList[i];
            dF.addEvent(a, 'click', dF.confirmMessage, false);
        }

    },

/**
* Add the correct event to each form control element.
* Add each element to either the controls[] or submitControls[] array.
* @param {Object} form  A form object.
*/
    assignControlEvent: function(form) {
        var inputControls = new Array();
        inputControls.push(form.getElementsByTagName('input'));
        inputControls.push(form.getElementsByTagName('select'));
        inputControls.push(form.getElementsByTagName('textarea'));

        for (var j = 0; j < inputControls.length; j++) {
            for (var i = 0; i < inputControls[j].length; i++) {
                var control = inputControls[j][i];
                if (control.className && (' ' + control.className + ' ').indexOf(' ' + 'notMonitored' + ' ') != -1) {
                    continue;
                }
                switch (control.type.toLowerCase()) {
                    case 'submit':
                        dF.submitControls[dF.pSubmitControls.length] = control;
                        break;
                    case 'reset':
                        dF.addEvent(control, 'change', dF.resetChanged, false);
                        break;
                    case 'password':
                    case 'text':
                    case 'select-one':
                    case 'textarea':
                        dF.addEvent(control, 'change', dF.registerChange, false);
                        dF.controls[dF.pControls.length] = control;
                        break;
                    case 'checkbox':
                    case 'radio':
                        dF.addEvent(control, 'click', dF.registerChange, false);
                        dF.controls[dF.pControls.length] = control;
                        break;
                }
            }
        }
    },

/**
* Register a change has accured to one of the form elements were monitoring.
* @param {event} e  The event object.
* 
*/
    registerChange: function(e) {
        dF.pChanged = true;
    },

/**
* Register no change has taken place with the form elements were monitoring.
* @param {event} e  The event object.
*
*/
    resetChanged: function(e) {
        dF.pChanged = false;
    },

    focusFirstElement: function() {
        for (var i = 0; i < dF.controls.length; i++) {
            var element = dF.controls[i];
            if (element.type != 'hidden' && !element.disabled) {
                element.focus();
                element.select();
                break;
            }
        }
    },

/**
* Display a confimation message to the user. Block the event if needed.
* @param {event} e  The event object.
*
*/
    confirmMessage: function(e) {
        dF.focusFirstElement;
        if (dF.pChanged) {
            var msg = "\n You are navigating away without\n" +
                      "saving changes. Do you want to continue?\n";
            if (!confirm(msg)) {
                if (window.event) {
                    event.cancelBubble = true;
                    event.returnValue = false;
                } else {
                    e.preventDefault();
                    e.stopPropagation();
                }


            }
        }
    }

}

dF.addEvent(window, 'load', dF.init, false);

