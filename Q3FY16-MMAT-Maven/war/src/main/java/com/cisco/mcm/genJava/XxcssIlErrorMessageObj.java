/*****************************************************************************
 * XxcssIlErrorMessageObj.java
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

 
public class XxcssIlErrorMessageObj 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxcssIlErrorMessageObj.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxcssIlErrorMessageObj newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxcssIlErrorMessageObj) factoryClass.newInstance();
    }

public XxcssIlErrorMessageObj() {
        errorRef=MISSING_CHAR;
        errorCode=MISSING_CHAR;
        errorType=MISSING_CHAR;
        errorMessage=MISSING_CHAR;
        suggestedAction=MISSING_CHAR;
        applicationShortName=MISSING_CHAR;
        languageCode=MISSING_CHAR;
        messageNumber=MISSING_NUM;
        type=MISSING_CHAR;
        description=MISSING_CHAR;
        category=MISSING_CHAR;
        fndLogSeverity=MISSING_NUM;
        fndLogSeverityDescription=MISSING_CHAR;
        logAttribute=MISSING_CHAR;
        categoryDetail=MISSING_CHAR;
        severityDetail=MISSING_CHAR;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String errorRef;
    private String errorCode;
    private String errorType;
    private String errorMessage;
    private String suggestedAction;
    private String applicationShortName;
    private String languageCode;
    private BigDecimal messageNumber;
    private String type;
    private String description;
    private String category;
    private BigDecimal fndLogSeverity;
    private String fndLogSeverityDescription;
    private String logAttribute;
    private String categoryDetail;
    private String severityDetail;


    // getter methods
    public String getErrorRef() {
        return errorRef;
    }
    public String getErrorCode() {
        return errorCode;
    }
    public String getErrorType() {
        return errorType;
    }
    public String getErrorMessage() {
        return errorMessage;
    }
    public String getSuggestedAction() {
        return suggestedAction;
    }
    public String getApplicationShortName() {
        return applicationShortName;
    }
    public String getLanguageCode() {
        return languageCode;
    }
    public BigDecimal getMessageNumber() {
        return messageNumber;
    }
    public String getType() {
        return type;
    }
    public String getDescription() {
        return description;
    }
    public String getCategory() {
        return category;
    }
    public BigDecimal getFndLogSeverity() {
        return fndLogSeverity;
    }
    public String getFndLogSeverityDescription() {
        return fndLogSeverityDescription;
    }
    public String getLogAttribute() {
        return logAttribute;
    }
    public String getCategoryDetail() {
        return categoryDetail;
    }
    public String getSeverityDetail() {
        return severityDetail;
    }

    // setter methods                       
    public void setErrorRef(String aErrorRef) {
        errorRef = aErrorRef;
    }
    public void setErrorCode(String aErrorCode) {
        errorCode = aErrorCode;
    }
    public void setErrorType(String aErrorType) {
        errorType = aErrorType;
    }
    public void setErrorMessage(String aErrorMessage) {
        errorMessage = aErrorMessage;
    }
    public void setSuggestedAction(String aSuggestedAction) {
        suggestedAction = aSuggestedAction;
    }
    public void setApplicationShortName(String aApplicationShortName) {
        applicationShortName = aApplicationShortName;
    }
    public void setLanguageCode(String aLanguageCode) {
        languageCode = aLanguageCode;
    }
    public void setMessageNumber(BigDecimal aMessageNumber) {
        messageNumber = aMessageNumber;
    }
    public void setType(String aType) {
        type = aType;
    }
    public void setDescription(String aDescription) {
        description = aDescription;
    }
    public void setCategory(String aCategory) {
        category = aCategory;
    }
    public void setFndLogSeverity(BigDecimal aFndLogSeverity) {
        fndLogSeverity = aFndLogSeverity;
    }
    public void setFndLogSeverityDescription(String aFndLogSeverityDescription) {
        fndLogSeverityDescription = aFndLogSeverityDescription;
    }
    public void setLogAttribute(String aLogAttribute) {
        logAttribute = aLogAttribute;
    }
    public void setCategoryDetail(String aCategoryDetail) {
        categoryDetail = aCategoryDetail;
    }
    public void setSeverityDetail(String aSeverityDetail) {
        severityDetail = aSeverityDetail;
    }


    // other methods


    public XxcssIlErrorMessageObj loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        errorRef=(String)attributes[0];
        errorCode=(String)attributes[1];
        errorType=(String)attributes[2];
        errorMessage=(String)attributes[3];
        suggestedAction=(String)attributes[4];
        applicationShortName=(String)attributes[5];
        languageCode=(String)attributes[6];
        messageNumber=(BigDecimal)attributes[7];
        type=(String)attributes[8];
        description=(String)attributes[9];
        category=(String)attributes[10];
        fndLogSeverity=(BigDecimal)attributes[11];
        fndLogSeverityDescription=(String)attributes[12];
        logAttribute=(String)attributes[13];
        categoryDetail=(String)attributes[14];
        severityDetail=(String)attributes[15];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCSS_IL_ERROR_MESSAGE_OBJ",conn);
        Object[] attributes = new Object[]{
            ((errorRef==null) ? null : new CHAR(errorRef,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((errorCode==null) ? null : new CHAR(errorCode,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((errorType==null) ? null : new CHAR(errorType,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((errorMessage==null) ? null : new CHAR(errorMessage,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((suggestedAction==null) ? null : new CHAR(suggestedAction,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((applicationShortName==null) ? null : new CHAR(applicationShortName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((languageCode==null) ? null : new CHAR(languageCode,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            messageNumber,
            ((type==null) ? null : new CHAR(type,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((description==null) ? null : new CHAR(description,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((category==null) ? null : new CHAR(category,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            fndLogSeverity,
            ((fndLogSeverityDescription==null) ? null : new CHAR(fndLogSeverityDescription,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((logAttribute==null) ? null : new CHAR(logAttribute,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((categoryDetail==null) ? null : new CHAR(categoryDetail,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((severityDetail==null) ? null : new CHAR(severityDetail,CharacterSet.make(CharacterSet.UTF8_CHARSET)))
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxcssIlErrorMessageObj newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxcssIlErrorMessageObj newInstance=newInstance();
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
        sb.append("errorRef=").append(errorRef);
        sb.append(",errorCode=").append(errorCode);
        sb.append(",errorType=").append(errorType);
        sb.append(",errorMessage=").append(errorMessage);
        sb.append(",suggestedAction=").append(suggestedAction);
        sb.append(",applicationShortName=").append(applicationShortName);
        sb.append(",languageCode=").append(languageCode);
        sb.append(",messageNumber=").append(messageNumber);
        sb.append(",type=").append(type);
        sb.append(",description=").append(description);
        sb.append(",category=").append(category);
        sb.append(",fndLogSeverity=").append(fndLogSeverity);
        sb.append(",fndLogSeverityDescription=").append(fndLogSeverityDescription);
        sb.append(",logAttribute=").append(logAttribute);
        sb.append(",categoryDetail=").append(categoryDetail);
        sb.append(",severityDetail=").append(severityDetail);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxcssIlErrorMessageObj theClone = (XxcssIlErrorMessageObj) super.clone();
        


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
        
        hashStringBuffer.append("errorRef=").append(errorRef);
        hashStringBuffer.append("errorCode=").append(errorCode);
        hashStringBuffer.append("errorType=").append(errorType);
        hashStringBuffer.append("errorMessage=").append(errorMessage);
        hashStringBuffer.append("suggestedAction=").append(suggestedAction);
        hashStringBuffer.append("applicationShortName=").append(applicationShortName);
        hashStringBuffer.append("languageCode=").append(languageCode);
        hashStringBuffer.append("messageNumber=").append(messageNumber);
        hashStringBuffer.append("type=").append(type);
        hashStringBuffer.append("description=").append(description);
        hashStringBuffer.append("category=").append(category);
        hashStringBuffer.append("fndLogSeverity=").append(fndLogSeverity);
        hashStringBuffer.append("fndLogSeverityDescription=").append(fndLogSeverityDescription);
        hashStringBuffer.append("logAttribute=").append(logAttribute);
        hashStringBuffer.append("categoryDetail=").append(categoryDetail);
        hashStringBuffer.append("severityDetail=").append(severityDetail);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
