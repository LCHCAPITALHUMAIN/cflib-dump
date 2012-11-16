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

<!---
 Checks to see if a string is valid XML.
 
 @param data 	 String to check. (Required)
 @return Returns a boolean. 
 @author Ben Forta (ben@forta.com) 
 @version 1, August 28, 2003 
--->
<cffunction name="isXML" returnType="boolean" output="no">
   <cfargument name="data" type="string" required="yes">

   <!--- try catch block --->
   <cftry>
      <!--- try to parse the data as xml --->
      <cfset xmlparse(data)>
      <!--- if xmlparse() fails, it is not xml --->
      <cfcatch type="any">
         <cfreturn false>
      </cfcatch>
   </cftry>

   <cfreturn true>
   
</cffunction>