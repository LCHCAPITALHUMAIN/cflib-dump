<cffunction name="HTTPHeader" output="false" returnType="void">
	<cfargument name="name" type="string" default="">
	<cfargument name="value" type="string" default="">
	<cfargument name="statuscode" type="string" default="">
	<cfargument name="statustext" type="string" default="">
	<cfif Len(name) and Len(value)>
		<cfheader name="#name#" value="#value#">
	<cfelseif Len(statuscode) and Len(statustext)>
		<cfheader statuscode="#statuscode#" statustext="#statustext#">
	</cfif>
</cffunction>