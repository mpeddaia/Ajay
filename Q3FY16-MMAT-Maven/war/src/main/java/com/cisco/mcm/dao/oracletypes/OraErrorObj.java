package com.cisco.mcm.dao.oracletypes;

import java.sql.SQLException;
import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.CustomDatum;
import oracle.sql.CustomDatumFactory;
import oracle.sql.Datum;
import oracle.sql.STRUCT;
import oracle.jpub.runtime.MutableStruct;

public class OraErrorObj implements CustomDatum, CustomDatumFactory
{
  public static final String _SQL_NAME = "XXCM.XX_CM_ERROR_OBJ_TYPE";
  public static final int _SQL_TYPECODE = OracleTypes.STRUCT;

  protected MutableStruct _struct;

  private static int[] _sqlType =  { 2,1,12 };
  private static CustomDatumFactory[] _factory = new CustomDatumFactory[3];
  private static final OraErrorObj _OraErrorObjFactory = new OraErrorObj();

  public static CustomDatumFactory getFactory()
  { return _OraErrorObjFactory; }
  /* constructor */
  protected OraErrorObj(boolean init)
  { if(init) _struct = new MutableStruct(new Object[3], _sqlType, _factory); }
  public OraErrorObj()
  { this(true); }

  /* CustomDatum interface */
  public Datum toDatum(OracleConnection c) throws SQLException
  {
    return _struct.toDatum(c, _SQL_NAME);
  }

  /* CustomDatumFactory interface */
  public CustomDatum create(Datum d, int sqlType) throws SQLException
  { return create(null, d, sqlType); }
  protected CustomDatum create(OraErrorObj o, Datum d, int sqlType) throws SQLException
  {
    if (d == null) return null; 
    if (o == null) o = new OraErrorObj(false);
    o._struct = new MutableStruct((STRUCT) d, _sqlType, _factory);
    return o;
  }
  /* accessor methods */
  public java.math.BigDecimal getPErrCode() throws SQLException
  { return (java.math.BigDecimal) _struct.getAttribute(0); }

  public void setPErrCode(java.math.BigDecimal pErrCode) throws SQLException
  { _struct.setAttribute(0, pErrCode); }


  public String getPErrType() throws SQLException
  { return (String) _struct.getAttribute(1); }

  public void setPErrType(String pErrType) throws SQLException
  { _struct.setAttribute(1, pErrType); }


  public String getPErrMsg() throws SQLException
  { return (String) _struct.getAttribute(2); }

  public void setPErrMsg(String pErrMsg) throws SQLException
  { _struct.setAttribute(2, pErrMsg); }

}
