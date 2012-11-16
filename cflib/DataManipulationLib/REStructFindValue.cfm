<cffunction name="REStructFindValue" returntype="array" output="false">
	<cfargument name="top" type="any" required="true">
	<cfargument name="reg_expression" type="string" required="true">
	<cfargument name="scope" type="string" required="false">
	<cfargument name="owner" type="any" required="false">
	<cfargument name="path" type="string" required="false">
	<cfargument name="results" type="any" required="false">
	
	<cfset var key = "">
	<cfset var i = "">
	<cfset var result="">	
	
	<!--- set default values --->
	<cfif not StructKeyExists(arguments,"scope")>
		<cfset arguments.scope = "one">
	</cfif>
	
	<cfif not StructKeyExists(arguments,"owner")>
		<cfset arguments.owner = arguments.top>
	</cfif>
	
	<cfif not StructKeyExists(arguments,"path")>
		<cfset arguments.path = "">
	</cfif>
	
	<cfif not StructKeyExists(arguments,"results")>
		<cfset arguments.results = CreateObject("java","java.util.ArrayList").init()>
	</cfif>
	
	<!--- exit if scope is "one" and we have a result --->
	<cfif CompareNoCase(arguments.scope,"one") eq 0
		and ArrayLen(arguments.results) eq 1>
				
		<cfreturn arguments.results>
		
	</cfif>
		
	<!--- recurse or do test depending on type --->
	<cfif IsStruct(arguments.top)>	
	
		<cfloop collection="#arguments.top#" item="key">	
			<cfset REStructFindValue(arguments.top[key],arguments.reg_expression,arguments.scope,arguments.top,"#arguments.path#.#key#",arguments.results)>
		</cfloop>		
		
	<cfelseif IsArray(arguments.top)>
	
		<cfloop from="1" to="#ArrayLen(arguments.top)#" index="i">	
			<cfset REStructFindValue(arguments.top[i],arguments.reg_expression,arguments.scope,arguments.top,"#path#[#i#]",arguments.results)>
		</cfloop>
		
	<cfelseif IsSimpleValue(arguments.top)
		and IsStruct(arguments.owner)
		and REFind(arguments.reg_expression,arguments.top)>			
			
		<cfset result = StructNew()>
		<cfset result["key"] = ListLast(arguments.path,".")>
		<cfset result["owner"] = arguments.owner>
		<cfset result["path"] = arguments.path>		
		<cfset ArrayAppend(arguments.results,result)>
		
	</cfif>
		
	<cfreturn arguments.results>
			
</cffunction>