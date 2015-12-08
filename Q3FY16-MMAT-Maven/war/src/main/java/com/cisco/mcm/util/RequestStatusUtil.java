/*
 * Created on Dec 2, 2005
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.cisco.mcm.util;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;



import com.cisco.ca.fea.daoservices.DAOServices;
import com.cisco.ca.fea.daoservices.DAOServicesFactory;
import com.cisco.ca.fea.daoservices.DAOTransaction;
import com.cisco.ca.fea.daoservices.DAOTransactionFactory;
import com.cisco.cts.util.oa.OracleApplicationSession;
import com.cisco.servicesales.util.SpringSingleton;

/**
 * @author jbathula
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class RequestStatusUtil {

    private static String defaultPool = "APP";

    /**
     * @return
     */
    public static DataSource getDataSource() {
	return getDataSource(defaultPool);
    }

    /**
     * @param pool
     * @return
     */
    public static DataSource getDataSource(String pool) {

	ApplicationContext context = SpringSingleton.getContext();
	return (DataSource) context.getBean("dataSource");
    }

    /**
     * @return
     */
    
    public static DAOServices getServices() {
	return DAOServicesFactory.create(getDataSource());
    }

    /**
     * @param oaSession
     * @return */
     
    public static DAOServices getServices(OracleApplicationSession oaSession) {
	return DAOServicesFactory.create(getDataSource(), oaSession);
    }

    /**
     * @return
     */
    public static DAOTransaction getTransaction() {
	return DAOTransactionFactory.create(getDataSource());
    }

    /**
     * @param oaSession
     * @return  */
     
    public static DAOTransaction getTransaction(
	    OracleApplicationSession oaSession) {
	return DAOTransactionFactory.create(getDataSource(), oaSession);
    }
   

}
