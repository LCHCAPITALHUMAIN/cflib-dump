<cffunction name="findList" returnType="numeric" output="false">
	<cfargument name="valuelist" required="Yes" type="string">
	<cfargument name="stringtocompare" required="Yes" type="string">
	<cfargument name="start" required="No" type="numeric" default="0">
	<cfargument name="delim" required="no" type="string" default=",">
	<cfset var test=arrayNew(1)>
	<cfset var x = "">


	<cfloop list="#arguments.valuelist#" index="x" delimiters="#arguments.delim#">
		<cfset ArrayAppend(test,findnocase(x,arguments.stringtocompare, arguments.start)) />
	</cfloop>

	<cfreturn arrayMin(test) />
</cffunction>