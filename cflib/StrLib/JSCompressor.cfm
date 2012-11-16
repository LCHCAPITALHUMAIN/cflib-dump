<cffunction name="jsCompressor" returntype="string" description="Compresses javascript code" output="false">
	<cfargument name="jscode" type="string" required="yes">
	<cfargument name="brem" type="boolean" required="no" default="true">
	<cfargument name="lrem" type="boolean" required="no" default="true">
	<cfargument name="spc" type="boolean" required="no" default="true">
	<cfargument name="ret" type="boolean" required="no" default="true">
	<cfset var linerem= "[^:]\/\/[^#chr(13)##chr(10)#]*">
	<cfset var blockrem1="/\*">
	<cfset var blockrem2="\*/">
	<cfset var blockrem="#chr(172)#[^#chr(172)#]*#chr(172)#">
	<cfset var spaces="[\s]*([\=|\{|\}|\(|\)|\;|[|\]|\+|\-|\n|\r]+)[\s]*">
	<cfset var retornos="[\r\n\f]*">
	<cfif brem>
		<cfset jscode = rereplacenocase(jscode,blockrem1,"#chr(172)#","all")>
		<cfset jscode = rereplacenocase(jscode,blockrem2,"#chr(172)#","all")>
		<cfset jscode = rereplacenocase(jscode,blockrem,"","all")>
	</cfif>
	<cfif lrem><cfset jscode = rereplacenocase(jscode,linerem,"","all")></cfif>
	<cfif spc><cfset jscode = rereplacenocase(jscode,spaces,"\1","all")></cfif>
	<cfif ret><cfset jscode = rereplacenocase(jscode,retornos,"","all")></cfif>
	<cfreturn jscode>
</cffunction>