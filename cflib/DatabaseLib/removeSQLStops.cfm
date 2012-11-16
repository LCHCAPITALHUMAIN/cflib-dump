/**
 * Remove Stop words from list for SQL FreeText Search.
 * 
 * @function:  RemoveSQLStops
 * @param required: TheList
 * @param dilims optional: The delimiters add as the second argument
 * @return a string with stop words removed.
 * @syntax default: RemoveSQLStops("The,stuff,to,remove")
 * @syntax optional delimiter: RemoveSQLStops("The stuff to remove", " ")
 * @author Joe Graves StagingRoom.com (joe@stagingroom.com) 
 * @version 1, 12/08/2006 
 */
function removeSQLStops(TheList){
// list of stop words 
var TheStopList="a,about,1,after,2,all,also,3,an,4,and,5,another,6,any,7,are,8,as,9,at,0,be,$,because,been,before,being,between,both,but,by,came,can,come,could,did,do,each,for,from,get,got,has,had,he,have,her,here,him,himself,his,how,if,in,into,is,it,like,make,many,me,might,more,most,much,must,my,never,now,of,on,only,or,other,our,out,over,said,same,see,should,since,some,still,such,take,than,that,the,their,them,then,there,these,they,this,those,through,to,too,under,up,very,was,way,we,well,were,what,where,which,while,who,with,would,you,your";

var delims = ",";
var i=1;
var OriginalSize=0;
var results="";

//check for declared delimiter
if(arrayLen(arguments) gt 1) delims = arguments[2];

// get the size of the list
OriginalSize=listlen(TheList,delims);

// loop over the list and search for stop words
	for(; i lte OriginalSize; i=i+1){
	//if the word is not in the stop word list add it to the results
		if(ListFindNoCase(TheStopList, ListGetAt(TheList,i,delims),"," ) EQ 0) {
	// word a are added to new list (list is returned with the same delimiter passed in to the function) 
				results=ListAppend(results,(ListGetAt(TheList,i,delims)),delims);
			}
		}
		return results;
}