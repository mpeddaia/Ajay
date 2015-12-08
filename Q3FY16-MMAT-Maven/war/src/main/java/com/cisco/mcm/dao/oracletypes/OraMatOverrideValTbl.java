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

public class OraMatOverrideValTbl implements CustomDatum, CustomDatumFactory
{
  public static final String _SQL_NAME = "CIBER.CIB_MAT_VAL_OVERRIDE_TBL_TYPE";
  public static final int _SQL_TYPECODE = OracleTypes.ARRAY;

  MutableArray _array;

private static final OraMatOverrideValTbl _OraMatOverrideValTblFactory = new OraMatOverrideValTbl();

  public static CustomDatumFactory getFactory()
  { return _OraMatOverrideValTblFactory; }
  /* constructors */
  public OraMatOverrideValTbl()
  {
    this((OraMatOverrideValObj[])null);
  }

  public OraMatOverrideValTbl(OraMatOverrideValObj[] a)
  {
	  
	//Start: added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  OraMatOverrideValObj[] temp; 	  
	  										
      if(a == null){
             temp = new OraMatOverrideValObj[0];
      } else {
             temp = (OraMatOverrideValObj[]) Arrays.copyOf(a, a.length); 
      }
	  
	  _array = new MutableArray(temp, 2002, OraMatOverrideValObj.getFactory());
	  
	// End : added by amalekar as part of Q1FY15 , in order to fix critical issue.
	  
    //_array = new MutableArray(a, 2002, OraMatOverrideValObj.getFactory()); //original code
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
    OraMatOverrideValTbl a = new OraMatOverrideValTbl();
    a._array = new MutableArray((ARRAY) d, 2002, OraMatOverrideValObj.getFactory());
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
  public OraMatOverrideValObj[] getArray() throws SQLException
  {
    return (OraMatOverrideValObj[]) _array.getObjectArray(
      new OraMatOverrideValObj[_array.length()]);
  }

  public void setArray(OraMatOverrideValObj[] a) throws SQLException
  {
    _array.setObjectArray(a);
  }

  public OraMatOverrideValObj[] getArray(long index, int count) throws SQLException
  {
    return (OraMatOverrideValObj[]) _array.getObjectArray(index,
      new OraMatOverrideValObj[_array.sliceLength(index, count)]);
  }

  public void setArray(OraMatOverrideValObj[] a, long index) throws SQLException
  {
    _array.setObjectArray(a, index);
  }

  public OraMatOverrideValObj getElement(long index) throws SQLException
  {
    return (OraMatOverrideValObj) _array.getObjectElement(index);
  }

  public void setElement(OraMatOverrideValObj a, long index) throws SQLException
  {
    _array.setObjectElement(a, index);
  }

}
