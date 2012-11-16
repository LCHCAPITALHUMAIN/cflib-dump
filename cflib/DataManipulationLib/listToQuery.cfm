<cffunction name="listToQuery" access="public" returntype="query" output="false" 
	hint="Converts a list to a single-column query.">
    <cfargument name="list" type="string" required="yes" hint="List to convert.">
    <cfargument name="delimiters" type="string" required="no" default="," hint="Things that separate list elements.">
    <cfargument name="column_name" type="string" required="no" default="column" hint="Name to give query column.">
    
    <cfset var query = queryNew(arguments.column_name)>
    <cfset var index = ''>
    
    <cfloop list="#arguments.list#" index="index" delimiters="#arguments.delimiters#">
        <cfset queryAddRow(query)>
        <cfset querySetCell(query,arguments.column_name,index)>
    </cfloop>
    
    <cfreturn query>
</cffunction>