<cffunction name="arraySlice2" returntype="array" output="false">
	<cfargument name="thisArray" required="true" type="array" />
	<cfargument name="start" required="false" type="numeric" default="1" />
	<cfargument name="length" required="false" type="numeric" default="0" />
	<cfset var resArray = createObject("java", "java.util.ArrayList").Init(arguments.thisArray) />
	<cfset var thisArrayLen = ArrayLen(arguments.thisArray) />
	<cfset var finish = 0 />
	<cfif (arguments.length EQ 0) OR ((arguments.start + arguments.length - 1) GT thisArrayLen)>
		<cfset arguments.length = thisArrayLen - arguments.start + 1 />
	</cfif>
	<cfset finish = arguments.start + arguments.length - 1 />

	<cfreturn resArray.subList(JavaCast("int", arguments.start - 1), JavaCast("int", finish)) />
</cffunction>