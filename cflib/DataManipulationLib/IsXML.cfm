<cffunction name="isXML" returnType="boolean" output="no">
   <cfargument name="data" type="string" required="yes">

   <!--- try catch block --->
   <cftry>
      <!--- try to parse the data as xml --->
      <cfset xmlparse(data)>
      <!--- if xmlparse() fails, it is not xml --->
      <cfcatch type="any">
         <cfreturn false>
      </cfcatch>
   </cftry>

   <cfreturn true>
   
</cffunction>