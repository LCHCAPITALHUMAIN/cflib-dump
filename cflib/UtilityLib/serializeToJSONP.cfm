<cffunction name="serializeToJSONP" displayname="Serialize to JSONp" hint="Serializes supplied data in JSONp format" output="false" returntype="any">
	<cfargument name="data" displayName="data" type="any" hint="The data to serialize" required="true" />
	<cfargument name="callback" displayName="callback" type="string" hint="the jsonp callback to use" required="true" />
	
	<cfscript>
	var local = {};
	local.json = serializeJSON(arguments.data);
	local.jsonp = arguments.callback & '(' & local.json & ')';
	</cfscript>
	
	<cfreturn local.jsonp />
</cffunction>