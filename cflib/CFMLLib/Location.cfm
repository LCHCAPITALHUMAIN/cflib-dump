<cffunction name="location" output="false" returnType="void">
	<cfargument name="url" type="string" required="true">
	<cfargument name="addToken" type="boolean" default="true" required="false">
	<cflocation url="#url#" addToken="#addToken#">
</cffunction>