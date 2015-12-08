/*
 * Created on Dec 2, 2005
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

import com.cisco.mcm.bo.McmListControllerBO;
import com.cisco.mcm.bo.McmUploadSummaryContext;
import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.session.MCMUserSession;

/**
 * @author kiguntup
 * 
 */
public class McmViewRequestAction extends McmBaseAction {
    protected static final int DEFAULT_ITEMS_PER_PAGE = 25;
   
    private static final String REQUEST_NUMBER = "upldRequestId";
    private static final String columnDisplayOrder[] = { "requestDate",
	    REQUEST_NUMBER, "requestName", "upldDefinitionDesc",
	    "bizLatestStatus" };
   
    private static final String CONTEXT_KEY = "statusSummaryContext";
    private static final String EVENT = "event";
    private static final String CHANGE_USER_EVENT = "changeuser";
    private static final String CHANGE_USER_TO_PARAM = "new_user";

    public static final String MAT_UPLD_STATUS_SUMMARY_SCREEN = "UploadStatusSummaryScreen";
    
    private static Logger logger = Logger.getLogger(McmViewRequestAction.class); // added by amalekar as part of Q1FY15 , in order to fix critical issue.

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
	    boolean privilage = hasPrivileges(request,
		    McmConstants.MASS_MAT_REQ_STATS_REQS);
	    if (!privilage) {
		return throwUnAuthorizeAccess(mapping, request, response);
	    }
	    HttpSession session = request.getSession();
	    MCMUserSession userSession = (MCMUserSession) session
		    .getAttribute(MCMUserSession.USER_SESSION_KEY);
	    // doTest();
	    request.setAttribute("email", userSession.getEmail());
	    doPerform(request, response, userSession);
	} catch (IllegalAccessException e) {
		//e.printStackTrace(); // original code
		logger.error(" McmViewRequestAction : execute : IllegalAccessException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	    return handleException(mapping, request, response, e);
	}catch(Exception e){
		logger.error("McmViewRequestAction : execute : Exception : " , e);
	}
	
	/*catch (Throwable t)// commented to fix blokcer issue added by amalekar as part of Q1FY15
	{
		t.printStackTrace();
	}*/

	return mapping.findForward("success");
    }

    public void soln(String str) {

    }

     /*
     * testing the list framework
     * 
     */

    /*
     * public void doTest() throws Exception { soln(">>>>>>>>>>>>>>>>>>>here
     * 2>>>>>>>"); // ListConfiguration.get("upload.summary");
     * soln(">>>>>>>>>>>>>>>>>>>here 2xxx >>>>>>>"); final EnhancedList
     * enhancedList = ListFactory.getList("upload.summary", "ssr8_user");
     * 
     * soln(">>>>>>>>>>>>>>>>>>>here 2..1>>>>>>>"); final List list =
     * enhancedList.getObjects(0, enhancedList.getSize());
     * soln(">>>>>>>>>>>>>>>>>>>here 2.2>>>>>>"); // TestDrive.dumpBean(list); //
     * TestDrive.dumpMap(list); soln(">>>>>>>>>>>>>>>>>>>here 3>>>>>>>"); final
     * List displayColumns = enhancedList.getVisibleColumns(); // final List
     * filterColumns = enhancedList.getVisibleColumns();
     * 
     * for (int i = 0; i < list.size(); i++) { Map aRow = (Map) list.get(i);
     * 
     * for (int j = 0; j < displayColumns.size(); j++) { Column displayColumn =
     * (Column) displayColumns.get(j);
     *  } }
     *  // for (int i = 0; i < list.size(); i++) { // TerminateBean
     * terminateBean = (TerminateBean) list.get(i); // terminateBean. // }
     * soln(">>>>>>>>>>>>>>>>>>>here 4>>>>>>>"); }
     */
    /**
     * 
     * @param runData
     * @param context
     * @throws Exception
     */

    public void doPerform(HttpServletRequest request,
	    HttpServletResponse response, MCMUserSession usersession)
	    throws Exception {
	// final ParameterParser parameterParser = runData.getParameters();
	final String event = request.getParameter(EVENT);
	if (CHANGE_USER_EVENT.equalsIgnoreCase(event)) {

	    loadStatusSummary(request, response, request
		    .getParameter(CHANGE_USER_TO_PARAM), usersession);
	}

	McmUploadSummaryContext uploadStatusSummaryContext = (McmUploadSummaryContext) request
		.getSession().getAttribute(CONTEXT_KEY);
	if (uploadStatusSummaryContext == null) {
	    loadStatusSummary(request, response, usersession.getUsername(),
		    usersession);
	    uploadStatusSummaryContext = (McmUploadSummaryContext) request
		    .getSession().getAttribute(CONTEXT_KEY);
	}

	final McmListControllerBO listController = uploadStatusSummaryContext
		.getListController();
	final boolean atleastOneListEventsProcessed = listController
		.processListEvents(request);
	soln("atleastOneListEventsProcessed = " + atleastOneListEventsProcessed);

	gotoView(request, response);

    }

    /**
     * @param request
     * @param response
     * @param username
     * @param usersession
     */
    private void loadStatusSummary(HttpServletRequest request,
	    HttpServletResponse response, String username,
	    MCMUserSession usersession) {
	boolean viewAll = false;
	if (isNullOrEmpty(username)
		|| username.equalsIgnoreCase(usersession.getUsername())) {
	    username = usersession.getUsername();
	    viewAll = true;
	}

	final McmUploadSummaryContext uploadStatusSummaryContext = new McmUploadSummaryContext(username, viewAll);

	//List headercolumns = uploadStatusSummaryContext.getDisplayColumns();
	//for (int i = 0; i < headercolumns.size(); i++) {
	  // Column col = (Column) headercolumns.get(i);
	   

	//}

	request.getSession().setAttribute(CONTEXT_KEY,uploadStatusSummaryContext);

	gotoView(request, response);
    }

    /**
     * @param request
     * @param response
     */
    private void gotoView(HttpServletRequest request,
	    HttpServletResponse response) {
	final McmUploadSummaryContext uploadStatusSummaryContext = (McmUploadSummaryContext) request
		.getSession().getAttribute(CONTEXT_KEY);
	request.getSession().setAttribute(CONTEXT_KEY,
		uploadStatusSummaryContext);
    }

    /**
     * @param aString
     * @return
     */
    public static boolean isNullOrEmpty(String aString) {
	if (aString == null)
	    return true;

	if (aString.trim().equals(""))
	    return true;

	return false;
    }

}
