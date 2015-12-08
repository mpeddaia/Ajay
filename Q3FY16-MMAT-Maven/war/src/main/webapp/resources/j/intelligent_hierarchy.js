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
function ih_getMaxItemsAtLevel( node, req_level, curr_level, curr_max ) {
	var local_i;

	if (curr_level == req_level) {
		return node.items.length;
	} else {
		for (local_i=0; local_i<node.items.length; local_i++)	{
			myMax = ih_getMaxItemsAtLevel(node.items[local_i], req_level, curr_level+1, curr_max);
			if (myMax > curr_max) {	curr_max=myMax;	}
		}
		return curr_max;
	}
}

/**
 *
 * ih_update()
 *
 * 
 *
 **/

function ih_update( divindex, level ) {
	if(document.layers) {
		var curselect = document.navigationcontainer.document.layers['navigationdiv'+divindex].document.forms[this.objname+'form'+divindex].elements['list_'+divindex+'_'+level];
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
				tmpselect = document.navigationcontainer.document.layers['navigationdiv'+i].document.forms[this.objname+'form'+(i)].elements['list_'+i+'_'+level];
				}
			else {
				tmpselect = document.forms[this.objname+'form'+(i)].elements['list_'+i+'_'+level];
				}
			tmpselect.options[selectedindex].selected = true;
		}
		//last div: need to write the option values
		for( var i = level+1; i < this.levels; i++ ) {
			if(document.layers) {
				tmpselect = document.navigationcontainer.document.layers['navigationdiv'+i].document.forms[this.objname+'form'+(i)].elements['list_'+i+'_'+(level+1)];
				}
			else {
				tmpselect = document.forms[this.objname+'form'+(i)].elements['list_'+i+'_'+(level+1)];
				}
			var tmpindex = 0;
			// hack to get 'Introduction' in there pointing to the concept root page
			if( divindex == 2 ) {
				tmpselect.options[tmpindex++] = new Option( 'Introduction', listnode.id );
			}
			for( var j = 0; j < listnode.items.length; j++ ) {
				if( !listnode.items[j].inavsuppress ) {
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
			if(document.layers) {
				var tmpdiv = document.navigationcontainer.document.layers[this.objname+'div'+i];
				}
			else {
				var tmpdiv = document.all[this.objname+'div'+i];
				}
			if( i==(level+1) ) {
				if(document.layers) {
					tmpdiv.visibility = "visible";
					}
				else {
					tmpdiv.style.visibility = "visible";
					}
			} else {
				if(document.layers) {
					tmpdiv.visibility = "hidden";
					}
				else {
					tmpdiv.style.visibility = "hidden";
					}
			}
		}
		// if at the last level of search display the ih_go() input button
	}
}

function ih_go( layer, level ) {
	if(document.layers) {
		var dom = '.navigationcontainer.document.navigationdiv'+layer+'.document';
		}
	else if(document.all) {
		var dom = '';
		}
	var elts = eval('document'+dom).forms[this.objname+'form'+layer].elements['list_'+layer+'_'+level].options;
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



function ih_write_html(index) {
		if(document.layers) {
			var dom = '.navigationcontainer.document.navigationdiv'+index+'.document';
			}
		else if(document.all) {
			var dom = '';
			}
		eval('document'+dom).writeln('<form name="'+this.objname+'form'+index+'">');

		for( var j = 0; j <= index; j++ ) {
			// selects
			if( j < index ) {
				eval('document'+dom).writeln('<a href="javascript:'+this.objname+'.go('+index+','+j+')"><img src="/swa/i/037_arrow_tab.gif" width="14" height="14" alt="" align="absmiddle" border="0"></a><img src="/swa/i/s.gif" width="2" height="1" alt="" align="top"><select name="list_'+index+'_'+j+'" size="1" onChange="'+this.objname+'.update('+index+','+j+')" class="content">');
			} else if( index == (this.levels-1) ) {
				eval('document'+dom).writeln('<img src="/swa/i/s.gif" width="16" height="1" alt="" align="top"><select name="list_'+index+'_'+j+'" size="'+(this.size-(index*2)-j)+'" onChange="'+this.objname+'.go('+index+','+j+')" class="content">');
			} else {
				eval('document'+dom).writeln('<img src="/swa/i/s.gif" width="16" height="1" alt="" align="top"><select name="list_'+index+'_'+j+'" size="'+(this.size-(index*2)-j)+'" onChange="'+this.objname+'.update('+index+','+j+')" class="content">');
			}
			if( j == 0 ) {
				for( var k = 0; k < this.startingNode.items.length; k++ ) {
					tmpNode = this.startingNode.items[k];
					if( !tmpNode.inavsuppress ) {
						eval('document'+dom).writeln('<option value="'+tmpNode.id+'">'+tmpNode.displaytext+'</option>');
					}
				}
			} else {
				for(var k = 0; k < this.maxForEachLevel[j] ; k++ ){
					eval('document'+dom).writeln( '<option>'+this.blankoption+'</option>' );
				}
			}
			eval('document'+dom).writeln( '<option>'+this.blankoption+'</option>' );
			eval('document'+dom).writeln('</select><br>');
			if(j != depth-1) {
				eval('document'+dom).writeln('<img src="/swa/i/int_hier_dn_arrow.gif" width="240" height="18" alt=""><br>');
				}
		}

	eval('document'+dom).writeln('</form>');
	eval('document'+dom).writeln('<img src="pixel.gif" width="1" height="3"><br>');
}


function IntelligentHierarchy( objname, startingNode, levels, size, suppress ) {

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
	this.blankoption = '-----------------------------------------------------';

	// not-public methods

	this.maxForEachLevel = new Array();
	
	for (j=1; j<=this.levels; j++) {
		this.maxForEachLevel[j]=ih_getMaxItemsAtLevel(this.startingNode,j,0,0);
	}

    // event handlers

    // public methods

	this.write_html = ih_write_html;
	this.update = ih_update; 
	this.go = ih_go;
}

var depth = 2;
var navigation = new IntelligentHierarchy('navigation',nav_top,depth,15,false);
