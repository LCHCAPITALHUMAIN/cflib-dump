<cffunction name="ftpisConnected" output="false" returnType="boolean">
	<cfargument name="ftpObject" required="yes">
	<cfreturn ftpObject.isConnected()>
</cffunction>