<cffunction name="reFindAll" output="yes" returntype="array">
	<cfargument name="regExpression" type="string" required="yes">
    <cfargument name="string" type="string" required="yes">
    <cfargument name="start" type="numeric" required="no" default="1">
    <cfargument name="caseSensitive" type="boolean" required="no" default="false">
    
    <cfset var result = arrayNew(1)>
    <cfset var matches = ''>
    
    <cfif caseSensitive>
    	<cfset matches = refind(regExpression,string,start,true)>
    <cfelse>
    	<cfset matches = refindnocase(regExpression,string,start,true)>
    </cfif>
    
    <cfloop condition="#matches.len[1]# neq 0">
    	
        <cfset result[arraylen(result) + 1] = matches> 
        <cfset start = matches.pos[1] + matches.len[1]>
        
        <cfif caseSensitive>
			<cfset matches = refind(regExpression,string,start,true)>
        <cfelse>
            <cfset matches = refindnocase(regExpression,string,start,true)>
        </cfif>
        
    </cfloop>
    
    <cfreturn result>
</cffunction>