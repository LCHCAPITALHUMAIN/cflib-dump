<cffunction name="listSplit" output="no" returnType="array" description="
	* A split function for lists, splitting the original list into lists of n array elements.
	* Rewritten by Raymond Camden
	* Output delimiter mod by Jules Gravinese (webveteran.com), December 2009
	*
	* @author  Ryan Thompson-Jewell (ryan@thompson-jewell.com)
	* @version 2, September 24, 2002
">
	<cfargument name="inList"       default=""  hint="The list to split">
	<cfargument name="numGet"       default="1" hint="Number of items per array alement">
	<cfargument name="inDelimiter"  default="," hint="Input delimiter">
	<cfargument name="outDelimiter" default="," hint="Output delimiter">

    <cfscript>
    var aResult=arraynew(1);

    if(numGet gte listLen(inList,inDelimiter)) {
        aResult[1] = inList;
        return aResult;
    }
    aResult[1] = "";
    while(listLen(inList,inDelimiter)) {
        aResult[arrayLen(aResult)] = listAppend(aResult[arrayLen(aResult)],listFirst(inList,inDelimiter), outDelimiter);
        inList = listRest(inList,inDelimiter);
        if(listLen(aResult[arrayLen(aresult)],outDelimiter) is numGet and len(inList)) aResult[arrayLen(aResult)+1] = "";
    }
    return aResult;
    </cfscript>
</cffunction>