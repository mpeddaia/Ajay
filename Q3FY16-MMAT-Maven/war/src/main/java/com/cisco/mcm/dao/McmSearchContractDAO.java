package com.cisco.mcm.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.ea.dbpool.EASmartDbPoolManager;
import com.cisco.mcm.bean.McmSearchBean;
import com.cisco.mcm.genJava.CountryMigationRecType;
import com.cisco.mcm.genJava.XxcssMatStcCommonUtil;
import com.cisco.mcm.genJava.XxcssMatStcMigType;
import com.cisco.servicesales.db.ConnectionBroker;
import com.cisco.servicesales.mcm.utils.MCMDataUtil;

public class McmSearchContractDAO implements ConnectionBroker{
    
    private static final String SOURCE_SYSTEM = "XXCSS_MAT";
   // private static final String CONNECTION_POOL_NAME = "APP";
    
   // private final EASmartDbPoolManager eaSmartDbPoolManager = new EASmartDbPoolManager();
    private static Logger logger = Logger.getLogger(McmDAO.class);
    
    private static DAOServices ds;

    
    public Connection getConnection() throws SQLException {
	//	      
	//return eaSmartDbPoolManager.borrowConnection(CONNECTION_POOL_NAME);
	return ds.borrowConnection();
    }
    
    public void releaseConnection(Connection connection) throws SQLException {
	//	       
	//eaSmartDbPoolManager.returnToPool(connection);
    	ds.returnConnection(connection);
    }
   
    public List searchContracts(McmSearchBean searchBean) throws InstantiationException, SQLException,
    IllegalAccessException
    {
	
	logger.info("Inside the searchContracts Method in DAO");
	//logger.info("Input Parameter : +userName" + userName);
	
	XxcssMatStcCommonUtil matStcUtils = XxcssMatStcCommonUtil.getInstance();
	OracleApplicationSession oas = new OracleApplicationSession();
	oas.setApplicationShortName("XXCSS_MAT");
	oas.setResponsiblityName("NULL");
	oas.setUserName("Kiran");
	oas.setSchemaPackage("APPS.xxccs_fea_utl_session");
	ds = MCMDataUtil.getServices(oas, "APP");
	List[] resultList = new List[1];
	List finalList = null;
	logger
	.debug("@@@@@@@@@ In McmSearchContractDAO searchContracts  Methods @@@@@@@@@@@@@@@@@@@ ");

	 try {
	    logger
		    .debug("### Before Calling the searchContracts Method ######");
	    System.out.println("I am passing ................");
	    System.out.println("searchBean.getContratNumber()"+searchBean.getContratNumber());
	    System.out.println("getCustomerName :"+searchBean.getCustomerName());
	    System.out.println("getBillToSiteId :"+searchBean.getBillToSiteId());
	    System.out.println("getMigrationStatus :"+searchBean.getMigrationStatus());
	    finalList = matStcUtils.countryUiMigration(ds,searchBean.getContratNumber(),searchBean.getBillToSiteId(),searchBean.getCustomerName(),searchBean.getMigrationStatus(),resultList);
	    System.out.println(" finalList \t" + finalList);
	} catch (InstantiationException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (SQLException e) {
	    logger.error(e.toString(), e);
	    throw e;
	} catch (IllegalAccessException e) {
	    logger.error(e.toString(), e);
	    throw e;
	}
	//finalList = prepareDummyList();
	System.out.println("Exiting the searchContracts Method " + finalList);
	printData(finalList);
	System.out.println("Exiting the searchContracts Method " + resultList[0]);
	return finalList;
    }

  /*  Commenting as part of C3T Static Analysis fix  - Q3FY12 - Vijay 
   * 
   * private List prepareDummyList(){
	
	List myList = new ArrayList();
	for(int i=0;i<2500;i++){
	    System.out.println("Insode for loop");
	    //BigDecimal b = null;
	    XxcssMatStcMigType migrationRecType = new XxcssMatStcMigType();
	    migrationRecType.setBillToAddress(" 1815 Anchor Way "+i);
	    //migrationRecType.setContractNumber(b);
	    migrationRecType.setContractStatus(" Migrated ");
	    migrationRecType.setCustomerName("KiranKumar Guntupalli "+i);
	    //migrationRecType.setNewBillToSiteId(b);
	    migrationRecType.setNewBusinessEntity(" 2477 CountryBrook "+i);
	    migrationRecType.setNewCustomerId(" 116655 " +i);
	    //migrationRecType.setOldBillToSiteId(b);
	    migrationRecType.setOldBusinessEntity("1815 Anchor Way , San Jose "+i);
	    migrationRecType.setOldCustomerId("420 420 "+i);
	    migrationRecType.setStcMigCompleted("Yes "+i);
	    
	    myList.add(migrationRecType);
	    
	}
	
	return myList;
	
    } */
    
    private void printData(List result){
	
	System.out.println("--------------We are printing the data here-------");
	if(result!=null && result.size()>0){
	    for(int i=0;i<result.size();i++){
		XxcssMatStcMigType migrationRecType = (XxcssMatStcMigType)result.get(i);
		System.out.println("migrationRecType.getBillToAddress(): "+migrationRecType.getBillToAddress());
		System.out.println("getContractNumber : "+migrationRecType.getContractNumber());
		System.out.println("getContractStatus :"+migrationRecType.getContractStatus());
		System.out.println("getCustomerName : "+migrationRecType.getCustomerName());
		System.out.println("getNewBillToSiteId :"+migrationRecType.getNewBillToSiteId());
		System.out.println("getNewBusinessEntity:"+migrationRecType.getNewBusinessEntity());
		System.out.println("getNewBusinessEntity :"+migrationRecType.getNewCustomerId());
		System.out.println("getOldBillToSiteId :"+migrationRecType.getOldBillToSiteId());
		System.out.println("getOldBusinessEntity : "+migrationRecType.getOldBusinessEntity());
		System.out.println("getStcMigCompleted : "+migrationRecType.getStcMigCompleted());
		System.out.println("getSourceContractNumber : "+migrationRecType.getSourceContractNumber());
	    }
	}
    }
}
