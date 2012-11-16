<cffunction name="getdsn" returntype="struct" output="false">
	<cfargument name="dsn" type="string" required="yes">

	<!--- initialize variables --->
	<cfset var dsservice = "">

	<!--- get "factory" --->
	<cfobject action="create"
	         type="java"
	         class="coldfusion.server.ServiceFactory"
	         name="factory">

	<!--- get datasource service --->
	<cfset dsservice = factory.getdatasourceservice()>

	<cfif not structKeyExists(dsservice.datasources,dsn)>
		<cfthrow message="#dsn# is not a registered datasource.">
	</cfif>
	
	<!--- get dsn --->
	<cfreturn duplicate(dsservice.datasources[dsn])>

</cffunction>