/*****************************************************************************
 * XxcssMatAddRecType.java
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

 
public class XxcssMatAddRecType 
/* BEGIN PROTECT_BLOCK user_extends */
/* END PROTECT_BLOCK user_extends */

implements java.io.Serializable,Cloneable 
/* BEGIN PROTECT_BLOCK user_implements */
/* END PROTECT_BLOCK user_implements */

{



    public static java.sql.Timestamp MISSING_DATE;
    public static final BigDecimal MISSING_NUM=new BigDecimal("9.99E125");
    public static final String MISSING_CHAR=new String(new byte[]{0});
    public static Class factoryClass = XxcssMatAddRecType.class;

    static {     
        GregorianCalendar gc = new GregorianCalendar(4713,0,1);
        gc.set(GregorianCalendar.ERA,GregorianCalendar.BC);
        java.util.Date d=gc.getTime();
        MISSING_DATE=new java.sql.Timestamp(d.getTime());
    };

    public static void setFactoryClass(Class aFactoryClass) {
        factoryClass = aFactoryClass;
    }
    
    public static XxcssMatAddRecType newInstance()
        throws InstantiationException, IllegalAccessException {
        return (XxcssMatAddRecType) factoryClass.newInstance();
    }

public XxcssMatAddRecType() {
        instanceId=MISSING_NUM;
        transactionType=MISSING_CHAR;
        origRowNumber=MISSING_NUM;
        itemName=MISSING_CHAR;
        serialNumber=MISSING_CHAR;
        contractNumber=MISSING_CHAR;
        siteLocation=MISSING_CHAR;
        poSoBilling=MISSING_CHAR;
        beginDate=MISSING_DATE;
        endDate=MISSING_DATE;
        reasonCode=MISSING_CHAR;
        addAllowedFlag=MISSING_CHAR;
        addStatus=MISSING_CHAR;
        serviceLevel=MISSING_CHAR;
        billToLoc=MISSING_CHAR;
        productPo=MISSING_CHAR;
        productSo=MISSING_CHAR;
        quantity=MISSING_NUM;
        softlineFlag=MISSING_CHAR;
        csCaseNumber=MISSING_CHAR;
        maintenancePo=MISSING_CHAR;
        netPrice=MISSING_NUM;
        userRole=MISSING_CHAR;
        upldRequestId=MISSING_NUM;

/* BEGIN PROTECT_BLOCK user_default_constructor_code */
/* END PROTECT_BLOCK user_default_constructor_code */

}

/* BEGIN PROTECT_BLOCK user_member_variables */
/* END PROTECT_BLOCK user_member_variables */


    private BigDecimal instanceId;
    private String transactionType;
    private BigDecimal origRowNumber;
    private String itemName;
    private String serialNumber;
    private String contractNumber;
    private String siteLocation;
    private String poSoBilling;
    private Timestamp beginDate;
    private Timestamp endDate;
    private String reasonCode;
    private String addAllowedFlag;
    private String addStatus;
    private String serviceLevel;
    private String billToLoc;
    private String productPo;
    private String productSo;
    private BigDecimal quantity;
    private String softlineFlag;
    private String csCaseNumber;
    private String maintenancePo;
    private BigDecimal netPrice;
    private String userRole;
    private BigDecimal upldRequestId;


    // getter methods
    public BigDecimal getInstanceId() {
        return instanceId;
    }
    public String getTransactionType() {
        return transactionType;
    }
    public BigDecimal getOrigRowNumber() {
        return origRowNumber;
    }
    public String getItemName() {
        return itemName;
    }
    public String getSerialNumber() {
        return serialNumber;
    }
    public String getContractNumber() {
        return contractNumber;
    }
    public String getSiteLocation() {
        return siteLocation;
    }
    public String getPoSoBilling() {
        return poSoBilling;
    }
    public Timestamp getBeginDate() {
        return beginDate;
    }
    public Timestamp getEndDate() {
        return endDate;
    }
    public String getReasonCode() {
        return reasonCode;
    }
    public String getAddAllowedFlag() {
        return addAllowedFlag;
    }
    public String getAddStatus() {
        return addStatus;
    }
    public String getServiceLevel() {
        return serviceLevel;
    }
    public String getBillToLoc() {
        return billToLoc;
    }
    public String getProductPo() {
        return productPo;
    }
    public String getProductSo() {
        return productSo;
    }
    public BigDecimal getQuantity() {
        return quantity;
    }
    public String getSoftlineFlag() {
        return softlineFlag;
    }
    public String getCsCaseNumber() {
        return csCaseNumber;
    }
    public String getMaintenancePo() {
        return maintenancePo;
    }
    public BigDecimal getNetPrice() {
        return netPrice;
    }
    public String getUserRole() {
        return userRole;
    }
    public BigDecimal getUpldRequestId() {
        return upldRequestId;
    }

    // setter methods                       
    public void setInstanceId(BigDecimal aInstanceId) {
        instanceId = aInstanceId;
    }
    public void setTransactionType(String aTransactionType) {
        transactionType = aTransactionType;
    }
    public void setOrigRowNumber(BigDecimal aOrigRowNumber) {
        origRowNumber = aOrigRowNumber;
    }
    public void setItemName(String aItemName) {
        itemName = aItemName;
    }
    public void setSerialNumber(String aSerialNumber) {
        serialNumber = aSerialNumber;
    }
    public void setContractNumber(String aContractNumber) {
        contractNumber = aContractNumber;
    }
    public void setSiteLocation(String aSiteLocation) {
        siteLocation = aSiteLocation;
    }
    public void setPoSoBilling(String aPoSoBilling) {
        poSoBilling = aPoSoBilling;
    }
    public void setBeginDate(Timestamp aBeginDate) {
        beginDate = aBeginDate;
    }
    public void setEndDate(Timestamp aEndDate) {
        endDate = aEndDate;
    }
    public void setReasonCode(String aReasonCode) {
        reasonCode = aReasonCode;
    }
    public void setAddAllowedFlag(String aAddAllowedFlag) {
        addAllowedFlag = aAddAllowedFlag;
    }
    public void setAddStatus(String aAddStatus) {
        addStatus = aAddStatus;
    }
    public void setServiceLevel(String aServiceLevel) {
        serviceLevel = aServiceLevel;
    }
    public void setBillToLoc(String aBillToLoc) {
        billToLoc = aBillToLoc;
    }
    public void setProductPo(String aProductPo) {
        productPo = aProductPo;
    }
    public void setProductSo(String aProductSo) {
        productSo = aProductSo;
    }
    public void setQuantity(BigDecimal aQuantity) {
        quantity = aQuantity;
    }
    public void setSoftlineFlag(String aSoftlineFlag) {
        softlineFlag = aSoftlineFlag;
    }
    public void setCsCaseNumber(String aCsCaseNumber) {
        csCaseNumber = aCsCaseNumber;
    }
    public void setMaintenancePo(String aMaintenancePo) {
        maintenancePo = aMaintenancePo;
    }
    public void setNetPrice(BigDecimal aNetPrice) {
        netPrice = aNetPrice;
    }
    public void setUserRole(String aUserRole) {
        userRole = aUserRole;
    }
    public void setUpldRequestId(BigDecimal aUpldRequestId) {
        upldRequestId = aUpldRequestId;
    }


    // other methods


    public XxcssMatAddRecType loadFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        Object[] attributes=struct.getAttributes();
        instanceId=(BigDecimal)attributes[0];
        transactionType=(String)attributes[1];
        origRowNumber=(BigDecimal)attributes[2];
        itemName=(String)attributes[3];
        serialNumber=(String)attributes[4];
        contractNumber=(String)attributes[5];
        siteLocation=(String)attributes[6];
        poSoBilling=(String)attributes[7];
        beginDate=(Timestamp)attributes[8];
        endDate=(Timestamp)attributes[9];
        reasonCode=(String)attributes[10];
        addAllowedFlag=(String)attributes[11];
        addStatus=(String)attributes[12];
        serviceLevel=(String)attributes[13];
        billToLoc=(String)attributes[14];
        productPo=(String)attributes[15];
        productSo=(String)attributes[16];
        quantity=(BigDecimal)attributes[17];
        softlineFlag=(String)attributes[18];
        csCaseNumber=(String)attributes[19];
        maintenancePo=(String)attributes[20];
        netPrice=(BigDecimal)attributes[21];
        userRole=(String)attributes[22];
        upldRequestId=(BigDecimal)attributes[23];

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return this;
    }
    
    public STRUCT asStruct(Connection conn)
        throws SQLException {
        STRUCT struct=null;
        StructDescriptor sd=
            StructDescriptor.createDescriptor("APPS.XXCSS_MAT_ADD_REC_TYPE",conn);
        Object[] attributes = new Object[]{
            instanceId,
            ((transactionType==null) ? null : new CHAR(transactionType,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            origRowNumber,
            ((itemName==null) ? null : new CHAR(itemName,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((serialNumber==null) ? null : new CHAR(serialNumber,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((contractNumber==null) ? null : new CHAR(contractNumber,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((siteLocation==null) ? null : new CHAR(siteLocation,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((poSoBilling==null) ? null : new CHAR(poSoBilling,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            beginDate,
            endDate,
            ((reasonCode==null) ? null : new CHAR(reasonCode,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((addAllowedFlag==null) ? null : new CHAR(addAllowedFlag,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((addStatus==null) ? null : new CHAR(addStatus,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((serviceLevel==null) ? null : new CHAR(serviceLevel,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((billToLoc==null) ? null : new CHAR(billToLoc,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((productPo==null) ? null : new CHAR(productPo,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((productSo==null) ? null : new CHAR(productSo,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            quantity,
            ((softlineFlag==null) ? null : new CHAR(softlineFlag,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((csCaseNumber==null) ? null : new CHAR(csCaseNumber,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            ((maintenancePo==null) ? null : new CHAR(maintenancePo,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            netPrice,
            ((userRole==null) ? null : new CHAR(userRole,CharacterSet.make(CharacterSet.UTF8_CHARSET))),
            upldRequestId
        };
        struct=new STRUCT(sd,conn,attributes);

/* BEGIN PROTECT_BLOCK user_load_from_struct_code */
/* END PROTECT_BLOCK user_load_from_struct_code */

        return struct;
    }
    
    public static XxcssMatAddRecType newFromStruct(Connection conn,STRUCT struct) 
        throws SQLException,InstantiationException,IllegalAccessException {
        XxcssMatAddRecType newInstance=newInstance();
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
        sb.append("instanceId=").append(instanceId);
        sb.append(",transactionType=").append(transactionType);
        sb.append(",origRowNumber=").append(origRowNumber);
        sb.append(",itemName=").append(itemName);
        sb.append(",serialNumber=").append(serialNumber);
        sb.append(",contractNumber=").append(contractNumber);
        sb.append(",siteLocation=").append(siteLocation);
        sb.append(",poSoBilling=").append(poSoBilling);
        sb.append(",beginDate=").append(beginDate);
        sb.append(",endDate=").append(endDate);
        sb.append(",reasonCode=").append(reasonCode);
        sb.append(",addAllowedFlag=").append(addAllowedFlag);
        sb.append(",addStatus=").append(addStatus);
        sb.append(",serviceLevel=").append(serviceLevel);
        sb.append(",billToLoc=").append(billToLoc);
        sb.append(",productPo=").append(productPo);
        sb.append(",productSo=").append(productSo);
        sb.append(",quantity=").append(quantity);
        sb.append(",softlineFlag=").append(softlineFlag);
        sb.append(",csCaseNumber=").append(csCaseNumber);
        sb.append(",maintenancePo=").append(maintenancePo);
        sb.append(",netPrice=").append(netPrice);
        sb.append(",userRole=").append(userRole);
        sb.append(",upldRequestId=").append(upldRequestId);

    }
    
    public Object clone() throws CloneNotSupportedException {
        XxcssMatAddRecType theClone = (XxcssMatAddRecType) super.clone();
        


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
        
        hashStringBuffer.append("instanceId=").append(instanceId);
        hashStringBuffer.append("transactionType=").append(transactionType);
        hashStringBuffer.append("origRowNumber=").append(origRowNumber);
        hashStringBuffer.append("itemName=").append(itemName);
        hashStringBuffer.append("serialNumber=").append(serialNumber);
        hashStringBuffer.append("contractNumber=").append(contractNumber);
        hashStringBuffer.append("siteLocation=").append(siteLocation);
        hashStringBuffer.append("poSoBilling=").append(poSoBilling);
        hashStringBuffer.append("beginDate=").append(beginDate);
        hashStringBuffer.append("endDate=").append(endDate);
        hashStringBuffer.append("reasonCode=").append(reasonCode);
        hashStringBuffer.append("addAllowedFlag=").append(addAllowedFlag);
        hashStringBuffer.append("addStatus=").append(addStatus);
        hashStringBuffer.append("serviceLevel=").append(serviceLevel);
        hashStringBuffer.append("billToLoc=").append(billToLoc);
        hashStringBuffer.append("productPo=").append(productPo);
        hashStringBuffer.append("productSo=").append(productSo);
        hashStringBuffer.append("quantity=").append(quantity);
        hashStringBuffer.append("softlineFlag=").append(softlineFlag);
        hashStringBuffer.append("csCaseNumber=").append(csCaseNumber);
        hashStringBuffer.append("maintenancePo=").append(maintenancePo);
        hashStringBuffer.append("netPrice=").append(netPrice);
        hashStringBuffer.append("userRole=").append(userRole);
        hashStringBuffer.append("upldRequestId=").append(upldRequestId);

        return hashStringBuffer.toString().hashCode();
    }
      
/* BEGIN PROTECT_BLOCK user_java_code */
/* END PROTECT_BLOCK user_java_code */

}