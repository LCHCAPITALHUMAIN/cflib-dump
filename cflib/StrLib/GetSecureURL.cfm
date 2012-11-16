<cffunction name="GetSecureURL" output="false" returntype="string">
	<cfargument name="domain" typ="string" required="false" default="#cgi.server_name#" />
	<cfargument name="path" typ="string" required="false" default="#cgi.script_name#" />
	<cfargument name="queryString" typ="string" required="false" default="#cgi.query_string#" />
	<cfargument name="port" typ="string" required="false" default="#cgi.server_port#" />
	
	<cfset var HTTPSURL = "https://" & arguments.domain />
	
	<cfif IsNumeric(arguments.port)>
		<cfset HTTPSURL = HTTPSURL & ":" & arguments.port />
	</cfif>
	
	<cfset HTTPSURL = HTTPSURL & arguments.path />
	
	<cfif Len(arguments.queryString)>
		<cfset HTTPSURL = HTTPSURL & "?" & arguments.queryString />
	</cfif>
	
	<cfreturn HTTPSURL />
</cffunction>