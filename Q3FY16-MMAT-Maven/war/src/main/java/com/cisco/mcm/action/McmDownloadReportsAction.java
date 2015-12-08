package com.cisco.mcm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.session.MCMUserSession;

public class McmDownloadReportsAction extends McmBaseAction  {
	
	
	
	 public ActionForward execute(ActionMapping mapping, ActionForm form,
			    HttpServletRequest request, HttpServletResponse response)
			    throws Exception 
			   {

			

				return mapping.findForward("success");
		    
			   }
	

}
