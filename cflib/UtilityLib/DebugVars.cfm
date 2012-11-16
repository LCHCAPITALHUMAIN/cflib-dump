<cffunction name="debugVars" output="true" returntype="string" access="public" hint="Output more extensive debugging information than just the CF debug info" displayname="DebugVars()">
   <cfargument name="scopes" required="false" default="variables,form,url,request,cookie,session,client,application,server,cgi" hint="Scopes to be dumped" type="string" displayname="Scopes" />
   <cfsavecontent variable="returnVar">
      <cfloop list="#arguments.scopes#" index="myScope" delimiters=",">
         <cftry>
            <cfdump label="#Trim(myScope)#" var="#Evaluate(Trim(myScope))#" />
            <cfcatch>
               <cfoutput>
                  #cfcatch.Message#
               </cfoutput>
            </cfcatch>
         </cftry>
      </cfloop>
   </cfsavecontent>
   <cfreturn returnVar />
</cffunction>