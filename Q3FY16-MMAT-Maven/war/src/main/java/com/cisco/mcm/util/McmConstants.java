/*
 * Created on Nov 24, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.util;

import java.util.Arrays;
import java.util.List;

/**
 * @author jbathula
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class McmConstants {
    
	public static String DefaultValue = "MCM.MAIN.LOAD.DEFAULTVALUE";
    public static String DefaultKeyValue = "Please Select";

    public static String ATTRIB_DOWNLOADTEMPLATES = "loadattribs1";
    public static String ATTRIB_UPLOADTEMPLATES = "loadattribs";
    public static String ATTRIB_EMAILID = "email";
    public static String ATTRIB_SHOWFLAG = "showFlag";
    public static String ATTRIB_OVERRIDESLIST = "OVERRIDESLIST";
    public static String ATTRIB_OVERRIDES = "OVERRIDES";
    public static String MCM_OVERRIDE_VALIDATIONS = "MAT_OVERRIDE_VALIDATIONS";
    public static String MCM_TERMINATE = "MAT_TERMINATE";
    public static String MCM_SEARCH_SITES = "MAT_SEARCH_SITES";
    public static String MCM_CREATE_SITES = "MAT_CREATE_SITES";
    public static String MCM_IBCFG_EXP = "IBCFG_EXP";
    public static String MCM_UE_MOVE_S2S_PRODUCT = "MAT_UE_MOVE_S2S_PRODUCT";

    public static String VAR_STATUSTYPE_SUCCESS = "success";
    public static String VAR_STATUSTYPE_FAILURE = "generalError";
    public static String PARAM_REQTYPE = "reqType";

    public static String ERR_ATTRIB = "ERROR";
    public static String ERR_GENERROR = "MCM.GENERAL.SERVER.ERROR";

    public static String PORTABLE_SOLUTIONS = "PORTABLE_SOLUTIONS";

    /* Added a new entry on 17th as per the new requirement TD-2489 */
    public static String MCM_SEARCH_AND_CREATE_SHIP_TO_ID = "MAT_BEST_SR_CR_SITES";

    // TD - 2478 & 2480 Added by kasis on 30-Oct-2007 -start

    public static String MCM_MAT_M_AND_P_ENTITLMNT = "MAT_M_AND_P_ENTITLMNT_ADD_PRODUCTS";
    public static String MCM_MAT_CHANGE_SERLVL = "MAT_CHG_SERVICE_LEVEL";
    // TD 2478 & 2480 
   
    public static String DATE_CHANGE_PRODUCT_OR_LINE = "MAT_DATE_CHANGE_PRODUCT_LINE";
    // TD013
    public static String MCM_MAT_TERMINATE_CONTRACT = "MAT_TERMINATE_CONTRACT";
    public static String MCM_MAT_ADD = "MAT_ADD";

    // Access management
    public static String MASS_MAT_REQ_STATS_REQS = "XXCSS_MAT_REQ_STATS_REQS"; 
    public static String MASS_MAT_REQ_STATS_RPTS = "XXCSS_MAT_REQ_STATS_RPTS"; 
    public static String MASS_MAT_RPTS = "XXCSS_MAT_RPTS"; 
    public static String MASS_MAT_UPLD_ACTIONS = "XXCSS_MAT_UPLD_ACTIONS"; 
    public static String MASS_MAT_OVERRIDES = "XXCSS_MAT_OVERRIDES"; 
    public static String MASS_MAT_DWNLD_TMPLTE = "XXCSS_MAT_DWNLD_TMPLTE";
    public static String MASS_MAT_UPLD_ACTIONS_MOVE= "XXCSS_MAT_UPLD_ACTIONS_MOVE"; 
    public static String MASS_MAT_UPLD_ACTIONS_LINK = "XXCSS_MAT_UPLD_ACTIONS_LINK"; 
    public static String MASS_MAT_UPLD_ACTIONS_DELINK = "XXCSS_MAT_UPLD_ACTIONS_DELINK";
    public static String UN_AUTH = "unauth";	
    public static String SHOW_OVER_RIDE_PAGE = "showOverRidePage";
    public static String XXCSS_OPS_SUPER_USR = "XXCSS_OPS_SUPER_USR";
    public static String XXCSS_CS_OPS = "XXCSS_CS_OPS";
    public static String XXCSS_PORTABLE_SOLUTION = "XXCSS_PORTABLE_SOLUTION";
    public static String XXCSS_SSR_REP = "XXCSS_SSR_REP";
    public static String XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM = "XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM";
       
    

    // Reports
    public static String MCMUtilizationByUser = "MCMUtilizationByUser";
    public static String GPSAuditReport = "GPSAuditReport";
    public static String MASSMCMUtilizationByTranType = "MASSMCMUtilizationByTranType";
    public static String MCMFailureBreakOutTrans = "MCMFailureBreakOutTrans";
    public static String MCMProcessingTimesOfReq = "MCMProcessingTimesOfReq";
    public static String ReasonCodeReport = "ReasonCodeReport";
    public static String MCMVOAuditReport = "MCMVOAuditReport";
    
   
    
//  TD -26738 Added by Rajkumar on 3-August-2010 -start
   
    public static String MCMValidationOverrideReport = "MCMValidationOverrideReport";
    public static String MCMMassProcessingReport = "MCMMassProcessingReport";
    public static String MCMMoveConfiguredMinorProducts= "MCMMoveConfiguredMinorProducts";
    
   // TD -26738

    //These are used in for xls names
    public static String ADD_PRODUCTS = "ADD_PRODUCTS";
    public static String C2C_AND_S2S_SITE_LEVEL_MOVE = "C2C_AND_S2S_SITE_LEVEL_MOVE";
    public static String C2C_AND_S2S_PRODUCT_LEVEL_MOVE = "C2C_AND_S2S_PRODUCT_LEVEL_MOVE";
    public static String C2C_CONTRACT_LEVEL_MOVE = "C2C_CONTRACT_LEVEL_MOVE";
    public static String C2C_PRODUCT_LEVEL_MOVE = "C2C_PRODUCT_LEVEL_MOVE";
    public static String C2C_SITE_LEVEL_MOVE = "C2C_SITE_LEVEL_MOVE";
    public static String CHANGE_SERVICE_LEVEL = "CHANGE_SERVICE_LEVEL";
    public static String DATE_CHANGE_PRODUCT_OR_LINE1 = "CONTRACT_DATE_CHANGE";
    public static String M_AND_P_ENTITLMNT_ADD_PRODUCTS = "M_AND_P_ENTITLMNT_ADD_PRODUCTS";
    public static String MOVE_UNCOVERED_EQUIP_PROD_LVL = "MOVE_UNCOVERED_EQUIP_PROD_LVL";
    public static String S2S_PRODUCT_LEVEL_MOVE = "S2S_PRODUCT_LEVEL_MOVE";
    public static String S2S_SITE_LEVEL_MOVE = "S2S_SITE_LEVEL_MOVE";
    public static String SEARCH_AND_CREATE_SHIP_TO_ID = "SEARCH_AND_CREATE_SHIP_TO_ID";
    public static String TERMINATE_PRODUCTS = "TERMINATE_PRODUCTS";
    public static String TERMINATION_FOR_CREDIT="TERMINATION_FOR_CREDIT"; // ADDED AS PART OF Q1FY13 T4C CHANGES BY VIBK
    //TD013
    public static String CONTRACT_TERMINATIONS = "CONTRACT_TERMINATIONS";
    public static String SERVICE_LEVEL_TERMINATION="SERVICE_LEVEL_TERMINATIONS";
    public static String C2C_SERVICE_LEVEL_MOVE="C2C_SERVICE_LEVEL_MOVE";

    //These constants are used for Upload definition names
    public static String MAT_ADD = "MAT_ADD";
    public static String MAT_MOVE_C2C_S2S_AT_SITE = "MAT_MOVE_C2C_S2S_AT_SITE";
    public static String MAT_MOVE_C2C_S2S_AT_PRODUCT = "MAT_MOVE_C2C_S2S_AT_PRODUCT";
    public static String MAT_MOVE_C2C_AT_CONTRACT = "MAT_MOVE_C2C_AT_CONTRACT";
    public static String MAT_MOVE_C2C_AT_PRODUCT = "MAT_MOVE_C2C_AT_PRODUCT";
    public static String MAT_MOVE_C2C_AT_SITE = "MAT_MOVE_C2C_AT_SITE";
    public static String MAT_UE_MOVE_S2S_PRODUCT = "MAT_UE_MOVE_S2S_PRODUCT";
    public static String MAT_MOVE_S2S_AT_PRODUCT = "MAT_MOVE_S2S_AT_PRODUCT";
    public static String MAT_MOVE_S2S_AT_SITE = "MAT_MOVE_S2S_AT_SITE";
    public static String MAT_TERMINATE = "MAT_TERMINATE";
    public static String MAT_SERVICE_LEVEL_TERMINATION="MAT_TERMINATE_SERVICE_LVL";
    public static String MAT_C2C_SERVICE_LEVEL_MOVE="MAT_C2C_SVC_LVL_MOVE";
    //TD013
    public static String MAT_TERMINATE_CONTRACT = "MAT_TERMINATE_CONTRACT";
    
 // ADDED AS PART OF Q1FY13 T4C CHANGES BY VIBK
    public static String MAT_TERMINATION_FOR_CREDIT = "MAT_T4C"; 
    public static String XXCSS_T4C_AGENT= "XXCSS_T4C_AGENT";
    
    //Add code for link, delink and move for upload definition TD: 26738
    public static String SCM_AM_LINK = "SCM_AM_LINK";
    public static String SCM_AM_DELINK = "SCM_AM_DELINK";
    public static String SCM_AM_MOVE = "SCM_AM_MOVE";
    public static String USER_TYPE ="USER_TYPE";
    
    public static String ERROR_PAGE_WITH_TAB_MENU = "errorPageWithTabmenu";
    public static String ERROR_PAGE_WITHOUT_TAB_MENU = "errorPageWithOutTabmenu";
    //STC
    public static String STC_SEARCH_RESULTS = "searchResults";
    
 // These constants are user for download definition template names
 	public static String EXT_C2C_AND_S2S_SITE_LEVEL_MOVE = "EXT_C2C_AND_S2S_SITE_LEVEL_MOVE";
     public static String EXT_C2C_AND_S2S_PRODUCT_LEVEL_MOVE = "EXT_C2C_AND_S2S_PRODUCT_LEVEL_MOVE";
     public static String EXT_C2C_CONTRACT_LEVEL_MOVE = "EXT_C2C_CONTRACT_LEVEL_MOVE";
     public static String EXT_C2C_PRODUCT_LEVEL_MOVE = "EXT_C2C_PRODUCT_LEVEL_MOVE";
     public static String EXT_C2C_SITE_LEVEL_MOVE = "EXT_C2C_SITE_LEVEL_MOVE";
 	public static String EXT_S2S_PRODUCT_LEVEL_MOVE = "EXT_S2S_PRODUCT_LEVEL_MOVE";
     public static String EXT_S2S_SITE_LEVEL_MOVE = "EXT_S2S_SITE_LEVEL_MOVE";
     public static final String EXT_C2C_SERVICE_LEVEL_MOVE = "EXT_C2C_SERVICE_LEVEL_MOVE";
     

     public static List<String> EXT_ROLES = Arrays.asList("XXCSS_1_TIER","XXCSS_CUSTOMER_QUOT_ACCESS","XXCSS_CUSTOMER_WO_QUOT_ACCESS",
    		 "XXCSS_2_TIER","XXCSS_EXT_DISTRIBUTOR","XXCSS_2_TIER_RESELLER","XXCSS_2T_RESELLER_NEXTGEN","XXCSS_1T_RESELLER_NEXTGEN",
    		 "XXCSS_DISTI_QUOTING","XXCSS_DISTI_ORDERING","XXCSS_DISTI_ADMIN","XXCSS_SSR_REP","XXCSS_CISCO_CAPITAL",
    		 "XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM","XXCSS_CSCC_TEAM_SUPER_USR");
     
     public static List<String> DNR_ROLES = Arrays.asList("XXCSS_SSR_REP","XXCSS_CONVERGYS_SALES","XXCSS_EUR_CONVERGYS_SALES",
    		 "XXCSS_SER_ACC_MGR","XXCSS_ACC_MGR","XXCSS_US_ENCOVER_SALES","XXCSS_EUR_SERVICE_SOURCE_SALES","XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM",
    		 "XXCSS_QOT_TEAM","XXCSS_OPS_SUPER_USR");
     
     //public static List<String> INT_EXT_ROLES=Arrays.asList("XXCSS_SSR_REP","XXCSS_CISCO_CAPITAL","XXCSS_CISCO_SRCE_SUPRT_CNTR_TEAM");
     
 	//Added by sphilipo on as part of Q2FY13 release     
 	public static String MAT_SEARCH_AND_CREATE_SHIP_TO = "SEARCH_AND_CREATE_SHIP_TO";
 	public static String MAT_UNCOVERED_EQUIP_AT_PROD_LVL = "UNCOVERED_EQUIPMENT_MOVE_AT_PRODUCT_LEVEL";
 	//End of addition by sphilipo for Q2FY13 release      
     
 	//Start - Changes for DNR trasactions added by sphilipo as part of Q4FY13 release
 	
 	public static String MAT_DNR_UPDATE_AT_CONTRACT_LEVEL = "DNR_FLAG_UPDATE_AT_CONTRACT_LEVEL";
 	public static String MAT_DNR_UPDATE_AT_SITE_LEVEL = "DNR_FLAG_UPDATE_AT_INSTALL_SITE_LEVEL";
 	public static String MAT_DNR_UPDATE_AT_PROD_LEVEL = "DNR_FLAG_UPDATE_AT_PRODUCT_LEVEL";
 	
 	public static String MAT_DNR_CONTRACT_LVL ="MAT_DNR_CONTRACT_LVL";
    public static String MAT_DNR_SITE_LVL ="MAT_DNR_SITE_LVL";
    public static String MAT_DNR_PRODUCT_LVL ="MAT_DNR_PRODUCT_LVL";
 	
 	
 	
 	//End  -  Changes for DNR trasactions added by sphilipo as part of Q4FY13 release
    
  //Start - Changes for Contract BID Change trasaction added by amalekar as part of Q1FY14 release
    public static String MAT_CONTRACT_BID_CHANGE = "CONTRACT_BID_CHANGE";
    public static String MAT_BID_CHANGE ="MAT_CONTRACT_BID_CHANGE";
    //End  -  Changes for Contract BID Change trasaction added by amalekar as part of Q1FY14 release
    
    
    
    public static String MAT_ADD_UPDATE_DEPLOYBASE = "ADD_UPDATE_DEPLOYBASE";
    public static String MAT_AU_DEPLOYBASE = "MAT_ADD_UPDATE_DEPLOYBASE";
    
    }
