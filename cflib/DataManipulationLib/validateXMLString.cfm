<cffunction name="validateXMLString" output="false" returntype="boolean" hint="Validate a formatted XML string against a DTD">
	<cfargument name="xmlString" type="string" required="true" hint="XML document as string">
	<cfargument name="throwerror" type="boolean" required="false" default="false" hint="Throw an exception if the document isn't valid">
	<cfargument name="baseUrl" type="string" required="false" default="" hint="Needed to resolve url found in the DOCTYPE declaration and external entity references. Format must be: http://www.mydomain.com/xmldirectoty/">
	<cfset var isValid=true>
	<cfset var jStringReader="">
	<cfset var xmlInputSource="">
	<cfset var saxFactory="">
	<cfset var xmlReader="">
	<cfset var eHandler="">
	<cftry>
		<cfscript>
		//Use Java string reader to read the CFML variable
		jStringReader = CreateObject("java","java.io.StringReader").init(arguments.xmlString);
		//Turn the string into a SAX input source 
		xmlInputSource = CreateObject("java","org.xml.sax.InputSource").init(jStringReader);
		//Call the SAX parser factory
		saxFactory = CreateObject("java","javax.xml.parsers.SAXParserFactory").newInstance();
		//Creates a SAX parser and get the XML Reader
		xmlReader = saxFactory.newSAXParser().getXMLReader();
		//Turn on validation
		xmlReader.setFeature("http://xml.org/sax/features/validation",true);
		//Add a system id if required
		if(IsDefined("arguments.baseUrl")){
			xmlInputSource.setSystemId(arguments.baseUrl);
		}
		//Create an error handler
		eHandler = CreateObject("java","org.apache.xml.utils.DefaultErrorHandler").init();
		//Assign the error handler
		xmlReader.setErrorHandler(eHandler);
		</cfscript>
		<!--- Throw an exception in case any Java initialization failed --->
		<cfcatch type="Object">
			<cfthrow message="validateXMLString: failed to initialize Java objects" type="validateXMLString">
		</cfcatch>
	</cftry>
	<cftry>
		<cfset xmlReader.parse(xmlInputSource)>
		<!--- Catch SAX's exception and set the flag --->
	<cfcatch type="org.xml.sax.SAXParseException">
		<!--- The SAX parser failed to validate the document --->
		<cfset isValid=false>
		<cfif arguments.throwerror>
			<!--- Throw an exception with the error message if required	--->
			<cfthrow message="validateXMLString: Failed to validate the document, #cfcatch.Message#" type="validateXMLString">
		</cfif>
	</cfcatch>
	</cftry>
	<!--- Return the boolean --->
	<cfreturn isValid>
</cffunction>