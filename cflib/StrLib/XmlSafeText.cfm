<cffunction name="XmlSafeText" hint="Replaces all characters that would break an xml file." returnType="string" output="false">		
	<cfargument name="txt" type="string" required="true">
	<cfset var chars = "">
	<cfset var replaced = "">
	<cfset var i = "">
	
	<!--- Use XmlFormat function first --->
	<cfset txt = XmlFormat(txt)>
	<!--- Get all other characters to replace. ---> 
	<cfset chars = REMatch("[^[:ascii:]]",txt)>
	<!--- Loop through characters and do replace. Maintain a list of characters already replaced to avoid duplicate work. --->
	<cfloop index="i" from="1" to="#ArrayLen(chars)#">
		<cfif listFind(replaced,chars[i]) is 0>
			<cfset txt = Replace(txt,chars[i],"&##" & asc(chars[i]) & ";","all")>
			<cfset replaced = ListAppend(replaced,chars[i])>
		</cfif>
	</cfloop>
	<cfreturn txt>
</cffunction>