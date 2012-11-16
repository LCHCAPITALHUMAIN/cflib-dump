<cffunction name="naughtyFilter"  returntype="string" hint="Replaces unmentionables with gobbledegook">
	<cfargument name="body" type="string" required="yes" hint="Contains text to filter">
	<cfargument name="replaceType" default="all" hint="ALL - all characters, FL - only the middle bits are replaced">
	<cfargument name="repeatValue" default="*" hint="Character to repeat for replaced dirty characters">
	<cfargument name="naughtyList" default="mother fucker,cocksucker,shit,piss,fuck,cunt,tits" hint="George Carlin's original 7 dirty words, not in his original order, but the longest listed first">
	<cfargument name="replaceString" default="!@##$%^&*()!@##$%^&*()!@##$%^&*" hint="A replace string for ALL method, length must be at least as long as the longest dirty word">
	<cfset var naughtyWord = "">
	<cfset var replacement = "">

	<cfloop list="#Arguments.naughtyList#" index="naughtyWord" delimiters=",">
		<cfswitch expression="#UCase(Arguments.replaceType)#">
			<cfcase value="FL">
				<cfif Len(naughtyWord) GTE 3>
					<cfset replacement = Left(naughtyWord,1) & RepeatString(Arguments.repeatValue,Len(naughtyWord) - 2) & Right(naughtyWord,1)>
				<cfelse>
					<cfset replacement = RepeatString(Arguments.repeatValue,Len(naughtyWord))>
				</cfif>	
			</cfcase>
			<cfdefaultcase>
					<cfset replacement = Left(Arguments.replaceString,Len(naughtyWord))>
			</cfdefaultcase>

		</cfswitch>
		<cfset Arguments.body = REReplaceNoCase(Arguments.body,naughtyWord,replacement, "ALL")>
	</cfloop>
	<cfreturn Arguments.body>
</cffunction>