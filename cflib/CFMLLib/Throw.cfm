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
 Mimics the CFTHROW tag.
 
 @param Type 	 Type for exception. (Optional)
 @param Message 	 Message for exception. (Optional)
 @param Detail 	 Detail for exception. (Optional)
 @param ErrorCode 	 Error code for exception. (Optional)
 @param ExtendedInfo 	 Extended Information for exception. (Optional)
 @param Object 	 Object to throw. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="throw" output="false" returnType="void" hint="CFML Throw wrapper">
	<cfargument name="type" type="string" required="false" default="Application" hint="Type for Exception">
	<cfargument name="message" type="string" required="false" default="" hint="Message for Exception">
	<cfargument name="detail" type="string" required="false" default="" hint="Detail for Exception">
	<cfargument name="errorCode" type="string" required="false" default="" hint="Error Code for Exception">
	<cfargument name="extendedInfo" type="string" required="false" default="" hint="Extended Info for Exception">
	<cfargument name="object" type="any" hint="Object for Exception">
	
	<cfif not isDefined("object")>
		<cfthrow type="#type#" message="#message#" detail="#detail#" errorCode="#errorCode#" extendedInfo="#extendedInfo#">
	<cfelse>
		<cfthrow object="#object#">
	</cfif>
	
</cffunction>