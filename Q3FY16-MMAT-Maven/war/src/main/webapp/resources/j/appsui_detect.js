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
    document.write ("<link rel='stylesheet' type='text/css' href='/swa/c/appsUnix.css'>")
}
else if (navigator.appName == "Netscape") {
//if (!document.all && document.getElementById) {
    document.write ("<link rel='stylesheet' type='text/css' href='/swa/c/appsNs.css'>")
}
else document.write ("<link rel='stylesheet' type='text/css' href='/swa/c/apps.css'>")

