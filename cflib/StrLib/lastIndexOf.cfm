<cffunction name="lastIndexOf" returntype="numeric" output="no">
	<cfargument name="targetString" type="string" required="yes">
	<cfargument name="lastChar" type="string" required="yes">
  
	<cfif find(lastChar, arguments.targetString)>
		<cfreturn len(arguments.targetString) - find(lastChar,reverse(arguments.targetString))>  
	<cfelse>
		<cfreturn 0>
	</cfif>
	
</cffunction>