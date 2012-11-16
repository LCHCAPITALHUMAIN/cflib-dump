<cffunction name="highlightAndCrop" access="public" output="false" hint="Given an arbitrary string and a search term, find it, and return a 'cropped' set of text around the match.">
	<cfargument name="string" type="string" required="true" hint="Main blob of text">
	<cfargument name="term" type="string" required="true" hint="Keyword to look for.">
	<cfargument name="size" type="numeric" required="false" hint="Size of result string. Defaults to total size of string. Note this is a bit fuzzy - we split it in two and return that amount before and after the match. The size of term and wrap will therefore impact total string length.">
	<cfargument name="wrap" type="string" required="false" default="<b></b>" hint="HTML to wrap the match. MUST be one pair of HTML tags.">

	<cfset var excerpt = "">
	<cfset var pad = "">
	<cfset var match = "">
	<cfset var thisKeyword = "">
	<cfset var end = "">
	<cfset var endInitialTag = "">
	<cfset var beginTag = "">
	<cfset var endTag = "">
	
	<!--- clean the string --->
	<cfset arguments.string = trim(rereplace(arguments.string, "<.*?>", "", "all"))>

	<!--- pad is half our total --->
	<cfif not structKeyExists(arguments, "size")>
		<cfset arguments.size = len(arguments.string)>
	</cfif>
	<cfset pad = ceiling(arguments.size/2)>

	<cfloop list="#arguments.term#" index="thisKeyword">
		<cfif match is 0>
			<cfset match = findNoCase(thisKeyword, arguments.string)>
		<cfelseif findNoCase(thisKeyword, arguments.string) lt match>
			<cfset match = findNoCase(thisKeyword, arguments.string)>
		</cfif>
	</cfloop>
	   
	<cfif match lte pad>
		<cfset match = 1>
	</cfif>
	<cfset end = match + len(arguments.term) + arguments.size>

	<!--- now create the main string around the match --->
	<cfif len(arguments.string) gt arguments.size>
		<cfif match gt 1>
			<cfset excerpt = "..." & mid(arguments.string, match-pad, end-match)>
		<cfelse>
			<cfset excerpt = left(arguments.string,end)>
		</cfif>
		<cfif len(arguments.string) gt end>
			<cfset excerpt = excerpt & "...">
		</cfif>
	<cfelse>
		<cfset excerpt = arguments.string>
	</cfif>

	<!--- split up my wrap - I bet this can be done better... --->
	<cfset endInitialTag = find(">",arguments.wrap)>
	<cfset beginTag = left(arguments.wrap, endInitialTag)>
	<cfset endTag = mid(arguments.wrap, endInitialTag+1, len(arguments.wrap))>

	<cfloop list="#arguments.term#" index="thisKeyword">
		<cfset excerpt = reReplaceNoCase(excerpt, "(#thisKeyword#)", "#beginTag#\1#endTag#","all")>
	</cfloop>
	<cfreturn excerpt>
</cffunction>