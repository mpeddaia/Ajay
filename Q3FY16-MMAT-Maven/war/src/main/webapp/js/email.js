jsonurl = null;  //"/SalesRegion/JSON-RPC";// context has to be passed
jsonrpc = null;
var jrecords = null;

function jsonLoad(contextPath){

 contextPath = contextPath+'/JSON-RPC';      
      jsonurl = contextPath;
    try {
      jsonrpc = new JSONRpcClient(jsonurl);
//      alert(jsonurl);
  //    alert(jsonrpc);
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}

function loadEmailFormats(varCtxPath,varAppName,varFrmtOpt){

if("1"==varFrmtOpt){
try{
   jsonLoad(varCtxPath);
   var strAppName=varAppName;//"XXCSS_SOM";
   var emailFormats = document.getElementById('emailFormat');
   emailFormats.options.length=0;        
   emailFormats.options[0]= new Option('Select One','-1');
   jrecords=jsonrpc.handler.getEmailFormats(strAppName);   
   //alert('List : '+jrecords["list"]);
   if(jrecords != null ||jrecords["list"] != null){
      for(i=0; i<jrecords["list"].length; i++){
     //    alert('Adding '+ jrecords["list"][i].emailFormat+' to dropdown : '+jrecords["list"][i].emailFormatId);
         emailFormats.options[i+1]= new Option(jrecords["list"][i].emailFormat,jrecords["list"][i].emailFormatId);
      }
   }
   } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}
}
