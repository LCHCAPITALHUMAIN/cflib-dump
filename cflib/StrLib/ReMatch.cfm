<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Provides the CF8 ReMatch functionality in MX6/MX7
 * 
 * @param RegEx 	 regular expression for which to search (Required)
 * @param Txt 	 search string (Required)
 * @return Returns an array 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 0, May 9, 2009 
 */
function ReMatch(RegEx,Txt)
{
	var MatchList=ArrayNew(1);
	var tmp="";
	var Done=0;
	var StartPos=1;
	Arguments.Txt=Arguments.Txt & " ";

	while (NOT Done) {
		tmp=ReFind(Arguments.RegEx,Arguments.Txt,StartPos,"true");
		if (tmp.Pos[1] EQ "0") {
			Done=1;
		} else {
			MatchList[ArrayLen(MatchList) + 1]=Mid(Arguments.Txt,tmp.Pos[1],tmp.Len[1]);
			StartPos=tmp.Pos[1] + Tmp.Len[1];
		}
	}
	return MatchList;
}
</cfscript>