

package com.cisco.cts.util.oa;

import java.io.Serializable;
import java.util.Properties;

@SuppressWarnings("serial")
public class OracleApplicationSession implements Serializable
{

    public static final int INVALID_SESSION_ID = -1;
    private String userName;
    private String applicationShortName;
    private String responsiblityName;
    private String appServerSessionId;
    private int securityGroupId;
    private int sessionId;
    private String subProcessId;
    private int logLevel;
    private Properties attributes;
    private boolean logAsynchronousFlag;
    private boolean logAutonomousFlag;
    private boolean persistSessionFlag;
    private String schemaPackage;

    public OracleApplicationSession()
    {
        this(null, null, null, 0, null, null, -1, -1, false, true, true);
    }

    public OracleApplicationSession(int sessionId)
    {
        this(null, null, null, 0, null, null, sessionId, -1, false, true, true);
    }

    public OracleApplicationSession(int sessionId, int logLevel)
    {
        this(null, null, null, 0, null, null, sessionId, logLevel, false, true, true);
    }

    public OracleApplicationSession(String userName, String responsiblityName, String applicationShortName, String appServerSessionId, String subProcessId)
    {
        this(userName, responsiblityName, applicationShortName, 0, appServerSessionId, subProcessId, -1, -1, false, true, true);
    }

    public OracleApplicationSession(String userName, String responsiblityName, String applicationShortName, String appServerSessionId, String subProcessId, int logLevel)
    {
        this(userName, responsiblityName, applicationShortName, 0, appServerSessionId, subProcessId, -1, logLevel, false, true, true);
    }

    public OracleApplicationSession(String userName, String responsiblityName, String applicationShortName, int securityGroupId, String appServerSessionId, String subProcessId, int sessionId, 
            int logLevel, boolean logAsynchronousFlag, boolean logAutonomousFlag, boolean persistSessionFlag)
    {
        setUserName(userName);
        setResponsiblityName(responsiblityName);
        setApplicationShortName(applicationShortName);
        setSecurityGroupId(securityGroupId);
        setAppServerSessionId(appServerSessionId);
        setSubProcessId(subProcessId);
        setLogLevel(logLevel);
        setSessionId(sessionId);
        setLogAsynchronousFlag(logAsynchronousFlag);
        setLogAutonomousFlag(logAutonomousFlag);
        setPersistSessionFlag(persistSessionFlag);
        attributes = new Properties();
    }

    public String getApplicationShortName()
    {
        return applicationShortName;
    }

    public String getAppServerSessionId()
    {
        return appServerSessionId;
    }

    public Object getAttribute(String key)
    {
        return attributes.get(key);
    }

    public int getLogLevel()
    {
        return logLevel;
    }

    public String getResponsiblityName()
    {
        return responsiblityName;
    }

    public int getSessionId()
    {
        return sessionId;
    }

    public String getSubProcessId()
    {
        return subProcessId;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setApplicationShortName(String string)
    {
        applicationShortName = string;
    }

    public void setAppServerSessionId(String string)
    {
        appServerSessionId = string;
    }

    public void setAttribute(String key, Object value)
    {
        attributes.put(key, value);
    }

    public void setLogLevel(int value)
    {
        if(value >= 0 && value <= 6)
            logLevel = value;
        else
            logLevel = -1;
    }

    public void setResponsiblityName(String string)
    {
        responsiblityName = string;
    }

    public void setSessionId(int string)
    {
        sessionId = string;
    }

    public void setSubProcessId(String string)
    {
        subProcessId = string;
    }

    public void setUserName(String string)
    {
        userName = string;
    }

    public int getSecurityGroupId()
    {
        return securityGroupId;
    }

    public void setSecurityGroupId(int value)
    {
        securityGroupId = value;
    }

    public boolean equals(Object obj)
    {
        if(obj != null && (obj instanceof OracleApplicationSession))
            return ((OracleApplicationSession)obj).getSessionId() == sessionId;
        else
            return false;
    }

    public boolean isLogAsynchronousFlag()
    {
        return logAsynchronousFlag;
    }

    public boolean isLogAutonomousFlag()
    {
        return logAutonomousFlag;
    }

    public boolean isPersistSessionFlag()
    {
        return persistSessionFlag;
    }

    public void setLogAsynchronousFlag(boolean b)
    {
        logAsynchronousFlag = b;
    }

    public void setLogAutonomousFlag(boolean b)
    {
        logAutonomousFlag = b;
    }

    public void setPersistSessionFlag(boolean b)
    {
        persistSessionFlag = b;
    }

    public boolean getLogAsynchronousFlag()
    {
        return logAsynchronousFlag;
    }

    public boolean getLogAutonomousFlag()
    {
        return logAutonomousFlag;
    }

    public boolean getPersistSessionFlag()
    {
        return persistSessionFlag;
    }

    public String getSchemaPackage()
    {
        return schemaPackage;
    }

    public void setSchemaPackage(String schemaPackage)
    {
        this.schemaPackage = schemaPackage;
    }
}
