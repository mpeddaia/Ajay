package com.cisco.mcm.dao.oracletypes;

import java.sql.SQLException;

import edu.emory.mathcs.backport.java.util.Arrays;
import oracle.jdbc.driver.OracleConnection;
import oracle.jdbc.driver.OracleTypes;
import oracle.sql.CustomDatum;
import oracle.sql.CustomDatumFactory;
import oracle.sql.Datum;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.jpub.runtime.MutableArray;

public class OraMatReportParamsTbl implements CustomDatum, CustomDatumFactory
{
 //TD013 public static final String _SQL_NAME = "XXCM.XX_CM_UPLD_REQ_PARM_TBL_TYPE";
  public static final String _SQL_NAME = "APPS.XXCSS_SSF_UPLD_PARM_TAB_TYPE";
  public static final int _SQL_TYPECODE = OracleTypes.ARRAY;

  MutableArray _array;

private static final OraMatReportParamsTbl _OraMatReportParamsTblFactory = new OraMatReportParamsTbl();

  public static CustomDatumFactory getFactory()
  { return _OraMatReportParamsTblFactory; }
  /* constructors */
  public OraMatReportParamsTbl()
  {
    this((OraMatReportParamsObj[])null);
  }

  public OraMatReportParamsTbl(OraMatReportParamsObj[] a)
  {
	//Start: added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  OraMatReportParamsObj[] temp;
      if(a == null){
             temp = new OraMatReportParamsObj[0];
      } else {
             temp = (OraMatReportParamsObj[]) Arrays.copyOf(a, a.length); 
      }
	  
	  _array = new MutableArray(temp, 2002, OraMatReportParamsObj.getFactory()); 
	  
	//End: added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  
    //_array = new MutableArray(a, 2002, OraMatReportParamsObj.getFactory()); // original code
  }

  /* CustomDatum interface */
  public Datum toDatum(OracleConnection c) throws SQLException
  {
    return _array.toDatum(c, _SQL_NAME);
  }

  /* CustomDatumFactory interface */
  public CustomDatum create(Datum d, int sqlType) throws SQLException
  {
    if (d == null) return null;
    OraMatReportParamsTbl a = new OraMatReportParamsTbl();
    a._array = new MutableArray((ARRAY) d, 2002, OraMatReportParamsObj.getFactory());
    return a;
  }

  public int length() throws SQLException
  {
    return _array.length();
  }

  public int getBaseType() throws SQLException
  {
    return _array.getBaseType();
  }

  public String getBaseTypeName() throws SQLException
  {
    return _array.getBaseTypeName();
  }

  public ArrayDescriptor getDescriptor() throws SQLException
  {
    return _array.getDescriptor();
  }

  /* array accessor methods */
  public OraMatReportParamsObj[] getArray() throws SQLException
  {
    return (OraMatReportParamsObj[]) _array.getObjectArray(
      new OraMatReportParamsObj[_array.length()]);
  }

  public void setArray(OraMatReportParamsObj[] a) throws SQLException
  {
    _array.setObjectArray(a);
  }

  public OraMatReportParamsObj[] getArray(long index, int count) throws SQLException
  {
    return (OraMatReportParamsObj[]) _array.getObjectArray(index,
      new OraMatReportParamsObj[_array.sliceLength(index, count)]);
  }

  public void setArray(OraMatReportParamsObj[] a, long index) throws SQLException
  {
    _array.setObjectArray(a, index);
  }

  public OraMatReportParamsObj getElement(long index) throws SQLException
  {
    return (OraMatReportParamsObj) _array.getObjectElement(index);
  }

  public void setElement(OraMatReportParamsObj a, long index) throws SQLException
  {
    _array.setObjectElement(a, index);
  }

}
