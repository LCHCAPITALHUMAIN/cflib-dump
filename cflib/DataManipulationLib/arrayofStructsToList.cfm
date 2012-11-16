<cffunction name="arrayofStuctsToList" output="true" access="public" returntype="any" hint="i return a list of values from a particular key in an array of structs. if the key doesnt exist in an element it is ignored">
	<cfargument name="arry" type="array" required="yes" hint="the array to search" />
	<cfargument name="key" type="string" required="yes" hint="the key name in the structure from which to pull a list value" />
	<cfargument name="delim" type="string" required="no" default="," hint="the list delim character(s)" />
	<cfargument name="dedup" type="boolean" required="no" default="false" hint="if you want me to de-dup the list, lemme know. dont expect any order coming back." />
	<cfargument name="returnas" type="string" required="no" default="list" hint="enum: list,array; you tell me what format you want your 'list' back" />
	<!--- KEEP IN MIND THAT WITH de-dup=true or in the event any key values are missing from struct elements, the order of the returned value may not correspond to the order of the original array --->		
	<cfset var local = {} />
	<cfset local.result = "" />
	<cfset local.str = "" />    
	<cfset local.dedup = {} />

	<cfset local.returnval = "" />
	<cfloop array="#arry#" index="local.i">
				<cftry>
					<cfif arguments.dedup>
							<cfset local.dedup[local.i[key]] = "" />
	      <cfelse>
	        <cfset local.str = listAppend(local.str,local.i[key],delim) />
	      </cfif>
	    	<cfcatch><!--- FAIL SILENTLY IF KEY DOESNT EXIST ---></cfcatch>
	    </cftry>
	</cfloop>
		<cfif arguments.dedup>
			<cfset local.str = structKeyList(local.dedup,delim) />			
	</cfif>
	<cfif arguments.returnas EQ "array">
		<cfset local.result = listToArray(local.str,delim) />
	<cfelse>
		<cfset local.result = local.str />
	</cfif>

	<cfreturn local.result />
</cffunction>