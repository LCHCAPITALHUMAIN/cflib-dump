<cffunction name="tempConvert" output="false" returnType="string">

	<cfargument name="otemp" required="yes" type="numeric">
	<cfargument name="ctype" required="yes" type="string">
	
	<cfif arguments.ctype IS 'CF'>
		<cfset convertedtTemp = (arguments.otemp*1.8)+32>
		<cfset convertedtTemp = convertedtTemp & '&ordm; F'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'FC'>
		<cfset convertedtTemp = (arguments.otemp-32)*0.5555>
		<cfset convertedtTemp = convertedtTemp & '&ordm; C'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'CK'>
		<cfset convertedtTemp = arguments.otemp+273.15>
		<cfset convertedtTemp = convertedtTemp & '&ordm; K'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'KC'>
		<cfset convertedtTemp = arguments.otemp-273.15>
		<cfset convertedtTemp = convertedtTemp & '&ordm; C'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'FK'>
		<cfset convertedtTemp = ((arguments.otemp-32)*0.5555)+273.15>
		<cfset convertedtTemp = convertedtTemp & '&ordm; K'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'KF'>
		<cfset convertedtTemp = ((arguments.otemp-273.15)*1.8)+32>
		<cfset convertedtTemp = convertedtTemp & '&ordm; K'>
		<cfreturn convertedtTemp>
	</cfif>

</cffunction>