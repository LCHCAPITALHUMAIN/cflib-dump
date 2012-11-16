<cffunction name="amInCFThread" hint="returns 'true' if the current thread if a cfthread, rerturns false otherwise" access="public" returntype="boolean" output="false">
	<cfscript>
		var Thread = createObject("java", "java.lang.Thread");

		if(Thread.currentThread().getThreadGroup().getName() eq "cfthread")
		{
			return true;
		}

		return false;
	</cfscript>
</cffunction>