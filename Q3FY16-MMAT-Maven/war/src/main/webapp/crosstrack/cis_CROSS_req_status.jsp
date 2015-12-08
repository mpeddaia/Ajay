<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
  function resizePortlet(frameId,status) {
    frameObj=document.getElementById(frameId);
    
    //alert(frameObj.style.display);
    if (status == "OFF") 
       frameObj.height="391";
    else   
      frameObj.height="246";
}
  
       function displayErrors() {
         // alert("Inside displayerrors");
         <%
           String errorReport = (String)request.getAttribute("Request_status_error_message");
           
          if (errorReport != null ) { 
          %>
              alert('<%=errorReport%>');
         <% } %>
         
       }
		//alert("inside requ_status page");
		//Input the IDs of the IFRAMES you wish to dynamically resize to match its content height:
		//Separate each ID with a comma. Examples: ["myframe1", "myframe2"] or ["myframe"] or [] for none:
		var iframeids=["requestStatus0","requestStatus1","requestStatus2","requestStatus3","requestStatus4","requestStatus5"]
		
		//Should script hide iframe from browsers that don't support this script (non IE5+/NS6+ browsers. Recommended):
		var iframehide="yes"
		
		var getFFVersion=navigator.userAgent.substring(navigator.userAgent.indexOf("Firefox")).split("/")[1]
		var FFextraHeight=parseFloat(getFFVersion)>=0.1? 16 : 0 //extra height in px to add to iframe in FireFox 1.0+ browsers
		
		function dyniframesize() {
			var dyniframe=new Array()
			for (i=0; i<iframeids.length; i++){
				if (document.getElementById){ //begin resizing iframe procedure
					dyniframe[dyniframe.length] = document.getElementById(iframeids[i]);
					if (dyniframe[i] && !window.opera){
						dyniframe[i].style.display="block"
						if (dyniframe[i].contentDocument && dyniframe[i].contentDocument.body.offsetHeight) //ns6 syntax
						dyniframe[i].height = dyniframe[i].contentDocument.body.offsetHeight+FFextraHeight; 
						else if (dyniframe[i].Document && dyniframe[i].Document.body.scrollHeight) //ie5+ syntax
						dyniframe[i].height = dyniframe[i].Document.body.scrollHeight;
					}
				}
			//reveal iframe for lower end browsers? (see var above):
				if ((document.all || document.getElementById) && iframehide=="no"){
					var tempobj=document.all? document.all[iframeids[i]] : document.getElementById(iframeids[i])
					tempobj.style.display="block"
				}
			}
			
			displayErrors();
		}
		
		if (window.addEventListener)
			window.addEventListener("load", dyniframesize, false)
		else if (window.attachEvent)
			window.attachEvent("onload", dyniframesize)
		else
			window.onload=dyniframesize
		
</script>
<script type="text/javascript">
function toggleIFrms(strFrmId){
//alert("calling toggleIFrms");
ifrmObjID=document.getElementById(strFrmId);
//alert(ifrmObjID.height);


if("requestStatus0"==strFrmId){
	if(28 < ifrmObjID.height){
		ifrmObjID.height="28";
	}else if("28"==ifrmObjID.height){
		ifrmObjID.height="373";
	}
}

if("requestStatus1"==strFrmId){
	if(48 < ifrmObjID.height){
		ifrmObjID.height="48";
	}else if("48"==ifrmObjID.height){
		ifrmObjID.height="373";
	}
}

if("requestStatus2"==strFrmId){
	if(48 < ifrmObjID.height){
		ifrmObjID.height="48";
	}else if("48"==ifrmObjID.height){
		ifrmObjID.height="373";
	}
}

}


</script>
<% 
	ArrayList urlList = (ArrayList)request.getAttribute("urlList");
	String idStr = "";
	//System.out.println("url list in jsp for request status" + urlList);
%>


		<!-- APPLICATION WORK SPACE AREA -->
	<div id="application_area">
		<br clear="all" />
		<br clear="all" />	
		<!-- container for all modules -->
 		<div id="moduleContainerId">	
<%for(int i =0;i<urlList.size();i++){
		idStr = "requestStatus" + i;
%>
		<IFRAME id='<%=idStr%>' width="100%" height="100%" frameborder="0" marginwidth="0" marginheight="0"
			scrolling=no src='<%=urlList.get(i).toString()%>&reqStatFrmID=<%=idStr%>'>
		</IFRAME> 	
		<br clear="all" />
<%}%>	
		</div><!-- module container -->

	</div><!-- app area -->
