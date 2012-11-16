<cffunction name="calculateBMI" returntype="numeric" hint="This function calculates an individuals Body Mass Index">
	<cfargument name="WeightLbs" type="numeric" required="yes" hint="The person's weight in pounds">
	<cfargument name="HeightInches" type="numeric" required="yes" hint="The person's height in inches">
	<cfset var HI2 = "">
	<cfset var WHI = "">
	<cfset var BMI = "">
	<cfset HI2 = HeightInches * HeightInches>
	<cfset WHI = WeightLbs / HI2>
	<cfset BMI = WHI * 703>
	<cfreturn decimalFormat(BMI)>
</cffunction>