<cffunction name="xsdValidate" returnType="boolean" output="false">
  <cfargument name="xmlPath" type="string">
  <cfargument name="noNamespaceXsdUri" type="string">
  <cfargument name="namespaceXsdUri" type="string">
  <cfargument name="parseError" type="struct">
  
  <cfscript>
    var parser = createObject("java","org.apache.xerces.parsers.SAXParser");
    
    var err = structNew();
    var k = "";
    var success = true;
    
    var eHandler = createObject(
                     "java",
                     "org.apache.xml.utils.DefaultErrorHandler");
    
    var apFeat = "http://apache.org/xml/features/";
    var apProp = "http://apache.org/xml/properties/";
    
    eHandler.init();
    
    if (structKeyExists(arguments, "parseError")) {
       err = arguments.parseError;
     }
    
    
    try {
       parser.setErrorHandler(eHandler);
       
       parser.setFeature(
          "http://xml.org/sax/features/validation", 
          true);
          
       parser.setFeature(
          apFeat & "validation/schema", 
          true);
          
       parser.setFeature(
          apFeat & "validation/schema-full-checking", 
          true);
       
       if (structKeyExists(arguments, "noNamespaceXsdUri") and 
           arguments.noNamespaceXsdUri neq "") {
          
          parser.setProperty(
            apProp & "schema/external-noNamespaceSchemaLocation",
            arguments.noNamespaceXsdUri
          
          );
        }
       
       if (structKeyExists(arguments, "namespaceXsdUri") and 
           arguments.namespaceXsdUri neq "") {
          
          parser.setProperty(
            apProp & "schema/external-schemaLocation",
            arguments.namespaceXsdUri
          );
        }
       
       
       parser.parse(arguments.xmlPath);
     } catch (Any ex) {
       structAppend(err, ex, true);
       success = false;
     }
  </cfscript>

  <cfreturn success>
  
</cffunction>