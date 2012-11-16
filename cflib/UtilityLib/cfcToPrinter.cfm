<cffunction name="cfcToPrinter" access="public" output="false"  returntype="any">
    <cfargument name="cfcType" type="string" required="true" />
    <cfargument name="outputType" type="string" required="false" default="flashPaper" />
    <cfset var myCfc = structNew()>
    <cfset var myExplorer =  createObject("component","CFIDE.componentutils.cfcexplorer")>
    <cfset var cfcDocument = "">
    <cfset var cfceData = "">

    <cfset myCfc.name = arguments.cfcType>
    <cfset myCfc.path = "/" & replace(myCfc.name,".","/","all") & ".cfc">

    <!--- Trap CFCExplorer's output --->
    <cfsavecontent  variable="cfceData">
        <cfoutput>#myExplorer.getcfcinhtml(myCfc.name,myCfc.path)#</cfoutput>
    </cfsavecontent>

    <!--- Clean up the HTML a bit... there's a lotta crap in that output  stream... --->
    <cfset cfceData = reReplace(cfceData,"\t*?\n","","all")>
    <cfset cfceData = reReplace(cfceData,"\s{2,}",chr(10),"all")>

    <!--- Switch up the output stream based on outputType argument --->
    <cfswitch expression="#arguments.outputType#">
        <cfcase value="html">
            <!--- Return tidied HTML for cfoutputting --->
            <cfreturn cfceData />
        </cfcase>
        <cfcase value="flashpaper,pdf">
            <!--- Return !! object !! (use cfcontent to set the right mime  type!!) --->
            <cfdocument fontembed="true" name="cfcDocument"  format="#arguments.outputType#">
                <cfoutput>#cfceData#</cfoutput>
            </cfdocument>
            <cfreturn cfcDocument />
        </cfcase>
    <cfdefaultcase>
        <cfthrow message="Invalid data for argument outputType:  #arguments.outputType#"
            detail="Your choices for outputType are pdf, flashpaper, or html." />
    </cfdefaultcase>
    </cfswitch>
</cffunction>