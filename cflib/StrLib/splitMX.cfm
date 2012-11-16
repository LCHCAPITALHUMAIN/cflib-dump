<cffunction name="splitMX" output="false" access="public" returntype="array" hint="I use the java.lang.String object split method to convert a list to an array">
	<cfargument name="list" type="string" required="true" displayname="list" hint="I am the list to be converted to an array" />
	<cfargument name="delimiters" type="string" required="true" displayname="delimiters" hint="I contain the delimiters separating the list items" />
	<cfset var results = arrayNew(1) />
	<!--- if there are no delimiters return a single item array otherwise use .split() to convert the list to an array --->
	<cfif len(arguments.delimiters)>
		<cfset results = arguments.list.split(arguments.delimiters) />
	<cfelse>
		<cfset arrayAppend(results,arguments.list) />
	</cfif>
	<cfreturn results />
</cffunction>