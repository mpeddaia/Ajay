/*
 * Created on Dec 30, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cisco.mcm.bo.McmReportContext;
import com.cisco.mcm.bo.McmUploadBO;
import com.cisco.mcm.dao.McmDAO;
import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.session.MCMAccessManager;
import com.cisco.servicesales.session.MCMUserSession;

/**
 * @author kiguntup
 * 
 */
public class McmProcessReportsAction extends McmBaseAction {

    private static final String CONTEXT_KEY = "matReportContext";

    private static final String EVENT = "event";
    private static Logger logger = Logger
    .getLogger(McmProcessReportsAction.class);

    /*
     * (non-Javadoc)
     * 
     * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping,
     *      org.apache.struts.action.ActionForm,
     *      javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
    	    HttpServletRequest request, HttpServletResponse response)
    throws Exception {
    try {
	long startTime = System.currentTimeMillis();
	boolean privilage = hasPrivileges(request,
		McmConstants.MASS_MAT_REQ_STATS_REQS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}

	final String event = request.getParameter(EVENT);
	McmReportContext matReportContext = null;
	if (event != null) {
	    HttpSession session = request.getSession();
	    MCMUserSession userSession = (MCMUserSession) session
	    .getAttribute(MCMUserSession.USER_SESSION_KEY);
	    MCMAccessManager accessManager = userSession.getAccessManager();
	    matReportContext = new McmReportContext(request, accessManager
		    .getUsername(), userSession.getEmail());
	    McmDAO matDAO = new McmDAO();
	    
	    
		   // TD -26738 Added by Rajkumar 
		    
		    String reportType =  request.getParameter("MAT_REPORT_TYPE");
		    
		    if (reportType.equals("9") || reportType.equals("10") || reportType.equals("11"))	    
		    {	    	
		    	matDAO.createAuditReport(matReportContext);		    
		    }	    
		    else
		    {
		        matDAO.createReport(matReportContext);
		    }
	    
		    /* 
		    Start : Commented code 
		    Reason : Performance - Method invokes inefficient Number constructor; use static valueOf instead
		    Commented by : Ajay Malekar(amalekar)
		    Release name : Q2FY15
		    */
		    
		    //Integer str = new Integer(matReportContext.getRequestID());
		    
		    // End : Commented code

		    /* 
		    Start : New code added 
		    Reason : To fix CI issue , Performance - Method invokes inefficient Number constructor; use static valueOf instead
		    Commented by : Ajay Malekar(amalekar)
		    Release name : Q2FY15
		    */
		    
		    Integer str = Integer.valueOf(matReportContext.getRequestID());
	    
		 // End : New code added
	    
	    
	    McmUploadBO service = new McmUploadBO();
	    //String processRequestId = "";
	  /*TD013  if (matReportContext.getReportType() != null) {
		processRequestId = service.createRequestIdForReports(
			userSession.getEmail(), accessManager.getUsername(),
			matReportContext.getReportType());
	    } */
	    String userId = userSession.getUserId();
	    String referenceId = String.valueOf(str);
	   
	  //TD013  if (processRequestId != null && referenceId != null) {
	    	 if (referenceId != null) {
		userId = userSession.getUniversalId();
	//TD013	service.updateRequestDetailsInCt(processRequestId, referenceId,userId);
		 
		service.updateRequestDetailsInCt(referenceId, referenceId,userId);
	    }
	    	 //TD013  request.setAttribute("REQUESTID", processRequestId);
	    request.setAttribute("REQUESTID", referenceId);

	}
    
	long endTime = System.currentTimeMillis();
	logger.debug("Time taken for execution:" + (endTime - startTime));
    }catch (Exception e)
    {
    	//e.printStackTrace(); //original code
    	logger.error("McmProcessReportsAction : execute : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
    	    	
    } /*catch (Throwable t) // commented to fix blokcer issue added by amalekar as part of Q1FY15 
    {
    	t.printStackTrace();
    }*/
	return mapping.findForward("success");
    }

}
