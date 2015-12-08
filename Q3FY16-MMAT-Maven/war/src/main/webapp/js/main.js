/**
 * Constructor for the horizontal scrolling table object. All parameters are required to create a valid object.
 *
 * @param {String} tableId  The unique id of the table. 
 * @param {Integer} totalCols  The total number columns in the table.
 * @param {Integer} maxViewable  The number of non-static columns that can be viewed at a time.
 * @param {Array} staticCols  An Array of column numbers you want to remain static on the screen.  
 */
scrollTable = function(tableId, totalCols, maxViewable, staticCols) {
	if ((tableId == undefined) || (tableId == '') || 
	(totalCols == undefined) || (totalCols == '') || 
	(maxViewable == undefined) || (maxViewable == '') || 
	(staticCols == undefined) || (staticCols == '')) {
	return;
	}
	// set up object props
	this.tableId = tableId;
	this.totalCols = totalCols;
	this.maxViewable = maxViewable;
	this.viewableRange = {start:0, end:maxViewable - 1};
	this.staticCols = staticCols;
}

/**
* Scroll the a table's cells horizontally left or right.
* @param {Striing} direction  The direction to shift the table columns.
*/
scrollTable.prototype.scroll = function(direction) {
if (direction == "left") {
	if (this.viewableRange.start - 1 >= 0) {
		this.viewableRange.start--;
		this.viewableRange.end--;
	}
} else if (direction == "right") {
	if (this.viewableRange.start + 1 <= (this.totalCols - (this.maxViewable + this.staticCols.length))) {
		this.viewableRange.start++;
		this.viewableRange.end++
	}
} else {
 return;
}
var tableObj = document.getElementById(this.tableId);
// get a collection of all visible direct-child table rows only. From both the thead and tbody.
var thead = tableObj.getElementsByTagName("thead");
var tbody = tableObj.getElementsByTagName("tbody");
if (!tbody[0] || !thead[0]) { return; }
var trs = new Array();
var testNodes = new Array();
testNodes = thead[0].childNodes;
for (var i=0; i < testNodes.length; i++) {
    if (testNodes[i].nodeType == 1 && testNodes[i].tagName.toLowerCase() == 'tr' ) {
        trs[trs.length] = testNodes[i];
    }
}
testNodes = tbody[0].childNodes;
for (var i=0; i < testNodes.length; i++) {
    if (testNodes[i].nodeType == 1 && testNodes[i].tagName.toLowerCase() == 'tr' ) {
        trs[trs.length] = testNodes[i];
    }
}
// iterate over the rows changing our cells
for (var i=0; i < trs.length; i++) { // for each row
	var table_fields = trs[i].childNodes; // get the td/th (s)
    var indexCount = 0; // index point
    for (var x=0; x < table_fields.length; x++) { 
		if (table_fields[x].nodeType == 1) {
			if ((indexCount >= this.viewableRange.start && indexCount <= this.viewableRange.end) || this.isStaticField(indexCount)) {
				table_fields[x].style.display = '';
			} else {
                if (table_fields[x].className.indexOf('hidden_container') != -1) {
                		table_fields[x].style.display = '';
                    } else {
                        table_fields[x].style.display = 'none';
                    }
            }
		indexCount++;
		}	
	}
}
}
/**
* Check to see if a column number is with the static column list.
* @param {Integer} num  The column number in question.
* @return {Boolean}
*/

scrollTable.prototype.isStaticField = function(num) {
	for (i=0; i < this.staticCols.length; i++) {
	 if (num == this.staticCols[i]) {
	 	return true;
	 }
	}
	return false;
}







