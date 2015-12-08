/**
 *  IntelligentHierarchy object
 *
 *  intelligent_hierarchy.js
 *
 *  peldi.guilizzoni@sf.razorfish.com
 *  jan.borgersen@sf.razorfish.com
 *  September, 2000
 *
 *  This file contains the Internet Explorer - specific code for
 *  the intelligent navigation module.
 *
 *
 */  

/**
 * 
 * call it like this: ih_getMaxItemsAtLevel(this.startingNode,levelxx,0,0);
 *
 *
 */
function fs_getMaxItemsAtLevel( node, req_level, curr_level, curr_max ) {
	var local_i;

	if (curr_level == req_level) {
		return node.items.length;
	} else {
		for (local_i=0; local_i<node.items.length; local_i++)	{
			myMax = fs_getMaxItemsAtLevel(node.items[local_i], req_level, curr_level+1, curr_max);
			if (myMax > curr_max) {	curr_max=myMax;	}
		}
		return curr_max;
	}
}


function fs_reset() {
	for( var i = 0; i < this.levels; i++ ) {
		if(document.all) {
			var tmpdiv = document.all[this.objname+'div0'].style;
		}
		else if(document.layers) {
			var tmpdiv = eval('document.filtersearchcontainer.document.filtersearchdiv0');
		}
		else if(document.getElementById) {	
			var tmpdiv = document.getElementById(this.objname+'div0').style;
		}
		if( i==0 ) {
			tmpdiv.visibility = "visible";
		} else {
			tmpdiv.visibility = "hidden";
		}
	}
}

/**
 *
 * ih_update()
 *
 * 
 *
 **/
 
function fs_update( divindex, level ) {
	if(document.layers) {
		var curselect = eval('document.filtersearchcontainer.document.filtersearchdiv'+divindex).document.forms[this.objname+'form'+divindex].elements['list_'+divindex+'_'+level];
		}
	else {
		var curselect = document.forms[this.objname+'form'+divindex].elements['list_'+divindex+'_'+level];
		}
	var listnode = null;
	var selectedindex = 0;
	var tmpselect = null;
	// the select menu with the item selected
	for( var i = 0; i < curselect.options.length; i++ ) {
		if ( curselect.options[i].selected ) {
			selectedindex = i;
			listnode = eval( curselect.options[i].value );
		}
	}
	if( listnode ) {
		for( var i = level; i < this.levels; i++ ) {
			if(document.layers) {
				tmpselect = eval('document.filtersearchcontainer.document.filtersearchdiv'+i).document.forms[this.objname+'form'+i].elements['list_'+i+'_'+level];
				}
			else {	
				tmpselect = document.forms[this.objname+'form'+i].elements['list_'+i+'_'+level];
				}
			tmpselect.options[selectedindex].selected = true;
		}
		//last div: need to write the option values
		for( var i = level+1; i < this.levels; i++ ) {
			if(document.layers) {
				tmpselect = eval('document.filtersearchcontainer.document.filtersearchdiv'+i).document.forms[this.objname+'form'+i].elements['list_'+i+'_'+(level+1)];
				}
			else {
				tmpselect = document.forms[this.objname+'form'+i].elements['list_'+i+'_'+(level+1)];
				}
			var tmpindex = 0;
			// hack to get 'Introduction' in there pointing to the concept root page
			if( divindex == 2 ) {
				tmpselect.options[tmpindex++] = new Option( 'Introduction', listnode.id );
			}
			for( var j = 0; j < listnode.items.length; j++ ) {
				if( (!this.suppress)||(!listnode.items[j].inavsuppress) ) {
					tmpselect.options[tmpindex++] = new Option( listnode.items[j].displaytext, listnode.items[j].id );
				}
			}
			// clear the rest and replace them with empty options [up to this.size]
			for( var j = tmpindex; j < tmpselect.options.length; j++ ) {
				if( j == (tmpselect.options.length-1) ) {
					tmpselect.options[j] = new Option( this.blankoption, "");
				} else {
					tmpselect.options[j] = new Option( "", "");
				}
			}
		}

		// now make the appropriate level visible and all others invisible
		for( var i = 0; i < this.levels; i++ ) {
			if(document.all) {
				var tmpdiv = document.all[this.objname+'div'+i].style;
				}
			else if(document.layers) {
				var tmpdiv = eval('document.filtersearchcontainer.document.filtersearchdiv'+i);
				}
			else if(document.getElementById) {	
				var tmpdiv = document.getElementById(this.objname+'div'+i).style;
				}
			if( i==(level+1) ) {
				tmpdiv.visibility = "visible";
			} else {
				tmpdiv.visibility = "hidden";
			}
		}
		// if at the last level of search display the ih_go() input button
		if( level == (this.levels-2) ) {
//			document.all[this.objname+'go'].style.display = "";
		} else {
//			document.all[this.objname+'go'].style.display = "none";
		}
	}
}

function fs_go() {

	var elts = document.forms[this.objname+'form'].elements['list_'+(this.levels-1)+'_'+(this.levels-1)].options;
	for( var i = 0; i < elts.length; i++ ) {
		if( elts[i].selected ) {
			location.href = eval(elts[i].value).url; 
		}
	}
}


/**
 *
 * ih_write_html();
 * writes the initial select menu of all the products [routers, telephony, switches, etc.]
 * calls ih_update() to append the div
 *
 *
 **/

function fs_write_html() {
	if(document.layers) {
		var dim = document.filtersearchcontainer.document;
	}
	else if(document.all || document.getElementById) {
		var dim = document;
		eval(dim).writeln('<div id="iecontainer">');
	}
	for( var i = 0; i < this.levels; i++ ) {
		eval(dim).writeln('<div id="'+this.objname+'div'+i+'">');
		eval(dim).writeln('<form name="'+this.objname+'form'+i+'">');
		eval(dim).writeln('<table border="0" cellpadding="0" cellspacing="0" width="177" bgcolor="#669999"><tr><td colspan="3"><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
		for( var j = 0; j <= i; j++ ) {
			eval(dim).writeln('<tr><td><img src="/swa/i/s.gif" width="5" height="1"></td><td>');
			// selects
			if( j < i ) {
				eval(dim).writeln('<select name="list_'+i+'_'+j+'" size="1" onchange="'+this.objname+'.update('+i+','+j+');">');
			} else if( i == (this.levels-1) ) {
				eval(dim).writeln('<select name="list_'+i+'_'+j+'" size="'+(this.size+(j*2))+'">');
			} else {
				eval(dim).writeln('<select name="list_'+i+'_'+j+'" size="'+(this.size+(j*2))+'">');
			}

			if( j == 0 ) {
				for( var k = 0; k < this.startingNode.items.length; k++ ) {
					tmpNode = this.startingNode.items[k];
					if( !tmpNode.inavsuppress ) {
						eval(dim).writeln('<option value="'+tmpNode.id+'">'+tmpNode.displaytext+'</option>');
					}
				}
			} else {
				for(var k = 0; k < this.maxForEachLevel[j] ; k++ ){
					eval(dim).writeln( '<option>'+this.blankoption+'</option>' );
				}
			}

			eval(dim).writeln('<option>'+this.blankoption+'</option>' );
			eval(dim).writeln('</select></td><td><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
			if((j==0)&&(i>0)) {
				eval(dim).writeln('<tr><td colspan="3"><img src="/swa/i/filter_search_dn_arrow.gif" width="177" height="18" alt=""></td></tr>');
			}
		}
		if( i < (this.levels-1) ) {
		eval(dim).writeln('<tr><td colspan="3"><img src="/swa/i/s.gif" width="177" height="5" alt=""></td></tr><tr><td align="right" colspan="3"><input type="button" name="next" value="Next" onclick="'+this.objname+'.update('+i+',0)"><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
		}
		//eval(dim).writeln('<tr><td colspan="3" align="right"><a href="javascript:'+this.objname+'.reset();" class="toolslink">Reset</a></td></tr>');
		if(j != depth-1) {
			eval(dim).writeln('<tr><td colspan="3"><img src="/swa/i/s.gif" width="177" height="5" alt=""></td></tr><tr><td align="right" colspan="3"><input type="button" name="filter" value="Filter"><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
		}
		eval(dim).writeln('<tr><td colspan="3"><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
		eval(dim).writeln('<tr bgcolor="#669999"><td colspan="3"><img src="/swa/i/s.gif" width="1" height="6"></td></tr>');
		eval(dim).writeln('<tr><td bgcolor="#336666" colspan="3"><img src="/swa/i/s.gif" width="177" height="1"></td></tr>');
		eval(dim).writeln('<tr bgcolor="#669999"><td colspan="3"><img src="/swa/i/s.gif" width="1" height="8"></td></tr>');
		eval(dim).writeln('<tr bgcolor="#669999"><td><img src="/swa/i/s.gif" width="5" height="1"></td>');
		eval(dim).writeln('<td><span class="rellink">Customize Your View of Search</span></td>');
		eval(dim).writeln('<td><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
		eval(dim).writeln('<tr bgcolor="#669999"><td colspan="3"><img src="/swa/i/s.gif" width="1" height="6"></td></tr>');
		eval(dim).writeln('<tr bgcolor="#669999"><td><img src="/swa/i/s.gif" width="5" height="1"></td>');
		eval(dim).writeln('<td><span class="reltext">If you need help searching?<br>Try our </span><span class="rellink">Serach Tips.</span></td>');
		eval(dim).writeln('<td><img src="/swa/i/s.gif" width="5" height="1"></td></tr>');
		eval(dim).writeln('<tr bgcolor="#669999"><td colspan="3"><img src="/swa/i/s.gif" width="1" height="8"></td></tr></table>');
		eval(dim).writeln('</form>');
		eval(dim).writeln('</div>');
	}
	//eval(dim).writeln('<img src="/swa/i/s.gif" width="1" height="3"><br>');
	if(document.all || document.getElementById) {
		eval(dim).writeln('</div>');
	}
	// write the button
	if( this.levels==1 ) {
//		document.writeln('<div id="'+this.objname+'go" style="display:;"><img src="/swa/i/s.gif" width="1" height="3"><br><input type="button" name="go" value="Go" onclick="'+this.objname+'.go()"></input></div>');
	} else {
//		document.writeln('<div id="'+this.objname+'go" style="display:none;"><img src="/swa/i/s.gif" width="1" height="3"><br><input type="button" name="go" value="Go" onclick="'+this.objname+'.go()"></input></div>');
	}

}


function FilterSearch( objname, startingNode, levels, size, suppress ) {

	// WHAT THIS OBJECT HAS TO DO WHEN CONSTRUCTED

	// Find out how many levels underneath
	// Find out the maximum size for each level
	// Create empty divs (2 for each layers, one for list, one for pulldown menu

	// methods:
	// write_firstpulldown
	// write_html (writes the code and the empty divs stuff ????)
	

	// variables
    this.objname = objname;
	this.startingNode = startingNode;
	this.levels = levels;
	this.size = size;
	this.suppress = suppress;
	this.current_depth = 0;
	this.blankoption = '---------------------------------';
	
	// not-public methods
	this.maxForEachLevel = new Array();
	
	for (j=1; j<=this.levels; j++) {	
		this.maxForEachLevel[j]=fs_getMaxItemsAtLevel(this.startingNode,j,0,0);
	}

    // event handlers

    // public methods
	this.write_html = fs_write_html;
	this.update = fs_update; 
	this.reset = fs_reset;
	this.go = fs_go;
}

var depth = 2;
var filtersearch = new FilterSearch('filtersearch',nav_filter,depth,5,false);

