/*package com.cisco.contractmgmt.renewalmanager.data.mat;

import com.cisco.contractmgmt.commons.logger.Log;
import com.cisco.contractmgmt.commons.metrics.workUnits.db.LoggedCallableStatement;
import com.cisco.contractmgmt.renewalmanager.common.utils.D;
import com.cisco.contractmgmt.renewalmanager.common.utils.SelectedPersistentCacheDAO;
import com.cisco.contractmgmt.renewalmanager.utils.db.DBConnectionManager;
import com.cisco.contractmgmt.renewalmanager.utils.db.CommonConnection;
import com.cisco.contractmgmt.renewalmanager.data.oracletypes.OraErrorObj;
import com.cisco.contractmgmt.renewalmanager.data.oracletypes.OraMatOverrideValObj;
import com.cisco.contractmgmt.renewalmanager.data.oracletypes.OraMatOverrideValTbl;
import com.cisco.contractmgmt.renewalmanager.exception.RenewalManagerException;

import java.sql.Connection;
import java.util.HashMap;

import oracle.jdbc.driver.OracleCallableStatement;
import oracle.jdbc.driver.OracleTypes;

*//**
 * User: aygupta
 * Date: Jan 24, 2005
 * Time: 1:58:37 PM
 *//*
public class MatDAO {
    private static final String SOURCE_SYSTEM = "LEAP_MAT";

    public static void sendEmail(int requestNumber, String ccoUserId, String email, String download_type) throws RenewalManagerException {
        //TODO: Implement MatDAO.sendEmail()
        String method = "MatDAO.sendEmail()";
        long timeIn = D.bugIn(method);

		DBConnectionManager dbConnectionManager = DBConnectionManager.getInstance();;
		CommonConnection commonConnection = null;
		Connection conn = null;
		LoggedCallableStatement ocst = null;
        OraErrorObj errorObj = null;


        try {

//        cib_mat_result_download_pkg.sp_DownloadResults(
//        p_upld_request_id IN NUMBER
//        ,p_ccoUserID IN VARCHAR2
//        ,p_email_addr IN VARCHAR2
//        ,p_full_error_flag IN VARCHAR2
//        ,x_filename OUT VARCHAR2
//        ,x_error_obj OUT xxcm.xx_cm_error_obj_type
            String proc = "{call APPS.CIB_MAT_RESULTS_DOWNLOAD_PKG.SP_DOWNLOADRESULTS(?, ?, ?, ?, ?, ?, ?)}";

            commonConnection = dbConnectionManager.getIStoreConnection();
            conn = commonConnection.getJdbcConnection();
            ocst = new LoggedCallableStatement((OracleCallableStatement) conn.prepareCall(proc));

            ocst.setInt(1, requestNumber);
            ocst.setString(2, ccoUserId);
            ocst.setString(3, email);
            ocst.setString(4, download_type);
            ocst.registerOutParameter(5,OracleTypes.VARCHAR);
            ocst.registerOutParameter(6,OracleTypes.STRUCT, "XXCM.XX_CM_ERROR_OBJ_TYPE");
            ocst.setString(7, "2");

            ocst.execute();

            errorObj = (OraErrorObj) ocst.getCustomDatum(6, OraErrorObj.getFactory());

            if (errorObj != null && errorObj.getPErrCode() != null && errorObj.getPErrCode().intValue() != 0) {
                Log.error("Could not send email");
                Log.error(errorObj.getPErrType() + " : " + errorObj.getPErrMsg() + " : " + errorObj.getPErrCode().intValue());
                throw new RenewalManagerException(errorObj.getPErrCode().toString());
            }

        } catch (RenewalManagerException e) {
            Log.error("Could not send email to MAT user");
            Log.error(e.getErrorMsg());
            throw e;
        } catch (Exception e) {
            Log.error(e);
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                ocst.close();
                conn.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }
    }


    *//**
     *
     * @param matReportContext
     * @return requestID
     *//*
    public int createReport(MatReportContext matReportContext) throws RenewalManagerException {
        String method = "MatDAO.createReport()";
        long timeIn = D.bugIn(method);

        int requestID = 0;

		DBConnectionManager dbConnectionManager = DBConnectionManager.getInstance();;
		CommonConnection commonConnection = null;
		Connection conn = null;
		LoggedCallableStatement ocst = null;
        OraErrorObj errorObj = null;

        try {
            
                XXSOM_RP_CM_SUBMIT_PKG.SubmitProgramRequest(
                p_cco_userid IN  xx_cm_upld_requests.cco_userid%TYPE
                ,p_program_name      IN  xxcm.xx_cm_upld_definitions.upld_definition_name%TYPE
                ,p_email             IN  xxcm.xx_cm_upld_requests.email%TYPE
                ,p_email_cc          IN  xxcm.xx_cm_upld_requests.email_cc%TYPE
                ,p_email_bcc         IN  xxcm.xx_cm_upld_requests.email_bcc%TYPE
                ,p_parm_tbl          IN  xxcm.xx_cm_upld_req_parm_tbl_type
                ,p_request_id        IN  xxcm.xx_cm_upld_requests.upld_request_id%TYPE
                ,x_request_id        OUT xxcm.xx_cm_upld_requests.upld_request_id%TYPE
                ,x_error_obj         OUT xxcm.xx_cm_error_obj_type
                ,p_trace_level       IN  VARCHAR2 DEFAULT '2'
            )

            

            String proc = "{call APPS.XXSOM_RP_CM_SUBMIT_PKG.SubmitProgramRequest(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

            commonConnection = dbConnectionManager.getIStoreConnection();
            conn = commonConnection.getJdbcConnection();
            ocst = new LoggedCallableStatement((OracleCallableStatement) conn.prepareCall(proc));

            ocst.setString(1,matReportContext.getLoggedInUserCCOUserID()); // cco user ID
            ocst.setString(2,matReportContext.getReportType());   // report's upload def name
            ocst.setString(3,matReportContext.getLoggedInUserEmail()); //email
            ocst.setString(4,null);  // cc email
            ocst.setString(5,null); //bcc email
            ocst.setObject(6,matReportContext.getReportParams());
            ocst.setInt(7,0); //requestId
            ocst.registerOutParameter(8,OracleTypes.NUMBER ); // returned request ID
            ocst.registerOutParameter(9,OracleTypes.STRUCT, "XXCM.XX_CM_ERROR_OBJ_TYPE");
            ocst.setString(10,"2"); //trace_level

            ocst.execute();

            requestID = ocst.getInt(8);
            matReportContext.setRequestID(requestID);

            errorObj = (OraErrorObj) ocst.getCustomDatum(9, OraErrorObj.getFactory());

            if (errorObj != null && errorObj.getPErrCode() != null && errorObj.getPErrCode().intValue() != 0) {
                Log.error("Could not send email");
                Log.error(errorObj.getPErrType() + " : " + errorObj.getPErrMsg() + " : " + errorObj.getPErrCode().intValue());
                throw new RenewalManagerException(errorObj.getPErrCode().toString());
            }

        } catch (RenewalManagerException re) {
            Log.error("Could not create the report request");
            Log.error(re.getErrorMsg());
            throw re;
        } catch (Exception e) {
            Log.error(e);
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                ocst.close();
                conn.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }
        matReportContext.getStartDate();

        return requestID;
    }

    *//**
     * This method gets the qualified overrides from the back end for the user
     * @param userName
     *
     *//*
    public static void getOverrides(MatUploadContext matUploadContext, String userName) throws RenewalManagerException {
        String method = "MatDAO.getOverrides()";
        long timeIn = D.bugIn(method);
        HashMap overrideMap = null;

		DBConnectionManager dbConnectionManager = DBConnectionManager.getInstance();;
		CommonConnection commonConnection = null;
		Connection conn = null;
		LoggedCallableStatement ocst = null;
        OraErrorObj errorObj = null;

        try {
            
                cib_mat_utils_pkg.get_overridable_bizvals(

            

            String proc = "{call APPS.cib_mat_utils_pkg.get_overridable_bizvals(?, ?, ?, ?, ?)}";

            commonConnection = dbConnectionManager.getIStoreConnection();
            conn = commonConnection.getJdbcConnection();
            ocst = new LoggedCallableStatement((OracleCallableStatement) conn.prepareCall(proc));

            ocst.setString(1,SOURCE_SYSTEM); // calling application name
            ocst.setString(2,userName);   // cco user ID
            ocst.registerOutParameter(3,OraMatOverrideValTbl._SQL_TYPECODE, "CIBER.CIB_MAT_VAL_OVERRIDE_TBL_TYPE");
            ocst.registerOutParameter(4,OracleTypes.VARCHAR); // returned status
            ocst.registerOutParameter(5,OracleTypes.VARCHAR); // returned error message

            ocst.execute();

            String returnStatus = ocst.getString(4);
            String errorMessage= ocst.getString(5);

            if (!returnStatus.equalsIgnoreCase("E") ) {
                OraMatOverrideValTbl oraOverrideValTbl = (OraMatOverrideValTbl)ocst.getCustomDatum(3,OraMatOverrideValTbl.getFactory());
                if (oraOverrideValTbl != null) {
                    OraMatOverrideValObj[] oraMatOverrideValObjs = oraOverrideValTbl.getArray();
                    if (oraMatOverrideValObjs != null && oraMatOverrideValObjs.length > 0) {
                        for (int i = 0; i < oraMatOverrideValObjs.length; i++) {
                            OraMatOverrideValObj oraMatOverrideValObj = oraMatOverrideValObjs[i];
                            oraMatOverrideValObj.getUpldDefinitionName();
                            oraMatOverrideValObj.getBizValidationCode();
                            oraMatOverrideValObj.getBizValidationDesc();
                        }

                    }

                }
            } else {
                if (errorMessage != null)
                    Log.error(errorMessage);
            }

        } catch (RenewalManagerException re) {
            Log.error("Could not create the report request");
            Log.error(re.getErrorMsg());
            throw re;
        } catch (Exception e) {
            Log.error(e);
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                ocst.close();
                conn.close();
            } catch (Exception e) {
                Log.error(e);
            }
        }

    }

    public static void main(String[] args) {

        try {
            MatUploadContext uploadcontext = new MatUploadContext();
            MatDAO.getOverrides(uploadcontext, "ssr8_user");

        } catch (RenewalManagerException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
*/