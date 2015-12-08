package com.cisco.mcm.dao.oracletypes;

import java.sql.SQLException;
import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.CustomDatum;
import oracle.sql.CustomDatumFactory;
import oracle.sql.Datum;
import oracle.sql.STRUCT;
import oracle.jpub.runtime.MutableStruct;

public class OraMatOverrideValObj implements CustomDatum, CustomDatumFactory
{
  public static final String _SQL_NAME = "CIBER.CIB_MAT_VAL_OVERRIDE_OBJ_TYPE";
  public static final int _SQL_TYPECODE = OracleTypes.STRUCT;

  protected MutableStruct _struct;

  private static int[] _sqlType =  { 12,12,12 };
  private static CustomDatumFactory[] _factory = new CustomDatumFactory[3];
protected static final OraMatOverrideValObj _OraMatOverrideValObjFactory = new OraMatOverrideValObj(false);

  public static CustomDatumFactory getFactory()
  { return _OraMatOverrideValObjFactory; }
  /* constructor */
  protected OraMatOverrideValObj(boolean init)
  { if(init) _struct = new MutableStruct(new Object[3], _sqlType, _factory); }
  public OraMatOverrideValObj()
  { this(true); }
  public OraMatOverrideValObj(String upldDefinitionName, String bizValidationCode, String bizValidationDesc) throws SQLException
  { this(true);
    setUpldDefinitionName(upldDefinitionName);
    setBizValidationCode(bizValidationCode);
    setBizValidationDesc(bizValidationDesc);
  }

  /* CustomDatum interface */
  public Datum toDatum(OracleConnection c) throws SQLException
  {
    return _struct.toDatum(c, _SQL_NAME);
  }


  /* CustomDatumFactory interface */
  public CustomDatum create(Datum d, int sqlType) throws SQLException
  { return create(null, d, sqlType); }
  protected CustomDatum create(OraMatOverrideValObj o, Datum d, int sqlType) throws SQLException
  {
    if (d == null) return null; 
    if (o == null) o = new OraMatOverrideValObj(false);
    o._struct = new MutableStruct((STRUCT) d, _sqlType, _factory);
    return o;
  }
  /* accessor methods */
  public String getUpldDefinitionName() throws SQLException
  { return (String) _struct.getAttribute(0); }

  public void setUpldDefinitionName(String upldDefinitionName) throws SQLException
  { _struct.setAttribute(0, upldDefinitionName); }


  public String getBizValidationCode() throws SQLException
  { return (String) _struct.getAttribute(1); }

  public void setBizValidationCode(String bizValidationCode) throws SQLException
  { _struct.setAttribute(1, bizValidationCode); }


  public String getBizValidationDesc() throws SQLException
  { return (String) _struct.getAttribute(2); }

  public void setBizValidationDesc(String bizValidationDesc) throws SQLException
  { _struct.setAttribute(2, bizValidationDesc); }

}
