<cffunction name="getQueryMetadata" access="public" returntype="array" hint="Replicates the CF7 getMetadata(query) functionality for MX6.1+">
		<cfargument name="query" type="query" required="true"/>
		<cfset var metadata = ArrayNew(1)>
		<cfset var columns = ArrayNew(1)>
		<cfset var col = 1>
		<cfset var map = StructNew()>
		<cfif listFirst(server.ColdFusion.ProductVersion) GT 6>
			<cfreturn getMetadata(arguments.query)>
		</cfif>
		
		<cfset columns = arguments.query.getMetaData().getColumnLabels() />
		
		<cfloop from="1" to="#ArrayLen(columns)#" index="col">
			<cfset map = StructNew()>
			<cfset map.name = columns[col]>
			<cfset map.IsCaseSensitive = arguments.query.getMetaData().isCaseSensitive( javacast("int",col))>
			<cfset map.TypeName = arguments.query.getMetadata().getColumnTypeName(javacast("int",col))>
			<cfset ArrayAppend(metadata,map)>
		</cfloop>
		
		<cfreturn metadata>
	</cffunction>