function urlToHidden(){
	//a variable for iterating
	var key = "";
	//should we exlude any?  by default, no
	var excludeList = "";
	//a variable to return stuff
	var outVar = "";
	//if there is an argument, it is a list to exclude
	if(arrayLen(arguments))
		excludeList = arguments[1];
	//now loop through the form scope and make hidden fields
	for(key in url){
		if(NOT listFindNoCase(excludeList,key))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(url[key]) & """>";
	}
	return outVar;		
}