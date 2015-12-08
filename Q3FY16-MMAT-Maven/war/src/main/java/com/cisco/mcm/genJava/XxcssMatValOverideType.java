/*****************************************************************************
 * XxcssMatValOverideType.java
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
import java.util.GregorianCalendar;

import oracle.sql.CHAR;
import oracle.sql.CharacterSet;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;


/* BEGIN PROTECT_BLOCK user_imports */
/* END PROTECT_BLOCK user_imports */

 
public class XxcssMatValOverideType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxcssMatValOverideType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxcssMatValOverideType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxcssMatValOverideType) factoryClass.newInstance();
    }

public XxcssMatValOverideType() {
        upldDefinitionName=MISSING_CHAR;
        bizValidationCode=MISSING_CHAR;
        bizValidationDesc=MISSING_CHAR;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String upldDefinitionName;
    private String bizValidationCode;
    private String bizValidationDesc;


    // getter methods
    public String getUpldDefinitionName() {
        return upldDefinitionName;
    }
    public String getBizValidationCode() {
        return bizValidationCode;
    }
    public String getBizValidationDesc() {
        return bizValidationDesc;
    }

    // setter methods                       
    public void setUpldDefinitionName(String aUpldDefinitionName) {
        upldDefinitionName = aUpldDefinitionName;
    }
    public void setBizValidationCode(String aBizValidationCode) {
        bizValidationCode = aBizValidationCode;
    }
    public void setBizValidationDesc(String aBizValidationDesc) {
        bizValidationDesc = aBizValidationDesc;
    }


    // other methods


    public XxcssMatValOverideType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        upldDefinitionName=(String)attributes[0];
        bizValidationCode=(String)attributes[1];
        bizValidationDesc=(String)attributes[2];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCSS_MAT_VAL_OVERIDE_TYPE",conn);
        Object[] attributes = new Object[]{
            ((upldDefinitionName==null) ? null : new CHAR(upldDefinitionName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((bizValidationCode==null) ? null : new CHAR(bizValidationCode,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((bizValidationDesc==null) ? null : new CHAR(bizValidationDesc,CharacterSet.make(CharacterSet.UTF8_CHARSET)))
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxcssMatValOverideType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxcssMatValOverideType newInstance=newInstance();
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
        sb.append("upldDefinitionName=").append(upldDefinitionName);
        sb.append(",bizValidationCode=").append(bizValidationCode);
        sb.append(",bizValidationDesc=").append(bizValidationDesc);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxcssMatValOverideType theClone = (XxcssMatValOverideType) super.clone();
        


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
        
        hashStringBuffer.append("upldDefinitionName=").append(upldDefinitionName);
        hashStringBuffer.append("bizValidationCode=").append(bizValidationCode);
        hashStringBuffer.append("bizValidationDesc=").append(bizValidationDesc);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
