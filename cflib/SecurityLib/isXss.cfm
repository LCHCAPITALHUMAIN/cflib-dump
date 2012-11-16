<cffunction name="isXss" hint="" access="public" returntype="boolean">
	<cfargument name="field" type="string" required="yes" />
	
	<cfset var bReturn = false />
	<cfset var encodingsOfLessThan = "<
%3C
&lt
&lt;
&LT
&LT;
&##
&##60
&##060
&##0060
&##00060
&##000060
&##0000060
&##60;
&##060;
&##0060;
&##00060;
&##000060;	
&##0000060;
&##x3c
&##x03c
&##x003c
&##x0003c
&##x00003c
&##x000003c
&##x3c;
&##x03c;
&##x003c;
&##x0003c;
&##x00003c;
&##x000003c;
&##X3c
&##X03c
&##X003c
&##X0003c
&##X00003c
&##X000003c
&##X3c;
&##X03c;
&##X003c;
&##X0003c;
&##X00003c;
&##X000003c;
&##x3C
&##x03C
&##x003C
&##x0003C
&##x00003C
&##x000003C
&##x3C;
&##x03C;
&##x003C;
&##x0003C;
&##x00003C;
&##x000003C;
&##X3C
&##X03C
&##X003C
&##X0003C
&##X00003C
&##X000003C
&##X3C;
&##X03C;
&##X003C;
&##X0003C;
&##X00003C;
&##X000003C;
\x3c
\x3C
\u003c
\u003C">
	
	<cfloop list="#encodingsOfLessThan#" index="i" delimiters="#chr(10)#">
		
		<cfif Find(i, arguments.field)>
			<cfset bReturn = true >
		</cfif>
	</cfloop>
	
	<cfreturn bReturn />
	
</cffunction>