package com.cisco.mcm.dao.oracletypes;

import java.sql.SQLException;
import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.CustomDatum;
import oracle.sql.CustomDatumFactory;
import oracle.sql.Datum;
import oracle.sql.STRUCT;
import oracle.jpub.runtime.MutableStruct;

public class OraMatReportParamsObj implements CustomDatum, CustomDatumFactory
{
 //TD013 public static final String _SQL_NAME = "XXCM.XX_CM_UPLD_REQ_PARM_OBJ_TYPE";
  public static final String _SQL_NAME = "APPS.XXCSS_SSF_UPLD_PARM_OBJ_TYPE";
  public static final int _SQL_TYPECODE = OracleTypes.STRUCT;

  protected MutableStruct _struct;

  private static int[] _sqlType =  { 2,2,2,12,12,2,2,2,2,2,12,12,12,12,12,12,91,12,91 };
  private static CustomDatumFactory[] _factory = new CustomDatumFactory[19];
protected static final OraMatReportParamsObj _OraMatReportParamsObjFactory = new OraMatReportParamsObj(false);

  public static CustomDatumFactory getFactory()
  { return _OraMatReportParamsObjFactory; }
  /* constructor */
  protected OraMatReportParamsObj(boolean init)
  { if(init) _struct = new MutableStruct(new Object[19], _sqlType, _factory); }
  public OraMatReportParamsObj()
  { this(true); }
  public OraMatReportParamsObj(java.math.BigDecimal upldRequestParmId, java.math.BigDecimal upldRequestId, java.math.BigDecimal parmOrder, String parmName, String parmValue, java.math.BigDecimal attributeN1, java.math.BigDecimal attributeN2, java.math.BigDecimal attributeN3, java.math.BigDecimal attributeN4, java.math.BigDecimal attributeN5, String attributeC1, String attributeC2, String attributeC3, String attributeC4, String attributeC5, String createdBy, java.sql.Timestamp createdDate, String updatedBy, java.sql.Timestamp updatedDate) throws SQLException
  { this(true);
    setUpldRequestParmId(upldRequestParmId);
    setUpldRequestId(upldRequestId);
    setParmOrder(parmOrder);
    setParmName(parmName);
    setParmValue(parmValue);
    setAttributeN1(attributeN1);
    setAttributeN2(attributeN2);
    setAttributeN3(attributeN3);
    setAttributeN4(attributeN4);
    setAttributeN5(attributeN5);
    setAttributeC1(attributeC1);
    setAttributeC2(attributeC2);
    setAttributeC3(attributeC3);
    setAttributeC4(attributeC4);
    setAttributeC5(attributeC5);
    setCreatedBy(createdBy);
    setCreatedDate(createdDate);
    setUpdatedBy(updatedBy);
    setUpdatedDate(updatedDate);
  }

  /* CustomDatum interface */
  public Datum toDatum(OracleConnection c) throws SQLException
  {
    return _struct.toDatum(c, _SQL_NAME);
  }


  /* CustomDatumFactory interface */
  public CustomDatum create(Datum d, int sqlType) throws SQLException
  { return create(null, d, sqlType); }
  protected CustomDatum create(OraMatReportParamsObj o, Datum d, int sqlType) throws SQLException
  {
    if (d == null) return null; 
    if (o == null) o = new OraMatReportParamsObj(false);
    o._struct = new MutableStruct((STRUCT) d, _sqlType, _factory);
    return o;
  }
  /* accessor methods */
  public java.math.BigDecimal getUpldRequestParmId() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(0); }

  public void setUpldRequestParmId(java.math.BigDecimal upldRequestParmId) throws SQLException
  { _struct.setAttribute(0, upldRequestParmId); }


  public java.math.BigDecimal getUpldRequestId() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(1); }

  public void setUpldRequestId(java.math.BigDecimal upldRequestId) throws SQLException
  { _struct.setAttribute(1, upldRequestId); }


  public java.math.BigDecimal getParmOrder() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(2); }

  public void setParmOrder(java.math.BigDecimal parmOrder) throws SQLException
  { _struct.setAttribute(2, parmOrder); }


  public String getParmName() throws SQLException
  { return (String) _struct.getAttribute(3); }

  public void setParmName(String parmName) throws SQLException
  { _struct.setAttribute(3, parmName); }


  public String getParmValue() throws SQLException
  { return (String) _struct.getAttribute(4); }

  public void setParmValue(String parmValue) throws SQLException
  { _struct.setAttribute(4, parmValue); }


  public java.math.BigDecimal getAttributeN1() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(5); }

  public void setAttributeN1(java.math.BigDecimal attributeN1) throws SQLException
  { _struct.setAttribute(5, attributeN1); }


  public java.math.BigDecimal getAttributeN2() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(6); }

  public void setAttributeN2(java.math.BigDecimal attributeN2) throws SQLException
  { _struct.setAttribute(6, attributeN2); }


  public java.math.BigDecimal getAttributeN3() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(7); }

  public void setAttributeN3(java.math.BigDecimal attributeN3) throws SQLException
  { _struct.setAttribute(7, attributeN3); }


  public java.math.BigDecimal getAttributeN4() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(8); }

  public void setAttributeN4(java.math.BigDecimal attributeN4) throws SQLException
  { _struct.setAttribute(8, attributeN4); }


  public java.math.BigDecimal getAttributeN5() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(9); }

  public void setAttributeN5(java.math.BigDecimal attributeN5) throws SQLException
  { _struct.setAttribute(9, attributeN5); }


  public String getAttributeC1() throws SQLException
  { return (String) _struct.getAttribute(10); }

  public void setAttributeC1(String attributeC1) throws SQLException
  { _struct.setAttribute(10, attributeC1); }


  public String getAttributeC2() throws SQLException
  { return (String) _struct.getAttribute(11); }

  public void setAttributeC2(String attributeC2) throws SQLException
  { _struct.setAttribute(11, attributeC2); }


  public String getAttributeC3() throws SQLException
  { return (String) _struct.getAttribute(12); }

  public void setAttributeC3(String attributeC3) throws SQLException
  { _struct.setAttribute(12, attributeC3); }


  public String getAttributeC4() throws SQLException
  { return (String) _struct.getAttribute(13); }

  public void setAttributeC4(String attributeC4) throws SQLException
  { _struct.setAttribute(13, attributeC4); }


  public String getAttributeC5() throws SQLException
  { return (String) _struct.getAttribute(14); }

  public void setAttributeC5(String attributeC5) throws SQLException
  { _struct.setAttribute(14, attributeC5); }


  public String getCreatedBy() throws SQLException
  { return (String) _struct.getAttribute(15); }

  public void setCreatedBy(String createdBy) throws SQLException
  { _struct.setAttribute(15, createdBy); }


  public java.sql.Timestamp getCreatedDate() throws SQLException
  { return (java.sql.Timestamp) _struct.getAttribute(16); }

  public void setCreatedDate(java.sql.Timestamp createdDate) throws SQLException
  { _struct.setAttribute(16, createdDate); }


  public String getUpdatedBy() throws SQLException
  { return (String) _struct.getAttribute(17); }

  public void setUpdatedBy(String updatedBy) throws SQLException
  { _struct.setAttribute(17, updatedBy); }


  public java.sql.Timestamp getUpdatedDate() throws SQLException
  { return (java.sql.Timestamp) _struct.getAttribute(18); }

  public void setUpdatedDate(java.sql.Timestamp updatedDate) throws SQLException
  { _struct.setAttribute(18, updatedDate); }

}
