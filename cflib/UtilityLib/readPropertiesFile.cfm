<cffunction name="readPropertiesFile" output="true" returnType="Struct" hint="Read a properties file and return a structure">
    <cfargument name="filePath" type="string" required="true" hint="path to properties file">
	<cfargument name="varScope" type="Struct" required="false" hint="optional variable scope for value replacement">

    <cfset VAR stProps = StructNew()>
	<cfset VAR sProps = "">
	<cfset VAR i=0>
	<cfset VAR prop = "">
	<cfset VAR value = "">
	<cfset VAR line = "">
	<cfset VAR aMatch = ArrayNew(1)>

	<cfif NOT FileExists(arguments.filePath)>
		<cfreturn stProps>
	</cfif>
	<!--- read props file --->
	<cffile action="read" file="#arguments.filePath#" variable="sProps">

	<!--- remove any whitespace at top and tail --->
	<cfset sProps = trim(sProps)>

	<!--- remove comments and blank lines --->
	<cfset sProps = ReReplace(sProps,"(?m)\##.*?$", "","all")>
	<cfset sProps = ReReplace(sProps,"[#Chr(13)##Chr(10)#]{2,}", "#Chr(13)##Chr(10)#","all")>

	<!--- loop over each line, ignore comments (#...) and insert keys/values into return struct --->
	<cfloop list="#sProps#" index="line" delimiters="#CHR(10)##CHR(13)#">
		<cfset line = trim(line)>
		<cfif LEN(line) AND line CONTAINS "=">
			<cfset prop = trim(ListFirst(line,"="))>
			<cfset value = trim(ListRest(line,"="))>
			<!--- parse value for other keys like ${foo} and replace from previously created struct keys --->
			<cfset aMatch = REMatch("\${.*?}",value)>
			<cfloop from="1" to="#ArrayLen(aMatch)#" index="i">
				<cfset aMatch[i] = ReReplace(aMatch[i],"\${(.*)?}", "\1")>
				<cfif StructKeyExists(stProps, aMatch[i])>
					<cfset value = ReplaceNoCase(value, "${#aMatch[i]#}", stProps[aMatch[i]], "all")>
				<cfelseif IsDefined("arguments.varScope")
							AND ListFirst(aMatch[i],".") eq "vars"
							AND StructKeyExists(arguments.varScope, ListRest(aMatch[i], "."))>
					<cfset value = ReplaceNoCase(value, "${#aMatch[i]#}", arguments.varScope[ListRest(aMatch[i], ".")], "all")>
				</cfif>
			</cfloop>
			<cfset stProps[prop] = value>
		</cfif>
	</cfloop>

	<cfreturn stProps>
</cffunction>