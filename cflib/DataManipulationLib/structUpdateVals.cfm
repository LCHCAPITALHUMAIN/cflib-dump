<cffunction name="structUpdateVals" returntype="struct" output="false">
	<cfargument name="struct1" required="yes" type="struct" />
	<cfargument name="struct2" required="yes" type="struct"  />

	<cfloop collection="#struct2#" item="key">
		<cfif structKeyExists(struct1, key)>
			<cfset structUpdate(struct1, key, struct2[key]) />
	</cfif>
	</cfloop>		
	<cfreturn struct1 />
</cffunction>