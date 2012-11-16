<cffunction name="generateSiteMap" output="false" returnType="string">
	<cfargument name="data" type="any" required="true">
	<cfargument name="lastmod" type="date" required="false">
	<cfargument name="changefreq" type="string" required="false">
	<cfargument name="priority" type="numeric" required="false">
	
	<cfset var header = "<?xml version=""1.0"" encoding=""UTF-8""?><urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">">
	<cfset var s = createObject('java','java.lang.StringBuffer').init(header)>
	<cfset var aurl = "">
	<cfset var item = "">
	<cfset var validChangeFreq = "always,hourly,daily,weekly,monthly,yearly,never">
	<cfset var newDate = "">
	<cfset var tz = getTimeZoneInfo().utcHourOffset>
	<cfset var btz = replaceList(tz, "+,-","")>
	
	<cfif structKeyExists(arguments, "changefreq") and not listFindNoCase(validChangeFreq, arguments.changefreq)>
		<cfthrow message="Invalid changefreq (#arguments.changefreq#) passed. Valid values are #validChangeFreq#">
	</cfif>

	<cfif structKeyExists(arguments, "priority") and (arguments.priority lt 0 or arguments.priority gt 1)>
		<cfthrow message="Invalid priority (#arguments.priority#) passed. Must be between 0.0 and 1.0">
	</cfif>
	
	<!--- reformat datetime as w3c datetime / http://www.w3.org/TR/NOTE-datetime --->
	<cfif structKeyExists(arguments, "lastmod")>			
		<cfset newDate = dateFormat(arguments.lastmod, "YYYY-MM-DD") & "T" & timeFormat(arguments.lastmod, "HH:mm")>
		<cfif tz gt 0>
			<cfset newDate = newDate & "-" & numberFormat(btz,"00") & ":00">
		<cfelse>
			<cfset newDate = newDate & "+" & numberFormat(btz,"00") & ":00">
		</cfif>		
	</cfif>
	
	<!--- Support either a query or list of URLs --->
	<cfif isSimpleValue(arguments.data)>
		<cfloop index="aurl" list="#arguments.data#">
			<cfsavecontent variable="item">
				<cfoutput>
				<url>
					<loc>#xmlFormat(aurl)#</loc>
					<cfif structKeyExists(arguments,"lastmod")>
					<lastmod>#newDate#</lastmod>
					</cfif>
					<cfif structKeyExists(arguments,"changefreq")>
					<changefreq>#arguments.changefreq#</changefreq>
					</cfif>
					<cfif structKeyExists(arguments,"priority")>
					<priority>#arguments.priority#</priority>
					</cfif>
				</url>
				</cfoutput>
			</cfsavecontent>
			<cfset item = trim(item)>
			<cfset s.append(item)>
		</cfloop>
	<!--- url, lastmod, changefreq, and priority were changed to have the arguments.data.whatever and I also added the array notation to each like so [arguments.data.currentrow] --->
	<cfelseif isQuery(arguments.data)>
		<cfloop query="arguments.data">
			<cfsavecontent variable="item">
				<cfoutput>
				<url>
					<loc>#xmlFormat(arguments.data.url[arguments.data.currentrow])#</loc>
					<cfif listFindNoCase(arguments.data.columnlist,"lastmod")>
						<cfset newDate = dateFormat(arguments.data.lastmod[arguments.data.currentrow], "YYYY-MM-DD") & "T" & timeFormat(arguments.data.lastmod[arguments.data.currentrow], "HH:mm")>
						<cfif tz gt 0>
							<cfset newDate = newDate & "-" & numberFormat(btz,"00") & ":00">
						<cfelse>
							<cfset newDate = newDate & "+" & numberFormat(btz,"00") & ":00">
						</cfif>		
						<lastmod>#newDate#</lastmod>
					</cfif>
					<cfif listFindNoCase(arguments.data.columnlist,"changefreq")>
					<changefreq>#arguments.data.changefreq[arguments.data.currentrow]#</changefreq>
					</cfif>
					<cfif listFindNoCase(arguments.data.columnlist,"priority")>
					<priority>#arguments.data.priority[arguments.data.currentrow]#</priority>
					</cfif>
				</url>
				</cfoutput>
			</cfsavecontent>
			<cfset item = trim(item)>
			<cfset s.append(item)>
		
		</cfloop>
	</cfif>	
	<cfset s.append("</urlset>")>

	<cfreturn s>
	
</cffunction>