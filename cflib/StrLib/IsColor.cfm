<cffunction name="IsColor" access="public" output="false" returntype="boolean">
    <cfargument name="color" type="string" required="true" />
        
    <cfset var local = structNew() />
    <cfset local.colorNames = "aqua,black,blue,fuchsia,gray,green,lime,maroon,navy,olive,purple,red,silver,teal,white,yellow" />
    <cfset local.regex = "^(##([\dA-F]{3}|[\dA-F]{6})|([\dA-F]{3}|[\dA-F]{6}))$" />
    <cfset local.returnValue = false />
        
    <cfif listFind(local.colorNames, arguments.color) OR arrayLen(REMatchNoCase(local.regex, arguments.color)) gt 0>
        <cfset local.returnValue = true />
    </cfif>
    
    <cfreturn local.returnValue />
</cffunction>