/*
 * Multi image Tab Menu 
 * @supported (IE, Net, Moz)
 * @version 1.1
 *
 **/
 
/*
ToDoList
* Remove the timed roll out stuff, for the support tabs. On tab to tab mouse movement. It's not be needed anymore.

* Add comments and function descriptions.

*/
// ---------------------------------------------------------- //
function divout(id) {
	requestHide(document.getElementById(id));
}
// ---------------------------------------------------------- //
function requestHide(elem) {
	elem.outTimeout = setTimeout(function() { out2(elem); }, 1000);
}
// ---------------------------------------------------------- //
function divover(id) {	
	clearTimeout(document.getElementById(id).outTimeout);
}
// ---------------------------------------------------------- //
function over(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;
	clearTimeout(elem.outTimeout);
	activeTab(elem);
	document.getElementById(elem.id + "_submenu").style.display = 'block';
	}	
}
}
// ---------------------------------------------------------- //
function out(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;
	requestHide(elem);
	}	
}
}
// ---------------------------------------------------------- //
function out2(elem) {
 document.getElementById(elem.id + "_submenu").style.display = 'none';
 // change the tab back
 inActiveTab (elem);
}
// ---------------------------------------------------------- //
function inActiveTab(elem) {
elem.active = false;
var tdCollection = elem.parentNode.parentNode.getElementsByTagName("td");
// change the tab images and background class
var imgs = elem.getElementsByTagName("img");
for (var i = 0; i < imgs.length; i++) {
	if (i == 0 && elem.parentNode.cellIndex > 0 && tdCollection[elem.parentNode.cellIndex - 1].getElementsByTagName('a')[0].active) {
continue;
	}
	var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
	imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_normal$1');;
} 
if (elem.nodeName.toLowerCase() == 'a') {
	elem.parentNode.className = "";
}
// Change the supporting tab's (the tab on the right) left image.
if (elem.parentNode.cellIndex < tdCollection.length - 1) {
if (tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName('a')[0].active) {
	return;
}
	var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_normal$1');
}
}
// ---------------------------------------------------------- //
function activeTab(elem) {
allTabsOff(elem);
elem.active = true;
var imgs = elem.getElementsByTagName("img");
// change the tab images and background class
for (var i = 0; i < imgs.length; i++) {
	var baseSrc = imgs[i].src.replace(/_normal|_selected|_support/g, '');
	imgs[i].src = baseSrc.replace(/(\.[^.]+)$/, '_selected$1');
} 
if (elem.nodeName.toLowerCase() == 'a') {
	elem.parentNode.className = 'active';
}
// change the supporting tab's left image
var tdCollection = elem.parentNode.parentNode.getElementsByTagName("td");
if (elem.parentNode.cellIndex < tdCollection.length - 1) { 
	var supportImage = tdCollection[elem.parentNode.cellIndex + 1].getElementsByTagName("img")[0];
	var baseSrc = supportImage.src.replace(/_normal|_selected|_support/g, '');
	supportImage.src = baseSrc.replace(/(\.[^.]+)$/, '_support$1');
}
}
// ---------------------------------------------------------- //
function allTabsOff(elem) {
var tds = elem.parentNode.parentNode.getElementsByTagName("td");
for (var td = 0; td < tds.length; td++) {
	tds[td].className = '';
	var as = tds[td].getElementsByTagName("a");
	for (var a = 0; as < as.length; a++) {
clearTimeout(as[a].outTimeout);
as[a].active = false;
	}
	var imgs = tds[td].getElementsByTagName("img");
	for (img = 0; img < imgs.length; img++) {
var image = imgs[img].src.replace(/_normal|_selected|_support/g, '');
imgs[img].src = image.replace(/(\.[^.]+)$/, '_normal$1');
	}
}
}
