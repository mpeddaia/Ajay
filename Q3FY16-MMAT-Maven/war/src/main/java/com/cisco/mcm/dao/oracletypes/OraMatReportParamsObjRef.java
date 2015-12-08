package com.cisco.mcm.dao.oracletypes;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.CustomDatum;
import oracle.sql.CustomDatumFactory;
import oracle.sql.Datum;
import oracle.sql.REF;
import oracle.sql.STRUCT;

public class OraMatReportParamsObjRef implements CustomDatum, CustomDatumFactory
{
	
	private static Logger logger = Logger.getLogger(OraMatOverrideValObjRef.class); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	
 //TD013 public static final String _SQL_BASETYPE = "XXCM.xxcss_ssf_upld_parm_obj_type";
 public static final String _SQL_BASETYPE = "APPS.XXCSS_SSF_UPLD_PARM_OBJ_TYPE";
  
  public static final int _SQL_TYPECODE = OracleTypes.REF;

  REF _ref;

private static final OraMatReportParamsObjRef _OraMatReportParamsObjRefFactory = new OraMatReportParamsObjRef();

  public static CustomDatumFactory getFactory()
  { return _OraMatReportParamsObjRefFactory; }
  /* constructor */
  public OraMatReportParamsObjRef()
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
    OraMatReportParamsObjRef r = new OraMatReportParamsObjRef();
    r._ref = (REF) d;
    return r;
  }

  public static OraMatReportParamsObjRef cast(CustomDatum o) throws SQLException
  {
     if (o == null) return null;
     try { return (OraMatReportParamsObjRef) getFactory().create(o.toDatum(null), OracleTypes.REF); }
     catch (Exception exn)
     { 
    	 logger.error("OraMatReportParamsObjRef : OraMatReportParamsObjRef : Exception : " , exn); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
    	 throw new SQLException("Unable to convert "+o.getClass().getName()+" to OraMatReportParamsObjRef: "+exn.toString()); }
  }

  public OraMatReportParamsObj getValue() throws SQLException
  {
     return (OraMatReportParamsObj) OraMatReportParamsObj.getFactory().create(
       _ref.getSTRUCT(), OracleTypes.REF);
  }

  public void setValue(OraMatReportParamsObj c) throws SQLException
  {
      OracleConnection con = null;
      try{
	 con =  _ref.getConnection();
    _ref.setValue((STRUCT) c.toDatum(con));
      }catch(SQLException e){
    	  logger.error("OraMatReportParamsObjRef : setValue : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  throw e;
      }finally{
	  try{
	      con.close();
	  }catch (SQLException e){
		  logger.error("OraMatReportParamsObjRef : setValue : Exception : " , e); // added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  }
      }
  }
}
