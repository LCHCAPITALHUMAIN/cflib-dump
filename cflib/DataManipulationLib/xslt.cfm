<cffunction name="xslt" returntype="string" output="No">
	<cfargument name="xmlSource" type="string" required="yes">
	<cfargument name="xslSource" type="string" required="yes">
	<cfargument name="stParameters" type="struct" default="#StructNew()#" required="No">
	
	<cfscript>
		var source = "";		var transformer = "";	var aParamKeys = "";	var pKey = "";
		var xmlReader = "";		var xslReader = "";		var pLen = 0;
		var xmlWriter = "";		var xmlResult = "";		var pCounter = 0;
		var tFactory = createObject("java", "javax.xml.transform.TransformerFactory").newInstance();
		
		//if xml use the StringReader - otherwise, just assume it is a file source.
		if(Find("<", arguments.xslSource) neq 0)
		{
			xslReader = createObject("java", "java.io.StringReader").init(arguments.xslSource);
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init(xslReader);
		}
		else
		{
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init("file:///#arguments.xslSource#");
		}
		
		transformer = tFactory.newTransformer(source);
		
		//if xml use the StringReader - otherwise, just assume it is a file source.
		if(Find("<", arguments.xmlSource) neq 0)
		{
			xmlReader = createObject("java", "java.io.StringReader").init(arguments.xmlSource);
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init(xmlReader);
		}
		else
		{
			source = createObject("java", "javax.xml.transform.stream.StreamSource").init("file:///#arguments.xmlSource#");
		}
		
		//use a StringWriter to allow us to grab the String out after.
		xmlWriter = createObject("java", "java.io.StringWriter").init();
		
		xmlResult = createObject("java", "javax.xml.transform.stream.StreamResult").init(xmlWriter);		
		
		if(StructCount(arguments.stParameters) gt 0)
		{
			aParamKeys = structKeyArray(arguments.stParameters);
			pLen = ArrayLen(aParamKeys);
			for(pCounter = 1; pCounter LTE pLen; pCounter = pCounter + 1)
			{
				//set params
				pKey = aParamKeys[pCounter];
				transformer.setParameter(pKey, arguments.stParameters[pKey]);			
			}	
		}
		
		transformer.transform(source, xmlResult);
		
		return xmlWriter.toString();
	</cfscript>
</cffunction>