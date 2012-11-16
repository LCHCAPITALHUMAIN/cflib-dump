<cffunction name="customTagContext">
	<cfset var parentTemplate = "">
	<cftry>
		<cfthrow>
		<cfcatch>
			<cfif arrayLen(cfcatch.tagcontext) gte 3>
				<cfset parentTemplate = cfcatch.tagcontext[3].template>
			</cfif>
		</cfcatch>
	</cftry>
	<cfreturn parentTemplate>
</cffunction>