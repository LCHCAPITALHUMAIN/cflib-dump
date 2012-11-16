<cffunction name="passwordCheck">
	<cfargument name="password" required="true" type="string">
	<cfargument name="CharOpts" required="false" type="string" default="alpha,digit,punct">
	<cfargument name="typesRequired" required="false" type="numeric" default="2">
	<cfargument name="length" required="false" type="numeric" default="8">


	<!--- Initialize variables --->
	<cfset var TypesCount = 0>
	<cfset var i = "">
	<cfset var charClass = "">
	<cfset var checks = structNew()>
	<cfset var numReq = "">
	<cfset var reqCompare = "">
	<cfset var j = "">
	
	<!--- Use regular expressions to check for the presence banned characters such as tab, space, backspace, etc  and password length--->
	<cfif ReFind("[[:cntrl:] ]",password) OR len(password) LT length>
		<cfreturn false>
	</cfif>


	<!--- Loop through the list 'mustHave' --->
	<cfloop list="#charOpts#" index="i">
		<cfset charClass = listGetat(i,1,' ')>
		<!--- Check to see if item in list should be included or excluded --->
		<cfif listgetat(i,1,"_") eq "no">
			<cfset regex = "[^[:#listgetat(charClass,2,'_')#:]]">
		<cfelse>
			<cfset regex = "[[:#charClass#:]]">
		</cfif>
		
		<!--- If regex found, set variable to position found --->
		<cfset checks["check#replace(charClass,' ','_','all')#"] = ReFind(regex,password)>

		<!--- If regex not found set valid to false --->
		<cfif checks["check#replace(charClass,' ','_','all')#"] GT 0>
			<cfset typesCount = typesCount + 1>
		</cfif>

		<cfif listLen(i, ' ') GT 1>
			<cfset numReq = listgetat(i,2,' ')>
			<cfset reqCompare = 0>
			<cfloop from="1" to="#len(password)#" index="j">
				<cfif REFind(regex,mid(password,j,1))>
					<cfset reqCompare = reqCompare + 1>
				</cfif>
			</cfloop>
			<cfif reqCompare LT numReq>
				<cfreturn false>
			</cfif>
		</cfif>
	</cfloop>

	<!--- Check that retrieved values match with the give criteria --->
	<cfif typesCount LT typesRequired>
		<cfreturn false>
	</cfif>
	
	<cfreturn true>
	
</cffunction>