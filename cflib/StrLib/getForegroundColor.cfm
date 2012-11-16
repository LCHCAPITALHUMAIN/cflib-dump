<cffunction name="getForegroundColor" output="false" access="private" returntype="string" hint="gets the appropriate FG color.">
    <cfargument name="backgroundHEX" required="true" />
    <cfscript>
        // clean up the incoming color, strip the pound sign.
        var cleanHex = Replace(arguments.backgroundHEX,"##","");
        // break the hex up and convert to RGB
        var R = InputBaseN(Mid(cleanHex, 1, 2),16);
        var G = InputBaseN(Mid(cleanHex, 3, 2),16);        
        var B = InputBaseN(Mid(cleanHex, 5, 2),16);
        
        //determine the backgrounds 'brightness' (from a W3C Accessibility draft)
        var brightness = ((R * 299) + (G * 587) + (B * 114)) / 1000;
        //determine if it is a light or dark background and set the return to either black or white.
        if(255 - brightness lt 128) {
            return "##000000";
        } else {
            return "##ffffff";
        }
    </cfscript>    
</cffunction>