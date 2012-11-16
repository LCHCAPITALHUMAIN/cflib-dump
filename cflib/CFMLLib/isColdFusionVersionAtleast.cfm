<cffunction name="isColdFusionVersionAtleast" access="private" output="false" returntype="boolean">
	<cfargument name="MinimumVersionNumber" type="string" required="true" />

	<cfset Local.VersionData = ListToArray(Server.ColdFusion.ProductVersion) />
	<cfset Local.TestVersionData = ListToArray(Arguments.MinimumVersionNumber) />
	<cfset Local.Result = true />
	<cfset local.x = "">
	
	<cfloop from="1" to="#Min(ArrayLen(Local.TestVersionData), ArrayLen(Local.VersionData))#" index="x">
		<cfif Local.VersionData[x] lt Local.TestVersionData[x]>
			<cfset Local.Result = false />
			<cfbreak />
		<cfelseif Local.VersionData[x] gt Local.TestVersionData[x]>
			<cfbreak />
		</cfif>
	</cfloop>

	<cfreturn Local.Result />
</cffunction>