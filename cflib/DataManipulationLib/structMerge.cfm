<cffunction name="structMerge" output="false">
	<cfargument name="struct1" type="struct" required="true">
	<cfargument name="struct2" type="struct" required="true">
	<cfset var ii = "" />
	
	<!--- Loop over the second structure passed --->
	<cfloop collection="#arguments.struct2#" item="ii">
		<cfif structKeyExists(struct1,ii)>
		<!--- In case it already exists, we just update it --->
			<cfset struct1[ii] = listAppend(struct1[ii], struct2[ii])>
		<cfelse>
		<!--- In all the other cases, just create a new key with the values or list of values --->
			<cfset struct1[ii] = struct2[ii] />
		</cfif>
	</cfloop>
	<cfreturn struct1 />
</cffunction>