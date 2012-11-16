<cffunction name="flattenXmlToStruct" access="public" output="false" returntype="struct">
    <cfargument name="xmlObject" required="true" type="xml" />
    <cfargument name="delimiter" required="false" type="string" default="." />
    <cfargument name="prefix"      required="false" type="string" default="" />
    <cfargument name="stResult" required="false" type="struct" />
    <cfargument name="addPrefix" required="false" type="boolean" default="true" />
    
    <cfset var sKey = '' />
	<cfset var currentKey = "">
	<cfset var arrIndx = "">
	
	<cfif NOT isDefined("arguments.stResult")>
	  <cfset arguments.stResult = structNew()>
	</cfif>
    
    <cfloop from="1" to="#ArrayLen(arguments.xmlObject.XmlChildren)#" index="arrIndx">
	   
	   <cfset sKey = arguments.xmlObject.XmlChildren[arrIndx].XmlName>
	   
	   <cfif ArrayLen(arguments.xmlObject.XmlChildren[arrIndx].XmlChildren) EQ 0>
            <cfif arguments.addPrefix and len(arguments.prefix)>
                <cfset arguments.stResult["#arguments.prefix##arguments.delimiter##sKey#"] = arguments.xmlObject.XmlChildren[arrIndx].XmlText />
            <cfelse>
                <cfset arguments.stResult[sKey] = arguments.xmlObject.XmlChildren[arrIndx].XmlText />
            </cfif>
	     
	   <cfelse>	<!--- Node has more children... --->

			<cfif arguments.prefix EQ "">
			  <cfset currentKey = sKey>
			<cfelse>
			  <cfset currentKey = "#arguments.prefix##arguments.delimiter##sKey#">
			</cfif>
            <cfset flattenXmlToStruct(arguments.xmlObject.XmlChildren[arrIndx], arguments.delimiter, currentKey, arguments.stResult) />    
	   
	   </cfif>
    </cfloop>
	
    <cfreturn arguments.stResult />
</cffunction>