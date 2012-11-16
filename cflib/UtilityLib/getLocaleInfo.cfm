<cffunction name="getLocaleInfo" description="gets the Locale" output="false">
    <cfset var myLocale = structNew() />
    <cfset var currentLocale    = CreateObject("java", "java.util.Locale").getDefault() />
    <cfset myLocale.short.country        = currentLocale.getCountry() />
    <cfset myLocale.short.language    = currentLocale.getLanguage() />
    <cfset myLocale.short                        = myLocale.short.language &'_' &myLocale.short.country />
    <cfset myLocale.long                        = getLocale() />
    <cfset myLocale.full                        = getLocaleDisplayName() />

    <cfreturn myLocale />
</cffunction>