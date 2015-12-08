package com.cisco.servicesales.session;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.log4j.Logger;

import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.goldrush.access.UserAccessDAO;
import com.cisco.goldrush.access.UserAccessDAOAppException;
import com.cisco.goldrush.access.data.UserAccessData;
import com.cisco.mcm.dao.AccessManagementDAO;
import com.cisco.servicesales.exception.BaseRuntimeException;

/**
 * User: aygupta
 * Date: Oct 27, 2004
 * Time: 2:36:58 PM
 */
public class MCMAccessManager {
    private static final Logger log = Logger.getLogger(MCMAccessManager.class);
    private static final String FETCH_EMAiL_SQL = "select email from csa_user where cco_userid = ?";

    private String username;
    private String role;
    private int accessLevel;
    private boolean commerceAccess;
    private String email;

    private Map accessPrivileges;
    private static final String EQUALS = " = ";
    private static final String CRLF = "\r\n";
    AccessManagementDAO access = new AccessManagementDAO();

    public MCMAccessManager(String username) {
	this.username = username;

	try {

	    if (System.getProperty("application.environment") == null) {
		System.setProperty("application.environment", "local");
	    }

	}

	/* 
	Start : Commented code 
	Reason : Avoid Catching NPE
	Commented by : Ajay Malekar(amalekar)
	Release name : Q2FY15
	*/
	
	/*catch (NullPointerException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	}*/
	
	// End : Commented code
	
	
	/* 
	Start : New code added 
	Reason : To fix CI issue , Avoid Catching NPE
	Commented by : Ajay Malekar(amalekar)
	Release name : Q2FY15
	*/

	catch (Exception e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	}
	
	// End : New code added
	
    }

    public HashMap getRole(OracleApplicationSession oas, String userid) {

	try {
	    return AccessManagementDAO.getFunctionList(userid, oas);

	} catch (IllegalAccessException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	} catch (InstantiationException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	} catch (SQLException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	}

    }

    public HashMap getUserAttributes(OracleApplicationSession oas, String userid) {

	try {
	    return AccessManagementDAO.getUserData(userid, oas);

	} catch (IllegalAccessException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	} catch (InstantiationException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	} catch (SQLException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	}

    }

    public String getUserAttributes1(OracleApplicationSession oas, String userid) {

	try {
	    return AccessManagementDAO.getUserData1(userid, oas);

	} catch (IllegalAccessException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	} catch (InstantiationException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	} catch (SQLException e) {
	    log.error(e.toString(), e);
	    throw new BaseRuntimeException(
		    "Could not load authorization for user " + username);
	}

    }

    public Map getAccessPrivileges() {
	return accessPrivileges;
    }

    public String getUsername() {
	return username;
    }

    public String getRole() {
	return role;
    }
    
    public void setRole(String role) {
    	this.role= role;
     }

    public void setEmail(String email) {
    	this.email= email;
     }
    
    public void setAccessPrivileges(Map accessPrivileges) {
    	this.accessPrivileges= accessPrivileges;
     }
    
    public int getAccessLevel() {
	return accessLevel;
    }

    public String getAccessLevelAsString() {
	return String.valueOf(accessLevel);
    }

    public boolean isCommerceAccess() {
	return commerceAccess;
    }

    public String getEmail() {
	return email;
    }

    public String getAccessType(final String functionName) {
	try {
	    UserAccessData uad = UserAccessDAO
	    .getAccess(username, functionName);
	    return uad.getAccessType();
	} catch (UserAccessDAOAppException e) {
	    log.error(e.toString(), e);
	    log.error("Could not determine Access Mgmt on " + functionName
		    + " for " + username + " : " + e.getMessage());
	}

	return null;
    }

    public boolean hasPrivilege(final String functionName) {
	if (!commerceAccess) {
	    return false;
	}

	try {
	    if (accessPrivileges.containsKey(functionName))

		return ((Boolean) accessPrivileges.get(functionName))
		.booleanValue();
	} 
	
	/* 
	Start : Commented code 
	Reason : Avoid Catching NPE
	Commented by : Ajay Malekar(amalekar)
	Release name : Q2FY15
	*/
	
	/*catch (NullPointerException e) {
	    log.error("Could not load privilege for " + functionName);
	    log.error(e.toString(), e);
	}*/
	
	// End : Commented code
	
	/* 
	Start : New code added 
	Reason : To fix CI issue , Avoid Catching NPE
	Commented by : Ajay Malekar(amalekar)
	Release name : Q2FY15
	*/

	catch (Exception e) {
	    log.error("Could not load privilege for " + functionName);
	    log.error(e.toString(), e);
	}
	
	// End : New code added

	
	
	return false;
    }

   

}
