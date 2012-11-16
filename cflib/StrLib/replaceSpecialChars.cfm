<cffunction name="replaceSpecialChars" access="public" output="false" returntype="String">
	<cfargument name="textString" type="String" hint="String to have special characters replaced">
	<!--- If you would not like to remove spaces take the number 32 out of the list.--->
	<cfargument name="replaceTheseChars" type="String" default="32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,58,59,60,61,62,63,64,91,92,93,94,95,96,123,124,126" required="false" hint="Characters to be replaced">
	<cfargument name="replaceWithChar" type="String" default="#chr(0)#" required="no" hint="Character to replace special characters with.">
	<cfscript>
		var returnString = ARGUMENTS.textString;
		var i = 1;
		
		for(i=1; i <= listLen(ARGUMENTS.replaceTheseChars,','); i++){
			returnString = replace(returnString,chr(listGetAt(ARGUMENTS.replaceTheseChars,i)),ARGUMENTS.replaceWithChar,'all');
		}
	</cfscript>
	
	<cfreturn returnString />
</cffunction>