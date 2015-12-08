// Decompiled Using: FrontEnd Plus v2.03 and the JAD Engine
// Available From: http://www.reflections.ath.cx
// Decompiler options: packimports(3) 
// Source File Name:   DbUtil.java

package com.cisco.servicesales.list.engine;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.cisco.ea.dbpool.EASmartDbPoolManager;
import com.cisco.servicesales.db.ConnectionBroker;

public class DbUtil
{
	public static final EASmartDbPoolManager eaSmartDbPoolManager = new EASmartDbPoolManager();
	private static Logger logger = Logger.getLogger(DbUtil.class);
	
    public DbUtil()
    {
    }

    public static void init(String className)
    {
        try
        {	
            connectionBroker = (ConnectionBroker)Class.forName(className).newInstance();
        }
        catch(InstantiationException e)
        {
            //e.printStackTrace();
              logger.error(e.toString(),e);
        } catch(ClassNotFoundException e)
        {
            //e.printStackTrace();
              logger.error(e.toString(),e);
        }catch(IllegalAccessException e)
        {
            //e.printStackTrace();
              logger.error(e.toString(),e);
        }
    }

    public static Connection getConnection()
        throws SQLException
    {
        return eaSmartDbPoolManager.borrowConnection("UPLD");
    }

    public static void releaseConnection(Connection connection)
    {
        try
        {
            connectionBroker.releaseConnection(connection);
        }
        catch(SQLException e)
        {
            log.error(null, e);
        }
    }

    

    private static Logger log;
    private static ConnectionBroker connectionBroker = null;

    static 
    {
        log = Logger.getLogger(com.cisco.servicesales.list.engine.DbUtil.class);
    }
}