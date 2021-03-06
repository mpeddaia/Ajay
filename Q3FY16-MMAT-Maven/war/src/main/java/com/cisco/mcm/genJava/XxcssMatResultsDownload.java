/*****************************************************************************
 * XxcssMatResultsDownload.java
 *
 * Copyright 2001-2003 Cisco Systems, Inc. All Rights Reserved.
 * This software is the proprietary information of  Cisco Systems, Inc.
 *
 * NOTE:
 * This file was generated by the genJava script.  Please only make
 * changes to the file within protect blocks to ensure your changes are 
 * preserved when this file is next regenerated.
 * 
 *****************************************************************************/

package com.cisco.mcm.genJava;

/* Begin generated import statements */
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.driver.OracleTypes;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.ca.fea.daoservices.util.ConnectionUtil;
 


/* End generated import statements */

/* BEGIN PROTECT_BLOCK user_imports */
/* END PROTECT_BLOCK user_imports */

 


public class XxcssMatResultsDownload extends Object implements java.io.Serializable {

    private static XxcssMatResultsDownload theInstance=null;
    
/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */

    


/* BEGIN PROTECT_BLOCK user_public_constants */
/* END PROTECT_BLOCK user_public_constants */


/* BEGIN PROTECT_BLOCK user_static_initializers */
/* END PROTECT_BLOCK user_static_initializers */


    public static synchronized XxcssMatResultsDownload getInstance() {
        if (theInstance==null) {
            theInstance = new XxcssMatResultsDownload();
        }
        return theInstance;
    }
    
    private XxcssMatResultsDownload() {
/* BEGIN PROTECT_BLOCK user_private_constructor */
/* END PROTECT_BLOCK user_private_constructor */

    }
    

    

       

    public void spDownloadresults(
        DAOServices services,
        int upldRequestId,
        String ccouserid,
        String emailAddr,
        String fullErrorFlag,
        String[] filename,
        String[] errorObj,
        String traceLevel)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            System.out.println("Inside XxcssMatResultsDownload Class and before calling stored procedure ");
            stmt = conn.prepareCall("begin APPS.xxcss_mat_results_download.sp_downloadresults(:1,:2,:3,:4,:5,:6,:7); end;");
            stmt.setInt(1,upldRequestId);
            stmt.setString(2,ccouserid);
            stmt.setString(3,emailAddr);
            stmt.setString(4,fullErrorFlag);
            stmt.registerOutParameter(5, OracleTypes.VARCHAR);
            stmt.registerOutParameter(6, OracleTypes.VARCHAR);
            stmt.setString(7,traceLevel);
            stmt.execute();
            filename[0]=(String)stmt.getString(5);
            errorObj[0]=(String)stmt.getString(6);
            System.out.println("filename[0] :"+filename[0]);
            System.out.println(" errorObj[0]   :"+errorObj[0]);

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    public void spSubmitcmjob(
        DAOServices services,
        String appName,
        String pgmName,
        String reqDesc,
        String startTime,
        BigDecimal upldrequestid,
        String upldDefnName,
        String emailAddr,
        BigDecimal[] cmRequestId,
        String[] errorObj)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxcss_mat_results_download.sp_submitcmjob(:1,:2,:3,:4,:5,:6,:7,:8,:9); end;");
            stmt.setString(1,appName);
            stmt.setString(2,pgmName);
            stmt.setString(3,reqDesc);
            stmt.setString(4,startTime);
            stmt.setBigDecimal(5,upldrequestid);
            stmt.setString(6,upldDefnName);
            stmt.setString(7,emailAddr);
            stmt.registerOutParameter(8, OracleTypes.NUMBER);
            stmt.registerOutParameter(9, OracleTypes.VARCHAR);
            stmt.execute();
            cmRequestId[0]=(BigDecimal)stmt.getBigDecimal(8);
            errorObj[0]=(String)stmt.getString(9);

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    public void hpSendemail(
        DAOServices services,
        BigDecimal upldRequestId,
        String emailTo,
        String firstName,
        String lastName,
        String emailAttachment,
        String[] errorObj,
        String traceLevel)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxcss_mat_results_download.hp_sendemail(:1,:2,:3,:4,:5,:6,:7); end;");
            stmt.setBigDecimal(1,upldRequestId);
            stmt.setString(2,emailTo);
            stmt.setString(3,firstName);
            stmt.setString(4,lastName);
            stmt.setString(5,emailAttachment);
            stmt.setString(6,errorObj[0]);
            stmt.registerOutParameter(6, OracleTypes.VARCHAR);
            stmt.setString(7,traceLevel);
            stmt.execute();
            errorObj[0]=(String)stmt.getString(6);

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
