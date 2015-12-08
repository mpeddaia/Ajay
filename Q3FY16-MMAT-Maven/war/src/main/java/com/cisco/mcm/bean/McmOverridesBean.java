/*
 * Created on Dec 13, 2005
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
public class McmOverridesBean implements Serializable {
    private String id;
    private String description;
    private String enableStr;

    /**
     * @param id
     * @param Desc
     * @param enblstr
     */
    public McmOverridesBean(String id, String Desc, String enblstr) {
	this.id = id;
	this.description = Desc;
	this.enableStr = enblstr;
    }

    /**
     * @param id
     * @param Desc
     */
    public McmOverridesBean(String id, String Desc) {
	this.id = id;
	this.description = Desc;
    }

    /**
     * @return Returns the description.
     */
    public String getDescription() {
	return description;
    }

    /**
     * @return Returns the id.
     */
    public String getId() {
	return id;
    }

    /**
     * @return Returns the enableStr.
     */
    public String getEnableStr() {
	return enableStr;
    }
}
