<cffunction name="convertMemoryUnit" access="public" returntype="string">
	<!--- Number to convert. CMS --->
	<cfargument name="num" 		required="true" type="numeric" />
	<!--- Memory unit of arguments.num (byte, kilobyte, etc.). CMS --->
	<cfargument name="fromunit"	required="true" type="string" />
	<!--- Memory to convert to. CMS --->
	<cfargument name="tounit" 	required="true" type="string" />
	<!--- Number format to return (9.99, 9.99999, etc.). CMS --->
	<cfargument name="format" 	default="9.9"	type="string" />

	<!--- Convert the number to bytes. CMS --->
	<cfset var bytes = 0 />
	<cfset var conv = 0 />

	<!--- Then convert to the specified unit. CMS --->
	<cfswitch expression="#arguments.fromunit#">
		<cfcase value="bit"> 			<cfset bytes = (arguments.num/8) /> 		</cfcase>
		<cfcase value="byte"> 			<cfset bytes = arguments.num /> 			</cfcase>
		<cfcase value="kilobit"> 		<cfset bytes = (arguments.num*(2^10)/8) />	</cfcase>
		<cfcase value="kilobyte"> 		<cfset bytes = (arguments.num*(2^10)) />	</cfcase>
		<cfcase value="megabit"> 		<cfset bytes = (arguments.num*(2^20)/8) />	</cfcase>
		<cfcase value="megabyte"> 		<cfset bytes = (arguments.num*(2^20)) />	</cfcase>
		<cfcase value="gigabit"> 		<cfset bytes = (arguments.num*(2^30)/8) />	</cfcase>
		<cfcase value="gigabyte"> 		<cfset bytes = (arguments.num*(2^30)) />	</cfcase>
		<cfcase value="terabit"> 		<cfset bytes = (arguments.num*(2^40)/8) />	</cfcase>
		<cfcase value="terabyte"> 		<cfset bytes = (arguments.num*(2^40)) />	</cfcase>
		<cfcase value="petabit"> 		<cfset bytes = (arguments.num*(2^50)/8) />	</cfcase>
		<cfcase value="petabyte"> 		<cfset bytes = (arguments.num*(2^50)) />	</cfcase>
		<cfcase value="exabit"> 		<cfset bytes = (arguments.num*(2^60)/8) />	</cfcase>
		<cfcase value="exabyte"> 		<cfset bytes = (arguments.num*(2^60)) />	</cfcase>
		<cfcase value="zettabit"> 		<cfset bytes = (arguments.num*(2^70)/8) />	</cfcase>
		<cfcase value="zettabyte"> 		<cfset bytes = (arguments.num*(2^70)) />	</cfcase>
		<cfcase value="yottabit"> 		<cfset bytes = (arguments.num*(2^80)/8) />	</cfcase>
		<cfcase value="yottabyte"> 		<cfset bytes = (arguments.num*(2^80)) />	</cfcase>
		<cfdefaultcase>
			<cfthrow message="Could not convert #arguments.num# to #arguments.fromunit#."
					detail="Unit #arguments.fromunit# is not supported." />
		</cfdefaultcase>
	</cfswitch>

	<!--- First convert to bytes. CMS --->
	<cfswitch expression="#arguments.tounit#">
		<cfcase value="bit"> 		<cfset conv = (bytes*8) /> 			</cfcase>
		<cfcase value="byte"> 		<cfset conv = bytes /> 				</cfcase>
		<cfcase value="kilobit"> 	<cfset conv = (bytes/(2^10)*8) />	</cfcase>
		<cfcase value="kilobyte"> 	<cfset conv = (bytes/(2^10)) />		</cfcase>
		<cfcase value="megabit"> 	<cfset conv = (bytes/(2^20)*8) />	</cfcase>
		<cfcase value="megabyte"> 	<cfset conv = (bytes/(2^20)) />		</cfcase>
		<cfcase value="gigabit"> 	<cfset conv = (bytes/(2^30)*8) />	</cfcase>
		<cfcase value="gigabyte"> 	<cfset conv = (bytes/(2^30)) />		</cfcase>
		<cfcase value="terabit"> 	<cfset conv = (bytes/(2^40)*8) />	</cfcase>
		<cfcase value="terabyte"> 	<cfset conv = (bytes/(2^40)) />		</cfcase>
		<cfcase value="petabit"> 	<cfset conv = (bytes/(2^50)*8) />	</cfcase>
		<cfcase value="petabyte"> 	<cfset conv = (bytes/(2^50)) />		</cfcase>
		<cfcase value="exabit"> 	<cfset conv = (bytes/(2^60)*8) />	</cfcase>
		<cfcase value="exabyte"> 	<cfset conv = (bytes/(2^60)) />		</cfcase>
		<cfcase value="zettabit"> 	<cfset conv = (bytes/(2^70)*8) />	</cfcase>
		<cfcase value="zettabyte"> 	<cfset conv = (bytes/(2^70)) />		</cfcase>
		<cfcase value="yottabit"> 	<cfset conv = (bytes/(2^80)*8) />	</cfcase>
		<cfcase value="yottabyte"> 	<cfset conv = (bytes/(2^80)) />		</cfcase>
		<cfdefaultcase>
			<cfthrow message="Could not convert #arguments.num# to #arguments.tounit#."
					detail="Unit #arguments.tounit# is not supported." />
		</cfdefaultcase>
	</cfswitch>

	<!--- Then convert the bytes to the tounit. CMS --->
	<cfreturn NumberFormat(conv,arguments.format) />
</cffunction>