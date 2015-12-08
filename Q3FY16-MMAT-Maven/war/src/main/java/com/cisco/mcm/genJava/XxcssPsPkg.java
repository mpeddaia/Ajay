/*****************************************************************************
 * XxcssPsPkg.java
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
import java.io.*;
import java.util.*;
import oracle.jdbc.driver.*;
import java.sql.*;
import oracle.sql.*;
import java.math.BigDecimal;
import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.ca.fea.daoservices.util.ConnectionUtil;
 


/* End generated import statements */

/* BEGIN PROTECT_BLOCK user_imports */
/* END PROTECT_BLOCK user_imports */

 


public class XxcssPsPkg extends Object implements java.io.Serializable {

    private static XxcssPsPkg theInstance=null;
    
/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */

    


/* BEGIN PROTECT_BLOCK user_public_constants */
/* END PROTECT_BLOCK user_public_constants */


/* BEGIN PROTECT_BLOCK user_static_initializers */
/* END PROTECT_BLOCK user_static_initializers */


    public static synchronized XxcssPsPkg getInstance() {
        if (theInstance==null) {
            theInstance = new XxcssPsPkg();
        }
        return theInstance;
    }
    
    private XxcssPsPkg() {
/* BEGIN PROTECT_BLOCK user_private_constructor */
/* END PROTECT_BLOCK user_private_constructor */

    }
    

    
    private static List buildListFromOracleArray(Connection conn,List list,ARRAY array,com.cisco.mcm.genJava.XxcssPsValOverideType dummy)
        throws SQLException,InstantiationException,IllegalAccessException {
        List rlist=null;
        com.cisco.mcm.genJava.XxcssPsValOverideType element=null;
        Object[] jarray=null;
        STRUCT struct=null;
        rlist=(list==null) ? new ArrayList() : list;
        if (list != null) {
            list.clear();
        }
        if (array!=null) {
            jarray=(Object[])array.getArray();
            for (int i=0;i<jarray.length;i++) {
                struct=(STRUCT)jarray[i];
                if (struct == null) {
                    element = null;
                } else {
                    element=com.cisco.mcm.genJava.XxcssPsValOverideType.newFromStruct(conn,struct);
                }
                rlist.add(element);
            }
        }
        return rlist;
    }

       

    public void launcher(
        DAOServices services,
        String[] errbuf,
        BigDecimal[] retcode,
        BigDecimal upldreqid)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxcss_ps_pkg.launcher(:1,:2,:3); end;");
            stmt.registerOutParameter(1, OracleTypes.VARCHAR);
            stmt.registerOutParameter(2, OracleTypes.NUMBER);
            stmt.setBigDecimal(3,upldreqid);
            stmt.execute();
            errbuf[0]=(String)stmt.getString(1);
            retcode[0]=(BigDecimal)stmt.getBigDecimal(2);

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    public void ciSiteSwap(
        DAOServices services,
        String siteLoc,
        String rowid,
        String[] stcFlag,
        String[] errorMsg)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxcss_ps_pkg.ci_site_swap(:1,:2,:3,:4); end;");
            stmt.setString(1,siteLoc);
            stmt.setString(2,rowid);
            stmt.registerOutParameter(3, OracleTypes.VARCHAR);
            stmt.registerOutParameter(4, OracleTypes.VARCHAR);
            stmt.execute();
            stcFlag[0]=(String)stmt.getString(3);
            errorMsg[0]=(String)stmt.getString(4);

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    public void getOverridableBizvals(
        DAOServices services,
        java.util.List[] overridableBizvals,
        String[] returnStatus,
        String[] errorMsg)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxcss_ps_pkg.get_overridable_bizvals(:1,:2,:3); end;");
            stmt.registerOutParameter(1, OracleTypes.ARRAY,"APPS.XXCSS_PS_VAL_OVERIDE_TAB_TYPE");
            stmt.registerOutParameter(2, OracleTypes.VARCHAR);
            stmt.registerOutParameter(3, OracleTypes.VARCHAR);
            stmt.execute();
            ARRAY overridableBizvalsArray=(ARRAY)stmt.getArray(1);
            overridableBizvals[0]=buildListFromOracleArray(services.getNativeConnection(conn),overridableBizvals[0],overridableBizvalsArray,(com.cisco.mcm.genJava.XxcssPsValOverideType)null);
            returnStatus[0]=(String)stmt.getString(2);
            errorMsg[0]=(String)stmt.getString(3);

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
