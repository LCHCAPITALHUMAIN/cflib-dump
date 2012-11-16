<cffunction name="formToNameValuePairs" returntype="string" output="false" access="remote"
			hint="pass me a form and i'll generate concatenated name-value pairs.">

	<cfargument name="formStruct" type="struct" required="true" hint="the form struct to parse and concatenate" />
	<cfargument name="doNotProcessList" type="string" required="false" hint="a list of form fields to ignore" default="" />

	<cfset var local = structNew() />
	<cfset local.nameValuePairs = "" />
	<cfset local.doNotProcess = arguments.doNotProcessList />
	<cfset local.field = "" />

	<cfif structKeyExists(arguments,"formStruct") and structKeyExists(arguments.formStruct,"fieldnames")>
	    	<cfloop list="#arguments.formStruct.fieldnames#" index="local.field"> 
	    	    <cfif not listFindNoCase(local.doNotProcess,local.field)>
	    	        <cfset local.doNotProcess = listAppend(local.doNotProcess,local.field) />
	        	    <cfset local.nameValuePairs = listAppend(local.nameValuePairs,lcase(local.field) & "=" & urlEncodedFormat(form[local.field], "utf-8"), "&") />                        
	    	   	 </cfif>
	    	</cfloop>
	   </cfif>	

	<cfreturn local.nameValuePairs />    
</cffunction>