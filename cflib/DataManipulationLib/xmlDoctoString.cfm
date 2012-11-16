<cffunction name="xmlDoctoString" output="no" returntype="string" displayname="xmlDoctoString" hint="Extract the root element inside an XML Doc and return it as a string">
	<cfargument name="xmlDoc" type="string" required="true" displayname="xmlDoc" hint="An XML Doc or a well formed XML string">
	<cfset var xmlToParse="">
	<!--- Check to see if the argument is already an XMLDoc --->
	<cfif IsXmlDoc(arguments.xmlDoc)>
		<cfset xmlToParse=arguments.xmlDoc>
	<cfelse>
		<!--- We need a parsed XML doc, not just a simple string --->
		<cftry>
			<cfset xmlToParse=XmlParse(arguments.xmlDoc, "yes")>
			<!--- Failed parsing, the string culd be not a well formed XML, throw an exception --->
			<cfcatch type="Any">
				<cfthrow message="xmlDoctoString: failed to parse argument.xmlDoc" type="xmlDoctoString">
			</cfcatch>
		</cftry>
	</cfif>
	<cfreturn xmlToParse.getDocumentElement().toString()>
</cffunction>