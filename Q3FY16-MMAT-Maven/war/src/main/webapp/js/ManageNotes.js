jsonurl = "/JSON-RPC";
jsonrpc = null;
var jrecords = null;
var lastSortColumn = "creationDate";
var lastSortOrder = "DSC";


function jsonLoad(appctx){
    try {
      jsonrpc = new JSONRpcClient(appctx+jsonurl);
      //alert('jsonrprc : '+ jsonrpc);
      //alert('Page loaded completely');
    } 
    catch(e) {
      if(e.message) alert(e.message);
      else alert(e);
    }
}

function initialize(ctx, ctxval, ccouser, authlevel, sourcesytem, appctx, userType)
{

	getNotesList(ctx, ctxval, ccouser, authlevel, sourcesytem, userType);
}

function getNotesList(context,contextvalue,ccouserid,authlevel,sourcesystem, userType) {

   var parameters= new Array();
   var i=0;
  
   parameters[i++]='methodName';
   parameters[i++]='getNotes';
   parameters[i++]='context';
   parameters[i++]=context;
   parameters[i++]='contextvalue';
   parameters[i++]=contextvalue;
   parameters[i++]='ccouserid';
   parameters[i++]=ccouserid;
   parameters[i++]='authlevel';
   parameters[i++]=authlevel;
   parameters[i++]='sourcesystem';
   parameters[i++]=sourcesystem;
   parameters[i++]='userType';
   parameters[i++]=userType;

//	document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

		   var response = XMLHttpRequestSender('./manageNotes.do',
		                              parameters,
		                              'true',
		                              'POST',
		                              '1000000',
		                              '3','notesResults', displayPopupResults, true);
}

function addNotes(context,contextvalue,ccouserid,authlevel,sourcesystem, sysdate, userType)
{
	//alert ("In addNotes values from context are : "+ noteType+ noteText+ sourcesystem);
	var noteType = document.getElementById('noteType').value;
	var noteText = document.getElementById('noteText').value;
	
	noteText = noteText.replace(/<(.+?)>/g, "");
	noteText = noteText.replace(/[\r|\n]+/g, "");
	
   var parameters= new Array();
   var i=0;
  
   parameters[i++]='methodName';
   parameters[i++]='notesInsertDeleteData';
   parameters[i++]='context';
   parameters[i++]=context;
   parameters[i++]='contextvalue';
   parameters[i++]=contextvalue;
   parameters[i++]='ccouserid';
   parameters[i++]=ccouserid;
   parameters[i++]='authlevel';
   parameters[i++]=authlevel;
   parameters[i++]='sourcesystem';
   parameters[i++]=sourcesystem;
   parameters[i++]='addNote';
   parameters[i++]="true";      
   parameters[i++]='noteType';
   parameters[i++]=noteType;
   parameters[i++]='noteText';
   parameters[i++]=escape(noteText);
   parameters[i++]='sysdate';
   parameters[i++]=sysdate;
   parameters[i++]='userType';
   parameters[i++]=userType;

	   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

		   var response = XMLHttpRequestSender('./manageNotes.do',
		                              parameters,
		                              'true',
		                              'POST',
		                              '1000000',
		                              '3','notesResults', displayResults, true);	
	
	document.getElementById('noteType').value ="Select One";
	document.getElementById('noteText').value="";	                              
}


function deleteNotes(context,contextvalue,ccouserid,authlevel,sourcesystem,appctx, sortCol, key, userType)
{

	//var noteType = document.getElementById('noteId').value;
	//alert(noteIdArray.length);
   var parameters= new Array();
   var i=0;
  
   parameters[i++]='methodName';
   parameters[i++]='notesInsertDeleteData';
   parameters[i++]='context';
   parameters[i++]=context;
   parameters[i++]='contextvalue';
   parameters[i++]=contextvalue;
   parameters[i++]='ccouserid';
   parameters[i++]=ccouserid;
   parameters[i++]='authlevel';
   parameters[i++]=authlevel;
   parameters[i++]='sourcesystem';
   parameters[i++]=sourcesystem;
   parameters[i++]='SORT_COLUMN';
   parameters[i++]=sortCol;
   parameters[i++]='NOTES_KEY';
   parameters[i++]=key;
   parameters[i++]='deleteNote';
   parameters[i++]="true";      
   parameters[i++]='deleteNotesList';
   parameters[i++]=noteIdArray;
   parameters[i++]='userType';
   parameters[i++]=userType;

   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   
   //alert("before ajax call" +noteIdArray);
  var response = XMLHttpRequestSender('./manageNotes.do', parameters, 'true', 'POST', '1000000', '3','notesResults', displayResults, true);
		
	noteIdArray = new Array();

}

//Arguments for this function are 
//--------URL to send request
//--------parameters - An array of name value pairs (Look at the example above to create the array of parameters).
//--------Encode - a boolean. Pass either true or false. 
//--------requestType - GET or POST (used only for XMLHttpRequest)
//--------timeOut - spcify time in milliseconds (used only for XMLHttpRequest)
//--------maxResults - ask Praveen/Mahesh
//--------idToChange - The DOM element id that needs to be replaced. 
//--------callBackFunction - Pass a reference to the function that needs to parse the response.
function XMLHttpRequestSender()
{
      var serverResponse,url,URL,Encode,requestType,timeOut,maxResults,idToChange;
      var timer,UrlParameters="";
      var i,j=0,k=1,x=0,y=0,m;
      var Names = new Array();
      var Values = new Array();
      var Parameters = new Array(); 
      URL = arguments[0];
      Parameters = arguments[1];
      Encode = arguments[2];
      requestType = arguments[3];
      timeOut = arguments[4];
      maxResults = arguments[5];
      idToChange = arguments[6];
      callBackFunction = arguments[7];
      async = arguments[8];
      
      var XMLHttpReq = createXMLHttpReq();
      
      function createXMLHttpReq()
      {
         try { 
            return new ActiveXObject("Msxml2.XMLHTTP");
         }catch (e) {}
         try { 
            return new ActiveXObject("Microsoft.XMLHTTP");
         }catch (e) {}
         try {
            return new XMLHttpRequest();
         }catch (e) {}  
      }
      if(Encode == "true")
      {   
         for(i=0; i < Parameters.length/2; i++)
         {
            if(j+i < Parameters.length)
            {        
               Names[x++] = encodeURIComponent(Parameters[j+i]);
               j++;     
            }
            if(k+i < Parameters.length)
            {        
               Values[y++] = encodeURIComponent(Parameters[k+i]); 
               k++;     
            }
         }
         for(m in Names)
         {
            UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"&";      
         }
         
      }
      else
      {
         for(i=0; i < Parameters.length/2; i++)
         {
            if(j+i < Parameters.length){
               Names[x++] = Parameters[j+i];
               j++;           
            }
            if(k+i < Parameters.length){        
               Values[y++] = Parameters[k+i];
               k++;                    
            }  
         }

         for(m in Names)
         {
            UrlParameters = UrlParameters+Names[m]+"="+Values[m]+"\&";     
         }     

      }

      if( requestType == "GET")
      {
         url = URL+"?"+UrlParameters;
         XMLHttpReq.open("GET",url,true);
         timer = setTimeout( function() {
               XMLHttpReq.abort();
                },timeOut);      
         XMLHttpReq.onreadystatechange = function()
         {
            //alert('readyState : '+XMLHttpReq.readyState);
            //alert('Status : '+XMLHttpReq.status);
            if (XMLHttpReq.readyState == 4) 
            {
               clearTimeout(timer);               
               if (XMLHttpReq.status == 200) 
               {
               		//alert(callBackFunction);
                   callBackFunction(XMLHttpReq,idToChange);             
               }
            }     
         }     
         XMLHttpReq.send('');
      }

      else if( requestType == "POST")
      {
         url = URL; 
        if (async == "false") 
         	XMLHttpReq.open("POST", url, false);
         else
         	XMLHttpReq.open("POST",url,true);

         XMLHttpReq.open("POST",url,true);
         XMLHttpReq.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
         
         timer = setTimeout( function() {
               XMLHttpReq.abort();
                },timeOut);
         XMLHttpReq.onreadystatechange = function()
         {
              if (XMLHttpReq.readyState == 4) 
              {
                 clearTimeout(timer);
                 if (XMLHttpReq.status == 200) 
                 {
                 		
                        callBackFunction(XMLHttpReq,idToChange);             
                  }
              }
         }
         XMLHttpReq.send(UrlParameters);
      }
      
}

function displayPopupResults(req,idToChange) 
{
   var result = req.responseText;
   document.getElementById(idToChange).innerHTML=result;
   document.getElementById('errorResults').innerHTML='<table width="565" border="0" class="mod_grid_head" cellspacing="0" cellpadding="0"><font color="red">' + document.getElementById('errorString').value + '</font></table>';
}

function displayResults(req,idToChange) 
{
	var result = req.responseText;
	document.getElementById(idToChange).innerHTML=result;
	transferDataToMain();
}

function sort(key, sortcolumn) {
  
  var parameters= new Array();
   var i=0;
   var SORT_ORDER = "";
   
    if (lastSortColumn == sortcolumn){
     	if (lastSortOrder =="ASC"){
    	 	SORT_ORDER ="DSC";
     	}else{
     		SORT_ORDER ="ASC";
     	}
   
   }else {
		SORT_ORDER ="ASC";
   }
   
   parameters[i++]='methodName';
   parameters[i++]='getNotes';
   parameters[i++]='sortColumn';
   parameters[i++]= sortcolumn;
   parameters[i++]='SORT_ORDER';
   parameters[i++]= SORT_ORDER;
   parameters[i++]='ListKey';
   parameters[i++]= key;
   parameters[i++]='ActionEvent';
   parameters[i++]= 'SORT';
   parameters[i++]='context';
   parameters[i++]=document.getElementById('context').value;
   parameters[i++]='contextvalue';
   parameters[i++]=document.getElementById('contextvalue').value;
   parameters[i++]='ccouserid';
   parameters[i++]=document.getElementById('ccouserid').value;
   parameters[i++]='authlevel';
   parameters[i++]=document.getElementById('authlevel').value;
   parameters[i++]='sourcesystem';
   parameters[i++]=document.getElementById('sourcesystem').value;
   parameters[i++]='userType';
   parameters[i++]=document.getElementById('userType').value;

   document.getElementById('resultsList').innerHTML='<table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%"><tr><td valign="middle"><p align="center"><img src="images/global/progress_bar/progress_bar_anim_3.gif">&nbsp;<font size="3">Loading..</font></td></tr></table>';   

	var response = XMLHttpRequestSender('./manageNotes.do',
		                              parameters,
		                              'true',
		                              'POST',
		                              '1000000',
		                              '3','notesResults', displayPopupResults, true);
		                              
	//document.getElementById(sortcolumn).className="active sort_d_1";
	
	lastSortColumn = sortcolumn;
	lastSortOrder = SORT_ORDER;
		                              
		  		  
}
			
		
function adjustNotesArray()
{
   var notesLst = document.ManageNotesForm.selectedNotes;
   noteIdArray = new Array();
   //alert("notesLst length is " + notesLst.length);
   if ((notesLst != undefined) && (notesLst.length == undefined)) {
   		noteIdArray = addVal(noteIdArray, notesLst.value);
   }
   else {
   for(var d=0;d<notesLst.length;d++)
   {   	
      if((notesLst[d].checked==true) && (!notesLst[d].disabled))
      {
      	//alert('notesLst[d] checked '+notesLst[d].checked+' notesLst[d].enabled '+notesLst[d].enabled + ' notesLst[d].disabled '+notesLst[d].disabled);
        //alert('enabled' + d + ' - ' + notesLst[d].value);
         noteIdArray = addVal(noteIdArray, notesLst[d].value);
      }    
   }
   }
//   alert('note id array length' + noteIdArray.length);
}


function transferDataToMain()
{
	var jsonstr = document.getElementById('returnString').value;
	
	if ( jsonstr != null ) {
		self.creator.crosstrackManageNotes(jsonstr);
	}
}

