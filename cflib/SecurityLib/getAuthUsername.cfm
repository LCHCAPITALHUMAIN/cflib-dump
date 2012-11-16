<cffunction name="getAuthUsername" returntype="string" output="false">
	
	<cfset var username = "" />
	
	<cfif len(trim(cgi.auth_user))>
	
		<cfset username = trim(cgi.auth_user) />
	
	<cfelseif len(trim(cgi.remote_user))>
	
		<cfset username = trim(cgi.remote_user) />
	
	<cfelse>
	
		<!--- no string to work with --->
		<cfreturn trim(username) />
	
	</cfif>
	
	<!--- check username@some.domain --->
	<cfif find("@",username)>
	
		<cfreturn listFirst(username,"@") />
	
	<!--- check domain\username --->
	<cfelseif find("\",username)>
	
		<cfreturn listLast(username,"\") />
	
	<!--- no domain --->
	<cfelse>
	
		<cfreturn trim(username) />
	
	</cfif>
	
</cffunction>