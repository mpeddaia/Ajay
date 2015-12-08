/*****************************************************************************
 * XxccsCaamColCustObjType.java
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

 
public class XxccsCaamColCustObjType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxccsCaamColCustObjType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxccsCaamColCustObjType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxccsCaamColCustObjType) factoryClass.newInstance();
    }

public XxccsCaamColCustObjType() {
        columnDescription=MISSING_CHAR;
        columnSequence=MISSING_CHAR;
        hardCoded=MISSING_CHAR;
        selected=MISSING_CHAR;
        attributeN1=MISSING_NUM;
        attributeC1=MISSING_CHAR;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String columnDescription;
    private String columnSequence;
    private String hardCoded;
    private String selected;
    private BigDecimal attributeN1;
    private String attributeC1;


    // getter methods
    public String getColumnDescription() {
        return columnDescription;
    }
    public String getColumnSequence() {
        return columnSequence;
    }
    public String getHardCoded() {
        return hardCoded;
    }
    public String getSelected() {
        return selected;
    }
    public BigDecimal getAttributeN1() {
        return attributeN1;
    }
    public String getAttributeC1() {
        return attributeC1;
    }

    // setter methods                       
    public void setColumnDescription(String aColumnDescription) {
        columnDescription = aColumnDescription;
    }
    public void setColumnSequence(String aColumnSequence) {
        columnSequence = aColumnSequence;
    }
    public void setHardCoded(String aHardCoded) {
        hardCoded = aHardCoded;
    }
    public void setSelected(String aSelected) {
        selected = aSelected;
    }
    public void setAttributeN1(BigDecimal aAttributeN1) {
        attributeN1 = aAttributeN1;
    }
    public void setAttributeC1(String aAttributeC1) {
        attributeC1 = aAttributeC1;
    }


    // other methods


    public XxccsCaamColCustObjType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        columnDescription=(String)attributes[0];
        columnSequence=(String)attributes[1];
        hardCoded=(String)attributes[2];
        selected=(String)attributes[3];
        attributeN1=(BigDecimal)attributes[4];
        attributeC1=(String)attributes[5];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCCS_CAAM_COL_CUST_OBJ_TYPE",conn);
        Object[] attributes = new Object[]{
            ((columnDescription==null) ? null : new CHAR(columnDescription,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((columnSequence==null) ? null : new CHAR(columnSequence,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((hardCoded==null) ? null : new CHAR(hardCoded,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((selected==null) ? null : new CHAR(selected,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            attributeN1,
            ((attributeC1==null) ? null : new CHAR(attributeC1,CharacterSet.make(CharacterSet.UTF8_CHARSET)))
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxccsCaamColCustObjType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxccsCaamColCustObjType newInstance=newInstance();
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
        sb.append("columnDescription=").append(columnDescription);
        sb.append(",columnSequence=").append(columnSequence);
        sb.append(",hardCoded=").append(hardCoded);
        sb.append(",selected=").append(selected);
        sb.append(",attributeN1=").append(attributeN1);
        sb.append(",attributeC1=").append(attributeC1);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxccsCaamColCustObjType theClone = (XxccsCaamColCustObjType) super.clone();
        


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
        
        hashStringBuffer.append("columnDescription=").append(columnDescription);
        hashStringBuffer.append("columnSequence=").append(columnSequence);
        hashStringBuffer.append("hardCoded=").append(hardCoded);
        hashStringBuffer.append("selected=").append(selected);
        hashStringBuffer.append("attributeN1=").append(attributeN1);
        hashStringBuffer.append("attributeC1=").append(attributeC1);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}