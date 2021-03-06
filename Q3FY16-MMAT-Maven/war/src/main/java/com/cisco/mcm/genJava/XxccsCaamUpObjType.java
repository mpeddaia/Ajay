/*****************************************************************************
 * XxccsCaamUpObjType.java
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

 
public class XxccsCaamUpObjType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxccsCaamUpObjType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxccsCaamUpObjType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxccsCaamUpObjType) factoryClass.newInstance();
    }

public XxccsCaamUpObjType() {
        preferenceName=MISSING_CHAR;
        preferenceValue=MISSING_CHAR;
        preferenceDesc=MISSING_CHAR;
        preferenceAction=MISSING_CHAR;
        preferenceAttribute=MISSING_CHAR;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String preferenceName;
    private String preferenceValue;
    private String preferenceDesc;
    private String preferenceAction;
    private String preferenceAttribute;


    // getter methods
    public String getPreferenceName() {
        return preferenceName;
    }
    public String getPreferenceValue() {
        return preferenceValue;
    }
    public String getPreferenceDesc() {
        return preferenceDesc;
    }
    public String getPreferenceAction() {
        return preferenceAction;
    }
    public String getPreferenceAttribute() {
        return preferenceAttribute;
    }

    // setter methods                       
    public void setPreferenceName(String aPreferenceName) {
        preferenceName = aPreferenceName;
    }
    public void setPreferenceValue(String aPreferenceValue) {
        preferenceValue = aPreferenceValue;
    }
    public void setPreferenceDesc(String aPreferenceDesc) {
        preferenceDesc = aPreferenceDesc;
    }
    public void setPreferenceAction(String aPreferenceAction) {
        preferenceAction = aPreferenceAction;
    }
    public void setPreferenceAttribute(String aPreferenceAttribute) {
        preferenceAttribute = aPreferenceAttribute;
    }


    // other methods


    public XxccsCaamUpObjType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        preferenceName=(String)attributes[0];
        preferenceValue=(String)attributes[1];
        preferenceDesc=(String)attributes[2];
        preferenceAction=(String)attributes[3];
        preferenceAttribute=(String)attributes[4];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCCS_CAAM_UP_OBJ_TYPE",conn);
        Object[] attributes = new Object[]{
            ((preferenceName==null) ? null : new CHAR(preferenceName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((preferenceValue==null) ? null : new CHAR(preferenceValue,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((preferenceDesc==null) ? null : new CHAR(preferenceDesc,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((preferenceAction==null) ? null : new CHAR(preferenceAction,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((preferenceAttribute==null) ? null : new CHAR(preferenceAttribute,CharacterSet.make(CharacterSet.UTF8_CHARSET)))
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxccsCaamUpObjType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxccsCaamUpObjType newInstance=newInstance();
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
        sb.append("preferenceName=").append(preferenceName);
        sb.append(",preferenceValue=").append(preferenceValue);
        sb.append(",preferenceDesc=").append(preferenceDesc);
        sb.append(",preferenceAction=").append(preferenceAction);
        sb.append(",preferenceAttribute=").append(preferenceAttribute);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxccsCaamUpObjType theClone = (XxccsCaamUpObjType) super.clone();
        


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
        
        hashStringBuffer.append("preferenceName=").append(preferenceName);
        hashStringBuffer.append("preferenceValue=").append(preferenceValue);
        hashStringBuffer.append("preferenceDesc=").append(preferenceDesc);
        hashStringBuffer.append("preferenceAction=").append(preferenceAction);
        hashStringBuffer.append("preferenceAttribute=").append(preferenceAttribute);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
