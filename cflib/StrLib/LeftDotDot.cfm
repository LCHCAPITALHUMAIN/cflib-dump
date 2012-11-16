<cffunction name="leftDotDot" output="no" returntype="string">
	<cfargument name="str" type="string" required="yes">
	<cfargument name="l" type="numeric" required="no" default="80">
	
	<cfset var result = str>
	
	<cfif Len( str ) GT l>
		<cfset result = Left( Trim(str), l-2 ) & "...">
	</cfif>
	
	<cfreturn result>
	
</cffunction>