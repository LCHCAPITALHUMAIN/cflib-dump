<cffunction name="getFileSpace" access="public" output="false" returntype="array" hint="returns disk filespaces of the server">
  <cfset var local = {} />
  <cfset var i = "">

  <cfobject type="java" action="create" class="java.io.File" name="local.objFile" />
  <cfset local.aDrives = local.objFile.listRoots() />
  <cfset local.aResult = [] />

  <cfloop array="#local.aDrives#" index="i">
    <cfset local.strTemp = { drivename = i.getAbsolutePath(),
                             available = i.getFreeSpace(),
                             total     = i.getTotalSpace() } />
    <cfset arrayAppend(local.aResult, local.strTemp) />
  </cfloop>

  <CFRETURN local.aResult />
</cffunction>