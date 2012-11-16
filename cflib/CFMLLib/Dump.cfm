<cffunction name="dump" returnType="string">
	<cfargument name="var" type="any" required="true">
	<cfargument name="expand" type="boolean" required="false" default="true">
	<cfargument name="label" type="string" required="false" default="">
	<cfargument name="top" type="numeric" required="false">
	
	<!--- var --->
    <cfset var type = "">
    <cfset var tempArray = arrayNew(1)>
    <cfset var temp_x = 1>
    <cfset var tempStruct = structNew()>
	<cfset var orderedKeys = "">
	<cfset var tempQuery = queryNew("")>
	<cfset var col = "">
	
	<!--- do filtering if top ---->
	<cfif isDefined("top")>
	
		<cfif isArray(var)>
			<cfset type = "array">
		</cfif>
		<cfif isStruct(var)>
			<cfset type="struct">
		</cfif>
		<cfif isQuery(var)>
			<cfset type="query">
		</cfif>
		
		<cfswitch expression="#type#">
		
			<cfcase value="array">
				<cfif arrayLen(var) gt top>
					<cfloop index="temp_x" from=1 to="#Min(arrayLen(var),top)#">
						<cfset tempArray[temp_x] = var[temp_x]>
					</cfloop>
					<cfset var = tempArray>
				</cfif>
			</cfcase>
			
			<cfcase value="struct">
				<cfif listLen(structKeyList(var)) gt top>
					<cfset orderedKeys = listSort(structKeyList(var),"text")>
					<cfloop index="temp_x" from=1 to="#Min(listLen(orderedKeys),top)#">
						<cfset tempStruct[listGetAt(orderedKeys,temp_x)] = var[listGetAt(orderedKeys,temp_x)]>
					</cfloop>
					<cfset var = tempStruct>
				</cfif>
			</cfcase>
			
			<cfcase value="query">
				<cfif var.recordCount gt top>
					<cfset tempQuery = queryNew(var.columnList)>
					<cfloop index="temp_x" from=1 to="#min(var.recordCount,top)#">
						<cfset queryAddRow(tempQuery)>
						<cfloop index="col" list="#var.columnList#">
							<cfset querySetCell(tempQuery,col,var[col][temp_x])>
						</cfloop>
					</cfloop>
					<cfset var = tempQuery>
				</cfif>
			</cfcase>
			
		</cfswitch>
		
	</cfif>
	
	<cfdump var="#var#" expand="#expand#" label="#label#">
</cffunction>