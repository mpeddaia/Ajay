/*
 * Created on Nov 23, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.bo;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.mcm.action.McmBaseAction;
import com.cisco.mcm.bean.UploadTemplateBean;
import com.cisco.mcm.dao.McmDAO;
import com.cisco.mcm.genJava.XxcssCtReqDetailsObjType;
import com.cisco.mcm.util.McmConstants;
import com.cisco.mcm.util.RequestStatusUtil;
import com.cisco.servicesales.session.MCMUserSession;

/**
 * @author kiguntup
 * 
 */
public class McmUploadBO {

	private static Logger logger = Logger.getLogger(McmUploadBO.class);

	@SuppressWarnings("unchecked")
	public Collection getDownloadTemplates(MCMUserSession userSession,HttpServletRequest request, String matuser, String userRole)
			throws Exception {
		ArrayList list = new ArrayList();
		logger.info(" In Get Download Templates Function");
		try {

			ResourceBundle rb = ResourceBundle.getBundle("DownloadTemplateResources");

			list.add(new UploadTemplateBean("", rb.getString(McmConstants.DefaultValue)));
			logger.info("User Access Level : " + userSession.getAccessLevel());
			logger.info("User Role : " + userSession.getUserRole());
			logger.info("User Roles : " + userRole);
			// Portable solution
			if (userRole.equals(McmConstants.XXCSS_PORTABLE_SOLUTION)) {
				list
						.add(new UploadTemplateBean(McmConstants.PORTABLE_SOLUTIONS, rb
								.getString("MAT.PORTABLE_SOLUTIONS")));
			} 
			else if (userRole.equals(McmConstants.XXCSS_T4C_AGENT))
			{
				list.add(new UploadTemplateBean(McmConstants.TERMINATION_FOR_CREDIT, rb
						.getString("MAT.TERMINATION_FOR_CREDIT")));

			}
			else if((userSession.getAccessLevel()).equals("4") && (userRole.equals(McmConstants.XXCSS_CS_OPS)))
			{
					logger.info("Inside download If for get access level 4 and User role is CS OPS SUPER USER and OPS SUPER USER");
					list.add(new UploadTemplateBean(McmConstants.ADD_PRODUCTS, rb.getString("MAT.ADD_PRODUCTS")));
					list.add(new UploadTemplateBean(McmConstants.C2C_AND_S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_AND_S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_CONTRACT_LEVEL_MOVE, rb
							.getString("MAT.C2C_CONTRACT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT.C2C_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_SERVICE_LEVEL_MOVE, rb
							.getString("MAT.C2C_SERVICE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_SITE_LEVEL_MOVE, rb
							.getString("MAT.C2C_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.CHANGE_SERVICE_LEVEL, rb
							.getString("MAT_CHG_SERVICE_LEVEL")));
					list.add(new UploadTemplateBean(McmConstants.DATE_CHANGE_PRODUCT_OR_LINE1, rb
							.getString("MAT_DATE_CHANGE_PRODUCT_LINE")));
					list.add(new UploadTemplateBean(McmConstants.M_AND_P_ENTITLMNT_ADD_PRODUCTS, rb
							.getString("MCM_M_AND_P_ENTITLMNT_ADD_PRODUCTS")));
					list.add(new UploadTemplateBean(McmConstants.MOVE_UNCOVERED_EQUIP_PROD_LVL, rb
							.getString("MAT.MOVE_UNCOVERED_EQUIP_PROD_LVL")));
	
					list.add(new UploadTemplateBean(McmConstants.S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT.S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT.S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.SEARCH_AND_CREATE_SHIP_TO_ID, rb
							.getString("SEARCH_AND_CREATE_SHIP_TO_ID")));
	
					list.add(new UploadTemplateBean(McmConstants.SERVICE_LEVEL_TERMINATION, rb
							.getString("MAT.MAT_SERVICE_LEVEL_TERMINATION")));
					
					// ADDED AS PART OF Q1FY13 T4C CHANGES
					
				//	list.add(new UploadTemplateBean(McmConstants.TERMINATION_FOR_CREDIT, rb
					//		.getString("MAT.TERMINATION_FOR_CREDIT")));
	
					list.add(new UploadTemplateBean(McmConstants.TERMINATE_PRODUCTS, rb
									.getString("MAT.TERMINATE_PRODUCTS")));
					// TD013
					list.add(new UploadTemplateBean(McmConstants.CONTRACT_TERMINATIONS, rb
							.getString("MAT.CONTRACT_TERMINATIONS")));
					
					//Add code for link, delink and move for upload definition TD: 26738
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
					
					//Added by sphilipo for Q4FY13 changes
					/*
					list.add(new UploadTemplateBean(McmConstants.MAT_DNR_UPDATE_AT_CONTRACT_LEVEL, rb
						.getString("MAT.DNR_UPDATE_AT_CONTRACT_LEVEL")));
					list.add(new UploadTemplateBean(McmConstants.MAT_DNR_UPDATE_AT_SITE_LEVEL, rb
							.getString("MAT.DNR_UPDATE_AT_SITE_LEVEL")));
					list.add(new UploadTemplateBean(McmConstants.MAT_DNR_UPDATE_AT_PROD_LEVEL, rb
							.getString("MAT.DNR_UPDATE_AT_PROD_LEVEL")));*/
					
					//Added by sphilipo for Q4FY13 changes			
									
				}
			//Added by sphilipo for Q4FY13 changes
			else if((userSession.getAccessLevel()).equals("4")&& (McmConstants.DNR_ROLES.contains(userRole)))
			{
				if(userRole.equals(McmConstants.XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM) ||userRole.equals(McmConstants.XXCSS_SSR_REP)) 
				{
					logger.info(" inside  getDownloadtemplates DNR Roles with XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM & XXCSS_SSR_REP role ");
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_AND_S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_AND_S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_CONTRACT_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_CONTRACT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT_EXT.S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_SITE_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT_EXT.S2S_PRODUCT_LEVEL_MOVE")));
					//Add code for link, delink and move for upload definition TD: 26738
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
					
					// Added by sphilipo on 14/06/2012 as part of Q2FY13 Rel
					list.add(new UploadTemplateBean(McmConstants.SEARCH_AND_CREATE_SHIP_TO_ID, rb
							.getString("MAT.SEARCH_AND_CREATE_SHIP_TO")));				
					list.add(new UploadTemplateBean(McmConstants.MAT_UE_MOVE_S2S_PRODUCT, rb
							.getString("MAT.UNCOVERED_EQUIP_AT_PROD_LVL")));
					//End of addition by sphilipo
													
					
				}
				
				
				else if((userRole.equals(McmConstants.XXCSS_OPS_SUPER_USR)))
				{
					logger.info(" DNR User role is XXCSS_OPS_SUPER_USR");
						
					//System.out.println("Inside If for get access level 4");
					list.add(new UploadTemplateBean(McmConstants.ADD_PRODUCTS, rb.getString("MAT.ADD_PRODUCTS")));
					list.add(new UploadTemplateBean(McmConstants.C2C_AND_S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_AND_S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_CONTRACT_LEVEL_MOVE, rb
							.getString("MAT.C2C_CONTRACT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT.C2C_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_SERVICE_LEVEL_MOVE, rb
							.getString("MAT.C2C_SERVICE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.C2C_SITE_LEVEL_MOVE, rb
							.getString("MAT.C2C_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.CHANGE_SERVICE_LEVEL, rb
							.getString("MAT_CHG_SERVICE_LEVEL")));
					list.add(new UploadTemplateBean(McmConstants.DATE_CHANGE_PRODUCT_OR_LINE1, rb
							.getString("MAT_DATE_CHANGE_PRODUCT_LINE")));
					list.add(new UploadTemplateBean(McmConstants.M_AND_P_ENTITLMNT_ADD_PRODUCTS, rb
							.getString("MCM_M_AND_P_ENTITLMNT_ADD_PRODUCTS")));
					list.add(new UploadTemplateBean(McmConstants.MOVE_UNCOVERED_EQUIP_PROD_LVL, rb
							.getString("MAT.MOVE_UNCOVERED_EQUIP_PROD_LVL")));
	
					list.add(new UploadTemplateBean(McmConstants.S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT.S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT.S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.SEARCH_AND_CREATE_SHIP_TO_ID, rb
							.getString("SEARCH_AND_CREATE_SHIP_TO_ID")));
	
					list.add(new UploadTemplateBean(McmConstants.SERVICE_LEVEL_TERMINATION, rb
							.getString("MAT.MAT_SERVICE_LEVEL_TERMINATION")));
					
					// ADDED AS PART OF Q1FY13 T4C CHANGES
					
				    //	list.add(new UploadTemplateBean(McmConstants.TERMINATION_FOR_CREDIT, rb
					//		.getString("MAT.TERMINATION_FOR_CREDIT")));
	
					list.add(new UploadTemplateBean(McmConstants.TERMINATE_PRODUCTS, rb
									.getString("MAT.TERMINATE_PRODUCTS")));
					// TD013
					list.add(new UploadTemplateBean(McmConstants.CONTRACT_TERMINATIONS, rb
							.getString("MAT.CONTRACT_TERMINATIONS")));
					
					//Add code for link, delink and move for upload definition TD: 26738
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
	
					//Start : Added by amalekar for Q1FY14 changes
					
					list.add(new UploadTemplateBean(McmConstants.MAT_CONTRACT_BID_CHANGE, rb
							.getString("MAT.CONTRACT_BID_CHANGE")));
	
					
					//End: Added by amalekar for Q1FY14 changes	
					
					
					list.add(new UploadTemplateBean(McmConstants.MAT_ADD_UPDATE_DEPLOYBASE, rb
							.getString("MAT.ADD_UPDATE_DEPLOYBASE")));
								
												
				}
				
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_UPDATE_AT_CONTRACT_LEVEL, rb
						.getString("MAT.DNR_UPDATE_AT_CONTRACT_LEVEL")));
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_UPDATE_AT_SITE_LEVEL, rb
						.getString("MAT.DNR_UPDATE_AT_SITE_LEVEL")));
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_UPDATE_AT_PROD_LEVEL, rb
						.getString("MAT.DNR_UPDATE_AT_PROD_LEVEL")));
			
															
				
			}
			//Added by sphilipo for Q4FY13 changes
				else if (McmConstants.EXT_ROLES.contains(userRole))
				{
					logger.info("Inside If  for External User Roles");
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_AND_S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_AND_S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_CONTRACT_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_CONTRACT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_S2S_SITE_LEVEL_MOVE, rb
							.getString("MAT_EXT.S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_C2C_SITE_LEVEL_MOVE, rb
							.getString("MAT_EXT.C2C_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.EXT_S2S_PRODUCT_LEVEL_MOVE, rb
							.getString("MAT_EXT.S2S_PRODUCT_LEVEL_MOVE")));
					//Add code for link, delink and move for upload definition TD: 26738
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
					 // Added by sphilipo as a part of Q2FY13 Release
					list.add(new UploadTemplateBean(McmConstants.MAT_SEARCH_AND_CREATE_SHIP_TO, rb
							.getString("MAT.SEARCH_AND_CREATE_SHIP_TO")));
					list.add(new UploadTemplateBean(McmConstants.MAT_UNCOVERED_EQUIP_AT_PROD_LVL, rb
							.getString("MAT.UNCOVERED_EQUIP_AT_PROD_LVL")));
									
					//End of addition by sphilipo as a part of Q2FY13 Release					
				}
				
				else 
				{
					logger.info("Inside If for other user access levels");
					McmBaseAction mba=new McmBaseAction();
					//Add code for link, delink and move for upload definition TD: 26738
					if(mba.hasPrivilegesMoveLinkDelink(request, McmConstants.MASS_MAT_UPLD_ACTIONS_MOVE))
					{
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					}
					if(mba.hasPrivilegesMoveLinkDelink(request, McmConstants.MASS_MAT_UPLD_ACTIONS_LINK))
					{
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					}
					if(mba.hasPrivilegesMoveLinkDelink(request, McmConstants.MASS_MAT_UPLD_ACTIONS_DELINK))
					{
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
					}
							
					}
					
				
			
		} 
		
		/* 
		Start : Commented code 
		Reason : Avoid Catching NPE
		Commented by : Ajay Malekar(amalekar)
		Release name : Q2FY15
		*/

		
		/*catch (NullPointerException e) {
			//logger.error(e); // original code
			logger.error("McmUploadBO : getDownloadTemplates : NullPointerException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.

		} */
		
		// End : Commented code
		
		/* 
		Start : New code added 
		Reason : To fix CI issue , Avoid Catching NPE
		Commented by : Ajay Malekar(amalekar)
		Release name : Q2FY15
		*/
		
		catch (Exception e) {
			//logger.error(e); // original code
			logger.error("McmUploadBO : getDownloadTemplates : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.

		}
		
		// End : New code added
		
		finally {
			logger.debug(" Inside Finally Block ");
		}
		return list;
	}

	/**
	 * @param userSession
	 * @param matuser
	 * @param userRole
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Collection getUploadTemplates(MCMUserSession userSession,HttpServletRequest request, String matuser, String userRole) throws Exception {
		ArrayList list = new ArrayList();
		logger.info(" In Get Upload Templates Function");
		try {
			/*if(uploadprivilage)
			{*/
			ResourceBundle rb = ResourceBundle.getBundle("UploadTemplateResources");

			// added if condition to fix Portable solution condition by Archana,
			// 20 Nov
			
			logger.info("User Access Level :" +userSession.getAccessLevel() );
			if (userRole.equals(McmConstants.XXCSS_PORTABLE_SOLUTION)) {
				list
						.add(new UploadTemplateBean(McmConstants.PORTABLE_SOLUTIONS, rb
								.getString("MAT.PORTABLE_SOLUTIONS")));
			} 
			else if (userRole.equals(McmConstants.XXCSS_T4C_AGENT))
			{
				list.add(new UploadTemplateBean(McmConstants.MAT_TERMINATION_FOR_CREDIT, rb.getString("MAT.TERMINATION_FOR_CREDIT")));

			}
			else if((userSession.getAccessLevel()).equals("4") && (userRole.equals(McmConstants.XXCSS_CS_OPS)))
			{
				logger.info("Inside If for get access level 4 & User role is XXCSS_CS_OPS ");
				
					//System.out.println("Inside If for get access level 4");
				list.add(new UploadTemplateBean(McmConstants.MAT_ADD, rb.getString("MAT.ADD_PRODUCTS")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE, rb
						.getString("MAT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT, rb
						.getString("MAT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_CONTRACT, rb
						.getString("MAT.C2C_CONTRACT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_PRODUCT, rb
						.getString("MAT.C2C_PRODUCT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_C2C_SERVICE_LEVEL_MOVE, rb
						.getString("MAT.C2C_SERVICE_LEVEL_MOVE")));

				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_SITE, rb
						.getString("MAT.C2C_SITE_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MCM_MAT_CHANGE_SERLVL, rb
						.getString("MAT_CHG_SERVICE_LEVEL")));
				list.add(new UploadTemplateBean(McmConstants.DATE_CHANGE_PRODUCT_OR_LINE, rb
						.getString("MAT_DATE_CHANGE_PRODUCT_LINE")));

				list.add(new UploadTemplateBean(McmConstants.MCM_MAT_M_AND_P_ENTITLMNT, rb
						.getString("MCM_M_AND_P_ENTITLMNT_ADD_PRODUCTS")));
				list.add(new UploadTemplateBean(McmConstants.MAT_UE_MOVE_S2S_PRODUCT, rb
						.getString("MAT.MOVE_UNCOVERED_EQUIP_PROD_LVL")));

				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_PRODUCT, rb
						.getString("MAT.S2S_PRODUCT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_SITE, rb
						.getString("MAT.S2S_SITE_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID, rb
						.getString("MAT.SEARCH_AND_CREATE_SHIP_TO_ID")));

				list.add(new UploadTemplateBean(McmConstants.MAT_SERVICE_LEVEL_TERMINATION, rb
						.getString("MAT.MAT_SERVICE_LEVEL_TERMINATION")));
				
				// ADDED AS PART OF Q1FY13 T4C CHANGES
				
			//	list.add(new UploadTemplateBean(McmConstants.MAT_TERMINATION_FOR_CREDIT, rb.getString("MAT.TERMINATION_FOR_CREDIT")));

				list.add(new UploadTemplateBean(McmConstants.MAT_TERMINATE, rb.getString("MAT.TERMINATE_PRODUCTS")));
				
				// TD013
				list.add(new UploadTemplateBean(McmConstants.MAT_TERMINATE_CONTRACT, rb
						.getString("MAT.CONTRACT_TERMINATIONS")));
				
				//Add code for link, delink and move for upload definition TD: 26738
				list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
						.getString("MAT.SCM_AM_MOVE")));
				
				list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
						.getString("MAT.SCM_AM_LINK")));
				
				list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
						.getString("MAT.SCM_AM_DELINK")));
				
			/*	//Added by sphilipo for Q4FY13 changes
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_CONTRACT_LVL, rb
						.getString("MAT.DNR_UPDATE_AT_CONTRACT_LEVEL")));
				
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_SITE_LVL, rb
						.getString("MAT.DNR_UPDATE_AT_SITE_LEVEL")));
				
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_PRODUCT_LVL, rb
						.getString("MAT.DNR_UPDATE_AT_PROD_LEVEL")));
				//Added by sphilipo for Q4FY13 changes			
*/								
				
				}
			

			//Added by sphilipo for Q4FY13 changes
			else if((userSession.getAccessLevel()).equals("4")&& (McmConstants.DNR_ROLES.contains(userRole)))
			{
				if(userRole.equals(McmConstants.XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM) ||userRole.equals(McmConstants.XXCSS_SSR_REP)) 
				{	
					
					logger.info(" inside  getUploadtemplates DNR Roles with XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM & XXCSS_SSR_REP role ");
					
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE, rb
							.getString("MAT_EXT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT, rb
							.getString("MAT_EXT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_CONTRACT, rb
							.getString("MAT_EXT.C2C_CONTRACT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_PRODUCT, rb
							.getString("MAT_EXT.C2C_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_SITE, rb
							.getString("MAT_EXT.S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_SITE, rb
							.getString("MAT_EXT.C2C_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_PRODUCT, rb
							.getString("MAT_EXT.S2S_PRODUCT_LEVEL_MOVE")));
					//Add code for link, delink and move for upload definition TD: 26738
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
					// Added by sphilipo on 14/06/2012 as part of Q2FY13 Rel
					list.add(new UploadTemplateBean(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID, rb
							.getString("MAT.SEARCH_AND_CREATE_SHIP_TO")));				
					list.add(new UploadTemplateBean(McmConstants.MAT_UE_MOVE_S2S_PRODUCT, rb
							.getString("MAT.UNCOVERED_EQUIP_AT_PROD_LVL")));
					//End of addition by sphilipo	
											
					//logger.info(" inside  DNR Roles ");											
					
					
				}
								
				else if((userRole.equals(McmConstants.XXCSS_OPS_SUPER_USR)))
				{
					logger.info("DNR User role is XXCSS_OPS_SUPER_USR");
											
					list.add(new UploadTemplateBean(McmConstants.MAT_ADD, rb.getString("MAT.ADD_PRODUCTS")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE, rb
							.getString("MAT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT, rb
							.getString("MAT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_CONTRACT, rb
							.getString("MAT.C2C_CONTRACT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_PRODUCT, rb
							.getString("MAT.C2C_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_C2C_SERVICE_LEVEL_MOVE, rb
							.getString("MAT.C2C_SERVICE_LEVEL_MOVE")));
	
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_SITE, rb
							.getString("MAT.C2C_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MCM_MAT_CHANGE_SERLVL, rb
							.getString("MAT_CHG_SERVICE_LEVEL")));
					list.add(new UploadTemplateBean(McmConstants.DATE_CHANGE_PRODUCT_OR_LINE, rb
							.getString("MAT_DATE_CHANGE_PRODUCT_LINE")));
	
					list.add(new UploadTemplateBean(McmConstants.MCM_MAT_M_AND_P_ENTITLMNT, rb
							.getString("MCM_M_AND_P_ENTITLMNT_ADD_PRODUCTS")));
					list.add(new UploadTemplateBean(McmConstants.MAT_UE_MOVE_S2S_PRODUCT, rb
							.getString("MAT.MOVE_UNCOVERED_EQUIP_PROD_LVL")));
	
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_PRODUCT, rb
							.getString("MAT.S2S_PRODUCT_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_SITE, rb
							.getString("MAT.S2S_SITE_LEVEL_MOVE")));
					list.add(new UploadTemplateBean(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID, rb
							.getString("MAT.SEARCH_AND_CREATE_SHIP_TO_ID")));
	
					list.add(new UploadTemplateBean(McmConstants.MAT_SERVICE_LEVEL_TERMINATION, rb
							.getString("MAT.MAT_SERVICE_LEVEL_TERMINATION")));
				
					list.add(new UploadTemplateBean(McmConstants.MAT_TERMINATE, rb.getString("MAT.TERMINATE_PRODUCTS")));
					
					list.add(new UploadTemplateBean(McmConstants.MAT_TERMINATE_CONTRACT, rb
							.getString("MAT.CONTRACT_TERMINATIONS")));
					
									
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
							.getString("MAT.SCM_AM_MOVE")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
							.getString("MAT.SCM_AM_LINK")));
					
					list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
							.getString("MAT.SCM_AM_DELINK")));
					
					//Start : Added by amalekar for Q1FY14 changes
					
					list.add(new UploadTemplateBean(McmConstants.MAT_BID_CHANGE, rb
							.getString("MAT.CONTRACT_BID_CHANGE")));
	
					
					//End: Added by amalekar for Q1FY14 changes		
					
					list.add(new UploadTemplateBean(McmConstants.MAT_AU_DEPLOYBASE, rb
							.getString("MAT.ADD_UPDATE_DEPLOYBASE")));
												
			 }
				
				
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_CONTRACT_LVL, rb
						.getString("MAT.DNR_UPDATE_AT_CONTRACT_LEVEL")));
				
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_SITE_LVL, rb
						.getString("MAT.DNR_UPDATE_AT_SITE_LEVEL")));
				
				list.add(new UploadTemplateBean(McmConstants.MAT_DNR_PRODUCT_LVL, rb
						.getString("MAT.DNR_UPDATE_AT_PROD_LEVEL")));
				
			}
			
			
			
			
			//Added by sphilipo for Q4FY13 changes
			else if (McmConstants.EXT_ROLES.contains(userRole))
			{
				logger.info("Inside If  for External User Roles");
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_SITE, rb
						.getString("MAT_EXT.C2C_AND_S2S_SITE_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_S2S_AT_PRODUCT, rb
						.getString("MAT_EXT.C2C_AND_S2S_PRODUCT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_CONTRACT, rb
						.getString("MAT_EXT.C2C_CONTRACT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_PRODUCT, rb
						.getString("MAT_EXT.C2C_PRODUCT_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_SITE, rb
						.getString("MAT_EXT.S2S_SITE_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_C2C_AT_SITE, rb
						.getString("MAT_EXT.C2C_SITE_LEVEL_MOVE")));
				list.add(new UploadTemplateBean(McmConstants.MAT_MOVE_S2S_AT_PRODUCT, rb
						.getString("MAT_EXT.S2S_PRODUCT_LEVEL_MOVE")));
				//Add code for link, delink and move for upload definition TD: 26738
				list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
						.getString("MAT.SCM_AM_MOVE")));
				
				list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
						.getString("MAT.SCM_AM_LINK")));
				
				list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
						.getString("MAT.SCM_AM_DELINK")));
				// Added by sphilipo on 14/06/2012 as part of Q2FY13 Rel
				list.add(new UploadTemplateBean(McmConstants.MCM_SEARCH_AND_CREATE_SHIP_TO_ID, rb
						.getString("MAT.SEARCH_AND_CREATE_SHIP_TO")));				
				list.add(new UploadTemplateBean(McmConstants.MAT_UE_MOVE_S2S_PRODUCT, rb
						.getString("MAT.UNCOVERED_EQUIP_AT_PROD_LVL")));
				//End of addition by sphilipo				
			}
			
			else 
				{
						logger.info("Inside If for other user access levels");
						McmBaseAction mba=new McmBaseAction();
						//Add code for link, delink and move for upload definition TD: 26738
						if(mba.hasPrivilegesMoveLinkDelink(request, McmConstants.MASS_MAT_UPLD_ACTIONS_MOVE))
						{
						list.add(new UploadTemplateBean(McmConstants.SCM_AM_MOVE, rb
								.getString("MAT.SCM_AM_MOVE")));
						}
						if(mba.hasPrivilegesMoveLinkDelink(request, McmConstants.MASS_MAT_UPLD_ACTIONS_LINK))
						{
						list.add(new UploadTemplateBean(McmConstants.SCM_AM_LINK, rb
								.getString("MAT.SCM_AM_LINK")));
						}
						if(mba.hasPrivilegesMoveLinkDelink(request, McmConstants.MASS_MAT_UPLD_ACTIONS_DELINK))
						{
						list.add(new UploadTemplateBean(McmConstants.SCM_AM_DELINK, rb
								.getString("MAT.SCM_AM_DELINK")));
						}
				}
				
				
			
			
			
			//}
			
		} 
		
		/* 
		Start : Commented code 
		Reason : Avoid Catching NPE
		Commented by : Ajay Malekar(amalekar)
		Release name : Q2FY15
		*/
		
		/*catch (NullPointerException e) {
			logger.error(e.toString(), e);
			throw e;
		}*/

		// End : Commented code
		
		
		/* 
		Start : New code added 
		Reason : To fix CI issue , Avoid Catching NPE
		Commented by : Ajay Malekar(amalekar)
		Release name : Q2FY15
		*/
		catch (Exception e) {
			logger.error(e.toString(), e);
			throw e;
		}
		// End : New code added
		
		return list;
	}

	/**
	 * @param userSession
	 * @return
	 */
	public String getUserEmailId(MCMUserSession userSession) {
		return userSession.getAccessManager().getEmail();
	}

	/**
	 * @param requestId
	 * @param referenceId
	 * @param userId
	 * @throws SQLException
	 * @throws Exception
	 */
	public void updateRequestDetailsInCt(String requestId, String referenceId, String userId) throws Exception {
		XxcssCtReqDetailsObjType reqDetailsObj = new XxcssCtReqDetailsObjType();
		DAOServices daoServices = RequestStatusUtil.getServices();
		Timestamp presTimeStamp = new Timestamp(System.currentTimeMillis());
		McmDAO mcmDAO = new McmDAO();
		try {
			BigDecimal requestId1 = new BigDecimal(requestId);
			reqDetailsObj.setRequestId(requestId1);
			reqDetailsObj.setReferenceId(referenceId);
			BigDecimal userId1 = new BigDecimal(userId);
			reqDetailsObj.setCreatedBy(userId1);
			reqDetailsObj.setLastUpdatedBy(userId1);
			reqDetailsObj.setCreationDate(presTimeStamp);
			reqDetailsObj.setLastUpdatedDate(presTimeStamp);
			reqDetailsObj.setCompleteDate(presTimeStamp);
			reqDetailsObj.setStartDate(presTimeStamp);
			reqDetailsObj.setStatus("SUBMITTED");
			mcmDAO.updateRequestDetailsInCT(daoServices, reqDetailsObj, userId);
		} catch (SQLException sqlEx) {
			logger.error(sqlEx.toString(), sqlEx);
			throw sqlEx;
		}

	}

}
