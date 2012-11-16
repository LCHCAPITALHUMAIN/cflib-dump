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
 Mimics the cffile, action=&quot;move&quot; command.
 
 @param source 	 Souce file to move. (Required)
 @param destination 	 Path to move file to. (Required)
 @param mode 	 Defines permissions for a file on non-Windows systems. (Required)
 @param attributes 	 File attributes. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileMove" output="false" returnType="void">
	<cfargument name="source" type="string" required="true">
	<cfargument name="destination" type="string" required="true">
	<cfargument name="mode" type="string" default="" required="false">
	<cfargument name="attributes" type="string" required="false" default="">
	<cfif len(mode)>
		<cffile action="move" source="#source#" destination="#destination#" mode="#mode#">
	<cfelse>
		<cffile action="move" source="#source#" destination="#destination#" attributes="#attributes#">
	</cfif>	
</cffunction>