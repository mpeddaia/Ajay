/**
 * 
 */
package com.cisco.mcm.dto;

/**
 * @author smerugol
 *
 */
public class McmOverrideDTO {

	private String requestType;
	private String userName;
	private String appShortName;
	/**
	 * @return Returns the appShortName.
	 */
	public String getAppShortName() {
		return appShortName;
	}
	/**
	 * @param appShortName The appShortName to set.
	 */
	public void setAppShortName(String appShortName) {
		this.appShortName = appShortName;
	}
	/**
	 * @return Returns the requestType.
	 */
	public String getRequestType() {
		return requestType;
	}
	/**
	 * @param requestType The requestType to set.
	 */
	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}
	/**
	 * @return Returns the userName.
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName The userName to set.
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
