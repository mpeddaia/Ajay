/*
 * Created on Dec 7, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cisco.crosstrack.menu.Menu;
import com.cisco.crosstrack.menu.TabMenuException;
import com.cisco.mcm.bo.McmListControllerBO;
import com.cisco.mcm.bo.McmStatusDetailContext;
import com.cisco.mcm.dao.McmDAO;
import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.session.MCMUserSession;

/**
 * @author kiguntup
 * 
 */
public class McmStatusDetailAction extends McmBaseAction {
    private static final String MAT_CONTEXT = "matContext";
    private static final String REQUEST_ID = "requestid";
    private static final String REQUEST_NAME = "requestname";
    private static final String REQUEST_TYPE = "requesttype";
    private static final String STATUS = "status";
    private static final String EVENT = "event";
    private static final String SEND_EMAIL = "sendemail";
    private static final String EMAIL = "email";
    private static final String REPTYPE = "repType";
    private static final String STATUS_DETAIL_CONTEXT = "statusDetailContext";
    private static final String LOAD_DETAILS = "loadDetails";
    private static final String MAT_OVERRIDES = "matOverrides";
    private static final String ORSTATUS = "overrides";
    //private static final String SEARCH_SITES = "MAT_SEARCH_SITES";
    //private static final String CREATE_SITES = "MAT_CREATE_SITES";
    private static Logger logger = Logger
	    .getLogger(McmStatusDetailAction.class);

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
	    throws SQLException, IllegalAccessException, InstantiationException {
	String forwardPath = "";
	String method = "";
	try {
		    boolean privilage = hasPrivileges(request,McmConstants.MASS_MAT_REQ_STATS_RPTS);
		    logger.info("privilage::"+privilage);
	   // if (!privilage) {
		//return throwUnAuthorizeAccess(mapping, request, response);
	    //}
	    HttpSession session = request.getSession();
	    setUpTabMenu(session, request);

		    MCMUserSession userSession = (MCMUserSession) session.getAttribute(MCMUserSession.USER_SESSION_KEY);
	    if (null != session.getAttribute("matOverrides")) {
		session.removeAttribute("matOverrides");
	    }
	    request.setAttribute("email", userSession.getEmail());
		    logger.info("userSession.getEmail()::"+userSession.getEmail());

		    method = request.getParameter("method");
			logger.info("method ::"+method);
	    if (method == null) {
		setDetails(request, response);
		forwardPath = "viewRequest";
		
	    } else {
		doPerform(request, response, userSession);
		// forwardPath = "success";
		String event = request.getParameter(EVENT);
				logger.info("execute->event::"+event);
		if (LOAD_DETAILS.equalsIgnoreCase(event)) {
		    forwardPath = "success";
		} else {
		    forwardPath = "successResponse";
				    logger.info("forwardPath::"+forwardPath);
		    return mapping.findForward(forwardPath);
		}
	    }

	} catch (Exception e) {
		//e.printStackTrace(); // original code
		logger.error("McmStatusDetailAction : execute : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	    return handleException(mapping, request, response, e);
	}
	/*catch(Throwable t)
	{
		t.printStackTrace();
	}*/
		
	    logger.info("forwardPath ::"+forwardPath);
	return mapping.findForward(forwardPath);
    }

    /**
     * @param request
     * @param response
     * @return
     */
    protected boolean accessAllowed(HttpServletRequest request,
	    HttpServletResponse response) {
	// TODO: Implement MatStatusDetailAction.accessAllowed()
	return true;
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doAdd(HttpServletRequest request, HttpServletResponse response)
	    throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doTerminate(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveC2CAtContract(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveC2CAtSite(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveC2CAtProduct(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveC2CS2SAtSite(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveC2CS2SAtProduct(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveS2SAtSite(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doMoveS2SAtProduct(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    // 2491
    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doDateChangeAtProductLine(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {
	loadStatusDetails(request, response);
    }

    // TD013
    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    public void doContractTerminations(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException{
	loadStatusDetails(request, response);
    }

    /**
     * 
     * @param runData
     * @param context
     * @throws Exception
     */
    public void doPerform(HttpServletRequest request,
	    HttpServletResponse response, MCMUserSession userSession)
	    throws SQLException, IllegalAccessException, InstantiationException {

	String event = request.getParameter(EVENT);
		logger.info("doPerform->event ::"+event);
		if (LOAD_DETAILS.equalsIgnoreCase(event) || "loadResults".equalsIgnoreCase(event)) {
	    // Changed code for request status by Archana 21-Nov-2007
	    // String username = userSession.getUsername();
	    // Commented by Archana for request status 21-Nov-2007
	    loadStatusDetails(request, response);

	} else {
		    McmStatusDetailContext statusDetailContext = (McmStatusDetailContext) request.getSession().getAttribute(MAT_CONTEXT);
	    if (statusDetailContext != null) {
				McmListControllerBO listController		= statusDetailContext.getListController();
				boolean atleastOneListEventsProcessed 	= listController.processListEvents(request);
				System.out.println("atleastOneListEventsProcessed::"+atleastOneListEventsProcessed);
				
		if (SEND_EMAIL.equalsIgnoreCase(event)) {
		    String email = request.getParameter(EMAIL);
				    logger.info("doPerform->email ::"+email);
				    request.getSession().setAttribute("UserEmailId", email);
				    
		    String repType = request.getParameter(REPTYPE);
				    logger.info("doPerform->repType ::"+repType);
				    
		    try{
				    	logger.info("inside try block, before call to DAO");
				    	new McmDAO().sendEmail(statusDetailContext.getRequestNumber(),userSession.getUsername(),email, repType);
				    	logger.info("inside try block, after call to DAO");
				    }catch(SQLException e){
				    	/*logger.info("inside catch block");
				    	logger.error(e);*/ // original code
				    	logger.error("McmStatusDetailAction : doPerform : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
				    	
				    }
				    logger.info("Return nothing...");
		    return;
		}

		gotoView(request, response);
	    }

	}

    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     */
    private void loadStatusDetails(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {

	String requestType = request.getParameter(REQUEST_TYPE);
		logger.info("loadStatusDetails->requestType::"+requestType);
		String tempRequestType = requestType;
		
		/*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - Start*/
		String repType = request.getParameter(REPTYPE);
		logger.info("loadStatusDetails->repType::"+repType);
		
		HttpSession session = request.getSession();
		MCMUserSession userSession = (MCMUserSession) session.getAttribute(MCMUserSession.USER_SESSION_KEY);
		logger.info("LoadStatusDetails - > RepType :: " + repType);
		logger.info("Request Type : " +requestType);
		logger.info("User Role :" + userSession.getUserRole() +" User Name : " + userSession.getUsername());
		requestType=requestType.trim();
		
		
		if (repType == null && McmConstants.EXT_ROLES.contains(userSession.getUserRole().trim()) && 
				 (requestType.equals(McmConstants.MAT_MOVE_C2C_AT_CONTRACT) &&
				 (!requestType.equalsIgnoreCase(McmConstants.MAT_DNR_CONTRACT_LVL))&& 
				 (!requestType.equalsIgnoreCase(McmConstants.MAT_DNR_SITE_LVL))&& 
				 (!requestType.equalsIgnoreCase(McmConstants.MAT_DNR_PRODUCT_LVL))
						|| requestType.equals(McmConstants.MAT_MOVE_C2C_AT_PRODUCT)
						|| requestType.equals(McmConstants.MAT_MOVE_C2C_AT_SITE)
						|| requestType.equals(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE)
						|| requestType.equals(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT)
						||requestType.equals(McmConstants.MAT_MOVE_S2S_AT_PRODUCT)
						||	requestType.equals(McmConstants.MAT_MOVE_S2S_AT_SITE)
						//Added as part of Q2FY13
						|| requestType.equals(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID)
						|| requestType.equals(McmConstants.MAT_UE_MOVE_S2S_PRODUCT )))
		{
			logger.info("Request Type : " +requestType);
			logger.info("in loadStatusDetails if the transaction is of not DNR type");
			logger.info("User Session.getAccessLevel : " + userSession.getAccessLevel());
			logger.info("User Role : " + userSession.getUserRole());
			logger.info("Request type : " + requestType);
			repType="O";
			logger.info("Report Type : " + repType);
			
		}
		if(requestType.equals(McmConstants.MAT_BID_CHANGE))
		{
			logger.info("Passed test for bid change: changing report type to R");
			repType="R";
		}
		
		if(requestType.equals(McmConstants.MAT_AU_DEPLOYBASE))
		{
			repType= "R";
			logger.info("For ADD UPDATE DEPLOYBASE report type is set to R");
		}
		
		
		
		if(repType!=null)
		{
			if(repType.equals("R")){
				tempRequestType = requestType+"_RES";
				logger.info("loadStatusDetails->tempRequestType::"+tempRequestType);
			}else if (repType.equals("O"))
			{
				tempRequestType = requestType.trim()+"_OUT";
				logger.info("loadStatusDetails->tempRequestType::"+tempRequestType);
			}
			
			/*else if(repType.equals("S")){
				
			}else if(repType.equals("G")){
				
			}else if(repType.equals("E")){
				logger.info("loadStatusDetails->repType::"+repType);
			}*/
		}
		/*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - End*/
		logger.info("Report Type : " + repType);	
	requestType = requestType.trim();
		tempRequestType= tempRequestType.trim();
		
	String reqId = request.getParameter(REQUEST_ID);
	logger.info("Upload Request ID :" + reqId);
	reqId = reqId.trim();
		logger.info("reqId::"+reqId);
	int uploadRequestId = Integer.parseInt(reqId);
	
	logger.info("Upload Request ID :" + uploadRequestId);
		
		String requestName = (String) request.getSession().getAttribute("reqnameinSD");
	requestName = requestName.trim();
		logger.info("requestName::"+requestName);
		
	String status = request.getParameter(STATUS);
	status = status.trim();
		logger.info("status::"+status);
		request.setAttribute(STATUS,status);
		logger.info("Report Type : " + repType);
	String orStatus = request.getParameter(ORSTATUS);
	orStatus = orStatus.trim();
		logger.info("orStatus::"+orStatus);
		request.setAttribute(ORSTATUS,orStatus);

		logger.info("McmStatusDetailAction::loadStatusDetails::tempRequestType="+tempRequestType);
		logger.info("McmStatusDetailAction::loadStatusDetails::requestType="+requestType);
		logger.info("McmStatusDetailAction::loadStatusDetails::requestName="+requestName);
		logger.info("McmStatusDetailAction::loadStatusDetails::uploadRequestId="+uploadRequestId);

		McmStatusDetailContext statusDetailContext = new McmStatusDetailContext(requestType, requestName, uploadRequestId, status, orStatus, tempRequestType);//added orStatus Param - smerugol
	
		if (requestType != null	&& (requestType.equalsIgnoreCase(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID))) {
	    try{
		    	logger.info("Inside Try Block, Before call to DAO");
		new McmDAO().getSitesStat(statusDetailContext);
		    	logger.info("Inside Try Block, After call to DAO");
		    }catch(SQLException e){
		    	//logger.info("Inside Catch Block"+e);
		    	logger.error("McmStatusDetailAction : loadStatusDetails : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	}
		}
		
	request.getSession().setAttribute(MAT_CONTEXT, statusDetailContext);
	if (orStatus.equals("Y")) {
			logger.info("Inside orStatus Y, Before call to DAO");
	    HashMap hm = new McmDAO().getUserOverriddenData(uploadRequestId);
		    logger.info("Inside orStatus Y, After call to DAO");
	    request.setAttribute(MAT_OVERRIDES, hm);

	}
	gotoView(request, response);
    }

    /**
     * @param request
     * @param response
     */
    private void gotoView(HttpServletRequest request,HttpServletResponse response) {
    	
	String requestType = request.getParameter(REQUEST_TYPE);
	requestType = requestType.trim();
	HashMap hm = new HashMap();
	HttpSession session = request.getSession();
	
	MCMUserSession userSession = (MCMUserSession) session.getAttribute(MCMUserSession.USER_SESSION_KEY);
	if ((McmConstants.EXT_ROLES.contains(userSession.getUserRole().trim()))&&
			(!requestType.equalsIgnoreCase(McmConstants.MAT_DNR_CONTRACT_LVL))&& 
			(!requestType.equalsIgnoreCase(McmConstants.MAT_DNR_SITE_LVL))&& 
			(!requestType.equalsIgnoreCase(McmConstants.MAT_DNR_PRODUCT_LVL))
		&& (requestType.equals(McmConstants.MAT_MOVE_C2C_AT_CONTRACT)
		|| requestType.equals(McmConstants.MAT_MOVE_C2C_AT_PRODUCT)
		|| requestType.equals(McmConstants.MAT_MOVE_C2C_AT_SITE)
		|| requestType.equals(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE)
		|| requestType.equals(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT)
		||requestType.equals(McmConstants.MAT_MOVE_S2S_AT_PRODUCT)
		||	requestType.equals(McmConstants.MAT_MOVE_S2S_AT_SITE)
		// Added as a part Q2FY13 Rel
		|| requestType.equals(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID)
		|| requestType.equals(McmConstants.MAT_UE_MOVE_S2S_PRODUCT)))		
	{
		logger.info("Request Type : " +requestType);
		logger.info(" in gotoView method: user transaction not of DNR type");
		logger.info("goto view : User Role : " + userSession.getUserRole());
		logger.info("goto view : Request type : " + requestType);
		hm.put("O", "Output");
		
	}
	
	
	
	else if((McmConstants.DNR_ROLES.contains(userSession.getUserRole().trim()))
			&& (requestType.equalsIgnoreCase(McmConstants.MAT_DNR_CONTRACT_LVL)
			|| requestType.equalsIgnoreCase(McmConstants.MAT_DNR_SITE_LVL)
			|| requestType.equalsIgnoreCase(McmConstants.MAT_DNR_PRODUCT_LVL)))
	{
		logger.info("Request Type : " +requestType);
		logger.info("in else if : if Userrole is in DNR_ROLES : has to show error and results report" +requestType);
		
		hm.put("E", "Errors");
		hm.put("R", "Results");
		logger.info(" hm "+hm.values().size());
		
		
	}
	else if(!requestType.equalsIgnoreCase(McmConstants.MAT_BID_CHANGE))
	
	{	
		
		hm.put("E", "Errors");
		if (requestType.equals(McmConstants.MAT_MOVE_C2C_AT_CONTRACT)
			|| requestType.equals(McmConstants.MAT_MOVE_C2C_AT_PRODUCT)
			|| requestType.equals(McmConstants.MAT_MOVE_C2C_AT_SITE)
			|| requestType.equals(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE)
			|| requestType.equals(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT)) {
	
		    hm.put("G", "GU");
		}
	
			if (requestType.equalsIgnoreCase(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID)) {
		    hm.put("S", "Success");
		}
		// TD013
		if (requestType
			.equalsIgnoreCase(McmConstants.MCM_MAT_M_AND_P_ENTITLMNT)
			|| requestType.equalsIgnoreCase(McmConstants.M_AND_P_ENTITLMNT_ADD_PRODUCTS)    
				|| requestType.equalsIgnoreCase(McmConstants.MCM_MAT_ADD)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_MOVE_C2C_AT_SITE)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_MOVE_S2S_AT_PRODUCT)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_MOVE_S2S_AT_SITE)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_SERVICE_LEVEL_TERMINATION)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_C2C_SERVICE_LEVEL_MOVE)
				|| requestType.equalsIgnoreCase(McmConstants.DATE_CHANGE_PRODUCT_OR_LINE)  // Added as part of Q1FY13 TnC changes by VIBK
				//Start- Changes added by sphilipo for Q4FY13 Rel
				|| requestType.equalsIgnoreCase(McmConstants.MAT_DNR_CONTRACT_LVL)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_DNR_SITE_LVL)
				|| requestType.equalsIgnoreCase(McmConstants.MAT_DNR_PRODUCT_LVL)
				//End- Changes added by sphilipo for Q4FY13 Rel
				
				)
			
		
			     
		{
		    hm.put("R", "Results");
		}
		
		
		
	}
	//Start- Changes added by sarhv for Q1FY14 Rel
	
	if(requestType.equalsIgnoreCase(McmConstants.MAT_BID_CHANGE))
	{
		
		hm.put("R", "Results");
		logger.info("In if condition of bid change: and hm is "+hm.toString());
	}//End- Changes added by sarhv for Q1FY14 Rel
	
	//Start Changes for ADD_UPDATE_DEPLOY_DATABASE
	if(requestType.equalsIgnoreCase(McmConstants.MAT_AU_DEPLOYBASE))
	{
		hm.put("R","Results");
		hm.put("E","Errors");
		logger.info("In if condition for AU_DEPLOYBASE and hm is "+hm.toString());
	}
	//End-Changes for ADD_UPDATE_DEPLOY_DATABASE
	
	logger.info(" hm "+hm.values().size());
	
	
	request.getSession().setAttribute("repType", hm);
		McmStatusDetailContext statusDetailContext = (McmStatusDetailContext) request.getSession().getAttribute(MAT_CONTEXT);
		request.getSession().setAttribute(STATUS_DETAIL_CONTEXT,statusDetailContext);
    }

    /**
     * @param request
     * @param response
     * @throws SQLException
     * @throws Exception
     *  @see added this method to set all the parameters required to
     *      view request status page in request ~Archana 21-Nov-2007
     */
    private void setDetails(HttpServletRequest request,
	    HttpServletResponse response) throws SQLException, IllegalAccessException, InstantiationException {

	String requestId = request.getParameter(REQUEST_ID);
	String requestType = null;
	String requestName = null;
	String status = null;
	String orStatus = null;
	String failedRowCount = null;
	String[] returnValues = null;
	McmDAO mcmDAO = new McmDAO();
	try{
	    returnValues = mcmDAO.getRequestType(requestId);
	    
	}catch(SQLException e){ 
		//logger.error(e);  // original code
		logger.error("McmStatusDetailAction : setDetails : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	}
	

	requestType = returnValues[0];
	orStatus = returnValues[1];
	status = returnValues[2];
	failedRowCount = returnValues[3];
	requestName = returnValues[4];

	request.setAttribute("requestId", requestId);
	request.setAttribute(REQUEST_TYPE, requestType);
	request.setAttribute(REQUEST_NAME, requestType);
	request.setAttribute(STATUS, status);
	request.setAttribute(ORSTATUS, orStatus);
	request.setAttribute("failedRowCount", failedRowCount);
	request.getSession().setAttribute("reqnameinSD", requestName);

    }

    /**
     * @param session
     * @param request
     * @throws TabMenuException
     * @see Mass Mat integration start
     */
    public void setUpTabMenu(HttpSession session, HttpServletRequest request)
	    throws TabMenuException {
	String method = request.getParameter("method");
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
	StringBuffer massUrl = request.getRequestURL();
	String massURL = massUrl.substring(0, massUrl.lastIndexOf("/"));
	massURL = massURL + "/mcmindex.do";
	String requestUrl = massUrl.toString() + "?requestid="
		+ request.getParameter(REQUEST_ID);
	breadCrumbs.add(0, new com.cisco.crosstrack.menu.BreadCrumbs(
		"DashBoard", dashBoardURL));
	breadCrumbs.add(1, new com.cisco.crosstrack.menu.BreadCrumbs(
		"Mass Contract Management", massURL));

	if (method == null) {
	    breadCrumbs.add(2, new com.cisco.crosstrack.menu.BreadCrumbs(
		    "Request Status", "#"));
	} else {
	    breadCrumbs.add(2, new com.cisco.crosstrack.menu.BreadCrumbs(
		    "Request Status", requestUrl));
	    breadCrumbs.add(3, new com.cisco.crosstrack.menu.BreadCrumbs(
		    "Request Status Details", "#"));
	}
	try {
	    tabMenu.setBreadCrumbs(breadCrumbs);
	    tabMenu.setHeaderName("Mass Contract Management");
	    session.setAttribute("TabMenu", tabMenu);
	} catch (TabMenuException e2) {
	    throw e2;
	} catch (Exception e) {
	    throw new TabMenuException(e);
	}
    }

}
