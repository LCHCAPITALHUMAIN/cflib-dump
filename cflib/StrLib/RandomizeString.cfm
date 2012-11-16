<cffunction name="RandomizeString" returntype="string" output="false" access="public" 
			hint="pass me a string and desired length and i'll randomize it for you.">
	<cfargument name="theString" type="string" required="true" default="0123456789ABCDEF" />
	<cfargument name="theLength" type="numeric" required="true" default="32" />
	<cfset var randomizedString = "" />
	<cfset var theIndex = "" />

	<cfloop index="theIndex" from="1" to="#val(arguments.theLength)#" step="1">
		<cfset randomizedString = randomizedString & mid(arguments.theString, rand()*len(arguments.theString)+1, 1) />
	</cfloop>
	<cfreturn randomizedString />	
</cffunction>