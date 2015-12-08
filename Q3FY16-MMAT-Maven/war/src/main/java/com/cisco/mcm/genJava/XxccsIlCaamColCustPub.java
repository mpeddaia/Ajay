/*****************************************************************************
 * XxccsIlCaamColCustPub.java
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
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import oracle.jdbc.driver.OracleTypes;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.ca.fea.daoservices.util.ConnectionUtil;
 


/* End generated import statements */

/* BEGIN PROTECT_BLOCK user_imports */
/* END PROTECT_BLOCK user_imports */

 


public class XxccsIlCaamColCustPub extends Object implements java.io.Serializable {

    private static XxccsIlCaamColCustPub theInstance=null;
    
/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */

    


/* BEGIN PROTECT_BLOCK user_public_constants */
/* END PROTECT_BLOCK user_public_constants */


/* BEGIN PROTECT_BLOCK user_static_initializers */
/* END PROTECT_BLOCK user_static_initializers */


    public static synchronized XxccsIlCaamColCustPub getInstance() {
        if (theInstance==null) {
            theInstance = new XxccsIlCaamColCustPub();
        }
        return theInstance;
    }
    
    private XxccsIlCaamColCustPub() {
/* BEGIN PROTECT_BLOCK user_private_constructor */
/* END PROTECT_BLOCK user_private_constructor */

    }
    

    
    private static ARRAY buildOracleArrayFromList(Connection conn,List list,com.cisco.mcm.genJava.XxccsCaamColCustObjType dummy)
        throws SQLException {
       // ARRAY oracleArray=null;
        com.cisco.mcm.genJava.XxccsCaamColCustObjType element=null;
        Object[] jarray=null;
        STRUCT struct=null;
        ArrayDescriptor desc=
            ArrayDescriptor.createDescriptor("APPS.XXCCS_CAAM_COL_CUST_TAB_TYPE",conn);
        int i=0;
        if (list!=null) {
            jarray=new Object[list.size()];
            Iterator iterator=list.iterator();
            while (iterator.hasNext()) {
                element=(com.cisco.mcm.genJava.XxccsCaamColCustObjType)iterator.next();
                struct=element.asStruct(conn);
                jarray[i++]=struct;
            }
        }
        return new ARRAY(desc,conn,jarray);
    }
    private static List buildListFromOracleArray(Connection conn,List list,ARRAY array,com.cisco.mcm.genJava.XxccsCaamColCustObjType dummy)
        throws SQLException,InstantiationException,IllegalAccessException {
        List rlist=null;
        com.cisco.mcm.genJava.XxccsCaamColCustObjType element=null;
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
                    element=com.cisco.mcm.genJava.XxccsCaamColCustObjType.newFromStruct(conn,struct);
                }
                rlist.add(element);
            }
        }
        return rlist;
    }

       

    public void getColumnCustomizations(
        DAOServices services,
        String userName,
        String applicationShortName,
        String screenDescription,
        String htmlTableDescription,
        java.util.List[] colCustTab)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxccs_il_caam_col_cust_pub.get_column_customizations(:1,:2,:3,:4,:5); end;");
            stmt.setString(1,userName);
            stmt.setString(2,applicationShortName);
            stmt.setString(3,screenDescription);
            stmt.setString(4,htmlTableDescription);
            stmt.registerOutParameter(5, OracleTypes.ARRAY,"APPS.XXCCS_CAAM_COL_CUST_TAB_TYPE");
            stmt.execute();
            ARRAY colCustTabArray=(ARRAY)stmt.getArray(5);
            colCustTab[0]=buildListFromOracleArray(services.getNativeConnection(conn),colCustTab[0],colCustTabArray,(com.cisco.mcm.genJava.XxccsCaamColCustObjType)null);

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    public void saveColumnCustomizations(
        DAOServices services,
        String userName,
        String applicationShortName,
        String screenDescription,
        String htmlTableDescription,
        java.util.List colCustTab)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxccs_il_caam_col_cust_pub.save_column_customizations(:1,:2,:3,:4,:5); end;");
            stmt.setString(1,userName);
            stmt.setString(2,applicationShortName);
            stmt.setString(3,screenDescription);
            stmt.setString(4,htmlTableDescription);
            stmt.setArray(5,buildOracleArrayFromList(services.getNativeConnection(conn),colCustTab,(com.cisco.mcm.genJava.XxccsCaamColCustObjType)null));
            stmt.execute();

        } finally  {
            try {
                ConnectionUtil.closeQuietly(stmt);
            } finally {
                services.returnConnection(conn);
            }
        }
    }


    public void restoreDefaultColcust(
        DAOServices services,
        String userName,
        String applicationShortName,
        String screenDescription,
        String htmlTableDescription,
        java.util.List[] colCustTab)
        throws SQLException,InstantiationException,IllegalAccessException {
        Connection conn=null;
        CallableStatement stmt=null;
        try {
            conn = services.borrowConnection();
            stmt = conn.prepareCall("begin xxccs_il_caam_col_cust_pub.restore_default_colcust(:1,:2,:3,:4,:5); end;");
            stmt.setString(1,userName);
            stmt.setString(2,applicationShortName);
            stmt.setString(3,screenDescription);
            stmt.setString(4,htmlTableDescription);
            stmt.registerOutParameter(5, OracleTypes.ARRAY,"APPS.XXCCS_CAAM_COL_CUST_TAB_TYPE");
            stmt.execute();
            ARRAY colCustTabArray=(ARRAY)stmt.getArray(5);
            colCustTab[0]=buildListFromOracleArray(services.getNativeConnection(conn),colCustTab[0],colCustTabArray,(com.cisco.mcm.genJava.XxccsCaamColCustObjType)null);

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
