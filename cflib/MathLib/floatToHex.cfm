<cffunction name="floatToHex" returntype="string" access="public" output="false"
        hint="Converts a java float value to a 32-bit hexadecimal representation (IEEE 754 floating-point number)">
    <cfargument name="floatValue" type="numeric" required="true" />
    <cfargument name="usePadding" type="boolean" default="true" />

    <cfset var floatRef = javacast("float", 0) />
    <cfset var intValue = floatRef.floatToIntBits( javacast("float", arguments.floatValue) ) />
    <cfset var result   = formatBaseN(intValue, 16) />

    <!--- pad hex value with leading zeroes --->
    <cfif arguments.usePadding>
        <cfset result =  right("00000000"& result, 8) />
    </cfif>
    
    <cfreturn result />
</cffunction>