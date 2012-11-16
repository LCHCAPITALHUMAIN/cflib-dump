function friendlyUrl(title) {
	title = replaceNoCase(title,"&amp;","and","all"); //replace &amp;
	title = replaceNoCase(title,"&","and","all"); //replace &
	title = replaceNoCase(title,"'","","all"); //remove apostrophe
	title = reReplaceNoCase(trim(title),"[^a-zA-Z]","-","ALL");
	title = reReplaceNoCase(title,"[\-\-]+","-","all");
	//Remove trailing dashes
	if(right(title,1) eq "-") {
		title = left(title,len(title) - 1);
	}
	if(left(title,1) eq "-") {
		title = right(title,len(title) - 1);
	}	
	return lcase(title);
}