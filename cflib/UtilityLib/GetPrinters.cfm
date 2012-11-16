<cffunction name="GetPrinters" returntype="array" output="no">
   <!--- Define local vars --->
   <cfset var piObj="">

   <!--- Get PrinterInfo object --->
   <cfobject type="java"
         action="create"
         name="piObj"
         class="coldfusion.print.PrinterInfo">

   <!--- Return printer list --->
   <cfreturn piObj.getPrinters()>
</cffunction>