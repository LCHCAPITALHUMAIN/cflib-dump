<cffunction name="formFieldAsArray" returntype="array" output="false" hint="Returns a Form/URL variable as an array.">
	<cfargument name="fieldName" required="true" type="string" hint="Name of the Form or URL field" />

	<!--- Note: although we are getting the partsArray from the Form scope, it will contain URL values also. --->
	<cfset var tmpPartsArray = Form.getPartsArray() />
	<cfset var returnArray = arrayNew(1) /> 
	<cfset var tmpPart = 0 />
	<cfset var tmpValueArray = "" >
	
	<!--- if the getPartsArray method did not return NULL, then this is a multipart/form-data request, which must be handled as such. --->
	<cfif IsDefined("tmpPartsArray")>
		<cfloop array="#tmpPartsArray#" index="tmpPart">
			<cfif tmpPart.isParam() AND tmpPart.getName() EQ arguments.fieldName>
				<cfset arrayAppend(returnArray, tmpPart.getStringValue()) />
			</cfif>
		</cfloop>
	</cfif>
	
	<!--- Add the values that maybe on the URL with the same name, also if this *wasn't* a multipart/form-data request then
	the above code did not get any of the data, and the method below will return all of it. --->
	<cfset tmpValueArray = getPageContext().getRequest().getParameterValues(arguments.fieldName) />
	
	<!--- that may have returned null, so need to test for it. --->
	<cfif IsDefined("tmpValueArray")>
		<cfloop array="#tmpValueArray#" index="tmpPart">
			<cfset arrayAppend(returnArray, tmpPart) />
		</cfloop>
	</cfif>
	
	<cfreturn returnArray />
</cffunction>