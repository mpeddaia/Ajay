package com.cisco.mcm.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import oracle.jdbc.driver.OracleTypes;

import org.apache.log4j.Logger;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.ea.dbpool.EACallableStatementFacade;
import com.cisco.ea.dbpool.EASmartDbPoolManager;
import com.cisco.mcm.bean.McmOverridesBean;
import com.cisco.mcm.bo.McmReportContext;
import com.cisco.mcm.bo.McmStatusDetailContext;
import com.cisco.mcm.dao.oracletypes.OraErrorObj;
import com.cisco.mcm.dao.oracletypes.OraMatReportParamsTbl;
import com.cisco.mcm.dto.McmOverrideDTO;
import com.cisco.mcm.genJava.XxcssCtReqDetailsObjType;
import com.cisco.mcm.genJava.XxcssCtRequestStatus;
import com.cisco.mcm.genJava.XxcssMatCmRpSubmit;
import com.cisco.mcm.genJava.XxcssMatResultsDownload;
import com.cisco.mcm.genJava.XxcssMatSrCrSites;
import com.cisco.mcm.genJava.XxcssMatUtils;
import com.cisco.mcm.genJava.XxcssPsPkg;
import com.cisco.mcm.genJava.XxcssPsValOverideType;
import com.cisco.mcm.genJava.XxcssScmGenericUtils;
import com.cisco.mcm.genJava.XxcssScmValOverideType;
import com.cisco.mcm.util.McmConstants;
import com.cisco.servicesales.db.ConnectionBroker;
import com.cisco.servicesales.mcm.utils.MCMDataUtil;
import com.cisco.mcm.genJava.XxcssScmRepreqSubmitPkg;
/**
 * @author kiguntup
 * 
 */
public class McmDAO implements ConnectionBroker {

    private static final String SOURCE_SYSTEM = "XXCSS_MAT";
   // private static final String CONNECTION_POOL_NAME = "APP";
    private static Logger logger = Logger.getLogger(McmDAO.class);
    //private final EASmartDbPoolManager eaSmartDbPoolManager = new EASmartDbPoolManager();
    private static DAOServices ds;

    /**
     * @param requestNumber
     * @param ccoUserId
     * @param email
     * @param download_type
     * @throws SQLException
     * @throws Exception
     */
    public void sendEmail(int requestNumber, String ccoUserId, String email,
	    String download_type) throws InstantiationException, SQLException,
	    IllegalAccessException {

	logger.info("Inside the sendEmail Method of MCM DAO");
	XxcssMatResultsDownload matResultsDownload = XxcssMatResultsDownload
		.getInstance();
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("XXCSS_MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName(ccoUserId);
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	String[] filename = new String[1];
	String[] errorObj = new String[1];
	logger.info(" In MCMDAO sendEmail () Method ");
	try {

	    logger.info("Before calling the spDownloadresultsmethod from DAO");
	    
	    //added input params to logger info- smerugol
	    logger.info("Input Params########");
	    logger.info("requestNumber 	:: "+requestNumber+"\n"+
	    			"ccoUserId		:: "+ccoUserId+"\n"+
	    			"email			:: "+email+"\n"+
	    			"download_type	:: "+download_type+"\n");
	    
	    matResultsDownload.spDownloadresults(ds, requestNumber, ccoUserId,
		    email, download_type, filename, errorObj, "2");
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}

	logger.info("Exiting the sendEmail Method of MCM DAO");
    }

    /**
     * This method gets the qualified overrides from the back end for the user
     * 
     * @param userName
     * @return
     * @throws SQLException
     * @throws Exception
     */
    public HashMap getOverrides(String userName) throws InstantiationException,
	    SQLException, IllegalAccessException {

	logger.info("Inside the getOverrides Method ");
	logger.info("Input Parameter : +userName" + userName);
	HashMap overRideMap = null;
	XxcssMatUtils matUtils = XxcssMatUtils.getInstance();
	logger.info("MatUtils get Instance completed");
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("XXCSS_MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName(userName);
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	//ds = MCMDataUtil.getServices(oas, "APP");
	logger.info("Getting DAO Services");
	ds = MCMDataUtil.getServices(oas, "APP");
	logger.info("Got DAO Services");
	String[] returnStatus = new String[1];
	String[] errorMsg = new String[1];
	logger
		.debug("@@@@@@@@@ In Mcm DAO getOverrides Methods @@@@@@@@@@@@@@@@@@@ ");

	try {
	    logger
		    .info("### Before Calling the getOverridableBizvals Method ###### --------- ");
	    overRideMap = matUtils.getOverridableBizvals(ds, SOURCE_SYSTEM,
		    userName, returnStatus, errorMsg);
	    logger.info("overRideMap " + overRideMap);
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	logger.info("Exiting the getOverrides Method " + overRideMap);
	return overRideMap;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.cisco.servicesales.db.ConnectionBroker#getConnection()
     */
   
    public Connection getConnection() throws SQLException {
    	//	      
    	
    	//return eaSmartDbPoolManager.borrowConnection(CONNECTION_POOL_NAME);
    	return ds.borrowConnection();
        	
       
        }
        
        
        /*
         * (non-Javadoc)
         * 
         * @see com.cisco.servicesales.db.ConnectionBroker#releaseConnection(java.sql.Connection)
         */
        public void releaseConnection(Connection connection) throws SQLException {
    	//	       
    	//eaSmartDbPoolManager.returnToPool(connection);
    	ds.returnConnection(connection);
        	
        }
    /**
     * @param requestID
     * @return
     * @throws SQLException
     * @throws Exception
     */
    public HashMap getUserOverriddenData(int requestID)
	    throws InstantiationException, SQLException, IllegalAccessException {

	logger.info("Inside the getUserOverriddenData Method in MCM DAO ");
	logger.info("requestID :" + requestID);
	HashMap overRiddenMap = null;
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("Mass MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName("debadas");
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	String[] errormsg = new String[1];
	String[] approver = new String[1];
	String[] custName = new String[1];
	String[] reasonCode = new String[1];
	String[] initiator = new String[1];
	String[] returnStatus = new String[1];

	try {

	    logger.debug("requestID :" + requestID);
	    
		/* 
		Start : Commented code 
		Reason : Correctness - Invocation of toString on an array
		Commented by : Ajay Malekar(amalekar)
		Release name : Q2FY15
		*/

	    /*logger.debug("approver :" + approver);
	    logger.debug("custName :" + custName);
	    logger.debug("reasonCode :" + reasonCode);*/
	    
	    // End : Commented code
	    
	    /* 
	    Start : New code added 
	    Reason : Correctness - Invocation of toString on an array
	    Commented by : Ajay Malekar(amalekar)
	    Release name : Q2FY15
	    */

	    logger.debug("approver :" + Arrays.toString(approver));
	    logger.debug("custName :" + Arrays.toString(custName));
	    logger.debug("reasonCode :" + Arrays.toString(reasonCode));
	    
	    // End : New code added
	    
	    
	    
	    XxcssMatUtils xxcssMatUtils = XxcssMatUtils.getInstance();
	    overRiddenMap = xxcssMatUtils.uiOverrideDataVal(ds, errormsg,requestID, approver, custName, reasonCode, initiator,returnStatus);
	    	    
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	logger.info("Exiting the getUserOverriddenData Method in MCM DAO "
		+ overRiddenMap);
	return overRiddenMap;

    }
    
    /**
     * @param matReportContext
     * @throws SQLException
     * @throws Exception
     */
    public void createAuditReport(McmReportContext matReportContext)
	    throws InstantiationException, SQLException, IllegalAccessException {

	logger.info("Inside the createReport Method in MCM DAO ");
	BigDecimal requestID = null;
	//XxcssMatCmRpSubmit cmRpSubmit = XxcssMatCmRpSubmit.getInstance();
	
	XxcssScmRepreqSubmitPkg scmRpSubmit = XxcssScmRepreqSubmitPkg.getInstance();
	
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("Mass MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName(matReportContext.getLoggedInUserCCOUserID());
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	//String[] number = null;
	String[] errorMsg = new String[1];
	BigDecimal i[] = new BigDecimal[2];

	try {

	    logger.debug("ds --- " + ds);
	    logger.debug("matReportContext.getLoggedInUserCCOUserID()  : "
		    + matReportContext.getLoggedInUserCCOUserID());
	    logger.debug("matReportContext.getReportType()   :  "
		    + matReportContext.getReportType());
	    logger.debug("matReportContext.getLoggedInUserEmail()   :  "
		    + matReportContext.getLoggedInUserEmail());
	    
	    

	    // logger.debug("(List)matReportContext.getReportParams()"+(List)matReportContext.getReportParams());

	    scmRpSubmit.submitprogramrequest(ds, matReportContext.getLoggedInUserCCOUserID(), matReportContext.getReportType(), matReportContext.getLoggedInUserEmail(),
			     null, null, (OraMatReportParamsTbl) matReportContext
			 .getReportParams(), requestID, i,errorMsg, "2");
	    
	    if(i[0]!=null)
        	matReportContext.setRequestID(i[0].intValue());
	    
	    
	}  catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	    
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	
	catch (Exception e) {
	    logger.error(e.toString(), e);
	    
	}
	
	logger.info("Exiting the createReport Method in MCM DAO ");
    }
    
    
    

    /**
     * @param matReportContext
     * @throws SQLException
     * @throws Exception
     */
    public void createReport(McmReportContext matReportContext)
	    throws InstantiationException, SQLException, IllegalAccessException {

	logger.info("Inside the createReport Method in MCM DAO ");
	BigDecimal requestID = null;
	XxcssMatCmRpSubmit cmRpSubmit = XxcssMatCmRpSubmit.getInstance();
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("Mass MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName(matReportContext.getLoggedInUserCCOUserID());
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	String[] number = null;
	BigDecimal i[] = new BigDecimal[2];

	try {

	    logger.debug("ds --- " + ds);
	    logger.debug("matReportContext.getLoggedInUserCCOUserID()  : "
		    + matReportContext.getLoggedInUserCCOUserID());
	    logger.debug("matReportContext.getReportType()   :  "
		    + matReportContext.getReportType());
	    logger.debug("matReportContext.getLoggedInUserEmail()   :  "
		    + matReportContext.getLoggedInUserEmail());

	    // logger.debug("(List)matReportContext.getReportParams()"+(List)matReportContext.getReportParams());

	    cmRpSubmit.submitprogramrequest(ds, matReportContext
		    .getLoggedInUserCCOUserID(), matReportContext
		    .getReportType(), matReportContext.getLoggedInUserEmail(),
		    " null", "null", (OraMatReportParamsTbl) matReportContext
			    .getReportParams(), requestID, i, number, "2",
		    matReportContext);
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	logger.info("Exiting the createReport Method in MCM DAO ");
    }

    /**
     * This method returns the # of line submitted and # of sites created or
     * searched
     * 
     * @param matStatusDetail
     * @throws SQLException
     * @throws Exception
     */
    public void getSitesStat(McmStatusDetailContext matStatusDetail)
	    throws InstantiationException, SQLException, IllegalAccessException {
	logger.info("Inside the getSitesStat Method in MCM DAO ");
	XxcssMatSrCrSites matSrCrSites = XxcssMatSrCrSites.getInstance();
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("XXCSS_MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName("");
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	try {
	    matSrCrSites.srCrSitesDownloadHdrInfo(ds, matStatusDetail);
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	logger.info("Exiting the getSitesStat Method in MCM DAO ");
    }

    /**
     * @param email
     * @param userId
     * @param reqType
     * @return
     * @throws SQLException
     * @throws Exception
     */
    public String createRequestIdForReports(String email, String userId,
	    String reqType) throws InstantiationException, SQLException,
	    IllegalAccessException {

	logger.info("Inside the createRequestIdForReports Method in MCM DAO ");
	int processRequestId = 0;
	String definitionName = null;
	String emailFlag = null;
	String requestName = null;
	Connection conn = null;
	EACallableStatementFacade ocst = null;
	Statement statement = null;
	ResultSet rs = null;
	OraErrorObj errorObj = null;

	try {

	    try{
	    conn = this.getConnection();

	    if (conn == null) {
		throw new NullPointerException("Connection is not available ");
	    }

	    String query = "SELECT PROCESS_DEFINITION_NAME,EMAIL_FLAG,REQUEST_NAME FROM XXCSS_SSF_CM_PROCESS_DEFNS WHERE PROCESS_DEFINITION_NAME = '"+ reqType + "'";

	   
	    statement = conn.createStatement();

	    rs = statement.executeQuery(query);

	    while (rs.next()) {

		definitionName = rs.getString(1);

		emailFlag = rs.getString(2);
		requestName = rs.getString(3);
	    }
	    }finally{
		try{
		    rs.close();
		    statement.close();
		    conn.close();
		}catch(SQLException e){
		    //logger.error(e); //original code
			logger.error("MCMDAO : createRequestIdForReports : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
	    }

	    try{
		conn = this.getConnection();
		 
	    if (definitionName != null) {
		String procedure = "{call  xxcss_ssf_offline_frmk.create_process_request (?,?,?,?,?,?)}";
		ocst = ((EACallableStatementFacade) conn.prepareCall(procedure));
		ocst.setString(1, definitionName);
		ocst.setString(2, requestName);
		ocst.setString(3, userId);
		ocst.setString(4, email);
		ocst.setString(5, emailFlag);
		ocst.registerOutParameter(6, OracleTypes.VARCHAR); // returned
		// request
		// ID
		ocst.execute();
		processRequestId = ocst.getInt(6);
	    }

	    if (errorObj != null && errorObj.getPErrCode() != null
		    && errorObj.getPErrCode().intValue() != 0) {

		logger.debug(errorObj.getPErrType() + " : "
			+ errorObj.getPErrMsg() + " : "
			+ errorObj.getPErrCode().intValue());

	    }
	    }catch(SQLException e){
	    	logger.error("MCMDAO : createRequestIdForReports : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	    }finally{
		try{
		    ocst.close();
		    conn.close();
		}catch(SQLException e){
		    //logger.error(e); //original code
			logger.error("MCMDAO : createRequestIdForReports : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
		
	    }

	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} finally {
	    try {
		rs.close();
		statement.close();
		ocst.close();
		conn.close();
	    } catch (SQLException e) {
		logger.error(e.toString(), e);
	    }
	}

	logger.info("Exiting the createRequestIdForReports Method in MCM DAO ");
	return Integer.toString(processRequestId);
    }

    /**
     * @param services
     * @param reqDetailsObj
     * @param userId
     * @throws SQLException
     * @throws Exception
     */
    public void updateRequestDetailsInCT(DAOServices services,
	    XxcssCtReqDetailsObjType reqDetailsObj, String userId)
	    throws InstantiationException, SQLException, IllegalAccessException {
	logger.info("Inside the updateRequestDetailsInCT Method in MCM DAO ");
	XxcssCtRequestStatus ctRequestStatus = XxcssCtRequestStatus
		.getInstance();
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("XXCSS_MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName(userId);
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	BigDecimal[] requestDetailsId = new BigDecimal[1];
	com.cisco.mcm.genJava.XxcssIlErrorMessageObj[] errorMessage = new com.cisco.mcm.genJava.XxcssIlErrorMessageObj[1];
	try {

	    logger
		    .debug("Calling the insertRequestdetails Method from MCMDAO &&&&&&&"
			    + reqDetailsObj);
	    ctRequestStatus.insertRequestdetails(ds, reqDetailsObj,
		    requestDetailsId, errorMessage);
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
    }

    /**
     * @param requestId
     * @return
     * @throws SQLException
     * @throws Exception
     */
    public String[] getRequestType(String requestId)
	    throws InstantiationException, SQLException, IllegalAccessException {

	logger.info("Inside the getRequestType Method in MCM DAO " + requestId);
	Connection conn = null;
	String[] returnValues = new String[6];
	Statement statement = null;
	ResultSet rs = null;
	try {
	    conn = this.getConnection();
	    if (conn == null) {
		throw new NullPointerException("Connection is not available ");
	    }
	    
	    String query = "SELECT d.upld_definition_name Request_Type_Name,r.upld_request_id Upload_Request_ID,r.biz_latest_status Latest_Status, r.ROW_CNT_FAILED Row_Cnt_Failed ,s.parm_value ";
	    // Commented by Kiran for Q3FY09
	    /*
	     * query = query + "FROM apps.xx_cm_upld_definitions
	     * d,apps.xx_cm_upld_requests r,apps.xx_cm_upld_requests_parms s
	     * WHERE r.UPLD_REQUEST_ID =" + requestId;
	     */
	    query = query
		    + "FROM apps.XXCSS_SSF_UPLD_DEFINITIONS d,apps.XXCSS_SSF_UPLD_REQUESTS r,apps.XXCSS_SSF_UPLD_REQUESTS_PARMS s WHERE r.UPLD_REQUEST_ID ="
		    + requestId;
	    query = query
		    + " AND d.upld_definition_id  = r.upld_definition_id and  r.upld_request_id = s.upld_request_id AND s.parm_name='mat_request_name'";
	    
	    //Adding union to fix the blank page issue as part of Q3FY12 Normalization by vibk
	    
	    query = query + "union SELECT d.upld_definition_name Request_Type_Name,r.upld_request_id Upload_Request_ID,r.biz_latest_status Latest_Status, r.ROW_CNT_FAILED Row_Cnt_Failed ,s.parm_value ";
	    query = query
	    + "FROM apps.XXCSS_SSF_UPLD_DEFINITIONS d,apps.XXCSS_SSF_UPLD_REQUESTS r,apps.XXCSS_SSF_UPLD_REQUESTS_PARMS s WHERE r.UPLD_REQUEST_ID ="
	    + requestId;
	    query = query
	    + " AND d.upld_definition_id  = r.upld_definition_id and r.upld_request_id = s.upld_request_id AND s.parm_name='matReqName'";
	    
	    
	    logger.debug("total query---->" + query);
	    
	    try{
	    statement = conn.createStatement();
	    rs = statement.executeQuery(query);
	    if (rs.next()) {
		returnValues[0] = rs.getString("Request_Type_Name");
		returnValues[2] = rs.getString("Latest_Status");
		returnValues[3] = Integer.toString(rs.getInt("Row_Cnt_Failed"));
		returnValues[4] = rs.getString("parm_value");
	    }
	    }catch(SQLException e){
		//logger.error(e); // original code
	    logger.error("MCMDAO : getRequestType : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	    }finally{
		try{
		rs.close();
		statement.close();
		}catch(SQLException se){
		    //logger.error(se); // original code
			logger.error("MCMDAO : getRequestType : SQLException : " , se); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
	    }
	    String query2 = "SELECT f.override_allowed_flag Override_Flag FROM apps.XXCSS_MAT_BIZ_VAL_EXCEPDAT e,apps.XXCSS_MAT_BIZ_VAL_EXEC_FLOWS f WHERE ";
	    query2 = query2
		    + "e.request_id = "
		    + requestId
		    + " AND e.exec_flow_id = f.exec_flow_id AND f.override_allowed_flag = 'Y'";

	    try{
	    statement = conn.createStatement();
	    rs = statement.executeQuery(query2);
	    if (rs.next()) {
		returnValues[1] = rs.getString("Override_Flag");
	    }
	    if (returnValues[1] == null) {
		returnValues[1] = "N";
	    }
	    }catch(SQLException e){
		//logger.error(e); //original code
	    	logger.error("MCMDAO : getRequestType : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	    }finally{
		try{
		rs.close();
		statement.close();
		}catch(SQLException se){
		    //logger.error(se);// original code
		    logger.error("MCMDAO : getRequestType : SQLException : " , se); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
	    }
	} catch (SQLException sqlEx) {
	    logger.error(sqlEx.toString(), sqlEx);
	    throw sqlEx;
	} finally {
	    try {
		rs.close();
		statement.close();
		conn.close();
	    } catch (SQLException e) {
		logger.error(e.toString(), e);
	    }
	}
	
	/* 
	Start : Commented code 
	Reason : Correctness - Invocation of toString on an array
	Commented by : Ajay Malekar(amalekar)
	Release name : Q2FY15
	*/
	//logger.info("Exiting the getRequestType Method in MCM DAO "	+ returnValues); 
	//End : Commented code
	
	/* 
	Start : New code added 
	Reason : To fix CI issue , Correctness - Invocation of toString on an array
	Commented by : Ajay Malekar(amalekar)
	Release name : Q2FY15
	*/

	logger.info("Exiting the getRequestType Method in MCM DAO "	+ Arrays.toString(returnValues)); 
	
	// End : New code added
	
	return returnValues;
    }

    
//	For STC 3.0 - Start Added new method - smerugol    
    /**
     * For getting the overrides for PortableSolutions also implemented DTO pattern and 
     * bypassed the existed call for overrides
     * @param mcmOverrideDTO
     * @return
     * @throws InstantiationException
     * @throws SQLException
     * @throws IllegalAccessException
     */
    public HashMap getOverrides(McmOverrideDTO mcmOverrideDTO) throws InstantiationException,
    SQLException, IllegalAccessException {

    	logger.info("Inside the getOverrides Method ");
    	String userName = mcmOverrideDTO.getUserName();
    	String requestType = mcmOverrideDTO.getRequestType();
    	HashMap overRideMap = new HashMap();

    	
    	if(requestType!=null && !requestType.equalsIgnoreCase(McmConstants.PORTABLE_SOLUTIONS)){
    		overRideMap = getOverrides(userName);//by passing the existed call
    	}
    	
    	OracleApplicationSession oas = new OracleApplicationSession();
    	oas.setApplicationShortName("XXCSS_MAT");
    	oas.setResponsiblityName("NULL");
    	oas.setUserName(userName);
    	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
    	ds = MCMDataUtil.getServices(oas, "APP");
    	
    	String[] returnStatus 	= new String[1];
    	String[] errorMsg 		= new String[1];
    	List overrideList[] 	= new ArrayList[1];
    	XxcssPsPkg psPkg 		= XxcssPsPkg.getInstance();
   	
		try {
		    logger.debug("### Before Calling the getOverridableBizvals Method ###### &&&&&&&&& ");
		    psPkg.getOverridableBizvals(ds,overrideList, returnStatus, errorMsg);
		    logger.debug("overRideMap --- " + overRideMap);
		} catch (InstantiationException e) {
			/*e.printStackTrace();
		    logger.error(e.toString(), e);*/ //original code
			logger.error("MCMDAO : getOverrides : InstantiationException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		    throw e;
		} catch (SQLException e) {
			/*e.printStackTrace();
		    logger.error(e.toString(), e);*/ //original code
			logger.error("MCMDAO : getOverrides : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		    throw e;
		} catch (IllegalAccessException e) {
			/*e.printStackTrace();
		    logger.error(e.toString(), e);*/
			logger.error("MCMDAO : getOverrides : IllegalAccessException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		    throw e;
		    
		}
		
		try {
			/*if (overrideList[0].size() > 0) {
			XxcssPsValOverideType psValOverideType =  (XxcssPsValOverideType)overrideList[0].get(0);
			ArrayList transactionList = new ArrayList();
			
			transactionList.add(new McmOverridesBean(psValOverideType.getBizValidationCode(),psValOverideType.getBizValidationDesc(),"enabled"));
			overRideMap.put(psValOverideType.getUpldDefinitionName(),transactionList);
			}*/
			
			//start Q3FY15 PS LDOS changes
			if (overrideList[0].size() > 0) {
			ArrayList transactionList = new ArrayList();
			
			System.out.println("PS Override List :-> " + overrideList[0] +" Size :->" +overrideList[0].size());
			
            for(int counter = 0 ; counter < overrideList[0].size() ; counter++ ){
                  XxcssPsValOverideType psValOverideType =  (XxcssPsValOverideType)overrideList[0].get(counter);
                  transactionList.add(new McmOverridesBean(psValOverideType.getBizValidationCode(),psValOverideType.getBizValidationDesc(),"enabled"));
                  overRideMap.put(psValOverideType.getUpldDefinitionName(),transactionList);
                  System.out.println("Upload Definition Name : ->" +psValOverideType.getUpldDefinitionName());
                  System.out.println("BizVal List :-> "+ psValOverideType.getBizValidationCode());
            }
			}
        	//End Q3FY15 PS LDOS changes
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace(); //original code
			logger.error("MCMDAO : getOverrides : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
		logger.info("Exiting the getOverrides Method " + overRideMap);
		return overRideMap;
	}
    
    public HashMap getLinkDelinkAndMoveOverrides(McmOverrideDTO mcmOverrideDTO) throws InstantiationException,
    SQLException, IllegalAccessException {

    	logger.info("Inside the getLinkDelinkAndMoveOverrides Method ");
    	String reqType= mcmOverrideDTO.getRequestType();
    	List overrideList[] 	= new ArrayList[1];
    	String[] errorMsg 		= new String[1];
    	XxcssScmGenericUtils ovrdval= XxcssScmGenericUtils.getInstance();
    	//String sourceSyatem="XXCSS_OCM";
    	//String userID= mcmOverrideDTO.getUserName();
    	String transcationType="";
    	HashMap overRideMap = new HashMap();
    	ArrayList  transcationList = new ArrayList();
    	String[] returnStatus = new String[1];
    	
 	 	
	try {
		ovrdval.getUpldOverridableVals(ds,reqType,overrideList,returnStatus,errorMsg);
		
		if ((returnStatus [0]!= null) && (!returnStatus[0].equalsIgnoreCase("E"))) 
		{
		if(overrideList[0]!=null)
		{
			for(int i=0;i<overrideList[0].size();i++)
			{
				
			XxcssScmValOverideType overvals=(XxcssScmValOverideType)overrideList[0].get(i);
				transcationType= overvals.getUpldDefinitionName();
				McmOverridesBean ovb =new McmOverridesBean(
											overvals.getUpldValidationCode(),
											overvals.getUpldValidationDesc().trim(),
									    "enabled");
				        transcationList.add(ovb);	
			}
			
		}
		}
		overRideMap.put(transcationType,transcationList);
	} 
	catch (Exception e) {
		/*e.printStackTrace();
	    logger.error(e.toString(), e);*/// original code
	    //throw e;
		
		logger.error("MCMDAO : getLinkDelinkAndMoveOverrides : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	} 
	/*catch (SQLException e) {
			e.printStackTrace();
		    logger.error(e.toString(), e);
		    throw e;
		} */
		
		
		logger.info("Exiting the getOverrides Method " + overRideMap);
		return overRideMap;
	}
    
//	For STC 3.0 - Ended method - smerugol
}
