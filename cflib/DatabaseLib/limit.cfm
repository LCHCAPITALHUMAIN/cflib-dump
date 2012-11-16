<cffunction name="limit" returntype="query" description="WORKS LIKE MYSQL LIMIT(N,N)" output="false">
	<cfargument name="inQry" type="query" hint="I am the query" />
	<cfargument name="arg1" type="numeric" />
	<cfargument name="arg2" type="numeric" />
    
	<cfscript>
	var outQry = arguments.inQry;
	var a1 = arguments.arg1-1;
	
	if(arg1 GT 1){
	    outQry.RemoveRows(JavaCast( "int", 0 ), JavaCast( "int", a1 ));
	}
	
	outQry.RemoveRows(JavaCast( "int", arg2 ),JavaCast( "int", outQry.recordcount-arg2));
	
	return outQry;
	</cfscript>
</cffunction>