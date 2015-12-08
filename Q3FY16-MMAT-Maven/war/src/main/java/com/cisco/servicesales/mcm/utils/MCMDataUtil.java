package com.cisco.servicesales.mcm.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.DbUtils;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.ca.fea.daoservices.DAOServicesFactory;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.servicesales.util.SpringSingleton;

public class MCMDataUtil {
    private static Logger logger = Logger.getLogger(MCMDataUtil.class);
    private static final String SESSION_SCHEMA_UTIL = "xxccs_fea_utl_session";

    public static String genaratePropertyKey(String columnName) {
	String key = null;
	char _underScore = '_';
	key = columnName.toLowerCase();
	for (int i = 0; i < key.length(); i++) {
	    if (!(Character.isLetterOrDigit(key.charAt(i)))) {
		key = key.replace(key.charAt(i), _underScore);
	    }
	}
	return key;
    }

    /*
     * comments
     * 
     */
    public static DAOServices getServices(OracleApplicationSession oas,
	    String ConnectionPoolName) {
    	logger.info("Inside Get Services");
	return DAOServicesFactory
		.create(getDataSource(ConnectionPoolName), oas);
    }

    public static DataSource getDataSource(String ConnectionPoolName) {

		logger.info("Inside getDataSource Method");
		DataSource dataSource = null;	
		ApplicationContext context = SpringSingleton.getContext();
		
		logger.info("Inside getDataSource Method");
		if ("APP".equals(ConnectionPoolName)) 
		{
		     dataSource = (DataSource) context.getBean("dataSource");
		} else {
		     dataSource = (DataSource) context.getBean("dataSource-CM");
		}
		displayDatabaseInfo(dataSource);
		return dataSource;
    }
    
    private static void displayDatabaseInfo(DataSource dataSource) 
    {
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
			System.out.println("----------------------DATABASE INFORMATION-------------------------");
			System.out.println("Database Username : " + connection.getMetaData().getUserName());
			System.out.println("Database Name : " + connection.getMetaData().getURL());
			System.out.println("Driver Name : " + connection.getMetaData().getDriverName());
			System.out.println("----------------------DATABASE INFORMATION-------------------------");
		} catch (SQLException e) {
			//e.getMessage(); //original code
			logger.error("Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}finally {
        	try
        	{
	        	DbUtils.closeQuietly(connection);
        	} catch(Exception e) {
        		
        		logger.error("Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
        	}
        }

    }
}
