<cffunction name="listCompare" output="false" returnType="string">
       <cfargument name="list1" type="string" required="true" />
       <cfargument name="list2" type="string" required="true" />
       <cfargument name="delim1" type="string" required="false" default="," />
       <cfargument name="delim2" type="string" required="false" default="," />
       <cfargument name="delim3" type="string" required="false" default="," />

       <cfset var list1Array = ListToArray(arguments.List1,Delim1) />
       <cfset var list2Array = ListToArray(arguments.List2,Delim2) />

       <!--- Remove the subset List2 from List1 to get the diff --->
       <cfset list1Array.removeAll(list2Array) />

       <!--- Return in list format --->
       <cfreturn ArrayToList(list1Array, Delim3) />
</cffunction>