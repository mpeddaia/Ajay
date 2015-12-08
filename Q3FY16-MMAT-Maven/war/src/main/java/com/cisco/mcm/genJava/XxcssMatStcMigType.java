/*****************************************************************************
 * XxcssMatStcMigType.java
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

 
public class XxcssMatStcMigType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxcssMatStcMigType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxcssMatStcMigType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxcssMatStcMigType) factoryClass.newInstance();
    }

public XxcssMatStcMigType() {
        contractNumber=MISSING_CHAR;
        
        contractStatus=MISSING_CHAR;
        stcMigCompleted=MISSING_CHAR;
        customerName=MISSING_CHAR;
        oldCustomerId=MISSING_CHAR;
        newCustomerId=MISSING_CHAR;
        oldBusinessEntity=MISSING_CHAR;
        newBusinessEntity=MISSING_CHAR;
        billToAddress=MISSING_CHAR;
        billToCity=MISSING_CHAR;
        billToCountry=MISSING_CHAR;
        oldBillToSiteId=MISSING_CHAR;
        newBillToSiteId=MISSING_CHAR;
        sourceContractNumber=MISSING_CHAR;
        contractMigrationType=MISSING_CHAR;
/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private String contractNumber;
    private String contractStatus;
    private String stcMigCompleted;
    private String customerName;
    private String oldCustomerId;
    private String newCustomerId;
    private String oldBusinessEntity;
    private String newBusinessEntity;
    private String billToAddress;
    private String billToCity;
    private String billToCountry;
    private String oldBillToSiteId;
    private String newBillToSiteId;
    
    //changes for Q2FY14 Split Contracts CR by sarhv
    private String sourceContractNumber;
    private String contractMigrationType;

    // getter methods
    
    public String getSourceContractNumber() {
		return sourceContractNumber;
	}

    public String getContractMigrationType() {
		return contractMigrationType;
	}

	
    public String getContractNumber() {
        return contractNumber;
    }
    public String getContractStatus() {
        return contractStatus;
    }
    public String getStcMigCompleted() {
        return stcMigCompleted;
    }
    public String getCustomerName() {
        return customerName;
    }
    public String getOldCustomerId() {
        return oldCustomerId;
    }
    public String getNewCustomerId() {
        return newCustomerId;
    }
    public String getOldBusinessEntity() {
        return oldBusinessEntity;
    }
    public String getNewBusinessEntity() {
        return newBusinessEntity;
    }
    public String getBillToAddress() {
        return billToAddress;
    }
    public String getBillToCity() {
        return billToCity;
    }
    public String getBillToCountry() {
        return billToCountry;
    }
    public String getOldBillToSiteId() {
        return oldBillToSiteId;
    }
    public String getNewBillToSiteId() {
        return newBillToSiteId;
    }

    // setter methods                       
    public void setContractNumber(String aContractNumber) {
        contractNumber = aContractNumber;
    }
    //added by sarhv for Q2FY14 split contracts
    public void setSourceContractNumber(String aSourceContractNumber) {
		this.sourceContractNumber = aSourceContractNumber;
	}
    public void setContractMigrationType(String aContractMigrationType) {
		this.contractMigrationType = aContractMigrationType;
	}
    public void setContractStatus(String aContractStatus) {
        contractStatus = aContractStatus;
    }
    public void setStcMigCompleted(String aStcMigCompleted) {
        stcMigCompleted = aStcMigCompleted;
    }
    public void setCustomerName(String aCustomerName) {
        customerName = aCustomerName;
    }
    public void setOldCustomerId(String aOldCustomerId) {
        oldCustomerId = aOldCustomerId;
    }
    public void setNewCustomerId(String aNewCustomerId) {
        newCustomerId = aNewCustomerId;
    }
    public void setOldBusinessEntity(String aOldBusinessEntity) {
        oldBusinessEntity = aOldBusinessEntity;
    }
    public void setNewBusinessEntity(String aNewBusinessEntity) {
        newBusinessEntity = aNewBusinessEntity;
    }
    public void setBillToAddress(String aBillToAddress) {
        billToAddress = aBillToAddress;
    }
    public void setBillToCity(String aBillToCity) {
        billToCity = aBillToCity;
    }
    public void setBillToCountry(String aBillToCountry) {
        billToCountry = aBillToCountry;
    }
    public void setOldBillToSiteId(String aOldBillToSiteId) {
        oldBillToSiteId = aOldBillToSiteId;
    }
    public void setNewBillToSiteId(String aNewBillToSiteId) {
        newBillToSiteId = aNewBillToSiteId;
    }


    // other methods


    public XxcssMatStcMigType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        
        contractNumber=(String)attributes[0];
        contractStatus=(String)attributes[1];
        stcMigCompleted=(String)attributes[2];
        customerName=(String)attributes[3];
        oldCustomerId=(String)attributes[4];
        newCustomerId=(String)attributes[5];
        oldBusinessEntity=(String)attributes[6];
        newBusinessEntity=(String)attributes[7];
        billToAddress=(String)attributes[8];
        billToCity=(String)attributes[9];
        billToCountry=(String)attributes[10];
        oldBillToSiteId=(String)attributes[11];
        newBillToSiteId=(String)attributes[12];
        sourceContractNumber=(String)attributes[13];
        contractMigrationType=(String)attributes[14];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCSS_MAT_STC_MIG_TYPE",conn);
        Object[] attributes = new Object[]{
            ((contractNumber==null) ? null : new CHAR(contractNumber,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((contractStatus==null) ? null : new CHAR(contractStatus,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((stcMigCompleted==null) ? null : new CHAR(stcMigCompleted,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((customerName==null) ? null : new CHAR(customerName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((oldCustomerId==null) ? null : new CHAR(oldCustomerId,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((newCustomerId==null) ? null : new CHAR(newCustomerId,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((oldBusinessEntity==null) ? null : new CHAR(oldBusinessEntity,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((newBusinessEntity==null) ? null : new CHAR(newBusinessEntity,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((billToAddress==null) ? null : new CHAR(billToAddress,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((billToCity==null) ? null : new CHAR(billToCity,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((billToCountry==null) ? null : new CHAR(billToCountry,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((oldBillToSiteId==null) ? null : new CHAR(oldBillToSiteId,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((newBillToSiteId==null) ? null : new CHAR(newBillToSiteId,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((sourceContractNumber==null) ? null : new CHAR(sourceContractNumber,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((contractMigrationType==null) ? null : new CHAR(contractMigrationType,CharacterSet.make(CharacterSet.UTF8_CHARSET)))
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxcssMatStcMigType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxcssMatStcMigType newInstance=newInstance();
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
    	
        sb.append("contractNumber=").append(contractNumber);
        sb.append(",contractStatus=").append(contractStatus);
        sb.append(",stcMigCompleted=").append(stcMigCompleted);
        sb.append(",customerName=").append(customerName);
        sb.append(",oldCustomerId=").append(oldCustomerId);
        sb.append(",newCustomerId=").append(newCustomerId);
        sb.append(",oldBusinessEntity=").append(oldBusinessEntity);
        sb.append(",newBusinessEntity=").append(newBusinessEntity);
        sb.append(",billToAddress=").append(billToAddress);
        sb.append(",billToCity=").append(billToCity);
        sb.append(",billToCountry=").append(billToCountry);
        sb.append(",oldBillToSiteId=").append(oldBillToSiteId);
        sb.append(",newBillToSiteId=").append(newBillToSiteId);
        sb.append(",sourceContractNumber=").append(sourceContractNumber);
        sb.append(",contractMigrationType=").append(contractMigrationType);
        

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxcssMatStcMigType theClone = (XxcssMatStcMigType) super.clone();
        


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
        
        hashStringBuffer.append("contractNumber=").append(contractNumber);
        hashStringBuffer.append("contractStatus=").append(contractStatus);
        hashStringBuffer.append("stcMigCompleted=").append(stcMigCompleted);
        hashStringBuffer.append("customerName=").append(customerName);
        hashStringBuffer.append("oldCustomerId=").append(oldCustomerId);
        hashStringBuffer.append("newCustomerId=").append(newCustomerId);
        hashStringBuffer.append("oldBusinessEntity=").append(oldBusinessEntity);
        hashStringBuffer.append("newBusinessEntity=").append(newBusinessEntity);
        hashStringBuffer.append("billToAddress=").append(billToAddress);
        hashStringBuffer.append("billToCity=").append(billToCity);
        hashStringBuffer.append("billToCountry=").append(billToCountry);
        hashStringBuffer.append("oldBillToSiteId=").append(oldBillToSiteId);
        hashStringBuffer.append("newBillToSiteId=").append(newBillToSiteId);
        hashStringBuffer.append("sourceContractNumber=").append(sourceContractNumber);
        hashStringBuffer.append("contractMigrationType=").append(contractMigrationType);
       

        return hashStringBuffer.toString().hashCode();
    }

	
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}
