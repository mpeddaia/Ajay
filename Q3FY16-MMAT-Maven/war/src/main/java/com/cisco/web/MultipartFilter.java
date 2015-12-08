package com.cisco.web;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class MultipartFilter implements Filter {

	private static HashMap<String, String> templateColumnData = null;
	
	private static HashMap<String, String> templateColumnDataExt = null;
	
	static Logger log = Logger.getLogger(MultipartFilter.class);
	
	public void init(FilterConfig filterConfig) throws ServletException {
		
		log.info("MultipartFilter : Initializing HashMaps.");
		
		initHashMaps();
		
		log.info("MultipartFilter : Initialized HashMaps.");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {
		// Check type request.

		if (request instanceof HttpServletRequest) {
			// Cast back to HttpServletRequest.
			log.info("MultipartFilter : doFilter.");

			RequestWrapper multiReadRequest = new RequestWrapper((HttpServletRequest) request);
			HttpServletRequest httpRequest = multiReadRequest;

			List<FileItem> multipartItems = null;

			try {

				log.info("In try parsing request");

				// Parse the multipart request items.
				multipartItems = new FileUpload(new DiskFileItemFactory()).parseRequest(httpRequest);
			} catch (FileUploadException e) {
				log.info("In catch parsing request " + e);
			}

			log.info("Looping over multipartItems list");

			String requestType = "";
			String isValidRequest = "";
			String loggedUserId = "";
			String userAccessLevel = "";
			String requestTypeIsPS = "";
			
			for (FileItem multipartItem : multipartItems) {

				log.info(multipartItem.getFieldName());

				if (multipartItem.isFormField()) {
					// Process regular form field (input
					// type="text|radio|checkbox|etc", select, etc).
					// processFormField(multipartItem, parameterMap);

					String name = multipartItem.getFieldName();
					String value = multipartItem.getString();

					if (name.equals("requestType")) {

						requestType = multipartItem.getString();
						
						if(requestType.equals("PORTABLE_SOLUTIONS")){
							requestTypeIsPS = value;
							log.info("Breaking as request type is " +requestTypeIsPS);
							break;
						}
						
						log.info("Request type value : " + value);

					}else if(name.equals("loggedUserId")){
						
						loggedUserId = value;
						log.info("loggedUserId value : " + loggedUserId);
						
					}else if(name.equals("userAccessLevel")){
						userAccessLevel= value;
						log.info("userAccessLevel value : " + userAccessLevel);
						
					}

				} else {
					// Process form file field (input type="file").
										
					String name = new File(multipartItem.getName()).getName();
					
					Random rand = new Random();
				    // nextInt is normally exclusive of the top value,
				    // so add 1 to make it inclusive
				    int randomNum = rand.nextInt((1000 - 1) + 1) + 1;

					
					// File uploaded with good size.
					File fileFromRequest = null;
					File createDir = new File(loggedUserId+randomNum);
					createDir.mkdir();
					
					
					log.info("File name is : " + name);
					
					try {

						fileFromRequest = new File(loggedUserId+randomNum+"/"+name);
						
						log.info("File path : "+ fileFromRequest.getAbsolutePath());

						multipartItem.write(fileFromRequest);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						log.info("Exception file wr.." + e);
						fileFromRequest.delete();
					}

					File file = null;

					FileInputStream fis = null;
					HSSFWorkbook wb = null;
					HSSFSheet sheet = null;
					ArrayList<String> colListFromTemplate = new ArrayList<String>();
					List<String> colListFromTable = new ArrayList<String>();
					String colStrListFromTable = null;

					file = new File(loggedUserId+randomNum+"/"+name);
					
					log.info("Dir created..."+ loggedUserId+randomNum);
					
					
					try {
						fis = new FileInputStream(file);

						try {
							wb = new HSSFWorkbook(fis);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						sheet = wb.getSheetAt(0);
						HSSFRow row = sheet.getRow(0);

						log.info("----------------------------------------");
						
						/*for (Cell cell : row) {

							boolean isHidden = sheet.isColumnHidden(cell
									.getColumnIndex());

							String cellValue = cell.getStringCellValue();

							if (!isHidden
									&& (cellValue != null && !cell
											.getStringCellValue().equals(""))) {

								log.info(cell.getStringCellValue());

								colListFromTemplate.add(cellValue.trim());
								

							} else {
								log.info("Hidden : "
										+ sheet.isColumnHidden(cell
												.getColumnIndex()));
							}

							cellValue = null;
						}
*/
						
						for(int counter = 0 ; counter < row.getLastCellNum() ; counter ++){
							
							HSSFCell cell = row.getCell((short)counter);
							
							if (cell != null && cell.getCellStyle() != null && !cell.getCellStyle().getHidden()){
									
								log.info("Not Hidden ");
									
								 String cellValue = cell.getStringCellValue();
								 
								 log.info("Cell Value : " + cellValue);
								 
								 if((cellValue!=null &&  !cell.getStringCellValue().equals("")) ){
									 colListFromTemplate.add(cellValue.trim());
									  
								 }else { 
									//log.info("Hidden : "+sheet.isColumnHidden(cell.getColumnIndex())); 
								  
								  cellValue = null;
								  
								  }
							}
						}
						
						log.info("----------------------------------------");
						
						} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						log.info("FileNotFoundException " + e);
							
					}finally{
					
						log.info("In finally!!!");
						fis.close();
						file.delete();
						fileFromRequest.delete();
						log.info("File deleted");
						createDir.delete();
						log.info("Dir deleted");
						
					}

					log.info("Searching Request type value : " + requestType);
	
					if(userAccessLevel != null && userAccessLevel.equals("4")){
						
						log.info("User is internal");
						
						for (Map.Entry<String, String> entry : templateColumnData.entrySet()) {
							
							if(requestType.equals(entry.getKey())){
								colStrListFromTable = entry.getValue();
								log.info("Key : " + entry.getKey() + " Value : "+ entry.getValue());
								break;
							}
						}
					}else if(userAccessLevel != null && userAccessLevel.equals("3")){
						
						log.info("User is external");
						
						for (Map.Entry<String, String> entry : templateColumnDataExt.entrySet()) {
							
							if(requestType.equals(entry.getKey())){
								colStrListFromTable = entry.getValue();
								log.info("Key : " + entry.getKey() + " Value : "+ entry.getValue());
								break;
							}
						}
					}
					
					if (colStrListFromTable != null	&& colStrListFromTable.length() > 0) {
						
						for (String s : colStrListFromTable.split(",")) {

							colListFromTable.add(s.trim());
						}
						
						log.info("Searching Request type value : " + requestType);
						log.info("colListFromTemplate size : "	+ colListFromTemplate.size());
						log.info("colListFromTable size : "	+ colListFromTable.size());

						log.info("colListFromTemplate : "	+ colListFromTemplate);
						log.info("colListFromTable : "	+ colListFromTable);

						if (colListFromTemplate.size() == colListFromTable.size()) {

							log.info("Contains All : "+ colListFromTemplate.containsAll(colListFromTable));
							if (colListFromTemplate.containsAll(colListFromTable)) {
								
								
								isValidRequest = "matching";

							} else {
								isValidRequest = "notmatching";
							}

						} else {
							isValidRequest = "notmatching";
						}

					} else {
						isValidRequest = "notmatching";
					}
				}//else ends
			}

			log.info("Loooped over multipartItems ");
	
			log.info("Forwarding");

			log.info("Passing wrappedRequest ");
	
			if (isValidRequest.equals("matching")) {
				
				log.info("Requests matching");
				// Continue with filter chain.
				chain.doFilter(multiReadRequest, response);
			}else if (requestTypeIsPS!= null && !requestTypeIsPS.equals("")){
				log.info("PS");
				chain.doFilter(multiReadRequest, response);
			} 
			else {
				log.info("No Requests matching");
				request.setAttribute("errorMessage", "errorMessage");
				RequestDispatcher rd = request.getRequestDispatcher("/mcmindex.do");
				rd.forward(request, response);
			}

		} else {
			// Not a HttpServletRequest.
			log.info("Else in dofilter");
			chain.doFilter(request, response);
		}

		log.info("DONE!!! Finished processing Filter.");
	}

	/**
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
		// I am a boring method.
	}

	
	private void initHashMaps(){
		
		templateColumnData = new HashMap<String, String>();
		
		templateColumnDataExt = new HashMap<String, String>();
		
		templateColumnData.put("MAT_ADD", "Contract Number, Service Level, Begin Date, End Date, Bill To Id, PO/SO/Billing, Maintenance PO, Distributor Bill To Id, Serial Number/PAK Number, Product Id, Site Id, Instance Number, Product PO/SO, Quantity, Softline (Yes/No), Net Factor, Mac Id, Carton Id, Ship Date, Migrated Flag, External Reference, Reason Code, CS Case Number,PO#/SO# provided,Yes");
		
		templateColumnData.put("MAT_MOVE_C2C_S2S_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Contract #,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_S2S_AT_PRODUCT", "Source Contract #,Source Service Level,Source Site ID,Serial Number/PAK Number,Instance Number,Item Name,Target Contract #,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_AT_CONTRACT", "Source Contract #,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_AT_PRODUCT", "Source Contract #,Source Service Level,Serial Number / PAK Number,Instance Number,Item Name,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_C2C_SVC_LVL_MOVE", "Source Contract#,Source Service Level,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_CHG_SERVICE_LEVEL", "Contract Number,Source Service Level,Target Service Level,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_DATE_CHANGE_PRODUCT_LINE", "Contract Number,Serial Number/PAK Number,Product Id,Line Number,Start Date,End Date,Site Id,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_M_AND_P_ENTITLMNT_ADD_PRODUCTS", "Contract Number,Service Level,Begin Date,End Date,Bill To Id,Net Price,PO/SO/Billing,Maintenance PO,Distributor Bill To Id,Serial Number/PAK Number,Carton Id,Product Id,Site Id,Instance Number,Product PO/SO,Minimum Duration Flag,Quantity,Softline (Yes/No),Net Factor,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_UE_MOVE_S2S_PRODUCT", "Source Site ID,Serial Number/PAK Number,Item Name,Target Site ID,CS Case Number");
		templateColumnData.put("MAT_MOVE_S2S_AT_PRODUCT", "Source Contract #,Source Site ID,Serial number/PAK Number,Instance Number,Item Name,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_S2S_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_BEST_SR_CR_SITES", "Customer Name,Business Entity,Address 1,Address 2,Address 3,City,County,State,Province,Zip/Postal Code,Country,CS Case Number,User Reference No,Country List of Values,Business Entity List of Values");
		
		templateColumnData.put("MAT_TERMINATE_SERVICE_LVL", "Contract Number,Service Level,Termination Date,Reason Code,CS Case Number");
		templateColumnData.put("MAT_TERMINATE", "Contract Number,Service Level,Line Number,Instance Number,Serial Number/PAK Number,Product Id,Termination Date,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_TERMINATE_CONTRACT", "Contract Number,Termination Date,Reason Code,CS Case Number");
		
		templateColumnData.put("SCM_AM_MOVE", "Source Major Instance Number,Source Major Serial Number/PAK number,Source Major Product Item Name,Source Minor Instance Number,Source Minor Serial Number/PAK Number,Source Minor Item Name,Target Major- Instance Number,Target Major Serial Number/PAK number,Target -Major Product Item Name,CS Case Number-Internal");
		templateColumnData.put("SCM_AM_LINK", "Standalone Instance Number,Standalone Serial Number/PAK number,Standalone Item Name,New Parent - Instance Number,New Parent - Serial Number/PAK number,New Parent - Item Name,CS Case Number-Internal");
		templateColumnData.put("SCM_AM_DELINK", "Source Major Instance Number,Source Major Serial Number,Source Major Item Name,Source Minor Instance number,Source Minor Serial Number/PAK Number,Source Minor Item Name,CS Case number-Internal");
		
		templateColumnData.put("MAT_CONTRACT_BID_CHANGE", "Contract Number,Old BID,New BID,Reason Code,CS Case Number,Requestor Email Id");
		
		templateColumnData.put("MAT_ADD_UPDATE_DEPLOYBASE", "Host ID (SN or MAC ID),HW PID,HW Instance Number,SW PAK#,SW PID,SW Instance Number,SW Quantity,Start Date,End Date,Transaction Type,Migrated Flag,Reason Code,CS Case Number,ADD,YES");
		
		templateColumnData.put("MAT_DNR_CONTRACT_LVL", "Contract Number,Service Level,DNR,Reason Code,CS Case Number");
		templateColumnData.put("MAT_DNR_SITE_LVL", "Contract Number,Service Level,Install Site Id,DNR,Reason Code,CS Case Number");
		templateColumnData.put("MAT_DNR_PRODUCT_LVL", "Contract Number,Service Level,Line Number,Serial Number/PAK Number,Instance Number,Item Name,DNR,Reason Code,CS Case Number");
		
		templateColumnData.put("PORTABLE_SOLUTIONS","SOL CAT Number,ACTION,ROW Number - Label,Termination Effective Date dd-Mon-yy,Instance Number,Serial Number/PAK#,Item Name,Contract Number,Product Coverage Line Number,Target Contract Number,Target Service Line ID,Product Coverage Begin Date    dd-Mon-yy,Product Coverage End Date       dd-Mon-yy,Product Maintenance List Price,Product Maintenance Net Price,Maintenance SO Number,Maintenance PO Number,Distributor Bill To Id,COPY TO - Target Instance Number,COPY TO - Target Serial Number,COPY TO -Target Item Name,Terminate As-Is Coverage after copying,Terminate IB Instance after copying,New Serial Number/PAK#,New Item Name,Quantity,Target Installed At SiteID,Target Product Ship-To Number,Target Bill-To Number,Target Ship Date                 dd-Mon-yy,Hardware PO Number,Hardware PO Type,Hardware SO Number,Hardware List Price,Hardware Purchase Price,Warranty End Date                 dd-Mon-yy,Warranty Type,Installed Base Status,Mac ID,Migrated Flag,External Reference,Extended Support Number,New Parent - Instance Number,New Parent - Serial Number,New Parent - Item Name,New Parent- Copy Coverage,New Parent- Copy SiteID,Latest-INSTALLED");
														
		templateColumnData.put("MAT_T4C", "Contract Number,Service Level,Line Number,Line Status,Instance Number,Serial Number/PAK Number,Product Id,Termination Date,Reason Code,CS Case Number,Invoice Number,Bill-To ID,Credit Amount,Service Cancellation Fee (SCF),Invoice Line Number,Email Id,Decommission");
		
		templateColumnDataExt.put("MAT_MOVE_C2C_S2S_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Contract #,Target Site ID,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("MAT_MOVE_C2C_S2S_AT_PRODUCT", "Source Contract #,Source Service Level,Source Site ID,Serial Number/PAK Number,Instance Number,Item Name,Target Contract #,Target Site ID,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("MAT_MOVE_C2C_AT_CONTRACT", "Source Contract #,Target Contract #,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("MAT_MOVE_C2C_AT_PRODUCT", "Source Contract #,Source Service Level,Serial Number / PAK Number,Instance Number,Item Name,Target Contract #,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("MAT_MOVE_S2S_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Site ID,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("MAT_MOVE_C2C_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Contract #,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("MAT_MOVE_S2S_AT_PRODUCT", "Source Contract #,Source Site ID,Serial number/PAK Number,Instance Number,Item Name,Target Site ID,C2C-Dwngrd w/o proof of pay");
		templateColumnDataExt.put("SCM_AM_MOVE", "Source Major Instance Number,Source Major Serial Number/PAK number,Source Major Product Item Name,Source Minor Instance Number,Source Minor Serial Number/PAK Number,Source Minor Item Name,Target Major- Instance Number,Target Major Serial Number/PAK number,Target -Major Product Item Name,CS Case Number-Internal");
		templateColumnDataExt.put("SCM_AM_LINK", "Standalone Instance Number,Standalone Serial Number/PAK number,Standalone Item Name,New Parent - Instance Number,New Parent - Serial Number/PAK number,New Parent - Item Name,CS Case Number-Internal");
		templateColumnDataExt.put("SCM_AM_DELINK", "Source Major Instance Number,Source Major Serial Number,Source Major Item Name,Source Minor Instance number,Source Minor Serial Number/PAK Number,Source Minor Item Name,CS Case number-Internal");
		templateColumnDataExt.put("MAT_BEST_SR_CR_SITES", "Customer Name,Business Entity,Address 1,Address 2,Address 3,City,County,State,Province,Zip/Postal Code,Country,Country List of Values,Business Entity List of Values");
		templateColumnDataExt.put("MAT_UE_MOVE_S2S_PRODUCT", "Source Site ID,Serial Number/PAK Number,Item Name,Target Site ID");

		
	}
	
}























/*package com.cisco.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class MultipartFilter implements Filter {

	private static HashMap<String, String> templateColumnData = null;
	
	private static HashMap<String, String> templateColumnDataExt = null;
	
	public void init(FilterConfig filterConfig) throws ServletException {
		
		templateColumnData = new HashMap<String, String>();
	
		templateColumnDataExt = new HashMap<String, String>();
		
		templateColumnData.put("MAT_ADD", "Contract Number, Service Level, Begin Date, End Date, Bill To Id, PO/SO/Billing, Maintenance PO, Distributor Bill To Id, Serial Number/PAK Number, Product Id, Site Id, Instance Number, Product PO/SO, Quantity, Softline (Yes/No), Net Factor, Mac Id, Carton Id, Ship Date, Migrated Flag, External Reference, Reason Code, CS Case Number,PO#/SO# provided,Yes");
		
		templateColumnData.put("MAT_MOVE_C2C_S2S_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Contract #,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_S2S_AT_PRODUCT", "Source Contract #,Source Service Level,Source Site ID,Serial Number/PAK Number,Instance Number,Item Name,Target Contract #,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_AT_CONTRACT", "Source Contract #,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_AT_PRODUCT", "Source Contract #,Source Service Level,Serial Number / PAK Number,Instance Number,Item Name,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_C2C_SVC_LVL_MOVE", "Source Contract#,Source Service Level,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_C2C_AT_SITE", "Source Contract,Source Service Level,Source Site ID,Target Contract #,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_CHG_SERVICE_LEVEL", "Contract Number,Source Service Level,Target Service Level,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_DATE_CHANGE_PRODUCT_LINE", "Contract Number,Serial Number/PAK Number,Product Id,Line Number,Start Date,End Date,Site Id,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_M_AND_P_ENTITLMNT_ADD_PRODUCTS", "Contract Number,Service Level,Begin Date,End Date,Bill To Id,Net Price,PO/SO/Billing,Maintenance PO,Distributor Bill To Id,Serial Number/PAK Number,Product Id,Site Id,Instance Number,Product PO/SO,Minimum Duration Flag,Quantity,Softline (Yes/No),Net Factor,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_UE_MOVE_S2S_PRODUCT", "Source Site ID,Serial Number/PAK Number,Item Name,Target Site ID,CS Case Number");
		templateColumnData.put("MAT_MOVE_S2S_AT_PRODUCT", "Source Contract #,Source Site ID,Serial number/PAK Number,Instance Number,Item Name,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_MOVE_S2S_AT_SITE", "Source Contract #,Source Service Level,Source Site ID,Target Site ID,Reason Code,CS Case Number,C2C-Dwngrd w/o proof of pay");
		
		templateColumnData.put("MAT_BEST_SR_CR_SITES", "Customer Name,Business Entity,Address 1,Address 2,Address 3,City,County,State,Province,Zip/Postal Code,Country,CS Case Number,User Reference No,Country List of Values,Business Entity List of Values");
		
		templateColumnData.put("MAT_TERMINATE_SERVICE_LVL", "Contract Number,Service Level,Termination Date,Reason Code,CS Case Number");
		templateColumnData.put("MAT_TERMINATE", "Contract Number,Service Level,Line Number,Instance Number,Serial Number/PAK Number,Product Id,Termination Date,Reason Code,CS Case Number");
		
		templateColumnData.put("MAT_TERMINATE_CONTRACT", "Contract Number,Termination Date,Reason Code,CS Case Number");
		
		templateColumnData.put("SCM_AM_MOVE", "Source Major Instance Number,Source Major Serial Number/PAK number,Source Major Product Item Name,Source Minor Instance Number,Source Minor Serial Number/PAK Number,Source Minor Item Name,Target Major- Instance Number,Target Major Serial Number/PAK number,Target -Major Product Item Name,CS Case Number-Internal");
		templateColumnData.put("SCM_AM_LINK", "Standalone Instance Number,Standalone Serial Number/PAK number,Standalone Item Name,New Parent - Instance Number,New Parent - Serial Number/PAK number,New Parent - Item Name,CS Case Number-Internal");
		templateColumnData.put("SCM_AM_DELINK", "Source Major Instance Number,Source Major Serial Number,Source Major Item Name,Source Minor Instance number,Source Minor Serial Number/PAK Number,Source Minor Item Name,CS Case number-Internal");
		
		templateColumnData.put("MAT_CONTRACT_BID_CHANGE", "Contract Number,Old BID,New BID,Reason Code,CS Case Number,Requestor Email Id");
		
		templateColumnData.put("MAT_ADD_UPDATE_DEPLOYBASE", "Host ID (SN or MAC ID),HW PID,HW Instance Number,SW PAK#,SW PID,SW Instance Number,SW Quantity,Start Date,End Date,Transaction Type,Migrated Flag,Reason Code,CS Case Number,ADD,YES");
		
		templateColumnData.put("MAT_DNR_CONTRACT_LVL", "Contract Number,Service Level,DNR,Reason Code,CS Case Number");
		templateColumnData.put("MAT_DNR_SITE_LVL", "Contract Number,Service Level,Install Site Id,DNR,Reason Code,CS Case Number");
		templateColumnData.put("MAT_DNR_PRODUCT_LVL", "Contract Number,Service Level,Line Number,Serial Number/PAK Number,Instance Number,Item Name,DNR,Reason Code,CS Case Number");
		
		templateColumnData.put("PORTABLE_SOLUTIONS", "Contract Number,Service Level,Line Number,Serial Number/PAK Number,Instance Number,Item Name,DNR,Reason Code,CS Case Number");
		
		templateColumnData.put("TERMINATION_FOR_CREDIT", "Contract Number,Service Level,Line Number,Line Status,Instance Number,Serial Number/PAK Number,Product Id,Termination Date,Reason Code,CS Case Number,Invoice Number,Bill-To ID,Credit Amount,Service Cancellation Fee (SCF),Invoice Line Number,Email Id,Decommission");
		
		
		
		
		log.info("HashMap initianlized...");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {
		// Check type request.

		if (request instanceof HttpServletRequest) {
			// Cast back to HttpServletRequest.
			log.info("If in dofilter");

			RequestWrapper multiReadRequest = new RequestWrapper(
					(HttpServletRequest) request);
			HttpServletRequest httpRequest = multiReadRequest;

			List<FileItem> multipartItems = null;

			try {

				log.info("In try parsing request");

				// Parse the multipart request items.
				multipartItems = new FileUpload(new DiskFileItemFactory())
						.parseRequest(httpRequest);
			} catch (FileUploadException e) {
				log.info("In try parsing request " + e);
			}

			log.info("Loooping over multipartItems ");

			String requestType = null;
			String isValidRequest = "";
			String loggedUserId = null;
			String userAccessLevel = null;
			
			for (FileItem multipartItem : multipartItems) {

				log.info(multipartItem.getFieldName());

				if (multipartItem.isFormField()) {
					// Process regular form field (input
					// type="text|radio|checkbox|etc", select, etc).
					// processFormField(multipartItem, parameterMap);

					String name = multipartItem.getFieldName();
					String value = multipartItem.getString();

					if (name.equals("requestType")) {

						requestType = multipartItem.getString();
						log.info("Request type value : " + value);

					}else if(name.equals("loggedUserId")){
						
						loggedUserId = value;
						log.info("loggedUserId value : " + loggedUserId);
						
					}else if(name.equals("userAccessLevel")){
						userAccessLevel= value;
						log.info("userAccessLevel value : " + userAccessLevel);
						
					}

				} else {
					// Process form file field (input type="file").

					// File uploaded with good size.
					File fileFromRequest = null;
					
					
					String name = new File(multipartItem.getName()).getName();
					
					
					
					log.info("File name is : " + name);
					
					try {

						fileFromRequest = new File(name);
						
						fileFromRequest.mkdir();
						
						log.info("File path : "+ fileFromRequest.getAbsolutePath());

						multipartItem.write(fileFromRequest);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						log.info("Exception file wr.." + e);
						fileFromRequest.delete();
					}

					File file = null;

					FileInputStream fis = null;
					HSSFWorkbook wb = null;
					HSSFSheet sheet = null;
					ArrayList<String> colListFromTemplate = new ArrayList<String>();
					List<String> colListFromTable = new ArrayList<String>();
					String colStrListFromTable = null;

					file = new File(name);

					try {
						fis = new FileInputStream(file);

						try {
							wb = new HSSFWorkbook(fis);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						sheet = wb.getSheetAt(0);
						HSSFRow row = sheet.getRow(0);

						log.info("----------------------------------------");
						
						for (Cell cell : row) {

							boolean isHidden = sheet.isColumnHidden(cell
									.getColumnIndex());

							String cellValue = cell.getStringCellValue();

							if (!isHidden
									&& (cellValue != null && !cell
											.getStringCellValue().equals(""))) {

								log.info(cell.getStringCellValue());

								colListFromTemplate.add(cellValue.trim());
								

							} else {
								log.info("Hidden : "
										+ sheet.isColumnHidden(cell
												.getColumnIndex()));
							}

							cellValue = null;
						}

						
						for(int counter = 0 ; counter < row.getLastCellNum() ; counter ++){
							
							HSSFCell cell = row.getCell((short)counter);
							
							if (cell != null && cell.getCellStyle() != null && !cell.getCellStyle().getHidden()){
									
								log.info("Not Hidden ");
									
								 String cellValue = cell.getStringCellValue();
								 
								 log.info("Cell Value : " + cellValue);
								 
								 if((cellValue!=null &&  !cell.getStringCellValue().equals("")) ){
									 colListFromTemplate.add(cellValue.trim());
									  
								 }else { 
									//log.info("Hidden : "+sheet.isColumnHidden(cell.getColumnIndex())); 
								  
								  cellValue = null;
								  
								  }
							}
						}
						
						log.info("----------------------------------------");

						log.info("File deleting");
						file.delete();
						log.info("File deleted");

						
						} catch (FileNotFoundException e) {
						// TODO Auto-generated catch block
						log.info("FileNotFoundException " + e);
							
					}

					log.info("Searching Request type value : " + requestType);
	
					if(userAccessLevel != null && userAccessLevel.equals("4")){
						for (Map.Entry<String, String> entry : templateColumnData.entrySet()) {
							
							if(requestType.equals(entry.getKey())){
								colStrListFromTable = entry.getValue();
								log.info("Key : " + entry.getKey() + " Value : "+ entry.getValue());
								break;
							}
						}
					}else if(userAccessLevel != null && userAccessLevel.equals("3")){
						
					}
					
					
					
					if (colStrListFromTable != null
							&& colStrListFromTable.length() > 0) {
						for (String s : colStrListFromTable.split(",")) {

							colListFromTable.add(s.trim());
						}
						log.info("Searching Request type value : " + requestType);
						log.info("colListFromTemplate : "	+ colListFromTemplate);
						log.info("colListFromTable : "	+ colListFromTable);

						if (colListFromTemplate.size() == colListFromTable.size()) {

							log.info("Contains All : "+ colListFromTemplate.containsAll(colListFromTable));
							if (colListFromTemplate.containsAll(colListFromTable)) {

								isValidRequest = "matching";

							} else {
								isValidRequest = "notmatching";
							}

						} else {
							isValidRequest = "notmatching";
						}

					} else {
						isValidRequest = "notmatching";
					}
				}
			}

			log.info("Loooped over multipartItems ");
	
			log.info("Forwarding");

			log.info("Passing wrappedRequest ");
	
			if (isValidRequest.equals("matching")) {
				
				log.info("Requests matching");
				// Continue with filter chain.
				chain.doFilter(multiReadRequest, response);
			} else {
				log.info("No Requests matching");
				request.setAttribute("errorMessage", "errorMessage");
				RequestDispatcher rd = request.getRequestDispatcher("/mcmindex.do");
				rd.forward(request, response);
			}

		} else {
			// Not a HttpServletRequest.
			log.info("Else in dofilter");
			chain.doFilter(request, response);
		}

		log.info("DONE!!! ");
	}

	*//**
	 * @see javax.servlet.Filter#destroy()
	 *//*
	public void destroy() {
		// I am a boring method.
	}

	
}*/