/*
 * Created on Oct 22, 2004
 */
package com.cisco.servicesales.struts.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.ea.metrics.EAStrutsTilesMetricsCollector;
import com.cisco.servicesales.exception.BaseException;
import com.cisco.servicesales.session.MCMAccessManager;
import com.cisco.servicesales.session.MCMUserSession;
import com.cisco.servicesales.util.Constants;
import com.cisco.servicesales.util.StringUtil;
import org.apache.struts.tiles.TilesRequestProcessor;

/**
 * @author Amit Agarwal(amagarwa)
 * 
 * This class represents controller of struts. The method processPreprocess() always 
 * get executed for every HTTP request. Hence it is a good candidate to do any
 * security (authentication/authorization) check. SSF overrides this method to do
 * the authorization.
 * It extends <code>EAStrutsTilesMetricsCollector</code> to enable performance metrics.
 * To get the metrics, use the EA stats tool available at
 * http://wwwin-tools-dev.cisco.com/eastats/ (Dev)
 */
public class MCMRequestProcessor extends TilesRequestProcessor {
	
    /*
     * @see org.apache.struts.action.RequestProcessor#processPreprocess(javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */
	
	private static String APP_SHORT_NAME = "XXCSS_MAT";
	private static final String SESSION_SCHEMA_UTIL="xxccs_fea_utl_session";
	private static Logger logger = Logger.getLogger(MCMRequestProcessor.class);
   
    protected boolean processPreprocess(HttpServletRequest request,
            HttpServletResponse response) {

        //call EAStrutsTilesMetricsCollector.processPreprocess() method
        super.processPreprocess(request, response);
        
        String contextPath = request.getContextPath();
        String userPath=request.getRequestURI();
        logger.debug(userPath);
        HttpSession session = request.getSession();
        String username = request.getRemoteUser();
        

        //Get the UserSession object from the active session. 
        MCMUserSession userSession = MCMUserSession.getInstanceFromSession(session);
        

        if (userSession == null) {
        	try{
        	
        		if(session!=null && session.getAttribute("ROLES")==null)
            	{
        			userSession = new MCMUserSession(getOAS(request),username);
        			MCMAccessManager accessManager = userSession.getAccessManager();
                //final Map accessPrivileges = accessManager.getAccessPrivileges();
                final Map accessPrivileges = accessManager.getRole(getOAS(request),username);
                
                session.setAttribute("ROLES", accessPrivileges);
                session.setAttribute("MATUSER", "TRUE");
               }
        	
        	}catch (BaseException e) {
                logger.error(e.toString(),e);
                session.setAttribute(Constants.USER_NAME, username);
                if( StringUtil.isNullOrEmpty(e.getErrorCode()) ) {
                    session.setAttribute(Constants.ERROR_MESSAGE, "errors.invalidUser");
                } else {
                    session.setAttribute(Constants.ERROR_MESSAGE, e.getErrorCode());
                }

                try {
                	session.setAttribute("INVALIDUSER", "FALSE");
                    response.sendRedirect(contextPath + "/InvalidAccess.jsp");
                } catch (Exception ignore) {logger.error(ignore.toString(),ignore);}

                return false;
            }
        	}// end of if..
        
            session.setAttribute(Constants.USER_NAME, username);
            session.setAttribute("UserEmailId",userSession.getEmail());
           // session.setAttribute("UserEmailId",userSession.getUserEmail());
            session.setAttribute(MCMUserSession.USER_SESSION_KEY, userSession);
        

        return true;
    }
    
    
    public  OracleApplicationSession getOAS(HttpServletRequest request) 
	{

		HttpSession session = request.getSession();
    	OracleApplicationSession oas = (OracleApplicationSession)session.getAttribute("OAS");
    	if (oas == null)
    	{
    		setOAS(request);
    		oas = (OracleApplicationSession)session.getAttribute("OAS");
    	}
    	return oas;
	}
    
    
    public  void setOAS(HttpServletRequest request) 
	{
		HttpSession session = request.getSession();
		//User user = (User)session.getAttribute("User");
		String user = request.getRemoteUser();
		if (session.getAttribute("OAS") == null)
		{
			OracleApplicationSession oas = new OracleApplicationSession();
			
			oas.setUserName(user);
			oas.setApplicationShortName(APP_SHORT_NAME);
			oas.setSchemaPackage(SESSION_SCHEMA_UTIL);
			session.setAttribute("OAS",oas);
		}
	}
   

}