<cffunction name="execute" output="false" returnType="string">
	<cfargument name="name" type="string" required="true">
	<cfargument name="args" type="any" required="false" default="">
	<cfargument name="timeout" type="string" required="false" default="0">
	<cfargument name="outputfile" type="string" required="false" default="">

	<cfset var result = "">
	
	<cfsavecontent variable="result">
		<cfif len(outputFile)>
			<cfexecute name="#name#" arguments="#args#" timeout="#timeout#" outputfile="#outputfile#"/>
		<cfelse>
			<cfexecute name="#name#" arguments="#args#" timeout="#timeout#"/>
		</cfif>
	</cfsavecontent>
	<cfreturn result>
</cffunction>