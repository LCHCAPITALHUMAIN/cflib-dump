<CFFUNCTION NAME="VerifyDSN" RETURNTYPE="boolean">
   <CFARGUMENT NAME="dsn" TYPE="string" REQUIRED="yes">

   <!--- initialize variables --->
   <CFSET var dsService="">
   <!--- Try/catch block, throws errors if bad DSN --->
   <CFSET var result="true">


   <CFTRY>
      <!--- Get "factory" --->
      <CFOBJECT ACTION="CREATE"
                TYPE="JAVA"
                CLASS="coldfusion.server.ServiceFactory"
                NAME="factory">
      <!--- Get datasource service --->
      <CFSET dsService=factory.getDataSourceService()>
      <!--- Validate DSN --->
      <CFSET result=dsService.verifyDatasource(dsn)>

      <!--- If any error, return FALSE --->
	  <CFCATCH TYPE="any">
	     <CFSET result="false">
	  </CFCATCH>
   </CFTRY>

   <CFRETURN result>
</CFFUNCTION>