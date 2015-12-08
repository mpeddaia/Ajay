/*
 * Created on Dec 29, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.cisco.crosstrack.menu.Menu;
import com.cisco.crosstrack.menu.TabMenuException;
import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.mcm.utils.MCMDataUtil;

/**
 * @author kiguntup
 * 
 */
public class McmReportsAction extends DispatchAction {
    public static final ResourceBundle bundle = ResourceBundle
	    .getBundle("ApplicationResources");
    private static Logger logger = Logger.getLogger(McmReportsAction.class);
    

    /**  
    
    * @param mapping
    * @param form
    * @param request
    * @param response
    * @return
    */
   public ActionForward mcmValidationOverrideReport(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	long startTime = System.currentTimeMillis();
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	long endTime = System.currentTimeMillis();
    logger.debug("Time taken for execution:" + (endTime - startTime));
	return mapping.findForward(McmConstants.MCMValidationOverrideReport);
   }
   
   
   
   /**  
   
    * @param mapping
    * @param form
    * @param request
    * @param response
    * @return
    */
   public ActionForward massProcessingReport(ActionMapping mapping,
		    ActionForm form, HttpServletRequest request,
		    HttpServletResponse response) 
	{
		boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
		if (!privilage) {
		    return throwUnAuthorizeAccess(mapping, request, response);
		}

		if (null != request.getAttribute("REQUESTID")) {
		    request.setAttribute("REQUESTID", (request
			    .getAttribute("REQUESTID")).toString());
		}
		Date today;
		String output;
		SimpleDateFormat formatter;

		formatter = new SimpleDateFormat("dd-MMM-yyyy");
		today = new Date();
		output = formatter.format(today);

		HttpSession session = request.getSession();
		setUpTabMenu(session, request);
		session.setAttribute("ENDDATE", output);
		return mapping.findForward(McmConstants. MCMMassProcessingReport);
	}

   
    
    /**  
    
    * @param mapping
    * @param form
    * @param request
    * @param response
    * @return
    */
   public ActionForward massReConfigurationTransactionReport(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	long startTime = System.currentTimeMillis();
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	long endTime = System.currentTimeMillis();
	logger.debug("Time taken for execution:" + (endTime - startTime));
	return mapping.findForward(McmConstants.MCMMoveConfiguredMinorProducts);
   }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward mcmUtilizationByUser(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}

	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;

	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	return mapping.findForward(McmConstants.MCMUtilizationByUser);
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward gpsAuditReport(ActionMapping mapping, ActionForm form,
	    HttpServletRequest request, HttpServletResponse response) {
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}

	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	return mapping.findForward(McmConstants.GPSAuditReport);
    }

    public ActionForward massMCMUtilizationByTranType(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	return mapping.findForward(McmConstants.MASSMCMUtilizationByTranType);
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward mcmFailureBreakOutTrans(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}

	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	return mapping.findForward(McmConstants.MCMFailureBreakOutTrans);
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward mcmProcessingTimesOfReq(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	long startTime = System.currentTimeMillis();
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	long endTime = System.currentTimeMillis();
	logger.debug("Time taken for execution:" + (endTime - startTime));
	return mapping.findForward(McmConstants.MCMProcessingTimesOfReq);
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward reasonCodeReport(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	long startTime = System.currentTimeMillis();
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	long endTime = System.currentTimeMillis();
	logger.debug("Time taken for execution:" + (endTime - startTime));
	return mapping.findForward(McmConstants.ReasonCodeReport);
    }

    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     */
    public ActionForward mcmVOAuditReport(ActionMapping mapping,
	    ActionForm form, HttpServletRequest request,
	    HttpServletResponse response) {
	long startTime = System.currentTimeMillis();
	boolean privilage = hasPrivileges(request, McmConstants.MASS_MAT_RPTS);
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	if (null != request.getAttribute("REQUESTID")) {
	    request.setAttribute("REQUESTID", (request
		    .getAttribute("REQUESTID")).toString());
	}
	Date today;
	String output;
	SimpleDateFormat formatter;
	formatter = new SimpleDateFormat("dd-MMM-yyyy");
	today = new Date();
	output = formatter.format(today);

	HttpSession session = request.getSession();
	setUpTabMenu(session, request);
	session.setAttribute("ENDDATE", output);
	long endTime = System.currentTimeMillis();
	logger.debug("Time taken for execution:" + (endTime - startTime));
	return mapping.findForward(McmConstants.MCMVOAuditReport);
    }

    /**
     * @param session
     * @param request
     */
    public void setUpTabMenu(HttpSession session, HttpServletRequest request) {
	Menu tabMenu = (Menu) session.getAttribute("TabMenu");
	ArrayList breadCrumbs = new ArrayList();
	String serverPath = null;
	serverPath = request.getScheme() + "://" + request.getServerName();
	request.setAttribute("ServerPath", serverPath);
	String dashBoardURL = bundle.getString("DashboardContext");
	dashBoardURL = serverPath + dashBoardURL;
	String cmURL = bundle.getString("CMContext");
	cmURL = serverPath + cmURL;
	breadCrumbs.clear();
	breadCrumbs.add(0, new com.cisco.crosstrack.menu.BreadCrumbs(
		MCMDataUtil.genaratePropertyKey("DashBoard"), dashBoardURL));
	breadCrumbs.add(1, new com.cisco.crosstrack.menu.BreadCrumbs(
		MCMDataUtil.genaratePropertyKey("Mass Contract Management"),
		"#"));
	try {
	    tabMenu.setBreadCrumbs(breadCrumbs);
	    tabMenu.setHeaderName(MCMDataUtil.genaratePropertyKey(bundle
		    .getString("MassMATHeaderName")));
	    session.setAttribute("TabMenu", tabMenu);
	} catch (TabMenuException e2) {
	      //e2.printStackTrace();
		logger.error("McmReportsAction : setUpTabMenu : IllegalAccessException : " , e2); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	}
    }

    /**
     * @param request
     * @param function
     * @return
     */
    public boolean hasPrivileges(HttpServletRequest request, String function) {
	HttpSession session = request.getSession(false);

	HashMap map = (HashMap) session.getAttribute("ROLES");
	if (map.containsKey(function)) {
	    return true;
	} else {
	    return true;

	}
    }

    /**
     * @param mapping
     * @param request
     * @param response
     * @return
     */
    public ActionForward throwUnAuthorizeAccess(ActionMapping mapping,
	    HttpServletRequest request, HttpServletResponse response) {
	return mapping.findForward(McmConstants.UN_AUTH);
    }

}
