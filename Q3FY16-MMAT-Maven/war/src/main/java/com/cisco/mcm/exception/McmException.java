/*
 * Created on Dec 20, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.exception;

/**
 * @author jbathula
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class McmException {

    String exception_id;
    Exception exc;

    public McmException(String expId, Exception ex) {
	this.exception_id = expId;
	this.exc = ex;

    }

    /**
     * @return Returns the exc.
     */
    public Exception getExc() {
	return exc;
    }

    /**
     * @return Returns the exception_id.
     */
    public String getException_id() {
	return exception_id;
    }
}
