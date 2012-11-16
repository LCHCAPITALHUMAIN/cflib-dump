string function highlightKeywords(required string str, required string keywords, struct highlight){
	var keyword		= "";
	var replacement	= "";
	
	param name="highlight.tag"			default="em";
	param name="highlight.attributes"	default="";
	
	for (var index=1; index <= listLen( arguments.keywords ); index++){
		keyword = listGetAt(arguments.keywords, index);
		replacement = "<#highlight.tag#";
		if (len(highlight.attributes)){
			replacement &= " #highlight.attributes#";
		}
		replacement &= ">" & keyword & "</#highlight.tag#>";

		arguments.str = reReplaceNoCase( arguments.str, "\b#keyword#\b", replacement, "all" );
	}
	return arguments.str;
}