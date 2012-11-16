<cffunction name="showDatabaseTablesMySQL">
	<cfargument name="path" required="true">
	<cfargument name="database" required="true">
	<cfargument name="timeout" required="false" default="30">
	<cfscript>
		var a = "";
		var x = "";
		var y = 1;
		database=replace(database, '_', '\_', 'all');
	</cfscript>
	<cfexecute name="#arguments.path#\mysqlshow" arguments="#arguments.database#" timeout="#arguments.timeout#" variable="mySQLDB"></cfexecute>
	<cfscript>
		a=replaceList(mySQLDB,'+,-, ,','');
		a=trim(a);
		x=arrayNew(1);
	</cfscript>
	<cfloop list="#a#" index="i" delimiters="|">
		<cfscript>
			if (not compareNoCase(left(i, 9), "Database:")) {
					
			} else if (not compareNoCase(trim(replace(i, '|', '', 'all')),"Tables")) {
					x = arrayNew(1);
			} else if (compareNoCase(trim(i), "")) {
					x[y]=i;
					y=y+1;			
			}
		</cfscript>
	</cfloop>
	<cfreturn x>
</cffunction>