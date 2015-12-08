/*
 * Created on Nov 22, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.bean;

import java.io.Serializable;


/**
 * @author kiguntup
 *
 */
public class UploadTemplateBean implements Serializable{

    private String id;
    private String description;

    public UploadTemplateBean() {
    }
 
    /**
     * @param id
     * @param description
     */
    public UploadTemplateBean(String id, String description) {
	this.id = id;
	this.description = description;
    }

    /**
     * @return
     */
    public String getId() {
	return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
	this.id = id;
    }

    /**
     * @return
     */
    public String getDescription() {
	return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
	this.description = description;
    }
}
