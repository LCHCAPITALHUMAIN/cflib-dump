<cffunction name="parseQuotedPrintable" output="false">
	<cfargument name="text" type="string" required="true">
	<cfset var crlf = chr(13) & chr(10)>
	<cfset var char = "">
	<cfset var x = 0>
	
	<cfset text = ListToArray(crlf & text,"=")>
	<cfloop index="x" from="1" to="#arrayLen(text)#">
		<cfset char = left(text[x],2)>
		<cfset text[x] = removechars(text[x],1,2)>
		<cfif char is not crlf>
			<cfset text[x] = CHR(InputBaseN(char, 16)) & text[x]>
		</cfif>
	</cfloop>
	
	<cfreturn ArrayToList(text,"")>
</cffunction>