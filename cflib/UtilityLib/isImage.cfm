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