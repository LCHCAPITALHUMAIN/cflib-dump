<cffunction name="cf301Redirect" access="public" returntype="void" output="false">
  <cfargument name="urlString" type="string" required="yes" />
  
  <!--- 301 redirect the user to the provided url --->
  <cfheader statuscode="301" statustext="Moved permanently" />
  <cfheader name="Location" value="#arguments.urlString#" />
</cffunction>