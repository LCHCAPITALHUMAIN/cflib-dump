<cffunction name="arrayExcludeNumeric" returntype="array">
	<cfargument name="aObj" type="array" required="Yes">
	<cfset var ii = "">
	
	<!--- Looping through the array --->
	<cfloop to="1" from="#arrayLen(aObj)#" index="ii" step="-1">
		<!--- Checking if it's a number --->
		<cfif isNumeric(aObj[ii])>
			<cfset arrayDeleteAt(arguments.aObj, ii) />
		</cfif>
	</cfloop>
	
	<cfreturn aObj />
</cffunction>