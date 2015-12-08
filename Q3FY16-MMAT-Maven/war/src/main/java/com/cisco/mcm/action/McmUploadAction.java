/*
 * Created on Nov 23, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.upload.FormFile;

import com.cisco.mcm.util.McmConstants;

/**
 * @author kiguntup
 * 
 */
public class McmUploadAction extends McmBaseAction {

    /*
     * (non-Javadoc)
     * 
     * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping,
     *      org.apache.struts.action.ActionForm,
     *      javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
	    HttpServletRequest request, HttpServletResponse response)
    throws Exception {

	boolean privilage = hasPrivileges(request,
		McmConstants.MASS_MAT_UPLD_ACTIONS);
	
	if (!privilage) {
	    return throwUnAuthorizeAccess(mapping, request, response);
	}
	//DynaActionForm uploadForm = (DynaActionForm) form;
	//String reqType = uploadForm.get("requestType").toString();
	//String seleTemplate = uploadForm.get("selectTemplate").toString();
	//String requestName = uploadForm.get("mat_request_name").toString();
	//FormFile fileLoc = (FormFile) uploadForm.get("fileLocate");
	//String email = uploadForm.get("email").toString();
	response.setContentType("multipart/form-data");
	request.setAttribute("uploadDefinitionName", "MAT_ADD");
	request.setAttribute("isOnlineProcess", "true");
	request.setAttribute("redirecturl", "success");
	request.setAttribute("errorRedirectUrl", "success");

	RequestDispatcher rd = request
	.getRequestDispatcher("/ServiceSalesUpload");
	rd.forward(request, response);
	return mapping.findForward("success");
	
    }
}
