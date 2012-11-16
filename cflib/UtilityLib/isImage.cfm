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
 Checks to see if an image URL contains a valid jpeg or gif.
 
 @param imgURL 	 URL. (Required)
 @return Returns a boolean. 
 @author Nick Maloney (nmaloney@prolucid.com) 
 @version 1, September 7, 2005 
--->
<cffunction name="isImage" returntype="boolean" output="false">
	<cfargument name="imgURL" type="string" required="true">
	<cftry>
		<cfhttp method="get" url="#arguments.imgURL#" />
		<cfif cfhttp.mimetype eq "image/jpeg" or cfhttp.mimetype eq "image/gif">
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	<cfcatch>
		<cfreturn false>
	</cfcatch>
	</cftry>
</cffunction>