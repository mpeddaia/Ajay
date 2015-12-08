/**
 * 
 */
package com.cisco.mcm.util;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

/**
 * This class is used to get the data source depends upon the pool.
 * @author viddasar
 * 
 */
public class WASConnectionPoolManager {
	private static final Logger log = Logger
			.getLogger(WASConnectionPoolManager.class);
	private static String ciscolife = null;
	private static Context context = null;
	private static final String STAGE = "stage";
	private static final String STG = "stg";
	private static final String PRD = "prd";
	private static final String APPLICATION_ENV = "application.environment";
	private static final String PROD = "prod";
	private static final String CISCO_LIFE = "cisco.life";
	private static final String LOCAL = "local";

	private static Logger logger = Logger.getLogger(WASConnectionPoolManager.class);
	
	public WASConnectionPoolManager(){
		
	}
	static {
		setEnvironmentVars();
		ciscolife = System.getProperty("cisco.life");
		
	}
	 private static void setEnvironmentVars() {
	        if (System.getProperty(CISCO_LIFE) == null) {
	            System.setProperty(CISCO_LIFE, LOCAL);
	        }

	        String ciscoLife = System.getProperty(CISCO_LIFE, LOCAL);
	        if (STAGE.equalsIgnoreCase(ciscoLife)) {
	            System.setProperty(APPLICATION_ENV, STG);
	        } else if (PROD.equalsIgnoreCase(ciscoLife)) {
	            System.setProperty(APPLICATION_ENV, PRD);
	        } else {
	            System.setProperty(APPLICATION_ENV, ciscoLife);
	        }
	        
	        log.info("System.GetProperty(APPLICATION_ENV=" + System.getProperty(APPLICATION_ENV));
	    }

	/**
	 * To lookup the JNDI and return the data source.
	 * @param jndiName
	 * @return DataSource
	 */
	public DataSource loadPool(String jndiName) {
		log.info("Entering into loadPool() method........");
		DataSource dataSource = null;
		try {
			Context initCtx = createContext();
			log.info("After created the Context");
			if (null != jndiName && !"".equalsIgnoreCase(jndiName)) {
				dataSource = ((DataSource) initCtx.lookup(jndiName));
			}
		} catch (NamingException e) {
			log.error("WASConnectionPoolManager: Exception in getting data source from : " + jndiName);
			//e.printStackTrace();
			logger.error(" WASConnectionPoolManager : loadPool : NamingException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
		}
		log.info("Exiting from loadPool() method........");
		return dataSource;
	}

	private static Context createContext() throws NamingException {
		log.info("Entering into createContext() method.......");
		if((null != ciscolife) && !("".equals(ciscolife)) && !(ciscolife.equals("local"))){
			log.info("createContext() method : Cisco life Environment is : " + ciscolife);
			Properties env = new Properties();
			env.put(Context.INITIAL_CONTEXT_FACTORY,
					"com.ibm.websphere.naming.WsnInitialContextFactory");
			context = new InitialContext(env);
		}else {
			log.info("createContext() method : Cisco life Environment is : " + ciscolife);
			context = (Context) new InitialContext().lookup("java:comp/env");
			//context = (Context) new InitialContext().lookup("dv5cts");
		}
		log.info("Exiting from createContext() method.......");
		return context;
	}

}
