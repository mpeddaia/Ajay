/**
 *  Sitewide Tools Rollover Functions
 *  007_sitewide_tool.js
 *
 *  michael.sheridan@razorfish.com
 *  john.george@razorfish.com
 *  October 20, 2001
 *  spandav@cisco.com
 *  March 12, 2002
 */
 
// Window opening script for Sitewide Toolkit only
function sitewide_toolkit_window(url,winName) {
        if(!winName) { winName = 'win'; }
        window.open(url, winName, 'width=643,height=492,top=50,left=50,resizable=1,scrollbars=1,toolbar=1,menubar=1,status=1');
}  

// declare variable and assign graphics for rollovers 

var sitewide_print_off = new Image();  sitewide_print_off.src = "/apps-ui/generic/interim/images/sitewide_print_off.gif";
var sitewide_print_on = new Image();  sitewide_print_on.src = "/apps-ui/generic/interim/images/sitewide_print_on.gif";
var sitewide_print_text = new Image(); sitewide_print_text.src = "/apps-ui/generic/interim/images/sitewide_print_text.gif";

var sitewide_email_off = new Image();  sitewide_email_off.src = "/apps-ui/generic/interim/images/sitewide_email_off.gif";
var sitewide_email_on = new Image();  sitewide_email_on.src = "/apps-ui/generic/interim/images/sitewide_email_on.gif";
var sitewide_email_text = new Image(); sitewide_email_text.src = "/apps-ui/generic/interim/images/sitewide_email_text.gif";

var sitewide_bookmark_off = new Image();  sitewide_bookmark_off.src = "/apps-ui/generic/interim/images/sitewide_bookmark_off.gif";
var sitewide_bookmark_on = new Image();  sitewide_bookmark_on.src = "/apps-ui/generic/interim/images/sitewide_bookmark_on.gif";
var sitewide_bookmark_text = new Image(); sitewide_bookmark_text.src = "/apps-ui/generic/interim/images/sitewide_bookmark_text.gif";

var sitewide_download_off = new Image();  sitewide_download_off.src = "/apps-ui/generic/interim/images/sitewide_download_off.gif";
var sitewide_download_on = new Image();  sitewide_download_on.src = "/apps-ui/generic/interim/images/sitewide_download_on.gif";
var sitewide_download_text = new Image(); sitewide_download_text.src = "/apps-ui/generic/interim/images/sitewide_download_text.gif";

var sitewide_glossary_off = new Image();  sitewide_glossary_off.src = "/apps-ui/generic/interim/images/sitewide_glossary_off.gif";
var sitewide_glossary_on = new Image();  sitewide_glossary_on.src = "/apps-ui/generic/interim/images/sitewide_glossary_on.gif";
var sitewide_glossary_text = new Image(); sitewide_glossary_text.src = "/apps-ui/generic/interim/images/sitewide_glossary_text.gif";

// called on mouseover, swaps icon and site_wide_text.gif images 
function img_over( name ) {
    imgOn = eval( "sitewide_" + name + "_on.src" );
    document.images[ name+"img" ].src = imgOn;
        textSrc = eval( "sitewide_" + name + "_text.src" );
        document.images[ "sitewide_text" ].src = textSrc;
}

// called on mouseout, Replaces icon and site_wide_text.gif images 
function img_out( name ) {
        imgOff = eval( "sitewide_" + name + "_off.src" );
    document.images[ name+"img" ].src = imgOff;
        document.images[ "sitewide_text" ].src = "/apps-ui/generic/interim/images/sitewide_text_start.gif";
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

function precache_imgs( theimgs ) {
;
}
