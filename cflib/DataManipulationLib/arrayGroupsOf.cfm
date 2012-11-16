<cffunction name="arrayGroupsOf" access="public" output="false" returntype="array">
	<cfargument name="arrObj" type="array" required="true" hint="An array object that will be split up in groups">
	<cfargument name="intGroup" type="numeric" required="true" hint="Number of items on each group">
	<cfargument name="padding" type="string" required="false" default=" " hint="What should it be filled with in case there's empty slots">
	
	<cfset var resArray = createObject("java", "java.util.ArrayList").Init(arguments.arrObj) />
	<cfset var arrGroup = arrayNew(1) />
	<cfset var arrObjGroup = arrayNew(1) />
	<cfset var arrObjSize = resArray.size()>
	<cfset var subStart = 0>
	<cfset var subEnd = arguments.intGroup>
	<cfset var ii = "">
	<cfset var difference = "">
	<cfset var jj = "">
	
	<cfset arrGroupSize = ceiling(arrObjSize / arguments.intGroup)>
	<cfset arrArrayGroupSize = arrGroupSize * arguments.intGroup>
	
	<cfif arrArrayGroupSize GT arrObjSize>
		<cfset difference = arrArrayGroupSize - arrObjSize>
		<cfloop from="1" to="#difference#" index="ii">
			<cfset resArray.add(arguments.padding) />
		</cfloop>
	</cfif>
	
	<cfloop from="1" to="#arrGroupSize#" index="jj">			
		<cfset arrGroup = resArray.subList(subStart, subEnd)>		
		<cfset arrayAppend(arrObjGroup, arrGroup)>
		
		<cfset subStart = subStart + arguments.intGroup>
		<cfset subEnd = subEnd  + arguments.intGroup>
		<cfset arrGroup = arrayNew(1) />
	</cfloop>
	
	<cfreturn arrObjGroup>

</cffunction>