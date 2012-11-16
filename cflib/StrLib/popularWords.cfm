<cffunction name="popularWords" returntype="query" output="No">
	<cfargument name="qQuery" type="query" required="true">
	<cfargument name="targetCol" type="string" required="true">
	<cfargument name="returnCount" type="numeric" required="false" default="10">
	<cfargument name="ignoreWords" type="string" required="false" default="I,me,the,and,if,but,not,as,a,an,for,of,this,on,to,is">

	<cfset var thisRow = "">
	<cfset var thisLine = "">
	<cfset var thisWord = "">
	<cfset var wordData = structNew()>
	<cfset var qFinalResults = "">
	
	<!--- Create a query to contain the results, prime it so that loops
	don't fail since we can't INSERT or UPDATE using QoQ --->
	<cfset var qResults = queryNew("word,times")>

	<!--- Begin the looping, go through the query to check --->
	<cfloop from="1" to="#arguments.qQuery.RecordCount#" index="thisRow">
		<!--- Ease of use; set a "nickname" for the current line --->
		<cfset thisLine = arguments.qQuery[targetcol][thisRow]>

 		<!--- Loop through the line treating it as a list --->
 		<cfloop list="#thisLine#" delimiters=" " index="thisWord">
   
			<!--- Test for the words that we need to ignore (include all one-letter words) --->
	 		<cfif not listFindNoCase(arguments.ignoreWords, thisWord) and len(trim(thisWord)) gt 1>
		  		<cfif not structKeyExists(wordData, thisWord)>
						<cfset wordData[thisWord] = 0>
				</cfif>
				<cfset wordData[thisWord] = wordData[thisWord] + 1>
			</cfif>

	   </cfloop>
	</cfloop>

	<cfloop item="thisWord" collection="#wordData#">
		<cfset queryAddRow(qResults)>
		<cfset querySetCell(qResults, "word", thisWord)>
		<cfset querySetCell(qResults, "times", wordData[thisWord])>
	</cfloop>
	
	<!--- We've built our query, now use QoQ to get the "top 10" by count --->
	<cfquery name="qFinalResults" dbtype="query" maxrows="#arguments.returnCount#">
	select word, times
	from qresults
	order by times desc
	</cfquery>
	
	<cfreturn qFinalResults>
</cffunction>