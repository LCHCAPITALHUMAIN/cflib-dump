<cffunction name="chrex" return="string" output="false">
  <cfargument name="value" type="string" required="true">
  <cfargument name="charset" type="string" required="false" default="">
  <cfargument name="radix" type="numeric" required="false" default="16">
  <cfset var a="">
  <cfset var tmp="">
  <cfset var st = "">
  <cfset var integer = "">
  <cfset var string = "">
  <cfset var byte = "">
  <cfset var system = "">
  
  <cfobject type="java" class="java.util.StringTokenizer" action="create" name="st">
  <cfobject type="java" class="java.lang.Integer" action="create" name="integer">
  <cfobject type="java" class="java.lang.String" action="create" name="string">
  <cfobject type="java" class="java.lang.Byte" action="create" name="byte">

  <cfif not len(arguments.charset)>
    <cfobject type="java" class="java.lang.System" action="create" name="system">
    <cfset arguments.charset=system.getProperty("file.encoding")>
  </cfif>
 
  <cfset a=arraynew(1)>
  <cfset st.init(arguments.value, " ,#chr(9)#")>
  <cfloop condition="#st.hasMoreTokens()#">
    <cfset tmp=integer.parseInt(st.nextToken(), arguments.radix)>
    <cfset arrayappend(a, byte.init(tmp))>
  </cfloop>
  <cfreturn string.init(a, arguments.charset)>
</cffunction>