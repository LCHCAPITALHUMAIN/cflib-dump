<cffunction name="capFirstList" returntype="string" output="false">
    <cfargument name="str" type="string" required="true" />
    <cfargument name="delimiter" default="," required="false">

    <cfset var newstr = "" />
    <cfset var word = "" />
    <cfset var separator = "" />

    <cfloop index="word" list="#arguments.str#" delimiters="#arguments.delimiter#">
        <cfset newstr = newstr & separator & UCase(left(word,1)) />
        <cfif len(word) gt 1>
            <cfset newstr = newstr & right(word,len(word)-1) />
        </cfif>
        <cfset separator = arguments.delimiter />
    </cfloop>

    <cfreturn newstr />
</cffunction>