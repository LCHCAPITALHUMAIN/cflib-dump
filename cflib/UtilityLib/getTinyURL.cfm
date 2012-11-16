<cffunction name="getTinyURL" access="public" output="false" returntype="string">
	<cfargument name="theurl" required="true" type="string" />
	<cfset var apiURL = "http://tinyurl.com/api-create.php?url=" & URLEncodedFormat(arguments.theurl) />
	
	<cfhttp url="#apiURL#" />
	
	<cfreturn cfhttp.FileContent />
</cffunction>