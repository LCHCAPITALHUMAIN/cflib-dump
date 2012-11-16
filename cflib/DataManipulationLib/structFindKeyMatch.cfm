<cffunction name="structFindKeyMatch" returntype="array" output="false">
	<cfargument name="scope" type="struct" required="true">
	<cfargument name="keyword" type="string" required="true">
	
	<cfset var key = "">
	<cfset var i = "">
	<cfset var result = arrayNew(1)>    
	<cfset var tempstruct = structNew() />
	
	<cfloop index="i" list="#StructKeyList(arguments.scope)#" delimiters=",">  
		<cfif findNoCase(arguments.keyword,i)>
			<cfset tempstruct[i] = arguments.scope[i]>
			<cfset arrayAppend(result, duplicate(tempstruct)) />	
		</cfif>
	
		<cfset structClear(tempstruct) />
	</cfloop>
	
	<cfreturn result>
        
</cffunction>