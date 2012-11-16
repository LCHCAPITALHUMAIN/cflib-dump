<cffunction name="parseRawForm" returnType="struct" output="false">
	<cfset var raw = GetHttpRequestData().content>
	<cfset var sNewForm = structNew()>
	<cfset var iKey = "">
	<cfset var iVal = "">

	<cfloop list="#raw#" index="iHdr" delimiters="&">
		<cfif right(iHdr,1) EQ "=">
			<cfset iKey = ucase(left(iHdr, len(iHdr) - 1))>
			<cfset iVal = "">
		<cfelse>
			<cfset iKey = ucase(getToken(iHdr, 1, "="))>
			<cfset iVal = getToken(iHdr, 2, "=")>
		</cfif>
		<cfif structKeyExists(sNewForm, iKey)>
			<cfset sNewForm[iKey] = sNewForm[iKey] & ",#iVal#">
		<cfelse>
			<cfset sNewForm[iKey] = URLDecode(iVal)>
		</cfif>
	</cfloop>
	<cfset sNewform.fieldnames = structKeyList(sNewForm)>
	<cfreturn sNewForm>
</cffunction>