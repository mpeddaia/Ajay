jsonurl = "/SOM";
jsonrpc = null;
var jrecords = null;

function jsonLoad(){
    try {
		//alert('Inside jsonLoad()...');
      //jsonrpc = new JSONRpcClient(jsonurl);
      //jsonrpc = new JSONRpcClient();
       jsonrpc = new JSONRpcClient('JSON-RPC');
      //alert('jsonrprc : '+ jsonrpc);
      //alert('Page loaded completely');
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}


function getStates() {
	
   jsonLoad();
   
   //clear the states dropdown
   var stateProvinceObj = document.getElementById('stateProvince');    
   stateProvinceObj.options.length=0;        
   stateProvinceObj.options[0]= new Option('Select One','');
      
   var strcountrycode = document.getElementById('country').value;

  
//   if (strcountrycode=="US" ||strcountrycode=="CA"){
   jrecords=jsonrpc.handler.getStateList(strcountrycode);
   if(jrecords != null){
	   if(jrecords != null ||jrecords["list"] != null) {
	      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++){
	         
	         stateProvinceObj.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
	      }
       }
    } else {
    	alert('No states available for this country..');
    }
}


function populateCountries()
{
   jsonLoad();
   
   var country = document.getElementById('country');
   //country.options.length=0;
   country.options[0]= new Option('Select One','-1');
   
   //alert("In getting country list");
   
   jrecords=jsonrpc.handler.getCountryList();   
   //alert('List : '+jrecords["list"]);
   //alert ('List length :' +jrecords["list"].length);
   if(jrecords != null ||jrecords["list"] != null){
      for(i=0, j=1; i<jrecords["list"].length; i=i+2, j++) {
//        alert('Adding '+ jrecords["list"][i]+' to dropdown : ');
//          var temStr = jrecords["list"][2*i];
         country.options[j]= new Option(jrecords["list"][i+1], jrecords["list"][i]);
         
//         i++;
      }
   }
 }


