/*****************************************************************************
 * XxccsCaamUserlistObjType.java
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

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.GregorianCalendar;

import oracle.sql.CHAR;
import oracle.sql.CharacterSet;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;


/* BEGIN PROTECT_BLOCK user_imports */
/* END PROTECT_BLOCK user_imports */

 
public class XxccsCaamUserlistObjType implements java.io.Serializable,Cloneable 
{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxccsCaamUserlistObjType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxccsCaamUserlistObjType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxccsCaamUserlistObjType) factoryClass.newInstance();
    }

public XxccsCaamUserlistObjType() {
        userName=MISSING_CHAR;
        userType=MISSING_CHAR;
        startDate=MISSING_DATE;
        endDate=MISSING_DATE;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String userName;
    private String userType;
    private Timestamp startDate;
    private Timestamp endDate;


    // getter methods
    public String getUserName() {
        return userName;
    }
    public String getUserType() {
        return userType;
    }
    public Timestamp getStartDate() {
        return startDate;
    }
    public Timestamp getEndDate() {
        return endDate;
    }

    // setter methods                       
    public void setUserName(String aUserName) {
        userName = aUserName;
    }
    public void setUserType(String aUserType) {
        userType = aUserType;
    }
    public void setStartDate(Timestamp aStartDate) {
        startDate = aStartDate;
    }
    public void setEndDate(Timestamp aEndDate) {
        endDate = aEndDate;
    }


    // other methods


    public XxccsCaamUserlistObjType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        userName=(String)attributes[0];
        userType=(String)attributes[1];
        startDate=(Timestamp)attributes[2];
        endDate=(Timestamp)attributes[3];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCCS_CAAM_USERLIST_OBJ_TYPE",conn);
        Object[] attributes = new Object[]{
            ((userName==null) ? null : new CHAR(userName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((userType==null) ? null : new CHAR(userType,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            startDate,
            endDate
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxccsCaamUserlistObjType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxccsCaamUserlistObjType newInstance=newInstance();
        newInstance.loadFromStruct(conn,struct);
/* BEGIN PROTECT_BLOCK user_new_from_struct_code */
/* END PROTECT_BLOCK user_new_from_struct_code */

        return newInstance;
    }
    
    public String toString() {
        StringBuffer toStringBuffer = new StringBuffer();
        toStringBuffer.append(getClass());
        toStringBuffer.append("@");
        toStringBuffer.append(super.hashCode());
        toStringBuffer.append("[");
        this.appendToStringAttributes(toStringBuffer);
        toStringBuffer.append("]");
        return toStringBuffer.toString();
    }     

    protected void appendToStringAttributes(StringBuffer sb) {
        sb.append("userName=").append(userName);
        sb.append(",userType=").append(userType);
        sb.append(",startDate=").append(startDate);
        sb.append(",endDate=").append(endDate);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxccsCaamUserlistObjType theClone = (XxccsCaamUserlistObjType) super.clone();
        


        return theClone;
    }
    
    public boolean equals(Object obj) {
        boolean retVal = false;
        if (obj != null) {
            retVal = (hashCode()==obj.hashCode());   
        }
        return retVal; 
    }
    
    public int hashCode() {
        StringBuffer hashStringBuffer = new StringBuffer();
        
        hashStringBuffer.append("userName=").append(userName);
        hashStringBuffer.append("userType=").append(userType);
        hashStringBuffer.append("startDate=").append(startDate);
        hashStringBuffer.append("endDate=").append(endDate);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
