<cffunction name="pingTrackback" output="false" returntype="string">
	<cfargument name="trackBackURL" type="string" required="yes">
	<cfargument name="permalink" type="string" required="yes">
	<cfargument name="charset" type="string" required="no" default="utf-8">
	<cfargument name="title" type="string" required="no">
	<cfargument name="excerpt" type="string" required="no">
	<cfargument name="blogName"  type="string" required="no">
	<cfargument name="timeout"  type="numeric" required="no" default="30">
	<cfset var cfhttp = "">
	<cfhttp url="#arguments.trackBackURL#" method="post" timeout="#arguments.timeout#" charset="#arguments.charset#">
		<cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded; charset=#arguments.charset#">
		<cfhttpparam type="formfield" encoded="yes" name="url" value="#arguments.permalink#">
		<cfif structKeyExists(arguments, "title")>
			<cfhttpparam type="formfield" encoded="yes" name="title" value="#arguments.title#">
		</cfif>
		<cfif structKeyExists(arguments, "excerpt")>
			<cfhttpparam type="formfield" encoded="yes" name="excerpt" value="#arguments.excerpt#">
		</cfif>
		<cfif structKeyExists(arguments, "blogName")>
			<cfhttpparam type="formfield" encoded="yes" name="blog_name" value="#arguments.blogName#">
		</cfif>
	</cfhttp>
	<cfreturn cfhttp.FileContent>
</cffunction>