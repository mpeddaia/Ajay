package com.cisco.mcm.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.log4j.Logger;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.ea.dbpool.EACallableStatementFacade;
import com.cisco.mcm.dao.McmDAO;
import com.cisco.mcm.dao.oracletypes.OraErrorObj;
import com.cisco.servicesales.mcm.utils.MCMDataUtil;
import com.cisco.upload.common.utils.Log;

public class SamEmailReport extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	 private static final String SOURCE_SYSTEM = "XXCSS_MAT";
	   
	  private static Logger logger = Logger.getLogger(SamEmailReport.class);
	   
	 private static DAOServices ds;
	
	public SamEmailReport() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		
		logger.info("Inside ProcessRequest Method in SamEmailReport ");
		//String ccoUserId =(String) request.getAttribute("userName");
		
		Connection conn = null;
		Statement statement = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd =null;
		String strQuery;
		String uploadRId=request.getParameter("uploadRId");
		OracleApplicationSession oas = new OracleApplicationSession();
		oas.setApplicationShortName("XXCSS_MAT");
		oas.setResponsiblityName("NULL");
		oas.setUserName("vibk");
		oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
		ds=MCMDataUtil.getServices(oas, "APP");
		logger.info("Got Services ");

		try {

		   
		    conn = ds.borrowConnection();
		    

		    if (conn == null) 
		    {
		    	logger.info("Connection is null");
		    	throw new NullPointerException("Connection is not available ");
		    }
		    Log.info("Connection Established");
		    System.out.println("Connection Established");
		    statement = conn.createStatement();
		    strQuery = "SELECT distinct installed_at_site_id \"Installed At Site ID\", installed_at_site_name \"Installed At Site Name\", ";
	        strQuery = strQuery  + "Address1||' '||Address2||' '||Address3||' '||Address4||' '||City||' '||State||' '||Zip||' '||Country \"Site Address\", ";
	        strQuery = strQuery  + "nbd_sds_flag \"NBD/SDS Flag\" FROM apps.xxcss_mat_sam_site_info WHERE upld_request_id ="+uploadRId;
		   // strQuery="select upld_request_id,cco_userid,email  from xxcss_ssf_UPLD_requests where upld_request_id = "+uploadRId ;
	        Log.info("STR Query : " + strQuery);
	        
	        System.out.println("StrQuery : " + strQuery);
	        rs = statement.executeQuery(strQuery);
	        rsmd = rs.getMetaData();
		   response.setContentType("application/vnd.ms-excel");
		   response.setHeader("Content-Disposition", "attachment; filename=SamReport_" + uploadRId + ".xls");
		   WritableWorkbook w = Workbook.createWorkbook(response.getOutputStream());
		   WritableSheet s = w.createSheet("SAMReport", 0);
	           
	           // Adding column headers
	           for(int i = 1; i <=rsmd.getColumnCount(); i ++)
	           {
	               s.addCell(new Label(i-1,0,rsmd.getColumnLabel(i)));
	               s.setColumnView(i-1, 17);
	           }
	           //Adding query results
	           int j=1;
	           while (rs.next())
	           {
	               
	               for(int k=1; k <= rsmd.getColumnCount();k++)
	               {
	                   s.addCell(new Label(k-1,j,rs.getString(k)));
	               }
	               j++;
	           }
	           
		   //s.addCell(new Label(0, 0, "Hello World"));
		   w.write();
		   w.close();
		   
		}catch (Exception e)
		{
			//logger.error(e); // orginal code
			logger.error(" SamEmailReport : processRequest : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
		finally
		{
			try{
			    rs.close();
			    statement.close();
			    conn.close();
			}catch(SQLException e){
			    //logger.error(e); //original code
				logger.error(" SamEmailReport : processRequest : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
			}
		    }
		
		
	}
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
