package com.cisco.mcm.util;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.driver.OracleResultSet;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.BLOB;

import org.apache.log4j.Logger;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.servicesales.mcm.utils.MCMDataUtil;
import com.cisco.upload.common.utils.Log;

@SuppressWarnings("serial")
public class DownloadReport extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	 private static final String SOURCE_SYSTEM = "XXCSS_MAT";
	   
	  private static Logger logger = Logger.getLogger(DownloadReport.class);
	   
	 private static DAOServices ds;
	
	public DownloadReport() {
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
		
		
		System.out.println("Inside ProcessRequest Method in Download Report ");
		String ccoUserId =(String) request.getAttribute("userName");
		
		Connection conn = null;
		CallableStatement statement = null;
		String uploadRId=request.getParameter("uploadRId");
		String requestType = request.getParameter("request_type");
		OracleApplicationSession oas = new OracleApplicationSession();
		oas.setApplicationShortName(SOURCE_SYSTEM);
		oas.setResponsiblityName("NULL");
		oas.setUserName(ccoUserId);
		oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
		ds=MCMDataUtil.getServices(oas, "APP");
		logger.info("Got Services ");
		String xlFileName=requestType+"_Output_Report.xls";
		String zipFileName =requestType +"_Output_Report.zip";
		System.out.println("DownloadReport::processRequest:1:requestType="+requestType);
		//
		if(requestType.equals("SEARCH_AND_CREATE_SHIP_TO")
				|| requestType.equals("UNCOVERED_EQUIPMENT_MOVE_AT_PRODUCT_LEVEL")){
			zipFileName =requestType.replaceAll("_", " ")+".zip";
		}
System.out.println("DownloadReport::processRequest::xlFileName="+xlFileName);
System.out.println("DownloadReport::processRequest::zipFileName="+zipFileName);
System.out.println("DownloadReport::processRequest:2:requestType="+requestType);		
		logger.info("Excel File Name : " + xlFileName);
		logger.info("Zip File Name : " + zipFileName);
		
		ZipOutputStream zip = null;
		FileInputStream fis = null;
		FileOutputStream os = null;

		try {

		   
		    conn = ds.borrowConnection();
		    

		    if (conn == null) 
		    {
		    	logger.info("Connection is null");
		    	throw new NullPointerException("Connection is not available ");
		    }
		    logger.info("Connection Established");
		   // statement = conn.createStatement();
		    String sql = "{ call APPS.XXCSS_MAT_RESULTS_DOWNLOAD.sp_ext_downloadresults(?,?,?,?,?,? ) }";
		    //statement = conn.prepareCall("begin  APPS.XXCSS_MAT_RESULTS_TEST.sp_smart_services(:1,:2,:3,:4,:5,:6); end;");
		    statement = conn.prepareCall(sql);
		    statement.setString(1,uploadRId);
		    statement.setString(2,"vibk");
		    statement.setString(3,"O");
            statement.registerOutParameter(4, java.sql.Types.VARCHAR );
            statement.registerOutParameter(5, java.sql.Types.VARCHAR);
            statement.registerOutParameter(6, java.sql.Types.BLOB);
            statement.execute();
            logger.info("Statement Created : " + statement.toString());
            //String status=null;
            //status=(String)statement.getString(4);
            //String message=null;
            //message=(String)statement.getString(5);
		   
	        
	        
	        InputStream is=null; 
            Blob b=null; 
            b = statement.getBlob(6);
            os=new FileOutputStream(xlFileName);
           
            logger.info("File Output Stream created");
           
          	
            	
            is=b.getBinaryStream(); 
                 
            logger.info("Blob Object Retrieved");
                 
            byte[] b1 = new byte[ ((BLOB)b).getChunkSize()];
                
                 
            logger.info("Blob Size :" + ((BLOB) b).getChunkSize());
                 
           //int pos=0;
           int length =0;
                 
          while((length=is.read(b1))!= -1)
          { 
            //pos+=length; 
            
             os.write(b1); 
          } 
            
            is.close();
            logger.info("Input Stream Closed");
            
            response.setContentType("application/zip");
	        response.setHeader("Content-Disposition", "attachment; filename="+ zipFileName);
	        logger.info("Set Header");
            
            ServletOutputStream outputStream = response.getOutputStream();   
            zip = new ZipOutputStream(outputStream);
            zip.putNextEntry(new ZipEntry(xlFileName));   
            logger.info("Excel File Added to Zip");
            
            byte[] bte = new byte[1024];   
            int len;   
            fis= new FileInputStream(xlFileName);
            while ((len = fis.read(bte)) != -1)
            {   
             zip.write(bte, 0, len);   
            }   
            
            System.out.println("Zip file created and excel file added");
	         fis.close();   
	         zip.flush();   
	         zip.close();   
	         outputStream.flush();   
            
		   
		}catch (Exception e)
		{
			/*logger.error(e);
			logger.info("error :" + e.getMessage());*/ // original code
			
			logger.error("McmUploadBO : processRequest : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
		finally
		{
			try{
			    statement.close();
			    conn.close();
			   os.close();
			   zip.close();
			   fis.close();
			}catch(SQLException e){
				System.out.println("Exception Occured : " + e.getMessage() );
			    /*logger.error(e);
			    logger.info("error :" + e.getMessage());*/ // original code
				
				logger.error("McmUploadBO : processRequest : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
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
