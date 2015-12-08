package com.cisco.servicesales.services;

import java.net.ConnectException;
import java.security.AccessControlException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

import com.cisco.ea.EAInit;
import com.cisco.servicesales.cache.GlobalCache;
import com.cisco.servicesales.db.ConnectionPool;
import com.cisco.servicesales.util.AppProperties;

/**
 * User: aygupta
 * Date: Oct 22, 2004
 * Time: 5:11:06 PM
 */

public class InitServlet extends HttpServlet {
    private static final String EA_APP_NAME = AppProperties.getApplicationName();
    private static final String EA_DEVELOPER_NAME = AppProperties.getProperty("ea.cisco_developer_uid");
    private static final String EA_MANAGER_NAME = AppProperties.getProperty("ea.manager_uid");

    private static final Logger logger = Logger.getLogger(InitServlet.class);
    private static final String STAGE = "stage";
    private static final String STG = "stg";
    private static final String PRD = "prd";
    private static final String APPLICATION_ENV = "application.environment";
    private static final String PROD = "prod";
    private static final String CISCO_LIFE = "cisco.life";
    private static final String LOCAL = "local";
   

    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
        logger.debug("******** INIT SERVLET");
        setEnvironmentVars();

        try {
        	com.cisco.upload.common.UploadThreadPooler pool=new com.cisco.upload.common.UploadThreadPooler(2,5); 
           // initEA();
        } catch (AccessControlException e) {
           logger.error(e.toString(),e);
        }
        
        try {
            GlobalCache gcache = GlobalCache.getInstace();
        } catch (ClassCastException e) {
            logger.error("can not instantiate global cache", e);
        }
        
        /* 
        Start : Commented code 
        Reason : Avoid Catching NPE
        Commented by : Ajay Malekar(amalekar)
        Release name : Q2FY15
        */
        
        /*catch (NullPointerException e) {
            logger.error("can not instantiate global cache", e);
        }*/
        
     // End : Commented code
        
        
        
        /* 
        Start : New code added 
        Reason : To fix CI issue , Avoid Catching NPE
        Commented by : Ajay Malekar(amalekar)
        Release name : Q2FY15
        */
        
        catch (Exception e) {
            logger.error("can not instantiate global cache", e);
        }
        
        // End : New code added

        
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
        
       logger.debug("System.GetProperty(APPLICATION_ENV=" + System.getProperty(APPLICATION_ENV));
    }

    private void initEA() {
    	logger.debug("EA_APP_NAME = " + EA_APP_NAME);
        logger.debug("EA_DEVELOPER_NAME = " + EA_DEVELOPER_NAME);
       logger.debug("EA_MANAGER_NAME = " + EA_MANAGER_NAME);

       // EAInit.init(EA_APP_NAME, EA_DEVELOPER_NAME, EA_MANAGER_NAME);
        logger.debug("EA Initalized");

        //pingDb();
    }

    private void pingDb() {
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        try {
            connection = ConnectionPool.getInstance().getConnection();
           logger.debug("Created Connection");
            statement = connection.createStatement();
            logger.debug("Created Statement");
            rs = statement.executeQuery("Select * from dual");
            logger.debug("Executed Query");

            logger.debug("Ping successful");
        } catch (SQLException e) {
            //e.printStackTrace(); // original code
            logger.error("InitServlet : pingDb : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
        } finally {
            ConnectionPool.close(connection, statement, rs);
        }
    }

}
