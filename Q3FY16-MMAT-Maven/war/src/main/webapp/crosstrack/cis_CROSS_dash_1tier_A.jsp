<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
    
    
 function toggleIFrms(strFrmId,parentStyle,appShortName){

    ifrmObjID=document.getElementById(strFrmId);
     
		  if("XTRACK"==appShortName) {
		    if("block"==parentStyle) {
				ifrmObjID.height="54";
			   } else  {
				  ifrmObjID.height="229";
			    }
            } 
          
          if("OCM"==appShortName) {
		    if("block"==parentStyle) {
				ifrmObjID.height="25";
			} else  {
				ifrmObjID.height="181";
			}
          } 
          
        if("POM"==appShortName) {
		    if("block"==parentStyle) {
				ifrmObjID.height="84";
			} else  {
				ifrmObjID.height="185";
			}
          } 
          
        if("QOT"==appShortName) {
		    if("block"==parentStyle) {
				ifrmObjID.height="53";
			} else  {
				ifrmObjID.height="201";
			}
          } 
  } 
    
    function displayErrors() {
         // alert("Inside displayerrors");
         <%
           String errorReport = (String)request.getAttribute("Dashboard_action_error_message");
           
          if (errorReport != null ) { 
          %>
              alert('<%=errorReport%>');
         <% } %>
         
       }
		
		//Input the IDs of the IFRAMES you wish to dynamically resize to match its content height:
		//Separate each ID with a comma. Examples: ["myframe1", "myframe2"] or ["myframe"] or [] for none:
		var iframeids=["dashboard0","dashboard1","dashboard2","dashboard3","dashboard4","dashboard5"]
		
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

<% 
	ArrayList urlList = (ArrayList)request.getAttribute("urlList");
	String idStr = "";
%>

		<%--br clear="all" />
		<br clear="all" / --%>
		
		<!-- APPLICATION WORK SPACE AREA -->

	<div id="application_area">

		<br clear="all" />
		<br clear="all" />
			
		<!-- container for all modules -->
 		<div id="moduleContainerId">	
<%for(int i =0;i<urlList.size();i++){
		idStr = "dashboard" + i;
%>
		<IFRAME id='<%=idStr%>' width="100%", height="100%" frameborder="0" marginwidth="0" marginheight="0"
			scrolling=no src='<%=urlList.get(i).toString()%>&dashboardFrameID=<%=idStr%>'>
		</IFRAME> 	
		<br clear="all" />
<%}%>		
		</div><!-- module container -->

	</div><!-- app area -->
