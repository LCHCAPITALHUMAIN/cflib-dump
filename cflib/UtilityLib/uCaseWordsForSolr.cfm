<cffunction name="uCaseWordsForSolr" access="public" output="false" returntype="Any" >
	<cfargument name="string" type="string" default="" required="true" hint="String to run against" />
	<cfargument name="listOfWords" type="string" default="AND,OR,NOT,TO" required="false" hint="Comma-delim list of words to uCase" />

	<cfset var sLocal = StructNew() />

	<cfset sLocal.newString = lcase(arguments.string) /> <!--- lcase by default. mixed-case treated as case-sensitive by Solr --->
	<cfset sLocal.i = "" />

	<cfloop list="#arguments.listOfWords#" index="sLocal.i">

		<cfset sLocal.newString = reReplaceNoCase(sLocal.newString, "([^a-z])(#sLocal.i#)([^a-z])", "\1#ucase(sLocal.i)#\3", "all")/>

	</cfloop>

	<cfreturn sLocal.newString />
</cffunction>