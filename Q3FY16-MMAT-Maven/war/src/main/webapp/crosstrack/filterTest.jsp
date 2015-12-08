<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="com.cisco.crosstrack.filters.FilterHandler,java.util.*"%>
<%@ page import="com.cisco.crosstrack.filters.FilterHandler" %>

<%@ page import="com.cisco.crosstrack.filters.dao.genjava.XxcssCtSavesetObjType" %>
<%@ page import="com.cisco.crosstrack.filters.dao.genjava.XxcssCtSearchObjType" %>
<%@ page import="com.cisco.cts.util.oa.OracleApplicationSession" %>



<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/Master.css" rel="stylesheet" type="text/css">
<TITLE>filterTest.jsp</TITLE>
<SCRIPT language="JavaScript">
 <!--
 	function saveAD()
 	{
 		window.document.frmTest.SS.value='1';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}

	function saveUD()
 	{
 		window.document.frmTest.SS.value='2';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}
 	
 	function retSD()
 	{
 		window.document.frmTest.SS.value='3';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}
 	
 	function retUD()
 	{
 		window.document.frmTest.SS.value='4';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}
 	
 	function setSD()
 	{
 		window.document.frmTest.SS.value='5';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}
 	
 	function getSD()
 	{
 		window.document.frmTest.SS.value='6';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}
 	
 	function delSD()
 	{
	 	window.document.frmTest.SS.value='7';
 		window.document.frmTest.action='filterTest.jsp';
 		window.document.frmTest.submit();
 	}
 	
 	function delPopup()
 	{
	 	//window.document.frmTest.SS.value='8';
 		//window.document.frmTest.action='filterTest.jsp';
 		//window.document.frmTest.submit();
 		
	   	childwindow = window.open("../advancedSearch.do?methodName=loadFunctions&context="+context+"&ccouserid="+ccouserid+"&sourcesystem="+sourcesystem+"&authlevel="+authlevel,"childWin","width=615,height=550, scrollbars, statusbar");
    	childwindow.creator=self;
 	}
 //-->
</SCRIPT>
</HEAD>
<BODY>
<%
//(FilterHandler.getInstance()).initialiseOracleSession("jbathula","XXCSS_SOM");



		OracleApplicationSession oas1=new OracleApplicationSession();
		oas1.setApplicationShortName("XXCSS_SOM");
		oas1.setUserName("jbathula");
		oas1.setResponsiblityName("NULL"); 
		
		oas1.setSchemaPackage("APPS.xxccs_fea_utl_session");
	
	//Save Application  Data
	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("1"))	{	
	
		try{
		
			HashMap HM=new HashMap();
			ArrayList al=new ArrayList();
			ArrayList a1=new ArrayList();
			ArrayList a2=new ArrayList();
			ArrayList a3=new ArrayList();
			ArrayList a4=new ArrayList();
			
			/* EXE Dash board  */
			
			/*al.add("Current Fiscal Quarter");
			HM.put("Period",al);
			a1.add("All");
			HM.put("ServiceCategory",a1);
			a2.add("Select One");
			HM.put("Region",a2);
			HM.put("Flag",a2);
			HM.put("SuperTheatre",a2);
			HM.put("Theatre",a2);
			HM.put("Consolidation",a2);
			HM.put("Area",a2);
			HM.put("Operation",a2);
		
			*/
		
			
			/*  request status
			al.add("Select One");
			HM.put("functionStr",al);
			HM.put("requestTypeStr",al);
			HM.put("statusStr",al);
			*/
			/*
			al.add("Current Fiscal Quarter");
			HM.put("Period",al);
			a1.add("All");
			HM.put("ServiceCategory",a1);
				HM.put("Region",a1);
					HM.put("Flag",a1);
					a3.add("cisco");
						HM.put("OppurtunityType",a3);
							HM.put("Status",a1);
							a2.add("=");
								HM.put("Amount",a2);
							
			*/
				
				/*  Reassignment Manager */
		//	al.add("Select One");
		//	HM.put("TheatreAdmin",al);
		//	HM.put("RequestStatus",al);
		//	HM.put("statusStr",al);
						
		/*		SOM OPP Manager */		
		//	al.add("Current +1 Fiscal Quarter Value");
		//	HM.put("Period",al);
		//	a1.add("All");
		//	HM.put("ServiceCategory",a1);
		//		HM.put("Region",a1);
		//			HM.put("Flag",a1);
		//			a4.add("cisco");
		//				HM.put("OpportunityType",a4);
		//					HM.put("Status",a1);
		//					a2.add("=");
		//						HM.put("Amount",a2);
		
		//   al.add("AT&T");
		//	a2.add("AT%T");
		//	HM.put("TheatreAdmin",al);
		//	HM.put("RequestStatus",a2);
		
		a1.add("Select One");
		HM.put("theatreAdmin",a1);
		
		a2.add("Pending");
		HM.put("requestStatus",a2);
		
		
		//	(FilterHandler.getInstance()).setPageFilters(oas1,"F","APPLICATION","SOM-RSN-CSTS",HM);	
			(FilterHandler.getInstance()).setPageFilters(oas1,"F","APPLICATION","SOM-RSN-OSTS",HM);	
		//	(FilterHandler.getInstance()).setPageFilters(oas1,"F","APPLICATION","QOT-QUOTE-MNGR",HM);
		//		(FilterHandler.getInstance()).setPageFilters(oas1,"F","APPLICATION","EXEC-DASHBOARD",HM);					
			
		//	(FilterHandler.getInstance()).setPageFilters(oas,"F","APPLICATION","SOM-RSN-MGR-CONTRTS",HM);
		//	(FilterHandler.getInstance()).setPageFilters(oas,"F","APPLICATION","SOM-RSN-MGR-OPPT",HM);
			
			}catch(Exception e)
		{
		out.println(e);
		
		}
	}



	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("2"))	{	
	
	try{
		/*
		HashMap HM=new HashMap();
		ArrayList al=new ArrayList();
		
		al.add("=");
		HM.put("Amount",al);
		//a1.add("All");
		
		//a2.add("Select One");
		
		HM.put("Theatre",a2);
		HM.put("Consolidation",a2);
		HM.put("RenewalType",a2);
		HM.put("Region",a2);
		HM.put("Flag",a2);
		HM.put("SuperTheatre",a2);
		HM.put("Theatre",a2);
		
		HM.put("Area",a2);
		HM.put("Operation",a2);
	//	HM.put("Period",a2);
	//	HM.put("Area",a2);
		al.add("Failed");
			//al.add("fieldUSRvaluex2");
			//	al.add("fieldUSRvaluex3");
		HM.put("JobStatus",al);
		(FilterHandler.getInstance()).setPageFilters(oas1,"F","USER","RENWAL-TYPE-MNGR",HM);
		*/
		}catch(Exception e)
		{
		out.println(e);
		
		}
	}





	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("3"))	{	
		HashMap HM=new HashMap();
		HM=(FilterHandler.getInstance()).getPageFilters(oas1,"F","APPLICATION","REQUEST-STATUS");
		if (null!=HM){
			Set s;
			Iterator it;
			s=HM.entrySet();
			it=s.iterator();
			while(it.hasNext())
			{
				out.println(it.next());
			}
		}
	}
	
	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("4"))	{	
		HashMap HM=new HashMap();
		HM=(FilterHandler.getInstance()).getPageFilters(oas1,"F","USER","SOM-OPP-MNGR");
		//out.println(HM.values()+"test");
		if (null!=HM){
			Set s;
			Iterator it;
			s=HM.entrySet();
			it=s.iterator();
		while(it.hasNext())
			{
			out.println(it.next());
			}
		}
	}
		
	


 

	//Set Search Defaults
	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("5"))	{	
	
		try{
			
			HashMap HM=new HashMap();
			ArrayList al=new ArrayList();
			al.add("fieldAPPvalue1");
				al.add("fieldAPPvalue2");
					al.add("fieldAPPvalue3");
			HM.put("fieldAPPName1",al);
			String str=request.getParameter("scrnName");
			(FilterHandler.getInstance()).setPageFilters(oas1,"S",str,"ADV_SEARCH",HM);
			
			}catch(Exception e)
			{
			out.println(e);		
		}
	}
	
	
	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("6"))	{	
		List HM=new ArrayList();
		HM=(FilterHandler.getInstance()).getSavedSearchSet(oas1,"ADV_SEARCH");
		for(int i=0;i<HM.size();i++)
		{
		XxcssCtSavesetObjType ob=(XxcssCtSavesetObjType)HM.get(i);
		out.println(ob.getSaveSetName()+"<br>");
		}
	}
	
	
	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("7"))	{	
		List HM=new ArrayList();
		XxcssCtSearchObjType obj=new XxcssCtSearchObjType();
		obj.setProcessValue("test");
		obj.setScreenName("ADV_SEARCH");
		XxcssCtSearchObjType obj1=new XxcssCtSearchObjType();
		obj1.setProcessValue("test1");
		obj1.setScreenName("ADV_SEARCH");
		HM.add(obj);
		HM.add(obj1);
		(FilterHandler.getInstance()).deleteSavedSearchSet(oas1,HM);//.getSavedSearchSet("ADV_SEARCH");
	}

	if(request.getParameter("SS") !=null && request.getParameter("SS").equals("8"))	{	
		List HM=new ArrayList();
		HM=(FilterHandler.getInstance()).getSavedSearchSet(oas1,"ADV_SEARCH");
		for(int i=0;i<HM.size();i++)
		{
		XxcssCtSavesetObjType ob=(XxcssCtSavesetObjType)HM.get(i);
		out.println(ob.getSaveSetName()+"<br>");
		}
	}
	
%>
	
	

	<form  name="frmTest">
	<input type="hidden" name="SS" value="N"> 
	
	<input type=text name=scrnName value="" /><p>

				<a href="javascript:saveAD()" class="inline_button">Save as APP Default <input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="SaveAsAPPDefault" id="SaveAsAPPDefault" /></a><p>
				
				<a href="javascript:saveUD()" class="inline_button">Save as USER Default <input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="SaveAsUSRDefault" id="SaveAsUSRDefault" /></a><p>
				
				<a href="javascript:retSD()" class="inline_button">get System Defaults <input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="RestoreSDefaults" id="RestoreSDefaults" /></a><p>
				
				<a href="javascript:retUD()" class="inline_button">get User Defaults <input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="RestoreUDefaults" id="RestoreUDefaults" /></a><p>

				<a href="javascript:setSD()" class="inline_button">Save Search Set<input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="SaveSearch" id="SaveSearch" /></a><p>
				
		<a href="javascript:getSD()" class="inline_button">get Search Set<input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="getSaveSearch" id="getSaveSearch" /></a><p>
		
		<a href="javascript:delSD()" class="inline_button">Delete Search Set<input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="delSearch" id="delSearch" /></a><p>
		
		<a href="javascript:delPopup()" class="inline_button">Delete Popup<input type="image" src="../images/global/buttons_and_icons/icons/icn_action.gif" alt="Set Filters" align="absmiddle" height="13" width="13" border="0" name="delPopup" id="delPopup" /></a><p>
				
			
			
			
			</FORM>
			
