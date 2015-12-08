/*
 * Created on Nov1 , 2007
 *
 * Base Action class for MCM application.
 * 
 */
package com.cisco.mcm.action;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cisco.crosstrack.menu.TabMenuException;
import com.cisco.mcm.util.McmConstants;

/**
 * @author wipro
 * 
 * 
 */
public class McmBaseAction extends Action {
	public static final ResourceBundle bundle = ResourceBundle
	.getBundle("ApplicationResources");

    private static Logger logger = Logger.getLogger(McmReportsAction.class);

	
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
			return false;

		}
	}
	
	public boolean hasPrivilegesMoveLinkDelink(HttpServletRequest request, String function) {
		HttpSession session = request.getSession(false);
		HashMap map = (HashMap) session.getAttribute("ROLES");
		if (map.containsKey(function) && "RW".equals((String)map.get(function)) ) {
			return true;
		} else {
			return false;
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

	/**
	 * @param mapping
	 * @param request
	 * @param response
	 * @return
	 */

	public ActionForward handleException(ActionMapping mapping,
			HttpServletRequest request, HttpServletResponse response,
			Throwable t) {
		String page = "";
		request.setAttribute("ciscoLife", System.getProperty("cisco.life"));
		if (t instanceof SQLException) {
			String errorMessage = "Database error occured while process the request ";
			request.setAttribute("ERROR_MSG", errorMessage);
			page = McmConstants.ERROR_PAGE_WITH_TAB_MENU;
		}
		if (t instanceof TabMenuException) {
			if (t.getCause() != null) {
				t = t.getCause();
			}
			String errorMessage = " Error occured wihle processing the request ";
			request.setAttribute("ERROR_MSG", errorMessage);
			page = McmConstants.ERROR_PAGE_WITHOUT_TAB_MENU;
		} else {
			String errorMessage = "Error occured wihle processing the request ";
			request.setAttribute("ERROR_MSG", errorMessage);
			page = McmConstants.ERROR_PAGE_WITH_TAB_MENU;
		}

		try {
			ByteArrayOutputStream bout = new ByteArrayOutputStream();
			
			//t.printStackTrace(new PrintStream(bout)); // original code
			
			logger.error("McmBaseAction : handleException : TabMenuException : " , t); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
			
			request.setAttribute("ERROR_TRACE", new String(bout.toByteArray()));
			/*
			 * try { HttpSession session = request.getSession();
			 * setUpTabMenu(session,request); }catch(Exception e) {
			 * page=McmConstants.ERROR_PAGE_WITH_TAB_MENU; }
			 */
		} finally{
		    //stack here the trace
		    request.setAttribute("ERROR_TRACE", "");
		}
		try {
			return mapping.findForward(page);
		} finally{
		    //stack here the trace
		}
	}


}
