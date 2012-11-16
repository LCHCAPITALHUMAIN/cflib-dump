<cffunction name="getNorthAmericanTimeStamp" returntype="string" output="false" access="remote">
	<cfargument name="timeZone" type="string" required="false" default="central" />
	<cfscript>		
		var local = structNew();
		local.t = structNew();
		local.t.dts = now();
		local.t.tzi = getTimeZoneInfo();
		local.t.utc = dateAdd("s", local.t.tzi.utcTotalOffset, local.t.dts);
		local.timeZones = "newfoundland,atlantic,eastern,central,mountain,pacific,hawaii,utc";

		if ( local.t.tzi.isDSTon ) {
			local.t.newfoundland = dateAdd("n", -150, local.t.utc);			
			local.t.atlantic = dateAdd("h", -3, local.t.utc);
			local.t.eastern = dateAdd("h", -4, local.t.utc);
			local.t.central = dateAdd("h", -5, local.t.utc);
			local.t.mountain = dateAdd("h", -6, local.t.utc);
			local.t.pacific = dateAdd("h", -7, local.t.utc);
			local.t.hawaii = dateAdd("h", -9, local.t.utc);	

		} else {
			local.t.newfoundland = dateAdd("n", -210, local.t.utc);
			local.t.atlantic = dateAdd("h", -4, local.t.utc);
			local.t.eastern = dateAdd("h", -5, local.t.utc);
			local.t.central = dateAdd("h", -6, local.t.utc);
			local.t.mountain = dateAdd("h", -7, local.t.utc);
			local.t.pacific = dateAdd("h", -8, local.t.utc);
			local.t.hawaii = dateAdd("h", -10, local.t.utc);
		};
					
		if ( listFindNoCase(local.timeZones, arguments.timeZone, ",") ) {
			switch(arguments.timeZone) {
				case "newfoundland":
					return local.t.newfoundland;
					break;
				case "atlantic":
					return local.t.atlantic;
					break;
				case "eastern":
					return local.t.eastern;
					break;
				case "central":
					return local.t.central;
					break;
				case "mountain":
					return local.t.mountain;
					break;
				case "pacific":
					return local.t.pacific;
					break;
				case "hawaii":
					return local.t.hawaii;
					break;
				case "utc":
					return local.t.utc;
					break;
				default:
					return local.t.eastern;
			};
		} else {
			return local.t.eastern;
		};	
	</cfscript>
</cffunction>