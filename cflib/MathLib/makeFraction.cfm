<cffunction name="makeFraction" output="no" returntype="string" hint="turns a decimal number into a fraction">
	<cfargument name="decimalNumber" type="numeric" required="yes">
	<cfset var x=0>
	<cfset var numerator = ListLast(ARGUMENTS.decimalNumber,".")>
	<cfset var numeratorLength = Len(numerator)>
	<cfset var numFactors = "">
	<cfset var denomFactors = "">
	<cfset var denominator = 1>
	<cfset var GCD = 0>


	<cfloop from="1" to="#numeratorlength#" index="x">
		<cfset denominator = Evaluate(denominator & "0")>
	</cfloop>

	<!--- find factors of numerator --->
	<cfset x = 1>

	<cfloop condition="x NEQ numerator + 1">
		<cfif numerator MOD x EQ 0>
			<cfset numFactors = ListAppend(numFactors, x)>
		</cfif>
		<cfset x = x + 1>
	</cfloop>

	<!--- find factors of denominator --->
	<cfset x = 1>

	<cfloop condition="x NEQ denominator + 1">
		<cfif denominator MOD x EQ 0>
			<cfset denomFactors = ListAppend(denomFactors, x)>
		</cfif>
		<cfset x = x + 1>
	</cfloop>


	<!--- find greatest common divisor --->
	<cfset x = ListLen(numFactors)>

	<cfloop condition="GCD EQ 0">
		<cfif denomFactors CONTAINS ListGetAt(numFactors,x)>
			<cfset GCD = ListGetAt(numFactors,x)>
		<cfelse>
			<cfset x = x - 1>
		</cfif>
	</cfloop>

	<!--- set the "fractionalized" number --->
	<cfset numerator = numerator / GCD>
	<cfset denominator = denominator / GCD>

	<cfreturn "#ListFirst(ARGUMENTS.decimalNumber,".")# #numerator#/#denominator#">

</cffunction>