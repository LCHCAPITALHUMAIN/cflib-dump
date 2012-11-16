<cfsetting requesttimeout="10000">
<cfset baseUrl = "http://www.cflib.org/api/api.cfc?method=">
<cfset root = ListChangeDelims(expandPath("."), "/", "\")>
<cfset cflib = "#root#/cflib">

<cffile action="read" file="#root#/template.cfc" variable="template">

<cfhttp method="get" url="#baseUrl#getlibraries" result="r"></cfhttp>
<cfwddx action="wddx2cfml" input="#r.filecontent#" output="libraries">

<cfoutput query="libraries">
	
	<cfset dir = "#cflib#/#name#">
	
	<cfif !DirectoryExists(dir)>
		<cfset thecontent = replacenocase(template, "%cfcname%", name)>
		<cfdirectory action="create" directory="#dir#">
		<cffile action="write" addnewline="false" file="#cflib#/#name#.cfc" output="#thecontent#">
	</cfif>
	
	<cfhttp method="get" url="#baseUrl#getudfs&libraryid=#id#" result="r"></cfhttp>
	<cfwddx action="wddx2cfml" input="#r.filecontent#" output="udfs">
	
	<cfloop query="udfs">
		
		<cfset udf = "#dir#/#name#.cfm">
		
		<cfif !FileExists(udf)>
		
			<cfhttp method="get" url="#baseUrl#getudf&udfid=#id#" result="r"></cfhttp>
			<cfwddx action="wddx2cfml" input="#r.filecontent#" output="content">
			
			<cffile action="write" addnewline="false" file="#udf#" output="#content.code#">
		
		</cfif>
		
	</cfloop>

</cfoutput>

<p>Done</p>