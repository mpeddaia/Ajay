package com.cisco.mcm.bean;

import java.io.Serializable;

public class McmSearchBean implements Serializable{
    
    	private String contratNumber ;
	private String customerName;
	private String billToSiteId;
	private String migrationStatus;
	
	
	public String getContratNumber() {
	    return contratNumber;
	}
	public void setContratNumber(String contratNumber) {
	    this.contratNumber = contratNumber;
	}
	public String getCustomerName() {
	    return customerName;
	}
	public void setCustomerName(String customerName) {
	    this.customerName = customerName;
	}
	public String getBillToSiteId() {
	    return billToSiteId;
	}
	public void setBillToSiteId(String billToSiteId) {
	    this.billToSiteId = billToSiteId;
	}
	public String getMigrationStatus() {
	    return migrationStatus;
	}
	public void setMigrationStatus(String migrationStatus) {
	    this.migrationStatus = migrationStatus;
	}

}
