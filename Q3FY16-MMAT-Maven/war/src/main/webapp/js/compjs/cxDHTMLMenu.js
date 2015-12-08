/**
 * Constructor for the dhtml menu object. Sets the default values
 *
 * @param   n instance name
 * @param   d target Div ID
 * @param   s skinID
 */
cxDHTMLMenu = function(n, d, s) {
    if (s == undefined) s="default";  //setting skin ID as default if not defined

    this.skinID = s;
    this.instanceName = n;
    this.divID = d;

    // preload image for the add icon
    this.images = new Object();
    this.preLoadImage('mtab_left_first', true, true, false);
    this.preLoadImage('mtab_left', true, true, true);
    this.preLoadImage('mtab_middle', true, true, false);
    this.preLoadImage('mtab_right', true, true, false);
    this.preLoadImage('mtab_right_last', true, true, false);

    document.write('<link href="images/dNav/' + this.skinID + '/cxDHTMLMenu.css" rel="stylesheet" type="text/css">') // linking the css file
}


/**
 * (Re)Draws the dhtml navigation object
 */
cxDHTMLMenu.prototype.reDraw = function(){
    var t = this;

    // temp var to hold the HTML String representing the object
    var s = '';

    // formatting HTML
    s += '<div class="menu_container">';
    s +=   '<div class="tabs">';
    s +=     '<table class="menu" cellSpacing="0" cellPadding="0" border="0">';
    s +=     '<tr>';

    //create Tabs
    var ml = t.menuItems.length;

    // make each TD element
    for (i=0; i<ml; i++) {
      var mItem = t.menuItems[i];

      s += '<td'
      if (mItem.disabled) {
        s +=     ' class="disabledLink"';
      }
      s += '>';
      s +=   '<a';
      if (!mItem.disabled) {
        s +=     ' onmouseover="over(event)" onmouseout="out(event)"';
      }
      s +=       ' id="tab'+i+'"';
      // if url/target are specified put them else put in "#" and onclick="return false"
      // note: target is not checked unless url is specified.
      if ((mItem.url != null)&&(mItem.url != "")&&(!mItem.disabled)) {
        s +=     ' href="'+t.menuItems[i].url+'"';
        if ((mItem.target != null)&&(mItem.target != "")) {
          s +=   ' target="'+mItem.target+'"';
        }
        s +=     ' onclick="'+t.instanceName+'.callEvent(\'onClick\', '+i+');"';
      } else {
        s +=     ' href="#"';
        s +=     ' onclick="'+t.instanceName+'.callEvent(\'onClick\', '+i+'); return false;"';
      }
      s +=   '>';

      // add left image (special case for first tab
      s +=   '<img alt="" src="images/dNav/'+t.skinID+'/';
      s += (i == 0) ? 'mtab_left_first_normal.gif' : 'mtab_left_normal.gif';
      s +=       '" align="absMiddle" border="0">';

      // add title text
      s +=   '<span>'+mItem.title+'</span>';

      // add right image (special case for last tab
      s +=   '<img alt="" src="images/dNav/'+t.skinID+'/';
      s += (i == (ml-1)) ? 'mtab_right_last_normal.gif' : 'mtab_right_normal.gif';
      s +=       '" align="absMiddle" border="0">';

      s +=   '</a>';
      s += '</td>';
    }

    s +=     '</tr>';
    s +=     '</table>';
    s +=   '</div>';
    // tabs div closed

    // create sub menu div's
    s +=   '<div class="level_two">';

    // loop through all menu's
    for (i=0; i<ml; i++) {
      var sml = t.menuItems[i].subMenuItems.length;

      // if this menu has child menu's proceed as normal, else change the class to show no bar 
      if (sml > 0) {
        s +=   '<div id="tab'+i+'_submenu" class="subMenu" onmouseover="divover(\'tab'+i+'\')" onmouseout="divout(\'tab'+i+'\')">';
        s +=     '<ul>';
  
        // loop through and create all sub-menu items
        for (j=0; j<sml; j++) {
          var subItem = t.menuItems[i].subMenuItems[j];
          // attach class for first sub menu item so that the divider is not rendered
          s +=     '<li';
          if (j == 0) {
            s +=       ' class="first"';
          }
          s +=     '>';
  
          // create link around the text
          s +=       '<a';
//alert(subItem.display);
          if (!(!subItem.disabled)) {
            s +=         ' class="disabledSubLink"';
            s +=         ' href="#"';
            s +=         ' onclick="return false;"';
          } else {
            
            //added for sept-release 2007 ,if submenu is distribution (or distributor) then only we are adding title
            if(subItem.display == 'Distribution' || subItem.display== 'DISTRIBUTION' ){
                s +=         ' href="'+subItem.url+'" title="'+subItem.DistributionMessage+'"';
            }
            else{
            	s +=         ' href="'+subItem.url+'"';
            }
            // only attach target attribute if it exists
            if ((subItem.target != null) && (subItem.target != "")) {
              s +=       ' target="'+subItem.target+'"';
            }
            // attach onclick event
            s +=         ' onclick="'+t.instanceName+'.callEvent(\'onClick\', '+i+', '+j+');"';
          }

          s +=       '>';
          s +=       subItem.title;
          s +=       '</a>';
          s +=     '</li>';
  
          delete subItem;
        }
  
        s +=     '</ul>';
        s +=   '</div>';
      } else {
        s +=   '<div id="tab'+i+'_submenu" class="subMenuEmpty"></div>';
      }

      delete sml
    }

    s += '  </div>';
    // sub menus div closed
	//Added for tertiary menus...to temporarily prevent the menu movement
	//Will dig into deep to resolve it properly aftre discusing with crosstrack and vikram
    s +=   '<div id="ttab'+'_submenu" class="subMenuEmpty"></div>';
    s += '</div>';
    // close base div

    // write HTML String to the container Div
    MM_setTextOfLayer(t.divID, '' , s);
}


/**
 * Adds a new top-level menu item at the specified index position.
 *
 * @param   d display text (title) for the menu item
 * @param   i index position at which the new menu item will be added (optional)
 * @param   u url to link menu item to (optional)
 * @param   g target to use for url (optional)
 */
cxDHTMLMenu.prototype.addMenuItem = function (d, i, u, g) {
    var t = this;

    // if position is not specified - set it to last element
    if ((i == undefined) || (i == null) || (i == "")) {
      i = t.menuItems.length;
    }

    // create menu item object
    var o = new Object();
    o.title = d;
    o.url = u;
    o.target = g;
    o.subMenuItems = new Array();

    // splice new menu item into array
    t.menuItems.splice(i, 0, o);

    // redraw menu
    t.reDraw();
}


/**
 * Removes a top-level menu item at the specified index position. All sub menu items are also
 * destroyed by this.
 *
 * @param   i index position of the menu item to remove
 */
cxDHTMLMenu.prototype.removeMenuItem = function (i) {
    var t = this;

    // splice menu item out of array
    t.menuItems.splice(i, 1);

    // redraw menu
    t.reDraw();
}


/**
 * Adds a new sub menu item at the specified index position into a parent menu item.
 *
 * @param   d display text (title) for the menu item
 * @param   i index position at which the new menu item will be added
 * @param   si index position at which the new menu item will be added (optional)
 * @param   u url to link menu item to
 * @param   g target to use for url (optional)
 */
cxDHTMLMenu.prototype.addSubMenuItem = function (d, i, si, u, g, z, y) {
    var t = this;

    // if position is not specified - set it to last element
    if ((si == undefined) || (si == null) || (si == "")) {
      si = t.menuItems[i].subMenuItems.length;
    }

    // create submenu item object
    var o = new Object();
    o.title = d;
    o.url = u;
    o.target = g;
    o.display = z;
    o.DistributionMessage=y;

    // splice new menu item into array
    t.menuItems[i].subMenuItems.splice(si, 0, o);

    // redraw menu
    t.reDraw();
}


/**
 * Removes a submenu item at the specified index position. Parent needs to be specified
 *
 * @param   i  index of parent menu item
 * @param   is index of sub menu item to be removed
 */
cxDHTMLMenu.prototype.removeSubMenuItem = function (i, is) {
    var t = this;

    // splice sub menu item out of array
    t.menuItems[i].subMenuItems.splice(is, 1);

    // redraw menu
    t.reDraw();
}


/**
 * Enables a menu item component at the index position specified by i and si.
 * If si is not passed, it enables the top level menu item at "i" else it works
 * on the sub menu item at "si".
 *
 * @param   i  index of the top level menuItem in the component to be enabled
 * @param   si index of the sub menu item in the component to be enabled (optional)
 */
cxDHTMLMenu.prototype.setItemEnable = function (i, si) {
    var t = this;
    // if subitem is specified, enable subitem
    if((si != undefined)&&(si != null)&&(si != "")){
      var subItem = t.menuItems[i].subMenuItems[si];
      if (subItem.disabled) {
        subItem.disabled = false;
        t.reDraw();
      }
    } else {
    // if subitem is not passed, enable the top level item
      var mItem = t.menuItems[i];
      if (mItem.disabled) {
        mItem.disabled = false;
        t.reDraw();
      }
    }
}


/**
 * Disables a menu item component at the index position specified by i and si.
 * If si is not passed, it disables the top level menu item at "i" else it works
 * on the sub menu item at "si".
 *
 * @param   i  index of the top level menuItem in the component to be disabled
 * @param   si index of the sub menu item in the component to be disabled (optional)
 */
cxDHTMLMenu.prototype.setItemDisable = function (i, si) {
    var t = this;
    // if subitem is specified, disable subitem
    if((si != undefined)&&(si != null)&&(si != "")){
      var subItem = t.menuItems[i].subMenuItems[si];
      if (!subItem.disabled) {
        subItem.disabled = true;
        t.reDraw();
      }
    } else {
    // if subitem is not passed, disable the top level item
      var mItem = t.menuItems[i];
      if (!mItem.disabled) {
        mItem.disabled = true;
        t.reDraw();
      }
    }
}


/**
 * Triggers an event with any extra parameters specified
 *
 * @param e Name of event to be created/triggered
 */
cxDHTMLMenu.prototype.callEvent = function(e){
    this[e] && this[e].apply( this, [].slice.call( arguments, 1 ) );
};


/**
 * Preloads a given image
 * @param   imgID Name of image
 * @param   n     flag for "normal" state
 * @param   se    flag for "selected" state
 * @param   su    flag for "suport" state
 */
cxDHTMLMenu.prototype.preLoadImage = function(imgID, n, se, su) {
	var t = this;

  if (n) {
  	t.images[imgID] =  new Image();
  	t.images[imgID].src = "images/mPick/" + t.skinID + "/" + imgID + "_normal.gif";
  }
  if (se) {
  	t.images[imgID] =  new Image();
  	t.images[imgID].src = "images/mPick/" + t.skinID + "/" + imgID + "_selected.gif";
  }
  if (su) {
  	t.images[imgID] =  new Image();
  	t.images[imgID].src = "images/mPick/" + t.skinID + "/" + imgID + "_support.gif";
  }
}



// Macromedia helper function to get a reference to an object by its ID
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}


// Macromedia helper function to set text/innerHTML of a layer
function MM_setTextOfLayer(objName,x,newText) { //v4.01
if ((obj=MM_findObj(objName))!=null) with (obj)
    if (document.layers) {document.write(unescape(newText)); document.close();}
    else innerHTML = unescape(newText);
}


// Supporting menu handling functions


/**
 * Event handler for a mouseout event on a particular sub menu div
 *
 * @param   id id of sub menu item's div (that triggered the event)
 */
function divout(id) {
	requestHide(document.getElementById(id));
}


/**
 * Dets a timeout to give a slight delay between the mouse exiting a
 * div and the menu visually disappearing
 *
 * @param   elem id of sub menu item's div (that triggered the event)
 */
function requestHide(elem) {
	elem.outTimeout = setTimeout(function() { out2(elem); }, 300);
}


/**
 * Event handler for a mouseover event on a particular sub menu div
 * This cancels the call to any pending hide requests.
 *
 * @param   id id of sub menu item's div (that triggered the event)
 */
function divover(id) {	
	clearTimeout(document.getElementById(id).outTimeout);
}


/**
 * Event handler for a mouseover event on a particular top level tab
 *
 * @param   evt event pointer (will have reference to the tab that triggered the onmouseover)
 */
function over(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;

  // clear any pending hide timer for this tab
	clearTimeout(elem.outTimeout);
  // set the current active tab to this one
	activeTab(elem);
  // display the sub menu
	document.getElementById(elem.id + "_submenu").style.display = 'block';
	}	
}
}


/**
 * Event handler for a mouseout event on a particular top level tab
 *
 * @param   evt event pointer (will have reference to the tab that triggered the onmouseout)
 */
function out(evt) {
	evt = (evt) ? evt : ((window.event) ? event : null);
	if (evt) {
	var elem = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
	if (elem && elem.nodeType == 1) {
	elem = elem.parentNode;
  // set an interval before the menu is hidden
	requestHide(elem);
	}	
}
}


/**
 * This function does the real hiding/disabling for any tab+submenu
 *
 * @param   elem div id for the menu+submenu to be deactivated
 */
function out2(elem) {
 // hide the submenu
 document.getElementById(elem.id + "_submenu").style.display = 'none';
 // change the tab back
 inActiveTab (elem);
}


/**
 * This function visually returns the specified tab to "normal" state
 *
 * @param   elem div id for the menu to be deactivated
 */
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


/**
 * This function visually sets the specified tab to "active" state
 *
 * @param   elem div id for the menu to be activated
 */
function activeTab(elem) {
// turn all tabs off before turning this one on
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


/**
 * This function visually returns all tabs to "normal" state
 *
 * @param   elem div id for the menu (used to get pointer to parent td object
 * which tab we pass is immaterial.
 */
function allTabsOff(elem) {
var tds = elem.parentNode.parentNode.getElementsByTagName("td");
for (var td = 0; td < tds.length; td++) {
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
