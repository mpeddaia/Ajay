// This function take 4 parameters
// obj- array object  having the result set in the string format as  "id|value" ex: 123|nicholas
//		"123" is id and "nicholas" is the value.. relating to customer selector 
//		  "123" would be the customer ID and "nicholas" would be the customer name
// v1- is the String for type of selector ex:"CustomerSelector"
// v2- is the String for name of the first field ex:"CustomerID"
// v3- is the String for name of the second field ex:"CustomerName"
// returns JSON String
// valid only for selectors having to pass name-value pairs to the parent form
// ex: billto and customer selector


function makeJSONStr(obj,v1,v2,v3)
{
   var bgnStr = '{ "'+v1+'" : [';
   var outStr='';
  
   for(var c=0; c<obj.length; c++)
   {
	  var	sl=obj[c].split("|");
      outStr += '{ "'+v2+'" : "'+sl[0]+ '","'+v3+'" : "'+sl[1]+'" }';
	  if(c==obj.length-1){
		outStr+=" ] }";
		c=obj.length;
	  }else{
	  outStr+=" , ";
	  }
   }
  return bgnStr+outStr;
}


//sample code  for customer selector
function callParent()
{ 
var objs = new Array();
objs[0]="123|test ac";
objs[1]="223|aest ac";
objs[2]="323|best ac";
objs[3]="423|cest ac";
objs[4]="523|dest ac";
var v1='CustomerSelector';
var v2='CustomerID';
var v3='CustomerName';

var xSTR=makeJSONStr(objs,v1,v2,v3);
self.creator.xtrack_customerselector(xSTR);
self.close();
}

