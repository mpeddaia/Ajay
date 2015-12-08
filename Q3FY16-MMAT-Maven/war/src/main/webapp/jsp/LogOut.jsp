<%@page import="java.util.*" %>

<%
String dashBoardURL = (String)request.getAttribute("dashBoardURL");
String qotLogOutURL = (String)request.getAttribute("qotLogOutURL");
String ocmLogOutURL = (String)request.getAttribute("ocmLogOutURL");
String pomLogOutURL = (String)request.getAttribute("pomLogOutURL");
String somLogOutURL = (String)request.getAttribute("somLogOutURL");
String mmatLogOutURL = (String)request.getAttribute("mmatLogOutURL");
String xtrackLogOutURL = (String)request.getAttribute("xtrackLogOutURL");
%>

<html>
<body bgcolor=#ffffff onload="javascript:callHomePage('<%=dashBoardURL%>');">
</body>
<script>

	function callHomePage(CSCCURL)
	{
		var agt=navigator.userAgent.toLowerCase();
	 	if (agt.indexOf("msie") != -1) {
	   		document.execCommand("ClearAuthenticationCache");
	   		window.location=CSCCURL;
	   		iframeCheck();
		} else {
		   // Let's create an xmlhttp object
		   var xmlhttp = createXMLObject();
		   // Let's get the force page to logout for mozilla
		   xmlhttp.open("GET",".force_logout_offer_login_mozilla",true,"logout","logout"); 
		   // Let's send the request to the server
		   xmlhttp.send("");
		   // Let's abort the request
		   xmlhttp.abort();
		   // alert("-->");
		   iframeCheck();
	  
	 	} 	 	 
	}

	function logoutCounterIncre(){
		logoutCounter++;
	}

	function createXMLObject() {
   		try {
	      		if (window.XMLHttpRequest) {
	           	xmlhttp = new XMLHttpRequest();
	       		}
	      	 	// code for IE
	       		else if (window.ActiveXObject) {
	           xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	       	}
   		}
    	catch (e) {
       	xmlhttp=false
   		}	
  
   		return xmlhttp;
   	}
   
   	var logoutCounter = 0;
	var expirationCounter = 0;
	var expirationTime = 10;
	var loopWaitMsec = 1000;
	var iframeNum = 6; //subject to change as other tracks finish integration

    function delGlobalCookiesAndFwdToLogin(){
		//delGlobalCookies();
		var loginUrl = "<%= dashBoardURL%>";
		window.top.location=loginUrl;
	}
	function logoutCounterIncre(){
		logoutCounter++;				
	}
	function iframeCheck(){
   		if(logoutCounter==iframeNum || expirationCounter > expirationTime){
   			delGlobalCookiesAndFwdToLogin();
     		return;
   		}
   		setTimeout("iframeCheck()", loopWaitMsec);
   		expirationCounter++;
	}

	
</script>
   <iframe onload="logoutCounterIncre()" style="width:0px; height:0px; border: 0px" src="<%= ocmLogOutURL %>">
   </iframe>     
   <iframe onload="logoutCounterIncre()" style="width:0px; height:0px; border: 0px" src="<%= qotLogOutURL %>">
   </iframe>	
   <iframe onload="logoutCounterIncre()" style="width:0px; height:0px; border: 0px" src="<%= pomLogOutURL %>">
   </iframe>
   <iframe onload="logoutCounterIncre()" style="width:0px; height:0px; border: 0px" src="<%= somLogOutURL %>">
   </iframe>
   <iframe onload="logoutCounterIncre()" style="width:0px; height:0px; border: 0px" src="<%= mmatLogOutURL %>">
   </iframe>   
   <iframe onload="logoutCounterIncre()" style="width:0px; height:0px; border: 0px" src="<%= xtrackLogOutURL %>">
   </iframe>
   
</html>