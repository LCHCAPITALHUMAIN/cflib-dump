<cffunction name="GetXmlAttribute" output="false" returntype="any">
	<cfargument name="node" type="any" required="yes">
	<cfargument name="attribute" type="string" required="Yes">
	<cfargument name="default" type="string" default="" required="false">
	<cfset var myResult="#arguments.default#">
	<cfif StructKeyExists(node.XmlAttributes, attribute)>
		<cfset myResult=node.XmlAttributes["#attribute#"]>
	</cfif>
	<cfreturn myResult>
</cffunction>