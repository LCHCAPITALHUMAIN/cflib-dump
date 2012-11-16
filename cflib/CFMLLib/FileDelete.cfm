<cffunction name="fileDelete" output="false" returnType="void">
	<cfargument name="file" type="string" required="true">
	<cffile action="delete" file="#file#">	
</cffunction>