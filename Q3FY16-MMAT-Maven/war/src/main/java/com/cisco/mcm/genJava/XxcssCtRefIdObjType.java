/*****************************************************************************
 * XxcssCtRefIdObjType.java
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

 
public class XxcssCtRefIdObjType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxcssCtRefIdObjType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxcssCtRefIdObjType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxcssCtRefIdObjType) factoryClass.newInstance();
    }

public XxcssCtRefIdObjType() {
        referenceId=MISSING_CHAR;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String referenceId;


    // getter methods
    public String getReferenceId() {
        return referenceId;
    }

    // setter methods                       
    public void setReferenceId(String aReferenceId) {
        referenceId = aReferenceId;
    }


    // other methods


    public XxcssCtRefIdObjType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        referenceId=(String)attributes[0];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCSS_CT_REF_ID_OBJ_TYPE",conn);
        Object[] attributes = new Object[]{
            ((referenceId==null) ? null : new CHAR(referenceId,CharacterSet.make(CharacterSet.UTF8_CHARSET)))
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxcssCtRefIdObjType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxcssCtRefIdObjType newInstance=newInstance();
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
        sb.append("referenceId=").append(referenceId);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxcssCtRefIdObjType theClone = (XxcssCtRefIdObjType) super.clone();
        


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
        
        hashStringBuffer.append("referenceId=").append(referenceId);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}