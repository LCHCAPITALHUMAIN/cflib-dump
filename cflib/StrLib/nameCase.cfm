<cffunction name="nameCase" access="public" returntype="string" output="false">
    <cfargument name="name" type="string" required="true" />
    <cfset arguments.name = ucase(arguments.name)>
    <cfreturn reReplace(arguments.name,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
</cffunction>