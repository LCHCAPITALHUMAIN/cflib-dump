<cffunction name="flattenStruct" access="public" output="false" returntype="struct">
	<cfargument name="original" type="struct" required="true"><!--- struct to flatten --->
    <cfargument name="delimiter" required="false" type="string" default="." />
	<cfargument name="flattened" type="struct" default="#StructNew()#" required="false"><!--- result struct, returned at the end --->
	<cfargument name="prefix_string" type="string" default="" required="false"><!--- used in the processing, stores the preceding struct names in the current branch, ends in a delimeter --->
	
	<!--- get this level's elements --->
	<cfset var names = StructKeyArray(original)>
	<cfset var name = "">
	
	<cfloop array="#names#" index="name">
		<!--- add name --->
		<cfif IsStruct(original[name])>
			<cfset flattened = flattenStruct(original[name], delimiter, flattened, prefix_string & name & delimiter)>
		<cfelse>
			<cfset flattened[prefix_string & name] = original[name]>
		</cfif>
	</cfloop>
	
	<cfreturn flattened>
</cffunction>