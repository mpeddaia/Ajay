package com.cisco.crosstrack.actions;

import java.io.LineNumberReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.crosstrack.common.dao.DAOUtil;
import com.cisco.crosstrack.dao.XxcssCtHelpFieldsObjType;
import com.cisco.crosstrack.dao.XxcssCtHelpLinkPkg;
import com.cisco.crosstrack.user.User;



public class HelpPopupAction extends Action{

	public ActionForward execute(ActionMapping mapping, 
			 ActionForm form,
			 HttpServletRequest request, 
			 HttpServletResponse response)
			 throws Exception {
		
		
		DAOServices myDataService = null;
		myDataService=DAOUtil.getServices();
		String language=null;
		if(request.getLocale().getDisplayLanguage().equalsIgnoreCase("english"))
			language="ENGLISH";
		else
			language="ENGLISH";
         List helpfie[]=new List[1];
        String[] returnStatus=new String[1];
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("User");
       XxcssCtHelpLinkPkg pkg= XxcssCtHelpLinkPkg.getInstance();
       XxcssCtHelpFieldsObjType inp[]=new XxcssCtHelpFieldsObjType[10];
       inp[0]=XxcssCtHelpFieldsObjType.newInstance();
       inp[0].setApplicationCode("MMAT");
       inp[0].setLanguageCode(language);
       inp[0].setFieldName((String)request.getParameter("field"));
       inp[0].setDisplayFlag("Y");
       inp[0].setScreenName((String)request.getParameter("screen"));
       pkg.helpLinkMsg(myDataService,inp,user.getUserAttributes().getUid(),returnStatus);
       List list=new ArrayList();
      if((String)inp[0].getMessageText() != null && !"".equals((String)inp[0].getMessageText())){
       StringReader  inStream = new StringReader((String)inp[0].getMessageText());
   	   LineNumberReader lr = new LineNumberReader(inStream);
       String line = null;
   	    while ((line = lr.readLine()) != null) {
   	      System.out.println(lr.getLineNumber() + ": " + line);
   	      list.add(line);
   	    }
   	    lr.close();
   	    inStream.close();
      }
    	request.setAttribute("msg",inp[0].getMessageText());
    	request.setAttribute("heading",inp[0].getDisplayName());
    	request.setAttribute("helpList",list);
        return mapping.findForward("sucess");
        //return null;
	}
}
