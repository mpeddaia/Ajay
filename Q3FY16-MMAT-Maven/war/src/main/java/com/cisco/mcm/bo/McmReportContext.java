/*
 * Created on Jan 3, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.bo;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.cisco.mcm.action.McmReportsAction;
import com.cisco.mcm.dao.oracletypes.OraMatReportParamsObj;
import com.cisco.mcm.dao.oracletypes.OraMatReportParamsTbl;

/**
 * @author kiguntup
 * 
 */
public class McmReportContext {
    private String startDate;
    private String endDate;
    private String loggedInUserCCOUserID;
    private String loggedInUserEmail;
    private OraMatReportParamsTbl reportParamsTbl;

    private String requestedReportCCOUserID;

    private String reportType;
    private int requestID;
    private String reasonCode;
    private String requestStatus;
    private static final String START_DATE = "MAT_RPT_START_DATE";
    private static final String END_DATE = "MAT_RPT_END_DATE";
    private static final String REPORT_TYPE = "MAT_REPORT_TYPE";
    // MAT report upload definition names
    private static final String UTILIZATION_BY_USER = "MAT_UTILIZATION_BY_USER";
    private static final String GPS_AUDIT = "MAT_GPS_AUDIT";
    private static final String REASON_CODE_RECONCILIATION = "MAT_REASON_CODE_RECONCILIATION";
    private static final String UTIL_SUMM_BY_TRAN_TYPE = "MAT_UTIL_SUMM_BY_TRAN_TYPE";
    private static final String CURRENT_USER_LIST = "MAT_CURRENT_USER_LIST";
    private static final String FAILURE_BREAKDOWN = "MAT_FAILURE_BREAKDOWN";
    private static final String PROCESSING_TIMES = "MAT_PROCESSING_TIMES";
    private static final String VO_AUDIT = "MAT_VO_AUDIT_REPORT";
    
//  TD -26738 Added by Rajkumar 
   
    /*private static final String VALIDATION_OVERRIDE_REPORT = "MAT_VALIDATION_OVERRIDE_REPORT ";
    private static final String MASS_PROCESSING_REPORT = "MAT_ MASS_PROCESSING_REPORT ";
    private static final String MASS_RECONFIGURATION_TRANSACTION_REPORT = "MAT_ MASS_RECONFIGURATION_TRANSACTION_REPORT ";*/
    
    /**
    private static final String VALIDATION_OVERRIDE_REPORT = "SCM_TXN_VO_AUDIT_RPT";
    private static final String MASS_PROCESSING_REPORT = "SCM_TXN_PROC_TIME_RPT";
    private static final String MASS_RECONFIGURATION_TRANSACTION_REPORT = "SCM_TRA_FAIL_RPT";*/
    
    private static final String VALIDATION_OVERRIDE_REPORT = "SCM_TXN_VO_AUDIT_RPT";
    private static final String MASS_PROCESSING_REPORT = "SCM_TXN_PROC_TIME_RPT";
    private static final String MASS_RECONFIGURATION_TRANSACTION_REPORT = "SCM_TRA_FAIL_RPT";

    private static Logger logger = Logger.getLogger(McmReportsAction.class); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
    
    /**
     * Default Constructor
     */
    public McmReportContext() {

    }

    /**
     * @param req
     * @param loggedInUserCCOUser
     * @param email
     * @throws Exception
     */
    public McmReportContext(HttpServletRequest req, String loggedInUserCCOUser,
	    String email) throws Exception {
	this.loggedInUserCCOUserID = loggedInUserCCOUser;
	this.loggedInUserEmail = email;
	reportType = req.getParameter(REPORT_TYPE);

	switch (Integer.parseInt(reportType)) {

	case (1):
	    reportType = GPS_AUDIT;
	    break;
	case (2):
	    reportType = CURRENT_USER_LIST;
	    break;
	case (3):
	    reportType = UTILIZATION_BY_USER;
	    break;
	case (4):
	    reportType = UTIL_SUMM_BY_TRAN_TYPE;
	    break;
	case (5):
	    reportType = FAILURE_BREAKDOWN;
	    break;
	case (6):
	    reportType = PROCESSING_TIMES;
	    break;
	case (7):
	    reportType = REASON_CODE_RECONCILIATION;
	    break;
	case (8):
	    reportType = VO_AUDIT;
	    break;
	case (9):
	    reportType = VALIDATION_OVERRIDE_REPORT;
        break;

	case (10):
	    reportType=MASS_PROCESSING_REPORT;
        break;
	
		case (11):
	    reportType=MASS_RECONFIGURATION_TRANSACTION_REPORT;
	break;

	
	default:
	 
	
	}

	if (reportType != null)
	    setReportParams(createReportParamsTbl(req));
    }

    public String getStartDate() {
	return startDate;
    }

    public void setStartDate(String startDate) {
	this.startDate = startDate;
    }

    public String getEndDate() {
	return endDate;
    }

    public void setEndDate(String endDate) {
	this.endDate = endDate;
    }

    public String getLoggedInUserCCOUserID() {
	return loggedInUserCCOUserID;
    }

    public void setLoggedInUserCCOUserID(String loggedInUserCCOUserID) {
	this.loggedInUserCCOUserID = loggedInUserCCOUserID;
    }

    public String getRequestedReportCCOUserID() {
	return requestedReportCCOUserID;
    }

    public void setRequestedReportCCOUserID(String requestedReportCCOUserID) {
	this.requestedReportCCOUserID = requestedReportCCOUserID;
    }

    public String getReportType() {
	return reportType;
    }

    public void setReportType(String reportType) {
	this.reportType = reportType;
    }

    public int getRequestID() {
	return requestID;
    }

    public void setRequestID(int requestID) {
	this.requestID = requestID;
    }

    public String getReasonCode() {
	return reasonCode;
    }

    public void setReasonCode(String reasonCode) {
	this.reasonCode = reasonCode;
    }

    public String getRequestStatus() {
	return requestStatus;
    }

    public void setRequestStatus(String requestStatus) {
	this.requestStatus = requestStatus;
    }

    public String getLoggedInUserEmail() {
	return loggedInUserEmail;
    }

    /**
     * @param loggedInUserEmail
     */
    public void setLoggedInUserEmail(String loggedInUserEmail) {
	this.loggedInUserEmail = loggedInUserEmail;
    }

    /**
     * @param req
     * @return
     */
    private OraMatReportParamsTbl createReportParamsTbl(HttpServletRequest req) {

	try {

	    List oraMatReportParamsObjLst = new ArrayList();

	    if (this.reportType.equalsIgnoreCase(GPS_AUDIT)) {
		populateGPSReportParams(req, oraMatReportParamsObjLst);
	    } else if (this.reportType.equalsIgnoreCase(CURRENT_USER_LIST)) {
		System.out.println("Inside else if");

	    } else if (this.reportType.equalsIgnoreCase(UTILIZATION_BY_USER)) {
		populateUBUReportParams(req, oraMatReportParamsObjLst);

	    } else if (this.reportType.equalsIgnoreCase(UTIL_SUMM_BY_TRAN_TYPE)) {
		populateUSTReportParams(req, oraMatReportParamsObjLst);
	    } else if (this.reportType.equalsIgnoreCase(FAILURE_BREAKDOWN)) {
		populateFBReportParams(req, oraMatReportParamsObjLst);
	    } else if (this.reportType.equalsIgnoreCase(PROCESSING_TIMES)) {
		populatePTReportParams(req, oraMatReportParamsObjLst);
	    } else if (this.reportType.equalsIgnoreCase(VO_AUDIT)) {
		populateVATReportParams(req, oraMatReportParamsObjLst);
	    } else if (this.reportType
		    .equalsIgnoreCase(REASON_CODE_RECONCILIATION)) {
		populateRCRReportParams(req, oraMatReportParamsObjLst);
		
	    }
	    else if (this.reportType
			    .equalsIgnoreCase(VALIDATION_OVERRIDE_REPORT)) {
			populateVORReportParams(req, oraMatReportParamsObjLst);
		    }

	    else if (this.reportType
			    .equalsIgnoreCase(MASS_PROCESSING_REPORT)) {
			populateMPRReportParams(req, oraMatReportParamsObjLst);
		    }

	    else if (this.reportType
			    .equalsIgnoreCase(MASS_RECONFIGURATION_TRANSACTION_REPORT)) {
			populateMRTRReportParams(req, oraMatReportParamsObjLst);
		    }


	    return new OraMatReportParamsTbl(
		    (OraMatReportParamsObj[]) oraMatReportParamsObjLst
			    .toArray(new OraMatReportParamsObj[oraMatReportParamsObjLst
				    .size()]));

	} catch (SQLException e) {
	    //e.printStackTrace(); // To change body of catch statement use
	    // File | Settings | File Templates.
		
		logger.error("McmListControllerBO : filter : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		
	    throw new RuntimeException();
	}

    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateVATReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(3), "MAT_RPT_VOAR_REQUEST_TYPE",
		req.getParameter("MAT_RPT_VOAR_REQUEST_TYPE"), null, null,
		null, null, null, null, null, null, null, null, null, null,
		null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateRCRReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(3), "MAT_RPT_RCR_REQUEST_TYPE",
		req.getParameter("MAT_RPT_RCR_REQUEST_TYPE"), null, null, null,
		null, null, null, null, null, null, null, null, null, null,
		null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
	OraMatReportParamsObj oraMatReportParamsObj4 = new OraMatReportParamsObj(
		null, null,
		BigDecimal.valueOf(4),
		"MAT_RPT_TRN_REQUEST_ID",
		req.getParameter("MAT_RPT_TRN_REQUEST_ID"), // need to take care
		// of ALL or
		// specific user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj4);
	OraMatReportParamsObj oraMatReportParamsObj5 = new OraMatReportParamsObj(
		null,
		null,
		BigDecimal.valueOf(5),
		"MAT_RPT_RCR_CCO_USER_ID",
		req.getParameter("MAT_RPT_RCR_CCO_USER_ID"), // need to take
		// care of ALL
		// or specific
		// user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj5);
	OraMatReportParamsObj oraMatReportParamsObj6 = new OraMatReportParamsObj(
		null, null,
		BigDecimal.valueOf(6),
		"MAT_RPT_RCR_REASONCODE",
		req.getParameter("MAT_RPT_RCR_REASONCODE"), // need to take care
		// of ALL or
		// specific user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj6);
    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populatePTReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
		null,
		null,
		BigDecimal.valueOf(3),
		"MAT_RPT_PTR_REQUEST_TYPE",
		req.getParameter("MAT_RPT_PTR_REQUEST_TYPE"), // need to take
		// care of ALL
		// or specific
		// user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateFBReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
		null,
		null,
		BigDecimal.valueOf(3),
		"MAT_RPT_FBT_REQUEST_TYPE",
		req.getParameter("MAT_RPT_FBT_REQUEST_TYPE"), // need to take
		// care of ALL
		// or specific
		// user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateUSTReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
		null,
		null,
		BigDecimal.valueOf(3),
		"MAT_RPT_SUM_REQUEST_TYPE",
		req.getParameter("MAT_RPT_SUM_REQUEST_TYPE"), // need to take
		// care of ALL
		// or specific
		// user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateUBUReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
		null,
		null,
		BigDecimal.valueOf(3),
		"MAT_RPT_UBU_CCO_USER_ID",
		req.getParameter("MAT_RPT_UBU_CCO_USER_ID"), // need to take
		// care of ALL
		// or specific
		// user id
		null, null, null, null, null, null, null, null, null, null,
		null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
	OraMatReportParamsObj oraMatReportParamsObj4 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(4), "MAT_RPT_UBU_REQUEST_TYPE",
		req.getParameter("MAT_RPT_UBU_REQUEST_TYPE"), null, null, null,
		null, null, null, null, null, null, null, null, null, null,
		null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj4);
	OraMatReportParamsObj oraMatReportParamsObj5 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(5), "MAT_RPT_UBU_STATUS", req
			.getParameter("MAT_RPT_UBU_STATUS"), null, null, null,
		null, null, null, null, null, null, null, null, null, null,
		null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj5);
    }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateGPSReportParams(HttpServletRequest req,
	    List oraMatReportParamsObjLst) throws SQLException {
	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(1), START_DATE, req
			.getParameter(START_DATE), null, null, null, null,
		null, null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
		null, null, BigDecimal.valueOf(2), END_DATE, req
			.getParameter(END_DATE), null, null, null, null, null,
		null, null, null, null, null, null, null, null, null);
	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
    }
    
    
    
    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    
    
    private void populateVORReportParams(HttpServletRequest req,
    	    List oraMatReportParamsObjLst) throws SQLException {
    	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
    		null, null, BigDecimal.valueOf(1), START_DATE, req
    			.getParameter(START_DATE), null, null, null, null,
    		null, null, null, null, null, null, null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
    	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
    		null, null, BigDecimal.valueOf(2), END_DATE, req
    			.getParameter(END_DATE), null, null, null, null, null,
    		null, null, null, null, null, null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
    	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
    		null,
    		null,
    		BigDecimal.valueOf(3),
    		"MAT_RPT_VOR_REQUEST_TYPE",
    		req.getParameter("MAT_RPT_VOR_REQUEST_TYPE"), // need to take
    		// care of ALL
    		// or specific
    		// user id
    		null, null, null, null, null, null, null, null, null, null,
    		null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
        }



    
    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    private void populateMPRReportParams(HttpServletRequest req,
    	    List oraMatReportParamsObjLst) throws SQLException {
    	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
    		null, null, BigDecimal.valueOf(1), START_DATE, req
    			.getParameter(START_DATE), null, null, null, null,
    		null, null, null, null, null, null, null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
    	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
    		null, null, BigDecimal.valueOf(2), END_DATE, req
    			.getParameter(END_DATE), null, null, null, null, null,
    		null, null, null, null, null, null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
    	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
    		null,
    		null,
    		BigDecimal.valueOf(3),
    		"MAT_RPT_MPR_REQUEST_TYPE",
    		req.getParameter("MAT_RPT_MPR_REQUEST_TYPE"), // need to take
    		// care of ALL
    		// or specific
    		// user id
    		null, null, null, null, null, null, null, null, null, null,
    		null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
        }

    /**
     * @param req
     * @param oraMatReportParamsObjLst
     * @throws SQLException
     */
    
    
    private void populateMRTRReportParams(HttpServletRequest req,
    	    List oraMatReportParamsObjLst) throws SQLException {
    	OraMatReportParamsObj oraMatReportParamsObj1 = new OraMatReportParamsObj(
    		null, null, BigDecimal.valueOf(1), START_DATE, req
    			.getParameter(START_DATE), null, null, null, null,
    		null, null, null, null, null, null, null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj1);
    	OraMatReportParamsObj oraMatReportParamsObj2 = new OraMatReportParamsObj(
    		null, null, BigDecimal.valueOf(2), END_DATE, req
    			.getParameter(END_DATE), null, null, null, null, null,
    		null, null, null, null, null, null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj2);
    	OraMatReportParamsObj oraMatReportParamsObj3 = new OraMatReportParamsObj(
    		null,
    		null,
    		BigDecimal.valueOf(3),
    		"MAT_RPT_MRTR_REQUEST_TYPE",
    		req.getParameter("MAT_RPT_MRTR_REQUEST_TYPE"), // need to take
    		// care of ALL
    		// or specific
    		// user id
    		null, null, null, null, null, null, null, null, null, null,
    		null, null, null, null);
    	oraMatReportParamsObjLst.add(oraMatReportParamsObj3);
        }

   

    /**
     * @return
     */
    public Object getReportParams() {
	return reportParamsTbl;
    }

    /**
     * @param reportParams
     */
    public void setReportParams(OraMatReportParamsTbl reportParams) {
	this.reportParamsTbl = reportParams;
    }
}
