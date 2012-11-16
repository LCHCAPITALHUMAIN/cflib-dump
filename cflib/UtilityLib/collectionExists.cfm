<cffunction name="collectionExists" returnType="boolean" output="false" hint="This returns a yes/no value that checks for the existence of a named collection.">
	<cfargument name="collection" type="string" required="yes">

	<!---// by default return true //--->
	<cfset var bExists = true />
	<cfset var searchItems = "">
	
	<!---// if you can't search the collection, then assume it doesn't exist //--->
	<cftry>
		<cfsearch
			name="searchItems"
			collection="#arguments.collection#"
			type="simple"
			criteria="#createUUID()#"
			/>
		<cfcatch type="any">
			<!---// if the message contains the string "does not exist", then the collection can't be found //--->
			<cfif cfcatch.message contains "does not exist">
				<cfset bExists = false />
			<cfelse>
				<cfrethrow>
			</cfif>
		</cfcatch>
	</cftry>

	<!---// returns true if search was successful and false if an error occurred //--->
	<cfreturn bExists />

</cffunction>