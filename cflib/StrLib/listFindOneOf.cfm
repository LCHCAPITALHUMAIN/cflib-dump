<cffunction name="listFindOneOf" output="false" returntype="boolean">
	<cfargument name="list" type="string" required="yes"/>
	<cfargument name="values" type="string" required="yes"/>
	<cfargument name="delimiters" type="string" required="no" default=","/>
	<cfset var value = 0/>
	<cfloop list="#arguments.values#" index="value" delimiters="#arguments.delimiters#">
		<cfif ListFind(arguments.list, value, arguments.delimiters)>
			<cfreturn true />
		</cfif>
	</cfloop>
	<cfreturn false />
</cffunction>