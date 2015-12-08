/**
 *  Browser specific detection and printing of Cisco.com Style Sheets
 *
 *  john.george@razorfish.com
 *  november 13, 2001
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

function isSun() {
if (navigator.appVersion.indexOf("SunOS") !=-1)
return true;
else return false;
}
function isLinux() {
if (navigator.appVersion.indexOf("Linux") !=-1)
return true;
else return false;
}
function isHP() {
if (navigator.appVersion.indexOf("HP") !=-1)
return true;
else return false;
}

if (!document.all && document.getElementById) {
document.write ("<link rel='stylesheet' type='text/css' href='/apps-ui/generic/interim/css/stylesheet.css'>")
}
else if (isSun()) {
document.write ("<link rel='stylesheet' type='text/css' href='/apps-ui/generic/interim/css/stylesheet_ns.css'>")
}
else if (isLinux()) {
document.write ("<link rel='stylesheet' type='text/css' href='/apps-ui/generic/interim/css/stylesheet_ns.css'>")
}
else if (isHP()) {
document.write ("<link rel='stylesheet' type='text/css' href='/apps-ui/generic/interim/css/stylesheet_ns.css'>")
}
else document.write ("<link rel='stylesheet' type='text/css' href='/apps-ui/generic/interim/css/stylesheet.css'>")
