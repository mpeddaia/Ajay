package com.cisco.mcm.dao.oracletypes;

import java.sql.SQLException;

import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.CustomDatum;
import oracle.sql.CustomDatumFactory;
import oracle.sql.Datum;
import oracle.sql.REF;
import oracle.sql.STRUCT;

import org.apache.log4j.Logger;

public class OraMatOverrideValObjRef implements CustomDatum, CustomDatumFactory
{
  public static final String _SQL_BASETYPE = "CIBER.CIB_MAT_VAL_OVERRIDE_OBJ_TYPE";
  public static final int _SQL_TYPECODE = OracleTypes.REF;

  REF _ref;
  
  private static Logger logger = Logger.getLogger(OraMatOverrideValObjRef.class); // added by amalekar as part of Q1FY15 , in order to fix critical issue.

private static final OraMatOverrideValObjRef _OraMatOverrideValObjRefFactory = new OraMatOverrideValObjRef();

  public static CustomDatumFactory getFactory()
  { return _OraMatOverrideValObjRefFactory; }
  /* constructor */
  public OraMatOverrideValObjRef()
  {
  }

  /* CustomDatum interface */
  public Datum toDatum(OracleConnection c) throws SQLException
  {
    return _ref;
  }

  /* CustomDatumFactory interface */
  public CustomDatum create(Datum d, int sqlType) throws SQLException
  {
    if (d == null) return null;
    OraMatOverrideValObjRef r = new OraMatOverrideValObjRef();
    r._ref = (REF) d;
    return r;
  }

  public static OraMatOverrideValObjRef cast(CustomDatum o) throws SQLException
  {
     if (o == null) return null;
     try { return (OraMatOverrideValObjRef) getFactory().create(o.toDatum(null), OracleTypes.REF); }
     catch (Exception exn)
     { 
    	 logger.error("OraMatOverrideValObjRef : OraMatOverrideValObjRef : Exception : " , exn); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
    	 
    	 throw new SQLException("Unable to convert "+o.getClass().getName()+" to OraMatOverrideValObjRef: "+exn.toString()); 
     }
  }

  public OraMatOverrideValObj getValue() throws SQLException
  {
     return (OraMatOverrideValObj) OraMatOverrideValObj.getFactory().create(
       _ref.getSTRUCT(), OracleTypes.REF);
  }

  public void setValue(OraMatOverrideValObj c) throws SQLException
  {
      OracleConnection con = null;
      try{
	 con =  _ref.getConnection();
    _ref.setValue((STRUCT) c.toDatum(con));
      }catch(SQLException e){
    	  
    	  logger.error("OraMatOverrideValObjRef : setValue : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  throw e;
      }finally{
	  try{
	      con.close();
	  }catch (SQLException e){
		  logger.error("OraMatOverrideValObjRef : setValue : SQLException : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  }
      }
  }
}
