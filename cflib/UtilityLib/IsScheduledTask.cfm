<CFFUNCTION NAME="IsScheduledTask" RETURN="Boolean">
  <CFARGUMENT NAME="TaskName" REQUIRED="True" TYPE="String">
  <!--- var local vars for the func --->
  <CFSET Var TaskXML="">
  <CFSET Var GetTasks="">
  
  <!--- get the scheduler xml file.  It's stored as WDDX --->
  <CFFILE ACTION="Read"
          FILE="#Server.ColdFusion.RootDir#\lib\neo-cron.xml"
          VARIABLE="TaskXML">
  
  <!--- convert the WDDX to CFML - and array of structs --->        
  <CFWDDX ACTION="WDDX2CFML" INPUT="#TaskXML#" OUTPUT="GetTasks"> 
  
  <!--- search the array of structs for the name passed to the func --->
  <CFIF ListContainsNoCase(StructKeyList(GetTasks[1]), Arguments.TaskName) EQ 0>
    <CFRETURN False>
  <CFELSE>
    <CFRETURN True>
  </CFIF>
</CFFUNCTION>