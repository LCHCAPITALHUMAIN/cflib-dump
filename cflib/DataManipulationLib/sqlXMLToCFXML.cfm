<cffunction name="sqlXMLToCFXML" access="public" output="false" returntype="Any" hint="This function will take a multiple row query result and turn it into a CF XML var.">
      <cfargument name="doc" type="String" required="false" default="xml" />
      <cfargument name="qry" type="Query" required="true" />

      <cfset var x = "" />
      <cfset var y = "" />
      <cfset var retXML = "" />

      <cfset x = listFirst(arguments.qry.columnList)>
      <cfloop index="y" from="1" to="#arguments.qry.recordCount#">
         <cfset retXML = retXML & arguments.qry[x][y]>
      </cfloop>

      <cfset retXML = "<#arguments.doc#>" & retXML & "</#arguments.doc#>">

      <cfreturn retXML>
</cffunction>