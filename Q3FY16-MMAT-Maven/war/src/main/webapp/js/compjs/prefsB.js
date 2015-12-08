// n = instance name, d = Target DIV ID, w=Width, h=Height
cxmCol = function(n, d, w, h) {
	this.instanceName = n
	this.divID = d;
	if(w < 300) w=300
	this.width = w
	this.height  = h
	this.selectedRow = null
	this.elementInit = "mPref_" + d
	this.enableReOrdering = true;
	this.instance = this;

	this.onOrderChange = new function(){};
	this.onStatusChange = new function(){};
	this.onClose = new function(){};
}

cxmCol.prototype.initialize = function () {
	var t = this
	t.reDraw();

}


cxmCol.prototype.reDraw = function(){
	var t = this

	t.dynamicArea = t.height //- 60
	// adjusting height if the number of row is less than the maximum area available.
	//if(t.itemLabels.length*21 < t.dynamicArea) t.dynamicArea = t.itemLabels.length*21

	var s = ''

	s += '<table width="' + t.width + '"  border="0" cellspacing="0" cellpadding="0">'
	s += '<tr>'
	s += '<td align="center" valign="top">'
	if(!document.all){
		t.dynamicArea -= 8
	}
	s+= '<div id="mColDivs' + t.instanceName + '" style="position:relative; overflow:auto; width:' + t.width + 'px; height:' + t.dynamicArea +  'px; z-index:1" >'
	for(var i=0; i<t.itemLabels.length; i++)
	{
		s += '<div id="mColDivContainer'+ t.instanceName + i + '" class="mCol_DivContainer">'
		s += '<table  width="' + t.width + '"  border="0" cellspacing="0" cellpadding="0">'
		s += '<tr>'
		if(t.itemStatus[i]) {
			s += '<td class="mCol_NormalText" onClick="javascript:' + t.instanceName + '.selectRow(' + i + ');" id="' + t.elementInit + 'td' + i + '"><input type="hidden"  id="' + t.elementInit + 'ch' + i + '" value="one">'  + t.itemLabels[i]+  '</td>'
		} else {
			s += '<td class="mCol_DisabledText" onClick="javascript:' + t.instanceName + '.selectRow(' + i + ');"   id="' + t.elementInit + 'td' + i + '"><input type="hidden" id="' + t.elementInit + 'ch' + i + '" value="one">'  + t.itemLabels[i]+  '</td>'
		}
		s += '</tr>'
		s += '</table>'
		s += '</div>'
	}
	s += '</div>'

s += '</td>'
s += '</tr>'
s += '</table>'
//document.write('<textarea name="textareaName" rows="4" cols="40">' + s + '</textarea>')


MM_setTextOfLayer(t.divID, '' , s)
}


cxmCol.prototype.getActiveItemIDs = function() {
	var t = this
	var rArr = new Array()
	for (var i=0; i<t.itemIDs.length; i++) {
		//alert(t.itemStatus[i])
		if(t.itemStatus[i])rArr.push(t.itemIDs[i]);
	}
	return rArr
}
cxmCol.prototype.getAllItemIDs = function() {
	return this.itemIDs
}

cxmCol.prototype.close = function(blnAction) {
	MM_showHideLayers(this.divID,'','hide')
	window.focus();
	this.onClose(blnAction);
}

cxmCol.prototype.show = function() {
	MM_showHideLayers(this.divID,'','show')
}

cxmCol.prototype.selectRow = function (intID) {
	var t =this
	if(t.enableReOrdering) {
		t.selectedRow = intID
		t.updateRowState();
	}
}

cxmCol.prototype.updateRowState = function() {
	var t = this;

	for(var i=0; i<t.itemLabels.length; i++) {
		var tdO = MM_findObj(t.elementInit + "td" + i);
		var chO = MM_findObj(t.elementInit + 'ch' + i);
		if(t.itemStatus[i]) {
			tdO.className = "mCol_NormalText"
			tdO.innerHTML = '<input type="hidden"  id="' + t.elementInit + 'ch' + i + '" value="one">'  + t.itemLabels[i]

		}else {
			tdO.className = "mCol_DisabledText"
			tdO.innerHTML = '<input type="hidden"  id="' + t.elementInit + 'ch' + i + '" value="one">'  + t.itemLabels[i]
		}
		if(i == t.selectedRow){tdO.className = "mCol_SelectedText"}
	}

}


cxmCol.prototype.moveUp = function() {
	var t = this
	if(t.selectedRow > 0 && t.selectedRow != null &&  t.itemStatus[t.selectedRow]) {
		var bID = t.itemIDs[t.selectedRow - 1]
		var bLB = t.itemLabels[t.selectedRow - 1]
		var bST = t.itemStatus[t.selectedRow - 1]

		t.itemIDs[t.selectedRow - 1] = t.itemIDs[t.selectedRow]
		t.itemLabels[t.selectedRow - 1] = t.itemLabels[t.selectedRow]
		t.itemStatus[t.selectedRow - 1] = t.itemStatus[t.selectedRow]

		t.itemIDs[t.selectedRow] = bID
		t.itemLabels[t.selectedRow] = bLB
		t.itemStatus[t.selectedRow] = bST
		var e = {"changeID": t.selectedRow, "movedUP":true}
		t.onOrderChange(e)
		t.selectedRow --
		t.updateRowState();
	}
}

cxmCol.prototype.moveDown = function() {

	var t = this

	if(t.selectedRow < (t.itemIDs.length -1)  && t.selectedRow != null  &&  t.itemStatus[t.selectedRow]) {
		var bID = t.itemIDs[t.selectedRow + 1]
		var bLB = t.itemLabels[t.selectedRow + 1]
		var bST = t.itemStatus[t.selectedRow + 1]

		t.itemIDs[t.selectedRow + 1] = t.itemIDs[t.selectedRow]
		t.itemLabels[t.selectedRow + 1] = t.itemLabels[t.selectedRow]
		t.itemStatus[t.selectedRow + 1] = t.itemStatus[t.selectedRow]

		t.itemIDs[t.selectedRow] = bID
		t.itemLabels[t.selectedRow] = bLB
		t.itemStatus[t.selectedRow] = bST

		var e = {"changeID": t.selectedRow, "movedUP":false}
		t.onOrderChange(e)

		t.selectedRow ++
		t.updateRowState();
		t.onOrderChange();
	}


}


cxmCol.prototype.moveOne = function(otherInstanceName) {

	var t = this

	if(t.selectedRow < (t.itemIDs.length)  && t.selectedRow != null  &&  t.itemStatus[t.selectedRow]) {		
		var id = t.itemIDs.splice(t.selectedRow, 1);
		var lb = t.itemLabels.splice(t.selectedRow, 1);
		var is = t.itemStatus.splice(t.selectedRow, 1);
		
		var o = eval(otherInstanceName + ".instance");
		o.itemIDs[o.itemIDs.length] = id; 
		o.itemLabels[o.itemLabels.length] = lb; 
		o.itemStatus[o.itemStatus.length] = is; 

		t.selectedRow = null;
		t.reDraw();
		o.reDraw();
	}
}

cxmCol.prototype.moveAll = function(otherInstanceName) {
	var t = this
	var o = eval(otherInstanceName + ".instance");
	var t1 = new Array();
	var t2 = new Array();
	var t3 = new Array();
	t.selectedRow = null;
	
	for (var i=0; i < t.itemIDs.length; i++) {
		if (t.itemStatus[i]) {
			o.itemIDs[o.itemIDs.length] = t.itemIDs[i]; 
			o.itemLabels[o.itemLabels.length] = t.itemLabels[i]; 
			o.itemStatus[o.itemStatus.length] = t.itemStatus[i]; 
		} else {
			t1[t1.length] = t.itemIDs[i];
			t2[t2.length] = t.itemLabels[i];
			t3[t3.length] = t.itemStatus[i];
		}
	}
	t.itemIDs = t1; 
	t.itemLabels = t2;
	t.itemStatus = t3; 
	
	t.reDraw();
	o.reDraw();
}





///////////////////////////// common function from macromedia dreamweaver ///////////////////////////////

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}


function MM_setTextOfLayer(objName,x,newText) { //v4.01
if ((obj=MM_findObj(objName))!=null) with (obj)
    if (document.layers) {document.write(unescape(newText)); document.close();}
    else innerHTML = unescape(newText);
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	obj.visibility=v; }
}