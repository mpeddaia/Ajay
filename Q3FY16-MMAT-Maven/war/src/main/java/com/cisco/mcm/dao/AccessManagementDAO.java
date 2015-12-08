package com.cisco.mcm.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.mcm.genJava.XxccsCaamApplPub;
import com.cisco.mcm.genJava.XxccsCaamFuncaccessObjType;
import com.cisco.mcm.genJava.XxccsCaamUserAttrObjType;
import com.cisco.servicesales.mcm.utils.MCMDataUtil;


/**
 * @author kiguntup
 *
 */
public class AccessManagementDAO {

    private static final String APP_NAME = "XXCSS_MAT";
    private static DAOServices ds;
    private static Logger logger = Logger.getLogger(AccessManagementDAO.class);

    /**
     * 
     * @param userId
     * @param oas
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws SQLException
     */

    public static HashMap getFunctionList(String userId,
	    OracleApplicationSession oas) throws InstantiationException,
	    IllegalAccessException, SQLException {
	ds = MCMDataUtil.getServices(oas, "APP");
	logger.info("Inside the access management DAO getFunctionList method");

	XxccsCaamFuncaccessObjType xxccsCaamFuncaccessObj = XxccsCaamFuncaccessObjType.newInstance();
	XxccsCaamApplPub xxccsCaamApplPub = XxccsCaamApplPub.getInstance();
	List[] userRolesList = new List[1];
	HashMap functionAccessMap = new HashMap();
		xxccsCaamApplPub.getUserAttributes(ds, userId,userRolesList);
		xxccsCaamApplPub.getAllaccessAllresp(ds,userId,"",APP_NAME,null,userRolesList);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@ Got the User Role List @@@@@@@ "+userRolesList[0]);
	if (userRolesList[0] != null && !userRolesList[0].isEmpty()) {
	    Iterator iterator = userRolesList[0].iterator();
	    while (iterator.hasNext()) {
		xxccsCaamFuncaccessObj = (XxccsCaamFuncaccessObjType) iterator.next();
		if (xxccsCaamFuncaccessObj != null) {
		    functionAccessMap.put(xxccsCaamFuncaccessObj.getFunctionValue(), xxccsCaamFuncaccessObj.getFunctionType());
		    logger.info(xxccsCaamFuncaccessObj.getFunctionValue() + "\t"
			    + xxccsCaamFuncaccessObj.getFunctionType());
		}
	    }

	}
	logger
		.info("returning from Access Management DAO getFunctionList method "
			+ functionAccessMap);
	return functionAccessMap;
    }

    /**
     * @param userId
     * @param oas
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws SQLException
     */
    public static HashMap getUserData(String userId,
	    OracleApplicationSession oas) throws InstantiationException,
	    IllegalAccessException, SQLException {
	ds = MCMDataUtil.getServices(oas, "APP");
	logger.info("Inside the access management DAO getUserData method");
	XxccsCaamUserAttrObjType xxcssAmUserAttribObj = XxccsCaamUserAttrObjType.newInstance();
	XxccsCaamApplPub xxccsCaamApplPub = XxccsCaamApplPub.getInstance();
	List[] userAttributeList = new ArrayList[1];
	HashMap attributesMap = new HashMap();
	logger.info(" Before calling getuserattributes in Access Management DAO");
	xxccsCaamApplPub.getUserAttributes(ds, userId,userAttributeList);
	logger.info("userId " + userId);
	logger.info("***************** userAttributeList ********** " + userAttributeList[0]);
	if (userAttributeList[0] != null && !userAttributeList[0].isEmpty()) {
	    Iterator iterator = userAttributeList[0].iterator();
	    while (iterator.hasNext()) {
		xxcssAmUserAttribObj = (XxccsCaamUserAttrObjType) iterator.next();
		logger.info(xxcssAmUserAttribObj.getAttribute() + "=="
			+ xxcssAmUserAttribObj.getAttributeValue());
		attributesMap.put(xxcssAmUserAttribObj.getAttribute(),
			xxcssAmUserAttribObj.getAttributeValue());

	    }

	}
	logger.info("returning from Access Management DAO getUserData method "
		+ attributesMap);
	return attributesMap;

    }

    /**
     * @param userId
     * @param oas
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws SQLException
     */
    public static String getUserData1(String userId,
	    OracleApplicationSession oas) throws InstantiationException,
	    IllegalAccessException, SQLException {
	logger.info("Inside the access management DAO getUserData1 method");
	ds = MCMDataUtil.getServices(oas, "APP");
	String userRole = null;
	XxccsCaamFuncaccessObjType xxccsCaamFuncaccessObj = XxccsCaamFuncaccessObjType.newInstance();
	XxccsCaamApplPub xxccsCaamApplPub = XxccsCaamApplPub.getInstance();
	List[] roleTable = new ArrayList[1];
	logger.info("before calling the getallroles method");
	logger.info("userId " + userId);
	xxccsCaamApplPub.getAllRoles(ds, userId, roleTable);
	if (roleTable[0] != null && !roleTable[0].isEmpty()) {
	    Iterator iterator = roleTable[0].iterator();
	    while (iterator.hasNext()) {
		xxccsCaamFuncaccessObj = (XxccsCaamFuncaccessObjType) iterator.next();
		logger.info("getting primary role");
		if (xxccsCaamFuncaccessObj != null) {
		    logger.info(xxccsCaamFuncaccessObj.getPrimaryResponsibility()
			    + "=232322323="
			    + xxccsCaamFuncaccessObj.getResponsibility());
		    if (xxccsCaamFuncaccessObj.getPrimaryResponsibility().equals(
			    "Y")) {
			userRole = xxccsCaamFuncaccessObj.getResponsibility();
			logger.info("got primary role"+userRole);
			return userRole;

		    }
		}
	    }

	}
	logger.info("got1 primary role");
	logger.info("returning from Access Management DAO getUserData1 method "
		+ userRole);
	return userRole;

    }

}
