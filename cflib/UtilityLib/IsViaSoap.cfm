<cffunction name="isViaSoap" returnType="boolean" output="no">
   <!--- Get current message context --->
   <cfset var ctx = createObject("java", "org.apache.axis.MessageContext").getCurrentContext()>
	
   <!--- Invoke (cheap) method to see if it is null --->
   <cftry>
      <cfset ctx.isclient()>
      <cfcatch type="any">
         <cfreturn false>
      </cfcatch>
   </cftry>

   <cfreturn true>

</cffunction>