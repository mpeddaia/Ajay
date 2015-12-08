/*
 * Created on Nov 22, 2005
 *
 * Action class for MCM Index page.
 * 
 */
package com.cisco.mcm.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cisco.crosstrack.menu.Menu;
import com.cisco.crosstrack.menu.TabMenuException;
import com.cisco.mcm.bo.McmUploadBO;
import com.cisco.mcm.dao.McmDAO;
import com.cisco.mcm.dto.McmOverrideDTO;
import com.cisco.mcm.exception.McmException;
import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.session.MCMUserSession;

/**
 * @author kiguntup
 * 
 */
public class McmIndexAction extends McmBaseAction {
	
	private static Logger logger = Logger.getLogger(McmIndexAction.class);
	
	public static final ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources");

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String status2FWD = McmConstants.VAR_STATUSTYPE_SUCCESS;
		HttpSession session = request.getSession();
		try {

			boolean uploadprivilage = hasPrivileges(request, McmConstants.MASS_MAT_UPLD_ACTIONS);
			boolean downloadprivilage = hasPrivileges(request, McmConstants.MASS_MAT_DWNLD_TMPLTE);
			boolean overRideprivilage = hasPrivileges(request, McmConstants.MASS_MAT_OVERRIDES);

			String processRequestId = "";
			String method = request.getParameter("method");

			if (!(uploadprivilage || downloadprivilage || overRideprivilage)) {
				return throwUnAuthorizeAccess(mapping, request, response);
			}
			McmUploadBO service = new McmUploadBO();

			// Mass mat integration start
			setUpTabMenu(session, request);
			// Mass mat integration End
			String matuser = (session.getAttribute("MATUSER")).toString();
			MCMUserSession userSession = (MCMUserSession) session.getAttribute(MCMUserSession.USER_SESSION_KEY);
			String userRole = userSession.getUserRole();
			logger.info("UserRole : " + userRole);
			request.setAttribute("userRole", userRole);
			String strReqtype = request.getParameter(McmConstants.PARAM_REQTYPE);
			
			//Start of Changes added for Q4FY13 DNR. on 26.3.2013 by sphilipo
			if(strReqtype == null){
				strReqtype = "MAT_DNR_PRODUCT_LVL";
				request.setAttribute("selectedRequestType", strReqtype);
				System.out.println("In if ..setting value selectedRequestType is : "+strReqtype);
			}
			//End of Changes added for Q4FY13 DNR.  on 26.3.2013
						
			String strOverRide = request.getParameter(McmConstants.SHOW_OVER_RIDE_PAGE);
			String emailId = userSession.getEmail();//service.getUserEmailId(userSession);
			logger.info("strReqtype: "+strReqtype);
			logger.info("strOverRide: "+strOverRide);
			logger.info("emailId: "+emailId);
			
			//request.setAttribute(McmConstants.ATTRIB_EMAILID,session.getAttribute("UserEmailId"));// emailId);
			request.setAttribute(McmConstants.ATTRIB_EMAILID,emailId);
			//("Method = " + method + " strReqtype = " + strReqtype);
			// if (method != null && !method.equals("") &&
			// method.equals("reqChanged")) {
			if ("reqChanged".equalsIgnoreCase(method)) {
				if (strOverRide != null && !strOverRide.equals("")) {
					status2FWD = "successList";
					logger.info("status2FWD : " + status2FWD);
					if (McmConstants.MAT_ADD.equalsIgnoreCase(strReqtype)
							|| McmConstants.MCM_MAT_M_AND_P_ENTITLMNT.equalsIgnoreCase(strReqtype)
							|| McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT.equalsIgnoreCase(strReqtype)
							|| McmConstants.MAT_MOVE_C2C_AT_PRODUCT.equalsIgnoreCase(strReqtype)
							//|| McmConstants.MAT_MOVE_S2S_AT_PRODUCT.equalsIgnoreCase(strReqtype)
							|| McmConstants.DATE_CHANGE_PRODUCT_OR_LINE.equalsIgnoreCase(strReqtype)
							|| McmConstants.MAT_TERMINATE.equalsIgnoreCase(strReqtype)
							|| McmConstants.MAT_DNR_PRODUCT_LVL.equalsIgnoreCase(strReqtype)) // Added by sphilipo as part of Q4FY13 Rel
							{
						request.setAttribute("transactFlag", "Y");
					} else {
						request.setAttribute("transactFlag", "N");
					}

					// Added "priceCheckFlag" by jjohnche for SSO, 30-Mar-2011
					
					// if (McmConstants.MAT_ADD.equalsIgnoreCase(strReqtype))
					// {
					//	request.setAttribute("priceCheckFlag", "Y");
					// } else {
					//	request.setAttribute("priceCheckFlag", "N");
					// }
					
					// End of code changes by jjohnche for SSO
				}
			} else {
				Collection uploadTemplates = service.getUploadTemplates(userSession,request, matuser, userRole);
				request.setAttribute(McmConstants.ATTRIB_UPLOADTEMPLATES, uploadTemplates);
				Collection downloadTemplates = service.getDownloadTemplates(userSession,request, matuser, userRole);
				request.setAttribute(McmConstants.ATTRIB_DOWNLOADTEMPLATES, downloadTemplates);
				String userId = userSession.getUserId();
				logger.info("Size : " + downloadTemplates.size());
				logger.info("User ID :" + userId);

				String referenceId = request.getParameter("uploadRequestId");
				// String request_name =
				// request.getParameter("mat_request_name");
				// TD013
				if (referenceId != null) {
					request.getSession().setAttribute("processRequestId", "");
					request.setAttribute("processRequestId", processRequestId);
					request.getSession().setAttribute("processRequestId", referenceId);
					userId = userSession.getUniversalId();
					service.updateRequestDetailsInCt(referenceId, referenceId, userId);

				} // TD013
			}

			if (null != session.getAttribute(McmConstants.ATTRIB_OVERRIDESLIST)) {
				request.getSession().removeAttribute(McmConstants.ATTRIB_OVERRIDESLIST);
			}

//			For STC 3.0 Q2FY10 Release - Start Added/Modified for getting the overrides for PortableSolutions - smerugol
			McmDAO mcmDAO = new McmDAO();
			McmOverrideDTO mcmOverrideDTO = new McmOverrideDTO();
			mcmOverrideDTO.setUserName(userSession.getAccessManager().getUsername());
			mcmOverrideDTO.setRequestType(strReqtype);
			HashMap hm = null;
			if ((McmConstants.SCM_AM_LINK).equalsIgnoreCase(strReqtype) || 
				(McmConstants.SCM_AM_MOVE).equalsIgnoreCase(strReqtype)  )
			{
				hm = (HashMap) mcmDAO.getLinkDelinkAndMoveOverrides (mcmOverrideDTO);
				//hm = (HashMap) mcmDAO.getOverrides (mcmOverrideDTO);
			}
			else
			{
				hm = (HashMap) mcmDAO.getOverrides (mcmOverrideDTO);
			}

//			For STC 3.0 Q2FY10 Release- Ended - smerugol
			if (hm != null && hm.size() > 0) {
				session.setAttribute(McmConstants.ATTRIB_OVERRIDES, hm);
			}
			logger.info("strReqtype : " + strReqtype);
			logger.info("session.getAttribute(McmConstants.ATTRIB_OVERRIDES) : " + session.getAttribute(McmConstants.ATTRIB_OVERRIDES));
			// TD 2478 & 2480 - Start
			if ((null == session.getAttribute(McmConstants.ATTRIB_OVERRIDES))
					|| (McmConstants.MCM_TERMINATE).equals(strReqtype)
					|| (McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID).equals(strReqtype)
					|| (McmConstants.MCM_IBCFG_EXP).equals(strReqtype)
					|| (McmConstants.MCM_UE_MOVE_S2S_PRODUCT).equals(strReqtype)
					
					//|| (McmConstants.PORTABLE_SOLUTIONS).equals(strReqtype) //commented for STC 3.0 Q2FY10 Release - smerugol
			  	// || (McmConstants.DATE_CHANGE_PRODUCT_OR_LINE).equals(strReqtype) // commented as part of TnC Q1FY13 by vibk
					//|| (McmConstants.MCM_MAT_CHANGE_SERLVL).equals(strReqtype)
					|| (McmConstants.MCM_MAT_TERMINATE_CONTRACT).equals(strReqtype)
					|| (McmConstants.MAT_SERVICE_LEVEL_TERMINATION).equals(strReqtype)
					|| (McmConstants.MAT_TERMINATION_FOR_CREDIT).equals(strReqtype) 
					// || (McmConstants.MAT_C2C_SERVICE_LEVEL_MOVE).equals(strReqtype)
					// Start - changes added by sphilipo as part of Q4FY13 Rel
					|| (McmConstants.MAT_DNR_CONTRACT_LVL).equals(strReqtype)
					|| (McmConstants.MAT_DNR_SITE_LVL).equals(strReqtype)
					|| (McmConstants.MAT_DNR_PRODUCT_LVL).equals(strReqtype)
					// End - changes added by sphilipo as part of Q4FY13 Rel
					// Start - changes added by amalekar as part of Q1FY14 Rel
					|| (McmConstants.MAT_BID_CHANGE).equals(strReqtype) 
					// End - changes added by amalekar as part of Q1FY14 Rel
					||(McmConstants.MAT_AU_DEPLOYBASE).equals(strReqtype)
					) { // PORTABLE  
				session.setAttribute(McmConstants.ATTRIB_SHOWFLAG, new Boolean("false"));

			} else {
				session.setAttribute(McmConstants.ATTRIB_SHOWFLAG, new Boolean("true"));
			}

			if (null != (session.getAttribute(McmConstants.ATTRIB_OVERRIDES))
					&& null != request.getParameter(McmConstants.PARAM_REQTYPE)) {
				HashMap hm1 = (HashMap) session.getAttribute(McmConstants.ATTRIB_OVERRIDES);
				if (strReqtype.equals(McmConstants.SEARCH_AND_CREATE_SHIP_TO_ID)) {
					strReqtype = McmConstants.MAT_MOVE_C2C_AT_SITE;
				}
				if (strReqtype.equals(McmConstants.MCM_MAT_M_AND_P_ENTITLMNT)) {
					strReqtype = McmConstants.M_AND_P_ENTITLMNT_ADD_PRODUCTS;
				}
				if (hm1.containsKey(strReqtype)) {
					ArrayList arlst = (ArrayList) hm1.get(strReqtype);
					session.setAttribute(McmConstants.ATTRIB_OVERRIDESLIST, arlst);
				}
			}
		} catch (IllegalAccessException exc) {
			//exc.printStackTrace(); // original code
			logger.error("Exception : " , exc); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
			request.getSession()
					.setAttribute(McmConstants.ERR_ATTRIB, new McmException(McmConstants.ERR_GENERROR, exc));
			return handleException(mapping, request, response, exc);

		}catch (Exception e)
		{
			//e.printStackTrace(); // original code
			logger.error("Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
		logger.info("status2FWD: " + status2FWD);
		return mapping.findForward(status2FWD);
	}

	/**
	 * @param session
	 * @param request
	 * @throws TabMenuException @
	 *             Mass Mat integration start
	 */
	public void setUpTabMenu(HttpSession session, HttpServletRequest request) throws TabMenuException {
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
		breadCrumbs.add(0, new com.cisco.crosstrack.menu.BreadCrumbs("Contracts", cmURL));
		breadCrumbs.add(1, new com.cisco.crosstrack.menu.BreadCrumbs("Upload Manager", "#"));
		try {
			tabMenu.setBreadCrumbs(breadCrumbs);
			tabMenu.setHeaderName("Upload Manager");
			session.setAttribute("TabMenu", tabMenu);
		} catch (TabMenuException e2) {
			logger.error("Exception : " , e2); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
			throw e2;
		}
	}
	
	

}