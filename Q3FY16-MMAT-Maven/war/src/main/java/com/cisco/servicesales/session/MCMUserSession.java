/*
 * Created on Sep 8, 2004
 *
 */
package com.cisco.servicesales.session;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.servicesales.exception.BaseException;



/**
 * @author Amit Agarwal(amagarwa)
 */
public class MCMUserSession implements Serializable {
    private String userId = null;
    private String userRole =null;
    private static Logger logger = Logger.getLogger(MCMUserSession.class);

    public static final String USER_SESSION_KEY = "_SESSIONOBJ_";

    private Locale locale;
    private MCMAccessManager accessManager;

    //private UserPreference _userPreference;
    private HashMap userAttributes;
    
    /**
     * @param user
     */
    public MCMUserSession(OracleApplicationSession oas,String user) throws BaseException {
        this.userId = user;
        this.accessManager = new MCMAccessManager(user);
        userAttributes=accessManager.getUserAttributes(oas, user);
        logger.debug("before getting usr role:");
        userRole=accessManager.getUserAttributes1(oas, user);
        logger.debug("after getting usr role:");

        

        logger.debug("ACCESS MANAGER:" + accessManager.getAccessLevel());
    }

    public MCMAccessManager getAccessManager() {
        return accessManager;
    }

    /**
     * @return Returns the userId.
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId The userId to set.
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getUsername() {
        return (String)userAttributes.get("cn");
        //TODO: use ldap to return the full name of the user
    }


    public String getLocale() {
        return (String)userAttributes.get("language");
    }
    
    public String getJobRole() {
        return (String)userAttributes.get("jobRole");
    }
    
    public String getAccessLevel() {
        return (String)userAttributes.get("accessLevel");
    }

    public String getEmail() {
        return (String)userAttributes.get("mail");
    }
    public String getUserRole() {
        return userRole;
    }
    
    public String getUniversalId() {
    	if(userAttributes==null)
    	{
    	  return "0";
    	}
    	else
    	{
    		String universalId = (String)userAttributes.get("universalId");
    		if( universalId!=null && universalId.trim().length()>0)
    		{
    			return universalId;
    		}
    		else
    		{
    		return "0";
    		}
    	}
    	
    }


    public static MCMUserSession getInstanceFromSession(HttpSession session_) {
        return (MCMUserSession) session_.getAttribute(USER_SESSION_KEY);
    }

    public void setLocale(Locale locale_) {
        this.locale = locale_;
    }

    public static void main(String[] args) {
       // MCMUserSession user;
    }

    private static final int ROW_COUNT_5 = 100100;
    private static final int ROW_COUNT_10 = 100101;
    private static final int ROW_COUNT_15 = 100102;
    private static final int ROW_COUNT_20 = 100103;
    private static final int ROW_COUNT_25 = 100104;
    private static final int ROW_COUNT_30 = 100105;
    private static final int ROW_COUNT_35 = 100106;
    private static final int ROW_COUNT_40 = 100107;
    private static final int ROW_COUNT_45 = 100108;
    private static final int ROW_COUNT_50 = 100109;
    private static final int ROW_COUNT_55 = 100110;
    private static final int ROW_COUNT_60 = 100111;
    private static final int ROW_COUNT_65 = 100112;
    private static final int ROW_COUNT_70 = 100113;
    private static final int ROW_COUNT_75 = 100114;
    private static final int ROW_COUNT_80 = 100115;
    private static final int ROW_COUNT_85 = 100116;
    private static final int ROW_COUNT_90 = 100117;
    private static final int ROW_COUNT_95 = 100118;
    private static final int ROW_COUNT_100 = 100119;

    private static final int DEFAULT_ROWS_COUNT = 25;

    
}
