<cffunction name="humanize" access="public" returntype="string" output="false">
    <cfargument name="text" type="string" required="true" />
    <cfset arguments.text= ucase(arguments.text)>
    <cfset arguments.text= replace(arguments.text,"_"," ","all")>
    <cfreturn reReplace(arguments.text,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
</cffunction>