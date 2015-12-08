/*****************************************************************************
 * XxcssSsfUpldParmObjType.java
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

import oracle.sql.*;
import java.sql.*;
import java.math.BigDecimal;
import java.util.*;


/* BEGIN PROTECT_BLOCK user_imports */
/* END PROTECT_BLOCK user_imports */

 
public class XxcssSsfUpldParmObjType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxcssSsfUpldParmObjType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxcssSsfUpldParmObjType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxcssSsfUpldParmObjType) factoryClass.newInstance();
    }

public XxcssSsfUpldParmObjType() {
        upldRequestParmId=MISSING_NUM;
        upldRequestId=MISSING_NUM;
        parmOrder=MISSING_NUM;
        parmName=MISSING_CHAR;
        parmValue=MISSING_CHAR;
        attributeN1=MISSING_NUM;
        attributeN2=MISSING_NUM;
        attributeN3=MISSING_NUM;
        attributeN4=MISSING_NUM;
        attributeN5=MISSING_NUM;
        attributeC1=MISSING_CHAR;
        attributeC2=MISSING_CHAR;
        attributeC3=MISSING_CHAR;
        attributeC4=MISSING_CHAR;
        attributeC5=MISSING_CHAR;
        createdBy=MISSING_CHAR;
        createdDate=MISSING_DATE;
        updatedBy=MISSING_CHAR;
        updatedDate=MISSING_DATE;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private BigDecimal upldRequestParmId;
    private BigDecimal upldRequestId;
    private BigDecimal parmOrder;
    private String parmName;
    private String parmValue;
    private BigDecimal attributeN1;
    private BigDecimal attributeN2;
    private BigDecimal attributeN3;
    private BigDecimal attributeN4;
    private BigDecimal attributeN5;
    private String attributeC1;
    private String attributeC2;
    private String attributeC3;
    private String attributeC4;
    private String attributeC5;
    private String createdBy;
    private Timestamp createdDate;
    private String updatedBy;
    private Timestamp updatedDate;


    // getter methods
    public BigDecimal getUpldRequestParmId() {
        return upldRequestParmId;
    }
    public BigDecimal getUpldRequestId() {
        return upldRequestId;
    }
    public BigDecimal getParmOrder() {
        return parmOrder;
    }
    public String getParmName() {
        return parmName;
    }
    public String getParmValue() {
        return parmValue;
    }
    public BigDecimal getAttributeN1() {
        return attributeN1;
    }
    public BigDecimal getAttributeN2() {
        return attributeN2;
    }
    public BigDecimal getAttributeN3() {
        return attributeN3;
    }
    public BigDecimal getAttributeN4() {
        return attributeN4;
    }
    public BigDecimal getAttributeN5() {
        return attributeN5;
    }
    public String getAttributeC1() {
        return attributeC1;
    }
    public String getAttributeC2() {
        return attributeC2;
    }
    public String getAttributeC3() {
        return attributeC3;
    }
    public String getAttributeC4() {
        return attributeC4;
    }
    public String getAttributeC5() {
        return attributeC5;
    }
    public String getCreatedBy() {
        return createdBy;
    }
    public Timestamp getCreatedDate() {
        return createdDate;
    }
    public String getUpdatedBy() {
        return updatedBy;
    }
    public Timestamp getUpdatedDate() {
        return updatedDate;
    }

    // setter methods                       
    public void setUpldRequestParmId(BigDecimal aUpldRequestParmId) {
        upldRequestParmId = aUpldRequestParmId;
    }
    public void setUpldRequestId(BigDecimal aUpldRequestId) {
        upldRequestId = aUpldRequestId;
    }
    public void setParmOrder(BigDecimal aParmOrder) {
        parmOrder = aParmOrder;
    }
    public void setParmName(String aParmName) {
        parmName = aParmName;
    }
    public void setParmValue(String aParmValue) {
        parmValue = aParmValue;
    }
    public void setAttributeN1(BigDecimal aAttributeN1) {
        attributeN1 = aAttributeN1;
    }
    public void setAttributeN2(BigDecimal aAttributeN2) {
        attributeN2 = aAttributeN2;
    }
    public void setAttributeN3(BigDecimal aAttributeN3) {
        attributeN3 = aAttributeN3;
    }
    public void setAttributeN4(BigDecimal aAttributeN4) {
        attributeN4 = aAttributeN4;
    }
    public void setAttributeN5(BigDecimal aAttributeN5) {
        attributeN5 = aAttributeN5;
    }
    public void setAttributeC1(String aAttributeC1) {
        attributeC1 = aAttributeC1;
    }
    public void setAttributeC2(String aAttributeC2) {
        attributeC2 = aAttributeC2;
    }
    public void setAttributeC3(String aAttributeC3) {
        attributeC3 = aAttributeC3;
    }
    public void setAttributeC4(String aAttributeC4) {
        attributeC4 = aAttributeC4;
    }
    public void setAttributeC5(String aAttributeC5) {
        attributeC5 = aAttributeC5;
    }
    public void setCreatedBy(String aCreatedBy) {
        createdBy = aCreatedBy;
    }
    public void setCreatedDate(Timestamp aCreatedDate) {
        createdDate = aCreatedDate;
    }
    public void setUpdatedBy(String aUpdatedBy) {
        updatedBy = aUpdatedBy;
    }
    public void setUpdatedDate(Timestamp aUpdatedDate) {
        updatedDate = aUpdatedDate;
    }


    // other methods


    public XxcssSsfUpldParmObjType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        upldRequestParmId=(BigDecimal)attributes[0];
        upldRequestId=(BigDecimal)attributes[1];
        parmOrder=(BigDecimal)attributes[2];
        parmName=(String)attributes[3];
        parmValue=(String)attributes[4];
        attributeN1=(BigDecimal)attributes[5];
        attributeN2=(BigDecimal)attributes[6];
        attributeN3=(BigDecimal)attributes[7];
        attributeN4=(BigDecimal)attributes[8];
        attributeN5=(BigDecimal)attributes[9];
        attributeC1=(String)attributes[10];
        attributeC2=(String)attributes[11];
        attributeC3=(String)attributes[12];
        attributeC4=(String)attributes[13];
        attributeC5=(String)attributes[14];
        createdBy=(String)attributes[15];
        createdDate=(Timestamp)attributes[16];
        updatedBy=(String)attributes[17];
        updatedDate=(Timestamp)attributes[18];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCSS_SSF_UPLD_PARM_OBJ_TYPE",conn);
        Object[] attributes = new Object[]{
            upldRequestParmId,
            upldRequestId,
            parmOrder,
            ((parmName==null) ? null : new CHAR(parmName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((parmValue==null) ? null : new CHAR(parmValue,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            attributeN1,
            attributeN2,
            attributeN3,
            attributeN4,
            attributeN5,
            ((attributeC1==null) ? null : new CHAR(attributeC1,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((attributeC2==null) ? null : new CHAR(attributeC2,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((attributeC3==null) ? null : new CHAR(attributeC3,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((attributeC4==null) ? null : new CHAR(attributeC4,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((attributeC5==null) ? null : new CHAR(attributeC5,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((createdBy==null) ? null : new CHAR(createdBy,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            createdDate,
            ((updatedBy==null) ? null : new CHAR(updatedBy,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            updatedDate
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxcssSsfUpldParmObjType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxcssSsfUpldParmObjType newInstance=newInstance();
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
        sb.append("upldRequestParmId=").append(upldRequestParmId);
        sb.append(",upldRequestId=").append(upldRequestId);
        sb.append(",parmOrder=").append(parmOrder);
        sb.append(",parmName=").append(parmName);
        sb.append(",parmValue=").append(parmValue);
        sb.append(",attributeN1=").append(attributeN1);
        sb.append(",attributeN2=").append(attributeN2);
        sb.append(",attributeN3=").append(attributeN3);
        sb.append(",attributeN4=").append(attributeN4);
        sb.append(",attributeN5=").append(attributeN5);
        sb.append(",attributeC1=").append(attributeC1);
        sb.append(",attributeC2=").append(attributeC2);
        sb.append(",attributeC3=").append(attributeC3);
        sb.append(",attributeC4=").append(attributeC4);
        sb.append(",attributeC5=").append(attributeC5);
        sb.append(",createdBy=").append(createdBy);
        sb.append(",createdDate=").append(createdDate);
        sb.append(",updatedBy=").append(updatedBy);
        sb.append(",updatedDate=").append(updatedDate);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxcssSsfUpldParmObjType theClone = (XxcssSsfUpldParmObjType) super.clone();
        


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
        
        hashStringBuffer.append("upldRequestParmId=").append(upldRequestParmId);
        hashStringBuffer.append("upldRequestId=").append(upldRequestId);
        hashStringBuffer.append("parmOrder=").append(parmOrder);
        hashStringBuffer.append("parmName=").append(parmName);
        hashStringBuffer.append("parmValue=").append(parmValue);
        hashStringBuffer.append("attributeN1=").append(attributeN1);
        hashStringBuffer.append("attributeN2=").append(attributeN2);
        hashStringBuffer.append("attributeN3=").append(attributeN3);
        hashStringBuffer.append("attributeN4=").append(attributeN4);
        hashStringBuffer.append("attributeN5=").append(attributeN5);
        hashStringBuffer.append("attributeC1=").append(attributeC1);
        hashStringBuffer.append("attributeC2=").append(attributeC2);
        hashStringBuffer.append("attributeC3=").append(attributeC3);
        hashStringBuffer.append("attributeC4=").append(attributeC4);
        hashStringBuffer.append("attributeC5=").append(attributeC5);
        hashStringBuffer.append("createdBy=").append(createdBy);
        hashStringBuffer.append("createdDate=").append(createdDate);
        hashStringBuffer.append("updatedBy=").append(updatedBy);
        hashStringBuffer.append("updatedDate=").append(updatedDate);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
