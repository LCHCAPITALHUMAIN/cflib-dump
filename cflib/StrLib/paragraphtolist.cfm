function paragraphToList(text) { 
	var thelist = "";
	var i = 1;
	text = trim(text);
	for(i=1; i lte listLen(text,chr(13));i=i+1) thelist = thelist & "<li>" & ListGetAt(text,i,chr(13)) & "</li>";
	if(len(thelist) GT 0) {  
		thelist = "<ul>" & thelist & "</ul>";
		return thelist ;
	} else return "";
}