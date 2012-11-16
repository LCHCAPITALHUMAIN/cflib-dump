<cffunction name="getFileMimeType" returntype="string" output="no">
	
	<cfargument name="filePath" type="string" required="yes">
	
	<cfreturn getPageContext().getServletContext().getMimeType(arguments.filePath)>
	
</cffunction>