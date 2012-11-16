<cffunction name="clearStructureNested" returntype="void" output="false">
	<cfargument name="s" type="struct" required="true" />
	<cfset var i = "">
	<cfloop collection="#arguments.s#" item="i">
		<cfif isstruct(arguments.s[i])>
			<cfset clearStructureNested(arguments.s[i])>
		<cfelse>
			<cfset structupdate(arguments.s, i,"")>
		</cfif>
	</cfloop>
</cffunction>