<cffunction name="xmlExtractList" returnType="string" output="no">
   <cfargument name="inString" type="any">
   <cfargument name="tagName" type="string">
   <cfargument name="delim" default=",">
   
   <cfset var inXML = "">
   
   <cfset var elementsArray = "">
   <cfset var valuesArray = arrayNew(1)>
   <cfset var i=1>
   <cfset var j=1>
   <cfset var ret = "">
   
   <cfif isXmlDoc(arguments.inString)>
      <cfset inXML = arguments.inString>
   <cfelse>
      <cfset inXML  = xmlParse(arguments.inString)>
   </cfif>
   
   <cfset elementsArray = xmlSearch(inXML, "//" & arguments.tagName)>

   
   <cfloop index="j" from="1" to="#arrayLen(elementsArray)#">
      <cfif elementsArray[j].xmlText neq "">
         <cfset valuesArray[i] = elementsArray[j].xmlText>
         <cfset i=i+1>
      </cfif>
   </cfloop>
   
   <cfset ret = arrayToList(valuesArray, arguments.delim)>
   <cfreturn ret>
</cffunction>