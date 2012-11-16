<cffunction name="getMapDirectory" returntype="string" output="false">
	<cfargument name="name" type="string" required="yes">
	<cfset factory = CreateObject("java", "coldfusion.server.ServiceFactory")>
 	<cfreturn StructFind(factory.RuntimeService.getMappings(),Arguments.name)>
</cffunction>