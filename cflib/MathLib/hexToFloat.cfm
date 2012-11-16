<cffunction name="hexToFloat" returntype="numeric" access="public" output="false"
        hint="Converts a 32-bit hexadecimal representation (IEEE 754 floating-point number) to a java Float">
    <cfargument name="hex" type="string" required="true" />

    <cfset var longValue     = "">

    <cfif reFindNoCase("[^[:xdigit:]]", arguments.hex)>
        <cfthrow message="Argument.hex does not contain a recognized hexidecimal string" type="InvalidArgument" />
    </cfif>
    
    <cfset longValue = javacast("long", 0).parseLong( arguments.hex, 16 ) />
    <cfreturn javacast("float", 0).intBitsToFloat( longValue.intValue() ) />
</cffunction>