<cffunction name="abort" output="false" returnType="void">
	<cfargument name="showError" type="string" required="false">
	<cfif isDefined("showError") and len(showError)>
		<cfthrow message="#showError#">
	</cfif>
	<cfabort>
</cffunction>