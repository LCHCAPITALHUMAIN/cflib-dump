<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Absolute value |z| of a complex number.
 * Note that this function uses complex numbers stored as structures by the ComplexNum() UDF also available in this library.
 * 
 * @param ComplexNumber 	 Structure containing the complex number you want the absolute value for. 
 * @return Returns a numeric value. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 15, 2001 
 */
function ComplexNumAbs(ComplexNumber){
  return Sqr(ComplexNumber.R^2 + ComplexNumber.I^2);
}
</cfscript>