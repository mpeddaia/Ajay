/*
 * Created on Dec 7, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.cisco.mcm.action.McmStatusDetailAction;
import com.cisco.servicesales.list.EnhancedList;
import com.cisco.servicesales.list.ListFactory;
import com.cisco.servicesales.list.Paginator;
import com.cisco.servicesales.list.engine.Column;

/**
 * @author kiguntup
 * 
 */
@SuppressWarnings("unchecked")
public class McmStatusDetailContext {
    public static final String ADD = "MAT_ADD";
    public static final String TERMIATE = "MAT_TERMINATE";
    public static final String EXPIRECONFIG = "IBCFG_EXP";
    public static final String SEARCH_SITES = "MAT_SEARCH_SITES";
    public static final String CREATE_SITES = "MAT_CREATE_SITES";
    public static final String MOVE_C2C_AT_CONTRACT = "MAT_MOVE_C2C_AT_CONTRACT";
    public static final String MOVE_C2C_AT_SITE = "MAT_MOVE_C2C_AT_SITE";
    public static final String MOVE_C2C_AT_PRODUCT = "MAT_MOVE_C2C_AT_PRODUCT";
    public static final String MOVE_C2C_S2S_AT_SITE = "MAT_MOVE_C2C_S2S_AT_SITE";
    public static final String MOVE_S2S_AT_SITE = "MAT_MOVE_S2S_AT_SITE";
    public static final String MOVE_S2S_AT_PRODUCT = "MAT_MOVE_S2S_AT_PRODUCT";
    public static final String CHG_SERVICE_LEVEL = "MAT_CHG_SERVICE_LEVEL";
    public static final String BEST_SR_CR_SITES = "MAT_BEST_SR_CR_SITES";
    public static final String M_AND_P_ADD = "M_AND_P_ENTITLMNT_ADD_PRODUCTS";
    public static final String MOVE_C2C_S2S_AT_PRODUCT = "MAT_MOVE_C2C_S2S_AT_PRODUCT";
    public static final String MOVE_UE_S2S_AT_PRODUCT 	= "MAT_UE_MOVE_S2S_PRODUCT";
    public static final String DATE_CHANGE_PRODUCT_OR_LINE 	= "MAT_DATE_CHANGE_PRODUCT_LINE";
    public static final String T4C = "MAT_T4C"; // ADDED T4C string variable AS PART OF Q1FY13 T4C CHANGES BY VIBK
    // TD013
    public static final String CONTRACT_TERMINATIONS = "MAT_TERMINATE_CONTRACT";
    
    /*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - Start*/
    public static final String ADD_RES 					= "MAT_ADD_RES";
    public static final String MOVE_C2C_S2S_AT_SITE_RES = "MAT_MOVE_C2C_S2S_AT_SITE_RES";
    public static final String MOVE_C2C_AT_SITE_RES 	= "MAT_MOVE_C2C_AT_SITE_RES";
    public static final String M_AND_P_ADD_RES 			= "M_AND_P_ENTITLMNT_ADD_PRODUCTS_RES";
    public static final String MOVE_S2S_AT_PRODUCT_RES 	= "MAT_MOVE_S2S_AT_PRODUCT_RES";
    public static final String MOVE_S2S_AT_SITE_RES 	= "MAT_MOVE_S2S_AT_SITE_RES";
    public static final String MOVE_C2C_S2S_AT_PRODUCT_RES = "MAT_MOVE_C2C_S2S_AT_PRODUCT_RES";
    public static final String MAT_DATE_CHANGE_PRODUCT_LINE_RES="MAT_DATE_CHANGE_PRODUCT_LINE_RES";
    
    //for External users - Added as part of Smart Care Q1FY13 Changes BY VIBK
    public static final String MOVE_C2C_AT_CONTRACT_OUT = "MAT_MOVE_C2C_AT_CONTRACT_OUT";
    public static final String MOVE_C2C_AT_SITE_OUT = "MAT_MOVE_C2C_AT_SITE_OUT";
    public static final String MOVE_C2C_AT_PRODUCT_OUT = "MAT_MOVE_C2C_AT_PRODUCT_OUT";
    public static final String MOVE_C2C_S2S_AT_SITE_OUT = "MAT_MOVE_C2C_S2S_AT_SITE_OUT";
    public static final String MOVE_S2S_AT_SITE_OUT = "MAT_MOVE_S2S_AT_SITE_OUT";
    public static final String MOVE_S2S_AT_PRODUCT_OUT = "MAT_MOVE_S2S_AT_PRODUCT_OUT";
    public static final String MOVE_C2C_S2S_AT_PRODUCT_OUT= "MAT_MOVE_C2C_S2S_AT_PRODUCT_OUT";
    
    // for SOE
    
    public static final String TERM_SVL = "MAT_TERMINATE_SERVICE_LVL";
    public static final String TERM_SVL_RES = "MAT_TERMINATE_SERVICE_LVL_RES";
    public static final String MOVE_C2C_AT_SVL_RES = "MAT_C2C_SVC_LVL_MOVE_RES";
    public static final String MOVE_C2C_AT_SVL = "MAT_C2C_SVC_LVL_MOVE";

	// Added by sphilipo as part of Q2FY13 Rel
	public static final String SEARCH_N_CREATE_SHIP_TO="MAT_BEST_SR_CR_SITES_OUT";
	public static final String MOVE_UE_AT_PRODUCT_LEVEL="MAT_UE_MOVE_S2S_PRODUCT_OUT";
	// End of Addition by sphilipo as part of Q2FY13 Rel

	// Start - Changes for DNR transactions as part of Q4FY13 Rel added by sphilipo 
	public static final String DNR_UPDATE_AT_CONTRACT_LVL="MAT_DNR_CONTRACT_LVL";
	public static final String DNR_UPDATE_AT_SITE_LVL="MAT_DNR_SITE_LVL";
	public static final String DNR_UPDATE_AT_PROD_LVL="MAT_DNR_PRODUCT_LVL";
	
	public static final String DNR_UPDATE_AT_CONTRACT_LVL_RES="MAT_DNR_CONTRACT_LVL_RES";	
	public static final String DNR_UPDATE_AT_SITE_LVL_RES="MAT_DNR_SITE_LVL_RES";
	public static final String DNR_UPDATE_AT_PROD_LVL_RES="MAT_DNR_PRODUCT_LVL_RES";
	// End - Changes for DNR transactions as part of Q4FY13 Rel added by sphilipo 
	
	//Start - Changes for CONTRACT BID CHANGE transaction as part of Q1FY14 Rel added by amalekar
	public static final String CONTRACT_BID_CHANGE="MAT_CONTRACT_BID_CHANGE";
	public static final String CONTRACT_BID_CHANGE_RES="MAT_CONTRACT_BID_CHANGE_RES";
	//End - Changes for CONTRACT BID CHANGE transaction as part of Q1FY14 Rel added by amalekar
		
	//Start - Changes for Q4FY14
	public static final String ADD_UPDATE_DEPLOYBASE ="MAT_ADD_UPDATE_DEPLOYBASE";
	public static final String ADD_UPDATE_DEPLOYBASE_RES="MAT_ADD_UPDATE_DEPLOYBASE_RES";
	
	//END - Changes for Q4FY14
	
	
// Added "Distributor Bill To Id" column by jjohnche for 2TNG, Q1FY12
    private static final String addResultColumnDisplayOrder[] = { 
    	"origRowNumber","status","contractNumber","serviceLevel",
    	"beginDate","endDate","billToId","poSoBilling","maintenancePo","distributorBillToId","serialNumber", 
    	"itemName","siteLocation","instanceNumber","productPoSo","qty",    	
    	"softlineFlag","netFactor","reasonCode","csCaseNumber","macId","shipDate", 
    	"migratedFlag", "externalReference","cartonId","errorMessage"};
    
    private static final String moveResult_c2c_s2s_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber","status","sourceContractNumber", "sourceServiceLevel", "sourceSiteId", "targetContractNumber", 
	    "targetSiteId", "reasonCode","csCaseNumber", 
	    "errorMessage"};
    
    private static final String moveResult_c2c_s2s_at_product_ColumnDisplayOrder[] = {
	    "origRowNumber","status","sourceContractNumber","sourceServiceLevel", "sourceSiteId", 
	    "serialNumber","instanceNumber", "itemName","targetContractNumber","targetSiteId", 
	    "reasonCode","csCaseNumber","errorMessage" };/*Aded Service LEvel column by iyellapr for CCW5.0*/
    
    private static final String moveResult_c2c_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber","status","sourceContractNumber", "sourceServiceLevel",
	    "sourceSiteLocation","targetContractNumber","reasonCode", 
	    "csCaseNumber","errorMessage" };

//  Added "Distributor Bill To Id" column by jjohnche for 2TNG, Q1FY12    
    private static final String mandpResultsAddProd[] = { 
    	"origRowNumber","status","contractNumber","serviceLevel","beginDate","endDate","billToId","netPrice",
    	"poSoBilling","maintenancePo","distributorBillToId","serialNumber", 
    	"itemName","siteLocation","instanceNumber","productPoSo","qty","softlineFlag",
    	"netFactor","reasonCode","cartonId","errorMessage" };
    

    
    private static final String moveResults_s2s_at_product_ColumnDisplayOrder[] = {
	    "origRowNumber","status","sourceContractNumber","sourceSiteId",
	    "serialNumber","instanceNumber", "itemName","targetSiteId","reasonCode",
	    "csCaseNumber","errorMessage" };
    
    private static final String moveResults_s2s_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber","status","sourceContractNumber", "sourceServiceLevel", "sourceSiteId",
	    "targetSiteId",  "reasonCode","csCaseNumber","errorMessage" };
    /*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - End*/
    
    // TD2492
    
//  Added "Distributor Bill To Id" column by jjohnche for 2TNG, Q1FY12
    
    private static final String addColumnDisplayOrder[] = { "origRowNumber",
	    "contractNumber", "serviceLevel", "beginDate", "endDate",
	    "billToId", "poSoBilling", "maintenancePo","distributorBillToId", "serialNumber",
	    "itemName", "siteLocation", "instanceNumber", "productPoSo",
	    "quantity", "softline", "netFactor","reasonCode", "csCaseNumber","macId","shipDate", 
    	"migratedFlag", "externalReference","cartonId",
	    "errorMessage" };
    
   
    // private static final String temminateColumnDisplayOrder[] =
    // {"origRowNumber", "contractNumber", "serialNumber", "itemName",
    // "terminationDate","reasonCode","csCaseNumber", "errorMessage"};
    private static final String temminateColumnDisplayOrder[] = {
	    "origRowNumber", "contractNumber", "serviceLevel", "lineNumber","instanceNumber",
	    "serialNumber", "itemName", "terminationDate", "reasonCode",
	    "csCaseNumber", "errorMessage" };
    // TD013
    private static final String move_c2c_at_contract_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceContractNumber", "serialNumber",
	    "itemName", "targetContractNumber", "reasonCode", "csCaseNumber",
	    "errorMessage" };
    private static final String move_c2c_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceContractNumber", "sourceServiceLevel", "sourceSiteLocation",
	    "targetContractNumber", "reasonCode", "csCaseNumber",
	    "errorMessage" };
    private static final String move_c2c_at_product_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceContractNumber", "sourceServiceLevel", "serialNumber", "instanceNumber",
	    "itemName", "targetContractNumber", "reasonCode", "csCaseNumber",
	    "errorMessage" };
    private static final String move_c2c_s2s_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceContractNumber","sourceServiceLevel", "sourceSiteId", 
	    "targetContractNumber", "targetSiteId",
	    "reasonCode", "csCaseNumber", "errorMessage" };
    private static final String move_c2c_s2s_at_product_ColumnDisplayOrder[] = {
	    "origRowNumber", "status", "sourceContractNumber","sourceServiceLevel", "sourceSiteId",
	    "serialNumber", "instanceNumber", "itemName", "targetContractNumber", "targetSiteId",
	    "reasonCode", "csCaseNumber", "errorMessage" };/*Added service level column by iyellapr for CCW5.0 release */
    private static final String move_s2s_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceContractNumber","sourceServiceLevel", "sourceSiteId",
	    "targetSiteId", "reasonCode","csCaseNumber", "errorMessage" };
    private static final String move_s2s_at_product_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceContractNumber", "sourceSiteId",
	    "serialNumber", "instanceNumber", "itemName", "targetSiteId", "reasonCode",
	    "csCaseNumber", "errorMessage" };

    private static final String move_ue_s2s_at_product_ColumnDisplayOrder[] = {
	    "origRowNumber", "sourceSiteId", "serialNumber", "itemName",
	    "targetSiteId", "csCaseNumber", "errorMessage" };
    private static final String expireConfigColumnDisplayOrder[] = {
	    "origRowNumber", "instanceNumber", "serialNumber", "itemName",
	    "status", "csCaseNumber", "errorMessage" };
    // TD4846
    // TD5609
    private static final String searchSitesColumnDisplayOrder[] = {
	    "origRowNumber", "siteId", "customerId", "siteName", "address1",
	    "address2", "address3", "city", "state", "province", "zipCode",
	    "country", "csCaseNumber", "errorMessage" };
    private static final String createSitesColumnDisplayOrder[] = {
	    "origRowNumber", "customerName", "businessEntity", "address1",
	    "address2", "address3", "city", "state", "county", "province",
	    "zipCode", "country", "caseNumber", "errorMessage" };
    // TD4846
    // * TD5609
    // TD2492
    private static final String date_change_product_or_line_ColumnDisplayOrder[] = {
	    "origRowNumber", "contractNumber", "serialNumber", "productId",
	    "lineNumber", "beginDate", "endDate", "siteID", "reasonCode",
	    "csCaseNumber", "errorMessage" };

    private static final String changeServiceLevelColumnDisplayOrder[] = {
	    "origRowNumber", "contractNumber", "sourceServiceLevel", "targetServiceLevel", "reasonCode",
	    "status", "csCaseNumber", "errorMessage" };
    
//  Added "Distributor Bill To Id" column by jjohnche for 2TNG, Q1FY12
    
    private static final String mandpAddProd[] = { "origRowNumber",
    	"contractNumber", "serviceLevel", "beginDate", "endDate", "billToId","netPrice", "poSoBilling",    
	     "maintenancePo","distributorBillToId","serialNumber","itemName","siteLocation","instanceNumber","productPoSo","quantity",
	     "softline", "netFactor", "reasonCode", "csCaseNumber","cartonId","errorMessage" };
    
   
    // TD013
    private static final String contract_terminations_ColumnDisplayOrder[] = {
	    "origRowNumber", "contractNumber", "terminationDate", "reasonCode",
	    "csCaseNumber", "errorMessage" };
    
    
    // for SOE
    
    private static final String serviceLevel_termination_ColumnDisplayOrder[] = {
	    "origRowNumber", "status", "contractNumber", "serviceLevel", "terminationDate", "reasonCode",
	    "csCaseNumber", "errorMessage" };
    
    private static final String serviceLevel_termination_result_ColumnDisplayOrder[] = {
	    "origRowNumber", "status", "contractNumber", "serviceLevel", "terminationDate", "reasonCode",
	    "csCaseNumber", "errorMessage" };
    
    private static final String move_c2c_at_svl_ColumnDisplayOrder[] = {
	    "origRowNumber", "status", "contractNumber", "serviceLevel", "targetContractNumber", "reasonCode",
	    "csCaseNumber", "errorMessage" };
    
    private static final String move_c2c_at_svl_result_ColumnDisplayOrder[] = {
	    "origRowNumber", "status", "contractNumber", "serviceLevel", "targetContractNumber", "reasonCode",
	    "csCaseNumber", "errorMessage" };
    
  //ADDED T4C COLUMN Display Order as part of Q1FY13 T4C Changes  BY VIBK
    //ADDED T4C COLUMN serviceCancellationFee as part of Q2FY15 T4C Changes  BY MADHMS
    private static final String t4cColumnDisplayOrder[] = {
	    "origRowNumber", "contractNumber", "serviceLevel", "lineNumber","instanceNumber",
	    "serialNumber", "itemName", "terminationDate", "reasonCode",
	    "csCaseNumber", "mtvErrorMessage","arErrorMessage","invoiceLineNumber","invoiceNumber","billToId","emailId","creditAmount","serviceCancellationFee","status" };
    
    //ADDED CONTRACT DATE CHANGE RESULTS COLUMN DISPLAY ORDER AS PART OF Q1FY13 TNC CHANGES BY VIBK
    private static final String date_change_product_or_line_res_ColumnDisplayOrder[] = {
	    "origRowNumber", "contractNumber", "serialNumber", "productId",
	    "lineNumber", "beginDate", "endDate", "siteID", "reasonCode",
	    "csCaseNumber", "resultMessage","status" };
    
    //ADDED COLUMN DISPLAY ORDER FOR ALL THE 7 TRANSACTION AS PART OF SMART CARE Q1FY13 CHANGES BY VIBK
    private static final String ext_move_c2c_at_contract_ColumnDisplayOrder[] = {
	    "origRowNumber","status", "sourceContractNumber", "targetContractNumber", "errorType", "errorCode",
	    "errorMessage","suggestedAction" };
    
    private static final String ext_move_c2c_at_site_ColumnDisplayOrder[] = {
	    "origRowNumber","status", "sourceContractNumber", "sourceServiceLevel", "sourceSiteId",
	    "targetContractNumber", "errorType", "errorCode",
	    "errorMessage","suggestedAction"  };
    
    private static final String ext_move_c2c_at_product_ColumnDisplayOrder[] = {
		    "origRowNumber", "status","sourceContractNumber", "sourceServiceLevel", "serialNumber", "instanceNumber",
		    "itemName", "targetContractNumber", "errorType", "errorCode",
		    "errorMessage","suggestedAction"};
    
	    private static final String ext_move_c2c_s2s_at_site_ColumnDisplayOrder[] = {
		    "origRowNumber","status", "sourceContractNumber","sourceServiceLevel", "sourceSiteId", 
		    "targetContractNumber", "targetSiteId","errorType", "errorCode", "errorMessage","suggestedAction" };
	    
	    private static final String ext_move_c2c_s2s_at_product_ColumnDisplayOrder[] = {
		    "origRowNumber", "status", "sourceContractNumber","sourceServiceLevel", "sourceSiteId",
		    "serialNumber", "instanceNumber", "itemName", "targetContractNumber", "targetSiteId",
		    "errorType", "errorCode", "errorMessage","suggestedAction" };
	    
	    private static final String ext_move_s2s_at_site_ColumnDisplayOrder[] = {
		    "origRowNumber","status", "sourceContractNumber","sourceServiceLevel", "sourceSiteId",
		    "targetSiteId","errorType", "errorCode", "errorMessage","suggestedAction" };
	    
	    private static final String ext_move_s2s_at_product_ColumnDisplayOrder[] = {
		    "origRowNumber","status", "sourceContractNumber", "sourceSiteId",
		    "serialNumber", "instanceNumber", "itemName", "targetSiteId", "errorType", "errorCode",
		    "errorMessage","suggestedAction" };
    
		//ADDED by SPHILIPO AS A PART OF Q2FY13 Rel
		
		private static final String ext_search_n_create_ship_to_ColumnDisplayOrder[] = {
			"origRowNumber", "createSearchFailure", "siteId", "siteStatus", "customerName", 
			"businessEntity", "address1", "address2", "address3", "city", "state","county", "province",
			"zipCode", "country", "errorType", "errorCode", "errorMessage", "suggestedAction"};
	
		private static final String ext_move_ue_at_product_lvl_out_ColumnDisplayOrder[] = {
			"origRowNumber", "status", "sourceSiteId", "serialNumber", "itemName", "targetSiteId", "errorType",
			"errorCode", "errorMessage", "suggestedAction" };
	
		//Error report changes added by sphilipo for Q4FY13 Rel
		private static final String dnrUpdateAtContractLvl[]={"origRowNumber","contractNumber", "serviceLevel", "DNRFlag", "reasonCode", "csCaseNumber", "errorMessage"};
		private static final String dnrUpdateAtSiteLvl[]={"origRowNumber","contractNumber","serviceLevel", "installSiteId", "DNRFlag", "reasonCode",  
		"csCaseNumber" ,"errorMessage"};
		private static final String dnrUpdateAtProdLvl[]={"origRowNumber","contractNumber","serviceLevel", "lineNumber", "serialNumber",  "instanceNumber", "itemName", "DNRFlag", "reasonCode", "csCaseNumber", "errorMessage"};
				
		
		//Success result changes  added by sphilipo for Q4FY13 Rel
		private static final String dnrUpdateAtContractlvlRes[]={"origRowNumber", "status", "contractNumber", "serviceLevel", "DNRFlag", "reasonCode", "csCaseNumber", "resultMessage"};
		private static final String dnrUpdateAtSiteLvlRes[]={"origRowNumber", "status", "contractNumber", "serviceLevel", "installSiteId", "DNRFlag", "reasonCode", "csCaseNumber", "resultMessage"};
		private static final String dnrUpdateAtProdLvlRes[]={ "origRowNumber", "status", "contractNumber", "serviceLevel", "lineNumber", "serialNumber", 
		"instanceNumber", "itemName", "DNRFlag", "reasonCode", "csCaseNumber", "resultMessage"};
			
				
		
	
		// END OF ADDITION BY SPHILIPO    
		
		//Error report changes added by amalekar for Q1FY14 Rel
	//	private static final String contractBidChange[]={"origRowNumber","status", "contractNumber", "oldBID", "newBID", "reasonCode", "csCaseNumber", "reqEmailId", "errorMessage"};
		
		//Success report changes added by amalekar for Q1FY14 Rel
		private static final String contractBidChangeRes[]={"origRowNumber","contractNumber", "serviceLevel", "oldBID", "newBID", "reasonCode", "csCaseNumber", "reqEmailId", "errorMessage"};
		
		//changes made for 	Q4FY14
		//FOR ERROR REPORT
		private static final String addUpdateDeploybase [] = {"origRowNumber","status", "hostID","hwPID","hwInstanceID", "swPAK","swPID",
															   "swInstanceID","swQuantity","startDate","endDate",
															   "transactionType","migratedFlag","reasonCode", "csCaseNumber","errorMessage"};
															   //,"errorType","errorCode","suggestedAction"};
		//FOR SUCCESS REPORT
		private static final String addUpdateDeploybaseRes[]={"origRowNumber", "status", "hostID","hwPID","hwInstanceID", "swPAK","swPID",
															   "swInstanceID","swQuantity","startDate","endDate",
															   "transactionType","migratedFlag","reasonCode", "csCaseNumber","errorMessage"};
															  // ,"errorType","errorCode","suggestedAction"};
		//End Changes for Q4FY14
		
    private static HashMap columnOrderMap = new HashMap();

    protected static final int DEFAULT_ITEMS_PER_PAGE = 25;

    private int itemsPerPage;
    private int requestNumber;
    private int linesSubmitted;
    private int linesFoundorCreated;
    private int linesNotFound;

    private String requestType;
    private String requestTypeOut;// added new variable to store request type for external user as part of Q2FY13    
    private String requestName;
    private String requestStatus;
    private String requestOrStatus;

    private List displayColumns;
    private McmListControllerBO listController;
    
    private static Logger logger = Logger
    	    .getLogger(McmStatusDetailContext.class);
    
    static {
    	/*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - Start*/	
	    columnOrderMap.put(ADD_RES, addResultColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_S2S_AT_SITE_RES,moveResult_c2c_s2s_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_S2S_AT_PRODUCT_RES,moveResult_c2c_s2s_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_SITE_RES,moveResult_c2c_at_site_ColumnDisplayOrder);
		columnOrderMap.put(M_AND_P_ADD_RES, mandpResultsAddProd);
		columnOrderMap.put(MOVE_S2S_AT_PRODUCT_RES,moveResults_s2s_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_S2S_AT_SITE_RES,moveResults_s2s_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MAT_DATE_CHANGE_PRODUCT_LINE_RES,date_change_product_or_line_res_ColumnDisplayOrder); // Added as part of Tnc Q1FY13 Changes by vibk
		/*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - End*/
		
		// for SOE
		
		columnOrderMap.put(TERM_SVL,serviceLevel_termination_ColumnDisplayOrder);
		columnOrderMap.put(TERM_SVL_RES,serviceLevel_termination_result_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_SVL,move_c2c_at_svl_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_SVL_RES,move_c2c_at_svl_result_ColumnDisplayOrder);  
		
	columnOrderMap.put(ADD, addColumnDisplayOrder);
	columnOrderMap.put(TERMIATE, temminateColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_CONTRACT,move_c2c_at_contract_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_SITE,move_c2c_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_PRODUCT,move_c2c_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_S2S_AT_SITE,move_c2c_s2s_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_S2S_AT_PRODUCT,move_c2c_s2s_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_S2S_AT_SITE,move_s2s_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_S2S_AT_PRODUCT,move_s2s_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_UE_S2S_AT_PRODUCT,move_ue_s2s_at_product_ColumnDisplayOrder);
	columnOrderMap.put(CREATE_SITES, createSitesColumnDisplayOrder);
	columnOrderMap.put(SEARCH_SITES, searchSitesColumnDisplayOrder);
	columnOrderMap.put(EXPIRECONFIG, expireConfigColumnDisplayOrder);
	// 2491 kasis
		columnOrderMap.put(DATE_CHANGE_PRODUCT_OR_LINE,date_change_product_or_line_ColumnDisplayOrder); 
		columnOrderMap.put(CHG_SERVICE_LEVEL,changeServiceLevelColumnDisplayOrder);
	columnOrderMap.put(BEST_SR_CR_SITES, createSitesColumnDisplayOrder);
	columnOrderMap.put(M_AND_P_ADD, mandpAddProd);
	// TD013;saatmaku;11-jun-08;start;Adding new request type
		columnOrderMap.put(CONTRACT_TERMINATIONS,contract_terminations_ColumnDisplayOrder);
		// ADDED T4C COLUMN Display Order as part of Q1FY13 T4C Changes
		columnOrderMap.put(T4C, t4cColumnDisplayOrder);
		
		//ADDED AS PART OF SMART CARE Q1FY13 CHANGES BY VIBK
		columnOrderMap.put(MOVE_C2C_AT_CONTRACT_OUT, ext_move_c2c_at_contract_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_PRODUCT_OUT, ext_move_c2c_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_S2S_AT_SITE_OUT, ext_move_c2c_s2s_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_S2S_AT_PRODUCT_OUT, ext_move_c2c_s2s_at_product_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_C2C_AT_SITE_OUT, ext_move_c2c_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_S2S_AT_SITE_OUT,ext_move_s2s_at_site_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_S2S_AT_PRODUCT_OUT, ext_move_s2s_at_product_ColumnDisplayOrder);
		// Added as part of Q2FY13 REL by sphilipo
		columnOrderMap.put(SEARCH_N_CREATE_SHIP_TO, ext_search_n_create_ship_to_ColumnDisplayOrder);
		columnOrderMap.put(MOVE_UE_AT_PRODUCT_LEVEL, ext_move_ue_at_product_lvl_out_ColumnDisplayOrder);		
		
		
		 // Start - Changes for DNR transactions as part of Q4FY13 Rel added by sphilipo 
		
		columnOrderMap.put(DNR_UPDATE_AT_CONTRACT_LVL,dnrUpdateAtContractLvl);			
		columnOrderMap.put(DNR_UPDATE_AT_SITE_LVL,dnrUpdateAtSiteLvl);			
		columnOrderMap.put(DNR_UPDATE_AT_PROD_LVL,dnrUpdateAtProdLvl);
		
		columnOrderMap.put(DNR_UPDATE_AT_CONTRACT_LVL_RES,dnrUpdateAtContractlvlRes);
		columnOrderMap.put(DNR_UPDATE_AT_SITE_LVL_RES, dnrUpdateAtSiteLvlRes);
		columnOrderMap.put(DNR_UPDATE_AT_PROD_LVL_RES, dnrUpdateAtProdLvlRes);
		// End - Changes for DNR transactions as part of Q4FY13 Rel added by sphilipo 
		
		
		// Start - Changes for Contract Bid Change transactions as part of Q1FY14 Rel added by amalekar
		//columnOrderMap.put(CONTRACT_BID_CHANGE,contractBidChange);			
		columnOrderMap.put(CONTRACT_BID_CHANGE_RES,contractBidChangeRes);
		// End - Changes for Contract Bid Change transactions as part of Q1FY14 Rel added by amalekar
		
		//Start - Changes For Q4FY14
		columnOrderMap.put(ADD_UPDATE_DEPLOYBASE, addUpdateDeploybase);
		columnOrderMap.put(ADD_UPDATE_DEPLOYBASE_RES, addUpdateDeploybaseRes);
		//End - Changes  For Q4FY14
    }

    /**
     * @param requestType
     * @param requestName
     * @param requestNumber
     * @param status
     */
    public McmStatusDetailContext(String requestType, String requestName,int requestNumber, String status) {
    	this(requestType, requestName, requestNumber, status,DEFAULT_ITEMS_PER_PAGE);
    }

    /**
     * @param requestType
     * @param requestName
     * @param requestNumber
     * @param status
     * @param itemsPerPage
     */
    public McmStatusDetailContext(String requestType, String requestName,int requestNumber, String status, int itemsPerPage) {
		
	this.requestType = requestType;
	this.requestNumber = requestNumber;
	this.requestName = requestName.trim();
	this.itemsPerPage = itemsPerPage;
	this.requestStatus = status.trim();

    	EnhancedList enhancedList = null;
    	logger.info("before call to LF");
    	logger.info("Request Type : " + requestType);
    	logger.info("Upload Request ID :" + requestNumber);
		enhancedList = ListFactory.getList(requestType,requestNumber);
		logger.info("Upload Request ID :" + requestNumber);
		logger.info("after call to LF");
		enhancedList.sort("origRowNumber");
		logger.info("Request Type : " + requestType);
		logger.info("Enhanced List  after LF call :" + enhancedList.getSize());
		Paginator paginator = enhancedList.getPaginator(itemsPerPage);
		this.displayColumns = getColumnOrder(enhancedList.getVisibleColumns(),requestType);
		this.listController = new McmListControllerBO(enhancedList, paginator);
    }

    /*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - Start*/
    /**
     * @param requestType
     * @param requestName
     * @param requestNumber
     * @param status
     * @param orStatus
     */
    public McmStatusDetailContext(String requestType, String requestName,int requestNumber, String status, String orStatus, String tempRequestType) {
    	
    	this(tempRequestType, requestName, requestNumber, status,DEFAULT_ITEMS_PER_PAGE);
    	//Q2FY13 Rel
		requestTypeOut = tempRequestType;    	
    	logger.info("after constructor call");
    	this.requestType	= requestType;
    	this.requestOrStatus= orStatus;
    	logger.info("constructor : Request Type : " + this.requestType);
    }
    /*28-May-2009 - As per TD#CI_SCME_005 for Q1FY10 Release - smerugol Added - End*/    
    
    /**
     * Gets the column in order for display
     * 
     * @param visibleColumns
     * @param requestType
     * @return
     */
    private List getColumnOrder(final List visibleColumns,final String requestType) {
	List tempDisplayColumns = null;
	String columnDisplayOrder[] = (String[]) columnOrderMap.get(requestType); 
		
	if (columnDisplayOrder != null) {
	    tempDisplayColumns = new ArrayList();
	    String aColumn = null;
	    for (int i = 0; i < columnDisplayOrder.length; i++) {
	    	aColumn = columnDisplayOrder[i];
	    	logger.info("column for request "+requestType+" is = "+aColumn);
		if (findColumn(visibleColumns, aColumn) != null)
		    tempDisplayColumns.add(findColumn(visibleColumns, aColumn));
	    }

	}
	return tempDisplayColumns;
    }

    /**
     * Finds the column in the list
     * 
     * @param displayColumns
     * @param aColumnName
     * @return
     */
    private static Column findColumn(final List displayColumns,final String aColumnName) {
	for (int i = 0; i < displayColumns.size(); i++) {
	    final Column displayColumn = (Column) displayColumns.get(i);
		    if (displayColumn.getName().equals(aColumnName)){
		    	logger.info("Success getDisplayLabel::"+displayColumn.getDisplayLabel());
		    	logger.info("Success displayColumn  ::"+displayColumn.getName());
		return displayColumn;
	}
		}

	return null;
    }

    /**
     * @return
     */
    public Paginator getPaginator() {
	return listController.getPaginator();
    }

    /**
     * @return
     */
    public EnhancedList getEnhancedList() {
	return listController.getEnhancedList();
    }

    /**
     * @return
     */
    public McmListControllerBO getListController() {
	return listController;
    }

    /**
     * @return
     */
    public int getRequestNumber() {
	return requestNumber;
    }

    /**
     * @return
     */
    public String getStatus() {
	return requestStatus;
    }

    /**
     * @return
     */
    public String getRequestType() {
	return requestType;
    }

    /**
     * @return
     */
    public String getRequestName() {
	return requestName;
    }

    /**
     * @return
     */
    public List getDisplayColumns() {
	return displayColumns;
    }

    /**
     * @param messageString
     * @return
     */
    public String getDelimitedErrorString(final String messageString) {
	return replace(messageString, "||||", "<BR>", true);
    }

    /**
     * @param str
     * @param o
     * @param n
     * @param all
     * @return
     */
    private static String replace(String str, String o, String n, boolean all) {
	if (str == null || o == null || o.length() == 0 || n == null)
	    throw new IllegalArgumentException("null or empty String");
	StringBuffer result = null;
	int oldpos = 0;
	int pos = 0;

	do {
	    pos = str.indexOf(o, oldpos);
	    if (pos < 0)
		break;
	    if (result == null)
		result = new StringBuffer();
	    result.append(str.substring(oldpos, pos));
	    result.append(n);
	    pos += o.length();
	    oldpos = pos;
	} while (all);

	if (oldpos == 0) {
	    return str;
	} else {
	    result.append(str.substring(oldpos));
	    return new String(result);
	}
    }

    /**
     * @return
     */
    public int getLinesSubmitted() {
	return linesSubmitted;
    }

    /**
     * @param linesSubmitted
     */
    public void setLinesSubmitted(int linesSubmitted) {
	this.linesSubmitted = linesSubmitted;
    }

    /**
     * @return
     */
    public int getLinesFoundorCreated() {
	return linesFoundorCreated;
    }

    /**
     * @param linesFoundorCreated
     */
    public void setLinesFoundorCreated(int linesFoundorCreated) {
	this.linesFoundorCreated = linesFoundorCreated;
    }

    /**
     * @return
     */
    public int getLinesNotFound() {
	return linesNotFound;
    }

    /**
     * @param linesNotFound
     */
    public void setLinesNotFound(int linesNotFound) {
	this.linesNotFound = linesNotFound;
    }

	/**
	 * @return Returns the requestOrStatus.
	 */
	public String getOrStatus() {
		return requestOrStatus;
}
	//Q2FY13 Rel
	public String getRequestTypeOut() {
		return requestTypeOut;
}
}
