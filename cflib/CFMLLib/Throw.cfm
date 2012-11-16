<cffunction name="throw" output="false" returnType="void" hint="CFML Throw wrapper">
	<cfargument name="type" type="string" required="false" default="Application" hint="Type for Exception">
	<cfargument name="message" type="string" required="false" default="" hint="Message for Exception">
	<cfargument name="detail" type="string" required="false" default="" hint="Detail for Exception">
	<cfargument name="errorCode" type="string" required="false" default="" hint="Error Code for Exception">
	<cfargument name="extendedInfo" type="string" required="false" default="" hint="Extended Info for Exception">
	<cfargument name="object" type="any" hint="Object for Exception">
	
	<cfif not isDefined("object")>
		<cfthrow type="#type#" message="#message#" detail="#detail#" errorCode="#errorCode#" extendedInfo="#extendedInfo#">
	<cfelse>
		<cfthrow object="#object#">
	</cfif>
	
</cffunction>