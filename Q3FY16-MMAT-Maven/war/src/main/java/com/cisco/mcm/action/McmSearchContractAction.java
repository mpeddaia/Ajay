package com.cisco.mcm.action;

import java.io.FileOutputStream;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cisco.mcm.bean.McmSearchBean;
import com.cisco.mcm.dao.McmSearchContractDAO;
import com.cisco.mcm.genJava.XxcssMatStcMigType;
import com.cisco.mcm.util.McmConstants;

/**
 * @author kiguntup
 *
 */
public class McmSearchContractAction extends McmBaseAction{

	private static Logger logger = Logger.getLogger(McmSearchContractAction.class); //added by amalekar as part of Q1FY15 , in order to fix critical issue.
	
    public static final ResourceBundle bundle = ResourceBundle
	.getBundle("ApplicationResources");
    
    /* (non-Javadoc)
     * @see org.apache.struts.action.Action#execute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
		HttpServletRequest request, HttpServletResponse response)
throws Exception {
    	
    
		
	System.out.println("************************ Inside the execute method in the McmSearchContractAction************************");
	HttpSession session = request.getSession();
	String searchFlag = request.getParameter("search");
	List resultList = null;
	String nodataCheck = null;
	try {
	session.setAttribute("NodataFound", null);
	session.setAttribute("custName", null);
	session.setAttribute("contractNum", null);
	session.setAttribute("billTo", null);
	session.setAttribute("migratStatus", null);
	session.setAttribute(McmConstants.STC_SEARCH_RESULTS, null);
	if(searchFlag!=null){
	    	if(searchFlag.equals("1")){
        	session.setAttribute(McmConstants.STC_SEARCH_RESULTS, null);
        	String contratNumber = request.getParameter("contractNumber");
        	String customerName = request.getParameter("customerName");
        	String billToSiteId = request.getParameter("billToId");
        	String migrationStatus = request.getParameter("migrationStatus");
        	System.out.println("migrationStatus \t"+migrationStatus);

        	/* 
        	Start : Commented code 
        	Reason : Bad practice - Comparison of String objects using == or !=
        	Commented by : Ajay Malekar(amalekar)
        	Release name : Q2FY15
        	*/

        	
        	/*if(contratNumber!=null && contratNumber!= ""){
        	    contratNumber =contratNumber.trim();
        	}
        	if(customerName!=null && customerName!= ""){
        	    customerName =customerName.trim();
        	}
        	if(billToSiteId!=null && billToSiteId!= ""){
        	    billToSiteId =billToSiteId.trim();
        	}
        	 */        	
        	// End : Commented code
        	
        	
        	/* 
        	Start : New code added 
        	Reason : To fix CI issue , Bad practice - Comparison of String objects using == or !=
        	Commented by : Ajay Malekar(amalekar)
        	Release name : Q2FY15
        	*/
        	
        	if(contratNumber!=null && !contratNumber.equals("")){
        	    contratNumber =contratNumber.trim();
        	}
        	if(customerName!=null && !customerName.equals("")){
        	    customerName =customerName.trim();
        	}
        	if(billToSiteId!=null && !billToSiteId.equals("")){
        	    billToSiteId =billToSiteId.trim();
        	}

        	
        	// End : New code added

        	
        	McmSearchBean searchBean = new McmSearchBean();
        	if(billToSiteId!=null)
        	searchBean.setBillToSiteId(billToSiteId);
        	
        	searchBean.setContratNumber(contratNumber);
        	searchBean.setCustomerName(customerName);
        	searchBean.setMigrationStatus(migrationStatus);
        	try{
        	McmSearchContractDAO searchDAO = new McmSearchContractDAO();
        	resultList = searchDAO.searchContracts(searchBean);
        	}catch(Exception e){
        	    /*System.out.println("Got an Exception here"+ e);
        	    e.printStackTrace();*/ // original code
        		
        		logger.error("Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
        		
        	}
        	
        	if(resultList != null && resultList.size()> 0){
        	    
        	    System.out.println("Resultset is not None......");
        	    nodataCheck ="Data is there";
        	    for(int i=0;i<resultList.size();i++){
	        		XxcssMatStcMigType migrationRecType = (XxcssMatStcMigType)resultList.get(i);
	        		System.out.println("Got the Object here buddy "+migrationRecType);
	        		
	        		//	start added - smerugol - For Q1FY10 Release
	        		//Removing the word 'operating' from Oldbusiness Entity 
	        		if(migrationRecType.getOldBusinessEntity()!=null)
	        		{
	        			String oldBusinessEntity = migrationRecType.getOldBusinessEntity().toUpperCase();
	        		if(oldBusinessEntity!=null)
	        		{
	        			int index = oldBusinessEntity.indexOf("OPERATING");
	        			migrationRecType.setOldBusinessEntity(migrationRecType.getOldBusinessEntity().substring(0,index));
	        		//	ended - smerugol - For Q1FY10 Release	        		
	        		}
        	    }
	        	}
        	    
        	    session.setAttribute(McmConstants.STC_SEARCH_RESULTS, resultList);
        	    session.setAttribute("NodataFound", nodataCheck);
        	}else{
        	    nodataCheck = "nodataFound";
        	    session.setAttribute("NodataFound", nodataCheck);
        	    System.out.println("Resultset is None --------------->");
        	}
        	searchFlag = null;
	    	}else if(searchFlag.equals("ExportData")){
	    	    System.out.println("Inside the ExportData check");
	    	    //Implementation of Export to Excel functionality
	    	  //  List finaliList = (List)session.getAttribute(McmConstants.STC_SEARCH_RESULTS);
	    	    FileOutputStream fileOut = null;
	    	try{
	    	    System.out.println("Creating Work Book and All");
	    	HSSFWorkbook wb = new HSSFWorkbook();
	    	System.out.println("creating a new sheet");
	    	HSSFSheet sheet = wb.createSheet("new sheet");
	    	HSSFRow row = sheet.createRow((short)0);
	    	HSSFCell cell = row.createCell((short)0);
	    	cell.setCellValue(1);
	    	row.createCell((short)1).setCellValue(1.2);
	    	row.createCell((short)2).setCellValue("Kiran Kumar ");
	    	row.createCell((short)3).setCellValue(true);
	    	fileOut = new FileOutputStream("workbook.xls");
	    	wb.write(fileOut);
	    	
	    	searchFlag = null;
	    	}catch ( Exception ex ){
	    		logger.error("Exception : " , ex); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	    	} 
	    	finally {
	    		
	    		fileOut.close();
	    	 
	    	}
	    	    
	    	}
	}
    
	String contratNumber = request.getParameter("contractNumber");
	String customerName = request.getParameter("customerName");
	String billToSiteId = request.getParameter("billToId");
	String migrationStatus = request.getParameter("migrationStatus");
	
	session.setAttribute("custName", customerName);
	session.setAttribute("contractNum", contratNumber);
	session.setAttribute("billTo", billToSiteId);
	session.setAttribute("migratStatus", migrationStatus);
	
    
    } catch (Exception e)
    {
    	//e.printStackTrace(); // original code
    	logger.error("Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
    }
	/*catch (Throwable t)
    {
    	t.printStackTrace();
    }*/
    return mapping.findForward("success");
   }
}
